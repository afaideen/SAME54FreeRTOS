/* 
 * File:   FreeRTOSConfig.h
 * Author: han
 *
 * Created on January 11, 2026, 7:55 AM
 */

#ifndef FREERTOSCONFIG_H
#define	FREERTOSCONFIG_H


/*-----------------------------------------------------------
 * CPU & scheduler basics
 *----------------------------------------------------------*/
#define configCPU_CLOCK_HZ        120000000UL
#define configTICK_RATE_HZ        (1000)
#define configUSE_PREEMPTION      1
#define configUSE_TIME_SLICING    1

/*-----------------------------------------------------------
 * Task configuration
 *----------------------------------------------------------*/
#define configMAX_PRIORITIES      5
#define configMINIMAL_STACK_SIZE  128
#define configMAX_TASK_NAME_LEN   16

/*-----------------------------------------------------------
 * Memory allocation
 *----------------------------------------------------------*/
#define configSUPPORT_DYNAMIC_ALLOCATION 1
#define configSUPPORT_STATIC_ALLOCATION  1
#define configTOTAL_HEAP_SIZE     (20 * 1024)

/*-----------------------------------------------------------
 * Synchronization primitives
 *----------------------------------------------------------*/
#define configUSE_MUTEXES             1
#define configUSE_COUNTING_SEMAPHORES 1
#define configUSE_RECURSIVE_MUTEXES   1
#define configQUEUE_REGISTRY_SIZE     0

/*-----------------------------------------------------------
 * Hook functions (debug safety)
 *----------------------------------------------------------*/
#define configUSE_IDLE_HOOK        0
#define configUSE_TICK_HOOK        0
#define configCHECK_FOR_STACK_OVERFLOW 2
#define configUSE_MALLOC_FAILED_HOOK  1

/*-----------------------------------------------------------
 * Software timers (disable for now)
 *----------------------------------------------------------*/
#define configUSE_TIMERS           1

#define configTIMER_TASK_PRIORITY       ( configMAX_PRIORITIES - 1 )
#define configTIMER_QUEUE_LENGTH        10
#define configTIMER_TASK_STACK_DEPTH    ( configMINIMAL_STACK_SIZE * 2 )

/*-----------------------------------------------------------
 * Cortex-M interrupt priorities
 *----------------------------------------------------------*/
#define configKERNEL_INTERRUPT_PRIORITY         255
#define configMAX_SYSCALL_INTERRUPT_PRIORITY    191

/*-----------------------------------------------------------
 * SAME54 exception handler mapping
 *----------------------------------------------------------*/
#define xPortPendSVHandler    PendSV_Handler
#define xPortSysTickHandler   SysTick_Handler
#define vPortSVCHandler       SVCall_Handler

/*-----------------------------------------------------------
 * Tick type configuration (REQUIRED by newer FreeRTOS)
 *----------------------------------------------------------*/
#define configTICK_TYPE_WIDTH_IN_BITS    TICK_TYPE_WIDTH_32_BITS

#define INCLUDE_vTaskDelay            1
#define INCLUDE_xTaskGetTickCount     1 
/* We?ll use task notifications */
#define configUSE_TASK_NOTIFICATIONS      1


#endif	/* FREERTOSCONFIG_H */

