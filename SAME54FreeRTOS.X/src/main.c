/* 
 * File:   main.c
 * Author: han
 *
 * Created on January 11, 2026, 7:14 AM
 */

#include <stdio.h>
#include <stdlib.h>

#include "sam.h"

#include "system/common/cpu.h"
#include "system/common/board.h"

#include "FreeRTOS.h"
#include "task.h"
#include "queue.h"

#include "drivers/uart_dma.h"

static TaskHandle_t gBlinkTask = NULL;
volatile uint32_t gBlinkPeriodMs = 500;

/* Queue + TX task for UART DMA logger */
static QueueHandle_t gUartLogQ = NULL;
static TaskHandle_t  gUartTxTask = NULL;

/* --------- Demo tasks --------- */
static void vBlinkTask(void *pvParameters)
{
    (void)pvParameters;

    uint32_t period_ms = 500;
    gBlinkPeriodMs = period_ms;

    for (;;)
    {
        if (ulTaskNotifyTake(pdTRUE, pdMS_TO_TICKS(period_ms)) > 0)
        {
            period_ms = (period_ms == 500) ? 1000 : 500;
            gBlinkPeriodMs = period_ms;

            UART2_DMA_Log("[SW0] toggle -> blink=%lu ms\r\n", (unsigned long)period_ms);
        }
        else
        {
            board_led0_toggle();
        }
    }
}

static void vButtonTask(void *pv)
{
    (void)pv;

    sw_t sw0 = {
        .id = SW0,
        .t_debounce = 50,
        .cnt = 0
    };

    for (;;)
    {
        if (board_sw_pressed_rtos(&sw0))
        {
            if (gBlinkTask != NULL)
            {
                xTaskNotifyGive(gBlinkTask);
            }
        }

        vTaskDelay(pdMS_TO_TICKS(10));
    }
}


static void vLogTask(void *pvParameters)
{
    (void)pvParameters;

    for (;;)
    {
        UART2_DMA_Log("[RTOS] tick=%lu | LED0=%s | period=%lu ms\r\n",
                      (unsigned long)xTaskGetTickCount(),
                      board_led0_is_on() ? "ON" : "OFF",
                      (unsigned long)gBlinkPeriodMs);

        vTaskDelay(pdMS_TO_TICKS(gBlinkPeriodMs));
    }
}

int main(void)
{
    SystemConfigPerformance();   /* MUST be first */
    
    /* Create the FreeRTOS queue early (safe before scheduler starts). */
    gUartLogQ = xQueueCreate(DMA_LOG_QUEUE_SIZE, sizeof(UART2_DMA_LogMsg_t));

    /* Attach queue now (TX task not created yet). This prevents early drops
       if board_init() logs using UART2_DMA_Log(). */
    UART2_DMA_LogServiceAttach(gUartLogQ, NULL);

    board_init();                /* UART/RTCC/banner/DMA init etc. */
    __enable_irq();

    /* Create UART DMA TX consumer (higher prio helps drain logs smoothly). */
    xTaskCreate(UART2_DMA_TxTask, "uart_tx", 768, NULL, 3, &gUartTxTask);

    /* Attach again with the real TX task handle (for ISR notification). */
    UART2_DMA_LogServiceAttach(gUartLogQ, gUartTxTask);

    UART2_DMA_Log("\r\nBoard initialization completed...\r\n");

    /* Your demo tasks */
    xTaskCreate(vBlinkTask,  "blink",  512, NULL, 2, &gBlinkTask);
    xTaskCreate(vButtonTask, "button", 512, NULL, 2, NULL);
    xTaskCreate(vLogTask,    "log",    768, NULL, 1, NULL);

    vTaskStartScheduler();

    for (;;)
    {
        __BKPT(0);
    }

    return (EXIT_SUCCESS);
}
