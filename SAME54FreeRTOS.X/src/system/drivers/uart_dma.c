#include <string.h>
#include <stdarg.h>
#include <stdio.h>
#include <stdint.h>
#include <stdbool.h>

#include "rtcc.h"
#include "uart.h"
#include "uart_dma.h"
#include "../common/board.h"

#include "FreeRTOS.h"
#include "task.h"
#include "queue.h"
#include "rtos_time.h"

/* ============================================================================
 * DMA Descriptor Tables (aligned per SAME54 requirement)
 * ============================================================================ */

/* Primary and writeback descriptor tables (must be 16-byte aligned).
 *
 * SAME54 DMAC expects descriptor tables sized for the full channel count.
 */
#ifdef DMAC_CHANNEL_NUMBER
#define DMA_CHANNEL_COUNT DMAC_CHANNEL_NUMBER
#else
#define DMA_CHANNEL_COUNT 32u
#endif

__attribute__((aligned(DMA_DESCRIPTOR_ALIGN)))
static DmacDescriptor_t dma_descriptors[DMA_CHANNEL_COUNT];

__attribute__((aligned(DMA_DESCRIPTOR_ALIGN)))
static DmacDescriptor_t dma_writeback[DMA_CHANNEL_COUNT];

/* ============================================================================
 * DMA State Management
 * ============================================================================ */

static volatile bool uart2_dma_busy = false;
static UART2_DMA_Callback_t uart2_dma_callback = NULL;

/* ============================================================================
 * FreeRTOS log service objects (Queue + Notification)
 * ============================================================================ */

static QueueHandle_t s_uart2_log_q = NULL;
static TaskHandle_t  s_uart2_tx_task = NULL;

static volatile uint32_t dma_log_dropped = 0; /* monotonic drop counter */

/* Timestamp state for logging */
static uint32_t s_uart2_log_prev_cyc = 0;
static bool s_uart2_log_prev_valid = false;

/* ============================================================================
 * Helper Functions
 * ============================================================================ */

static void dmac_enable(void)
{
    /* DMAC is on AHB */
    MCLK_REGS->MCLK_AHBMASK |= MCLK_AHBMASK_DMAC_Msk;
    (void)MCLK_REGS->MCLK_AHBMASK;
}

static void dmac_config(void)
{
    DMAC_REGS->DMAC_BASEADDR = (uint32_t)dma_descriptors;
    DMAC_REGS->DMAC_WRBADDR  = (uint32_t)dma_writeback;

    DMAC_REGS->DMAC_PRICTRL0 |=
        DMAC_PRICTRL0_LVLPRI0(1U) | DMAC_PRICTRL0_RRLVLEN0_Msk |
        DMAC_PRICTRL0_LVLPRI1(1U) | DMAC_PRICTRL0_RRLVLEN1_Msk |
        DMAC_PRICTRL0_LVLPRI2(1U) | DMAC_PRICTRL0_RRLVLEN2_Msk |
        DMAC_PRICTRL0_LVLPRI3(1U) | DMAC_PRICTRL0_RRLVLEN3_Msk;

    DMAC_REGS->DMAC_CTRL = DMAC_CTRL_DMAENABLE_Msk |
                           DMAC_CTRL_LVLEN0_Msk |
                           DMAC_CTRL_LVLEN1_Msk |
                           DMAC_CTRL_LVLEN2_Msk |
                           DMAC_CTRL_LVLEN3_Msk;
}

static void dmac_channel_config(uint8_t channel)
{
    DMAC_REGS->CHANNEL[channel].DMAC_CHCTRLA =
        DMAC_CHCTRLA_TRIGACT_BURST |
        DMAC_CHCTRLA_TRIGSRC(SERCOM2_DMAC_ID_TX) |
        DMAC_CHCTRLA_THRESHOLD(0U) |
        DMAC_CHCTRLA_BURSTLEN(0U);

    DMAC_REGS->CHANNEL[channel].DMAC_CHPRILVL = DMAC_CHPRILVL_PRILVL(0U);

    DMAC_REGS->CHANNEL[channel].DMAC_CHINTENSET =
        (DMAC_CHINTENSET_TCMPL_Msk | DMAC_CHINTENSET_TERR_Msk);

    DMAC_REGS->CHANNEL[channel].DMAC_CHINTFLAG =
        (DMAC_CHINTFLAG_TCMPL_Msk | DMAC_CHINTFLAG_TERR_Msk);
}

static void dmac_setup_tx_descriptor(uint8_t channel, const char *buffer, uint32_t length)
{
    DmacDescriptor_t *desc = &dma_descriptors[channel];

    desc->btctrl =
        DMAC_BTCTRL_VALID_Msk |
        DMAC_BTCTRL_SRCINC_Msk |
        DMAC_BTCTRL_BEATSIZE_BYTE |
        DMAC_BTCTRL_BLOCKACT_INT;

    desc->btcnt = (uint16_t)length;

    /* srcaddr must point to end-of-buffer + 1 for SAME54 DMAC when SRCINC */
    desc->srcaddr = (uint32_t)(buffer + length);

    desc->dstaddr = (uint32_t)&SERCOM2_REGS->USART_INT.SERCOM_DATA;

    desc->descaddr = 0;
}

static void dmac_channel_enable(uint8_t channel)
{
    DMAC_REGS->CHANNEL[channel].DMAC_CHCTRLA |= DMAC_CHCTRLA_ENABLE_Msk;
}

static void dmac_channel_disable(uint8_t channel)
{
    DMAC_REGS->CHANNEL[channel].DMAC_CHCTRLA &= ~DMAC_CHCTRLA_ENABLE_Msk;
}

/* ============================================================================
 * Interrupt Handler (Notification point)
 * ============================================================================ */

/**
 * DMA Channel 0 Interrupt Handler.
 * - Clears flags
 * - Marks DMA idle
 * - Notifies UART2_DMA_TxTask() so it can send next queued message
 */
void DMAC_0_Handler(void)
{
    uint8_t channel = UART2_DMA_CHANNEL;
    uint8_t flags = DMAC_REGS->CHANNEL[channel].DMAC_CHINTFLAG;
    BaseType_t hpw = pdFALSE;

    if ((flags & DMAC_CHINTFLAG_TCMPL_Msk) != 0U)
    {
        DMAC_REGS->CHANNEL[channel].DMAC_CHINTFLAG = DMAC_CHINTFLAG_TCMPL_Msk;
        uart2_dma_busy = false;

        if (s_uart2_tx_task != NULL)
        {
            vTaskNotifyGiveFromISR(s_uart2_tx_task, &hpw);
        }

        if (uart2_dma_callback != NULL)
        {
            uart2_dma_callback();
        }
    }

    if ((flags & DMAC_CHINTFLAG_TERR_Msk) != 0U)
    {
        DMAC_REGS->CHANNEL[channel].DMAC_CHINTFLAG = DMAC_CHINTFLAG_TERR_Msk;
        uart2_dma_busy = false;

        if (s_uart2_tx_task != NULL)
        {
            vTaskNotifyGiveFromISR(s_uart2_tx_task, &hpw);
        }

        if (uart2_dma_callback != NULL)
        {
            uart2_dma_callback();
        }
    }

    portYIELD_FROM_ISR(hpw);
}

/* ============================================================================
 * Public API Functions
 * ============================================================================ */

void UART2_DMA_Init(void)
{
    /* Initialize timestamp baseline for log prefixes */
    s_uart2_log_prev_cyc   = (uint32_t)DWT->CYCCNT;
    s_uart2_log_prev_valid = false;

    dmac_enable();
    dmac_config();
    dmac_channel_config(UART2_DMA_CHANNEL);

    NVIC_ClearPendingIRQ(DMAC_0_IRQn);
    NVIC_EnableIRQ(DMAC_0_IRQn);
}

bool UART2_DMA_Send(const char *buffer, uint32_t length)
{
    uint8_t channel = UART2_DMA_CHANNEL;

    if ((buffer == NULL) || (length == 0U))
    {
        return false;
    }

    if (length > 0xFFFFU)
    {
        length = 0xFFFFU;
    }

    if (uart2_dma_busy)
    {
        return false;
    }

    DMAC_REGS->CHANNEL[channel].DMAC_CHINTFLAG =
        (DMAC_CHINTFLAG_TCMPL_Msk | DMAC_CHINTFLAG_TERR_Msk);

    uart2_dma_busy = true;

    dmac_setup_tx_descriptor(channel, buffer, length);
    dmac_channel_enable(channel);

    return true;
}

bool UART2_DMA_IsBusy(void)
{
    return uart2_dma_busy;
}

void UART2_DMA_SetCallback(UART2_DMA_Callback_t cb)
{
    uart2_dma_callback = cb;
}

void UART2_DMA_Wait(void)
{
    while (uart2_dma_busy)
    {
        __NOP();
    }
}

/* ============================================================================
 * Logger service (Queue producer + consumer task)
 * ============================================================================ */

uint32_t UART2_DMA_Log_Dropped(void)
{
    return dma_log_dropped;
}

void UART2_DMA_LogServiceAttach(QueueHandle_t q, TaskHandle_t tx_task)
{
    s_uart2_log_q = q;
    s_uart2_tx_task = tx_task;
}

/**
 * Consumer task:
 * - xQueueReceive() gets one message
 * - Starts DMA
 * - Blocks until DMAC ISR notifies completion
 */
void UART2_DMA_TxTask(void *arg)
{
    (void)arg;

    UART2_DMA_LogMsg_t m;

    for (;;)
    {
        if (s_uart2_log_q == NULL)
        {
            vTaskDelay(pdMS_TO_TICKS(100));
            continue;
        }

        if (xQueueReceive(s_uart2_log_q, &m, portMAX_DELAY) == pdTRUE)
        {
            (void)UART2_DMA_Send(m.buf, (uint32_t)m.len);

            /* Wait for DMAC_0_Handler() */
            (void)ulTaskNotifyTake(pdTRUE, portMAX_DELAY);
        }
    }
}

/* Format RTCC date/time as "YYYY-MM-DD HH:MM:SS". */
static bool rtcc_format_datetime(char *out, uint32_t out_sz)
{
    rtcc_datetime_t dt;

    if ((out == NULL) || (out_sz == 0U))
    {
        return false;
    }

    if (!RTCC_GetDateTime(&dt))
    {
        out[0] = '\0';
        return false;
    }

    (void)snprintf(out, out_sz, "%04u-%02u-%02u %02u:%02u:%02u",
                   (unsigned)dt.year, (unsigned)dt.month, (unsigned)dt.day,
                   (unsigned)dt.hour, (unsigned)dt.min, (unsigned)dt.sec);
    return true;
}

/* Producer-side internal (format + enqueue). */
static bool UART2_DMA_Log_internal(const char *fmt, va_list ap)
{
    /* Build the user message first (consume va_list exactly once) */
    char body[DMA_LOG_BUF_SIZE];
    int bn = vsnprintf(body, sizeof(body), fmt, ap);
    if (bn <= 0)
    {
        return false;
    }

    /* Timestamp prefix */
    uint32_t now_ms = millis();

    uint32_t now_cyc = DWT->CYCCNT;
    uint32_t delta_cyc = s_uart2_log_prev_valid ? (now_cyc - s_uart2_log_prev_cyc) : 0U;
    s_uart2_log_prev_cyc = now_cyc;
    s_uart2_log_prev_valid = true;

    uint32_t delta_us = (uint32_t)(((uint64_t)delta_cyc * 1000000ULL) / (uint64_t)CPU_CLOCK_HZ);
    uint32_t delta_ms_i = delta_us / 1000U;
    uint32_t delta_us_rem = delta_us % 1000U;

    char tmp[DMA_LOG_BUF_SIZE];
    char dt_str[24];
    bool have_dt = rtcc_format_datetime(dt_str, sizeof(dt_str));

    int n;
    if (have_dt)
    {
        n = snprintf(tmp, sizeof(tmp), "[%s][%lu][%lu.%03lu]%s",
                     dt_str,
                     (unsigned long)now_ms,
                     (unsigned long)delta_ms_i,
                     (unsigned long)delta_us_rem,
                     body);
    }
    else
    {
        n = snprintf(tmp, sizeof(tmp), "[----][%lu][%lu.%03lu]%s",
                     (unsigned long)now_ms,
                     (unsigned long)delta_ms_i,
                     (unsigned long)delta_us_rem,
                     body);
    }

    if (n <= 0)
    {
        return false;
    }

    uint16_t len = (uint16_t)n;
    if (len >= (uint16_t)sizeof(tmp))
    {
        len = (uint16_t)sizeof(tmp) - 1U;
    }

    if (s_uart2_log_q == NULL)
    {
        dma_log_dropped++;
        return false;
    }

    UART2_DMA_LogMsg_t msg;
    msg.len = len;
    memcpy(msg.buf, tmp, len);
    msg.buf[len] = '\0';

    /* Non-blocking enqueue: drop if queue full */
    if (xQueueSend(s_uart2_log_q, &msg, 0) != pdTRUE)
    {
        dma_log_dropped++;
        return false;
    }

    return true;
}

bool UART2_DMA_Log(const char *fmt, ...)
{
    /* Not ISR-safe (formatting + queue send with task context expectation). */
    if (__get_IPSR() != 0U)
    {
        dma_log_dropped++;
        return false;
    }

    va_list ap;
    va_start(ap, fmt);
    bool res = UART2_DMA_Log_internal(fmt, ap);
    va_end(ap);

    return res;
}
