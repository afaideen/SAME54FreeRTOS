/* 
 * File:   rtos_time.h
 * Author: han
 *
 * Created on January 11, 2026, 10:57 AM
 */

#ifndef RTOS_TIME_H
#define	RTOS_TIME_H

#include <stdint.h>
#include "sam.h"        // for __get_IPSR()
#include "FreeRTOS.h"
#include "task.h"

static inline uint32_t millis(void)
{
    if (xTaskGetSchedulerState() == taskSCHEDULER_NOT_STARTED) {
        return 0;
    }

    TickType_t t;
    if (__get_IPSR() != 0U) {
        t = xTaskGetTickCountFromISR();
    } else {
        t = xTaskGetTickCount();
    }

    return (uint32_t)(t * portTICK_PERIOD_MS);
}

#endif	/* RTOS_TIME_H */

