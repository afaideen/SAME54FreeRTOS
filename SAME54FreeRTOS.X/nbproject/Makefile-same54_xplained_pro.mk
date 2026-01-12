#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-same54_xplained_pro.mk)" "nbproject/Makefile-local-same54_xplained_pro.mk"
include nbproject/Makefile-local-same54_xplained_pro.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=same54_xplained_pro
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/SAME54FreeRTOS.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/SAME54FreeRTOS.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=-mafrlcsj
else
COMPARISON_BUILD=
endif

ifdef SUB_IMAGE_ADDRESS

else
SUB_IMAGE_ADDRESS_COMMAND=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=src/freertos/portable/GCC/ARM_CM4F/port.c src/freertos/portable/MemMang/heap_4.c src/freertos/croutine.c src/freertos/event_groups.c src/freertos/list.c src/freertos/queue.c src/freertos/stream_buffer.c src/freertos/tasks.c src/freertos/timers.c src/freertos/freertos_hooks.c src/system/common/board.c src/system/common/cpu.c src/system/drivers/rtcc.c src/system/drivers/uart.c src/system/drivers/uart_dma.c src/main.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/src/freertos/portable/GCC/ARM_CM4F/port.o ${OBJECTDIR}/src/freertos/portable/MemMang/heap_4.o ${OBJECTDIR}/src/freertos/croutine.o ${OBJECTDIR}/src/freertos/event_groups.o ${OBJECTDIR}/src/freertos/list.o ${OBJECTDIR}/src/freertos/queue.o ${OBJECTDIR}/src/freertos/stream_buffer.o ${OBJECTDIR}/src/freertos/tasks.o ${OBJECTDIR}/src/freertos/timers.o ${OBJECTDIR}/src/freertos/freertos_hooks.o ${OBJECTDIR}/src/system/common/board.o ${OBJECTDIR}/src/system/common/cpu.o ${OBJECTDIR}/src/system/drivers/rtcc.o ${OBJECTDIR}/src/system/drivers/uart.o ${OBJECTDIR}/src/system/drivers/uart_dma.o ${OBJECTDIR}/src/main.o
POSSIBLE_DEPFILES=${OBJECTDIR}/src/freertos/portable/GCC/ARM_CM4F/port.o.d ${OBJECTDIR}/src/freertos/portable/MemMang/heap_4.o.d ${OBJECTDIR}/src/freertos/croutine.o.d ${OBJECTDIR}/src/freertos/event_groups.o.d ${OBJECTDIR}/src/freertos/list.o.d ${OBJECTDIR}/src/freertos/queue.o.d ${OBJECTDIR}/src/freertos/stream_buffer.o.d ${OBJECTDIR}/src/freertos/tasks.o.d ${OBJECTDIR}/src/freertos/timers.o.d ${OBJECTDIR}/src/freertos/freertos_hooks.o.d ${OBJECTDIR}/src/system/common/board.o.d ${OBJECTDIR}/src/system/common/cpu.o.d ${OBJECTDIR}/src/system/drivers/rtcc.o.d ${OBJECTDIR}/src/system/drivers/uart.o.d ${OBJECTDIR}/src/system/drivers/uart_dma.o.d ${OBJECTDIR}/src/main.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/src/freertos/portable/GCC/ARM_CM4F/port.o ${OBJECTDIR}/src/freertos/portable/MemMang/heap_4.o ${OBJECTDIR}/src/freertos/croutine.o ${OBJECTDIR}/src/freertos/event_groups.o ${OBJECTDIR}/src/freertos/list.o ${OBJECTDIR}/src/freertos/queue.o ${OBJECTDIR}/src/freertos/stream_buffer.o ${OBJECTDIR}/src/freertos/tasks.o ${OBJECTDIR}/src/freertos/timers.o ${OBJECTDIR}/src/freertos/freertos_hooks.o ${OBJECTDIR}/src/system/common/board.o ${OBJECTDIR}/src/system/common/cpu.o ${OBJECTDIR}/src/system/drivers/rtcc.o ${OBJECTDIR}/src/system/drivers/uart.o ${OBJECTDIR}/src/system/drivers/uart_dma.o ${OBJECTDIR}/src/main.o

# Source Files
SOURCEFILES=src/freertos/portable/GCC/ARM_CM4F/port.c src/freertos/portable/MemMang/heap_4.c src/freertos/croutine.c src/freertos/event_groups.c src/freertos/list.c src/freertos/queue.c src/freertos/stream_buffer.c src/freertos/tasks.c src/freertos/timers.c src/freertos/freertos_hooks.c src/system/common/board.c src/system/common/cpu.c src/system/drivers/rtcc.c src/system/drivers/uart.c src/system/drivers/uart_dma.c src/main.c

# Pack Options 
PACK_COMMON_OPTIONS=-I "${CMSIS_DIR}/CMSIS/Core/Include"



CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-same54_xplained_pro.mk dist/${CND_CONF}/${IMAGE_TYPE}/SAME54FreeRTOS.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=ATSAME54P20A
MP_LINKER_FILE_OPTION=
# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assembleWithPreprocess
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/src/freertos/portable/GCC/ARM_CM4F/port.o: src/freertos/portable/GCC/ARM_CM4F/port.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src/freertos/portable/GCC/ARM_CM4F" 
	@${RM} ${OBJECTDIR}/src/freertos/portable/GCC/ARM_CM4F/port.o.d 
	@${RM} ${OBJECTDIR}/src/freertos/portable/GCC/ARM_CM4F/port.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -DUSE_FREERTOS -I"src" -I"src/freertos" -I"src/freertos/include" -I"src/freertos/portable/GCC/ARM_CM4F" -I"src/system" -MMD -MF "${OBJECTDIR}/src/freertos/portable/GCC/ARM_CM4F/port.o.d" -o ${OBJECTDIR}/src/freertos/portable/GCC/ARM_CM4F/port.o src/freertos/portable/GCC/ARM_CM4F/port.c    -DXPRJ_same54_xplained_pro=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	@${FIXDEPS} "${OBJECTDIR}/src/freertos/portable/GCC/ARM_CM4F/port.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/src/freertos/portable/MemMang/heap_4.o: src/freertos/portable/MemMang/heap_4.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src/freertos/portable/MemMang" 
	@${RM} ${OBJECTDIR}/src/freertos/portable/MemMang/heap_4.o.d 
	@${RM} ${OBJECTDIR}/src/freertos/portable/MemMang/heap_4.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -DUSE_FREERTOS -I"src" -I"src/freertos" -I"src/freertos/include" -I"src/freertos/portable/GCC/ARM_CM4F" -I"src/system" -MMD -MF "${OBJECTDIR}/src/freertos/portable/MemMang/heap_4.o.d" -o ${OBJECTDIR}/src/freertos/portable/MemMang/heap_4.o src/freertos/portable/MemMang/heap_4.c    -DXPRJ_same54_xplained_pro=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	@${FIXDEPS} "${OBJECTDIR}/src/freertos/portable/MemMang/heap_4.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/src/freertos/croutine.o: src/freertos/croutine.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src/freertos" 
	@${RM} ${OBJECTDIR}/src/freertos/croutine.o.d 
	@${RM} ${OBJECTDIR}/src/freertos/croutine.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -DUSE_FREERTOS -I"src" -I"src/freertos" -I"src/freertos/include" -I"src/freertos/portable/GCC/ARM_CM4F" -I"src/system" -MMD -MF "${OBJECTDIR}/src/freertos/croutine.o.d" -o ${OBJECTDIR}/src/freertos/croutine.o src/freertos/croutine.c    -DXPRJ_same54_xplained_pro=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	@${FIXDEPS} "${OBJECTDIR}/src/freertos/croutine.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/src/freertos/event_groups.o: src/freertos/event_groups.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src/freertos" 
	@${RM} ${OBJECTDIR}/src/freertos/event_groups.o.d 
	@${RM} ${OBJECTDIR}/src/freertos/event_groups.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -DUSE_FREERTOS -I"src" -I"src/freertos" -I"src/freertos/include" -I"src/freertos/portable/GCC/ARM_CM4F" -I"src/system" -MMD -MF "${OBJECTDIR}/src/freertos/event_groups.o.d" -o ${OBJECTDIR}/src/freertos/event_groups.o src/freertos/event_groups.c    -DXPRJ_same54_xplained_pro=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	@${FIXDEPS} "${OBJECTDIR}/src/freertos/event_groups.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/src/freertos/list.o: src/freertos/list.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src/freertos" 
	@${RM} ${OBJECTDIR}/src/freertos/list.o.d 
	@${RM} ${OBJECTDIR}/src/freertos/list.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -DUSE_FREERTOS -I"src" -I"src/freertos" -I"src/freertos/include" -I"src/freertos/portable/GCC/ARM_CM4F" -I"src/system" -MMD -MF "${OBJECTDIR}/src/freertos/list.o.d" -o ${OBJECTDIR}/src/freertos/list.o src/freertos/list.c    -DXPRJ_same54_xplained_pro=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	@${FIXDEPS} "${OBJECTDIR}/src/freertos/list.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/src/freertos/queue.o: src/freertos/queue.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src/freertos" 
	@${RM} ${OBJECTDIR}/src/freertos/queue.o.d 
	@${RM} ${OBJECTDIR}/src/freertos/queue.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -DUSE_FREERTOS -I"src" -I"src/freertos" -I"src/freertos/include" -I"src/freertos/portable/GCC/ARM_CM4F" -I"src/system" -MMD -MF "${OBJECTDIR}/src/freertos/queue.o.d" -o ${OBJECTDIR}/src/freertos/queue.o src/freertos/queue.c    -DXPRJ_same54_xplained_pro=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	@${FIXDEPS} "${OBJECTDIR}/src/freertos/queue.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/src/freertos/stream_buffer.o: src/freertos/stream_buffer.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src/freertos" 
	@${RM} ${OBJECTDIR}/src/freertos/stream_buffer.o.d 
	@${RM} ${OBJECTDIR}/src/freertos/stream_buffer.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -DUSE_FREERTOS -I"src" -I"src/freertos" -I"src/freertos/include" -I"src/freertos/portable/GCC/ARM_CM4F" -I"src/system" -MMD -MF "${OBJECTDIR}/src/freertos/stream_buffer.o.d" -o ${OBJECTDIR}/src/freertos/stream_buffer.o src/freertos/stream_buffer.c    -DXPRJ_same54_xplained_pro=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	@${FIXDEPS} "${OBJECTDIR}/src/freertos/stream_buffer.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/src/freertos/tasks.o: src/freertos/tasks.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src/freertos" 
	@${RM} ${OBJECTDIR}/src/freertos/tasks.o.d 
	@${RM} ${OBJECTDIR}/src/freertos/tasks.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -DUSE_FREERTOS -I"src" -I"src/freertos" -I"src/freertos/include" -I"src/freertos/portable/GCC/ARM_CM4F" -I"src/system" -MMD -MF "${OBJECTDIR}/src/freertos/tasks.o.d" -o ${OBJECTDIR}/src/freertos/tasks.o src/freertos/tasks.c    -DXPRJ_same54_xplained_pro=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	@${FIXDEPS} "${OBJECTDIR}/src/freertos/tasks.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/src/freertos/timers.o: src/freertos/timers.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src/freertos" 
	@${RM} ${OBJECTDIR}/src/freertos/timers.o.d 
	@${RM} ${OBJECTDIR}/src/freertos/timers.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -DUSE_FREERTOS -I"src" -I"src/freertos" -I"src/freertos/include" -I"src/freertos/portable/GCC/ARM_CM4F" -I"src/system" -MMD -MF "${OBJECTDIR}/src/freertos/timers.o.d" -o ${OBJECTDIR}/src/freertos/timers.o src/freertos/timers.c    -DXPRJ_same54_xplained_pro=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	@${FIXDEPS} "${OBJECTDIR}/src/freertos/timers.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/src/freertos/freertos_hooks.o: src/freertos/freertos_hooks.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src/freertos" 
	@${RM} ${OBJECTDIR}/src/freertos/freertos_hooks.o.d 
	@${RM} ${OBJECTDIR}/src/freertos/freertos_hooks.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -DUSE_FREERTOS -I"src" -I"src/freertos" -I"src/freertos/include" -I"src/freertos/portable/GCC/ARM_CM4F" -I"src/system" -MMD -MF "${OBJECTDIR}/src/freertos/freertos_hooks.o.d" -o ${OBJECTDIR}/src/freertos/freertos_hooks.o src/freertos/freertos_hooks.c    -DXPRJ_same54_xplained_pro=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	@${FIXDEPS} "${OBJECTDIR}/src/freertos/freertos_hooks.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/src/system/common/board.o: src/system/common/board.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src/system/common" 
	@${RM} ${OBJECTDIR}/src/system/common/board.o.d 
	@${RM} ${OBJECTDIR}/src/system/common/board.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -DUSE_FREERTOS -I"src" -I"src/freertos" -I"src/freertos/include" -I"src/freertos/portable/GCC/ARM_CM4F" -I"src/system" -MMD -MF "${OBJECTDIR}/src/system/common/board.o.d" -o ${OBJECTDIR}/src/system/common/board.o src/system/common/board.c    -DXPRJ_same54_xplained_pro=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	@${FIXDEPS} "${OBJECTDIR}/src/system/common/board.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/src/system/common/cpu.o: src/system/common/cpu.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src/system/common" 
	@${RM} ${OBJECTDIR}/src/system/common/cpu.o.d 
	@${RM} ${OBJECTDIR}/src/system/common/cpu.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -DUSE_FREERTOS -I"src" -I"src/freertos" -I"src/freertos/include" -I"src/freertos/portable/GCC/ARM_CM4F" -I"src/system" -MMD -MF "${OBJECTDIR}/src/system/common/cpu.o.d" -o ${OBJECTDIR}/src/system/common/cpu.o src/system/common/cpu.c    -DXPRJ_same54_xplained_pro=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	@${FIXDEPS} "${OBJECTDIR}/src/system/common/cpu.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/src/system/drivers/rtcc.o: src/system/drivers/rtcc.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src/system/drivers" 
	@${RM} ${OBJECTDIR}/src/system/drivers/rtcc.o.d 
	@${RM} ${OBJECTDIR}/src/system/drivers/rtcc.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -DUSE_FREERTOS -I"src" -I"src/freertos" -I"src/freertos/include" -I"src/freertos/portable/GCC/ARM_CM4F" -I"src/system" -MMD -MF "${OBJECTDIR}/src/system/drivers/rtcc.o.d" -o ${OBJECTDIR}/src/system/drivers/rtcc.o src/system/drivers/rtcc.c    -DXPRJ_same54_xplained_pro=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	@${FIXDEPS} "${OBJECTDIR}/src/system/drivers/rtcc.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/src/system/drivers/uart.o: src/system/drivers/uart.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src/system/drivers" 
	@${RM} ${OBJECTDIR}/src/system/drivers/uart.o.d 
	@${RM} ${OBJECTDIR}/src/system/drivers/uart.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -DUSE_FREERTOS -I"src" -I"src/freertos" -I"src/freertos/include" -I"src/freertos/portable/GCC/ARM_CM4F" -I"src/system" -MMD -MF "${OBJECTDIR}/src/system/drivers/uart.o.d" -o ${OBJECTDIR}/src/system/drivers/uart.o src/system/drivers/uart.c    -DXPRJ_same54_xplained_pro=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	@${FIXDEPS} "${OBJECTDIR}/src/system/drivers/uart.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/src/system/drivers/uart_dma.o: src/system/drivers/uart_dma.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src/system/drivers" 
	@${RM} ${OBJECTDIR}/src/system/drivers/uart_dma.o.d 
	@${RM} ${OBJECTDIR}/src/system/drivers/uart_dma.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -DUSE_FREERTOS -I"src" -I"src/freertos" -I"src/freertos/include" -I"src/freertos/portable/GCC/ARM_CM4F" -I"src/system" -MMD -MF "${OBJECTDIR}/src/system/drivers/uart_dma.o.d" -o ${OBJECTDIR}/src/system/drivers/uart_dma.o src/system/drivers/uart_dma.c    -DXPRJ_same54_xplained_pro=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	@${FIXDEPS} "${OBJECTDIR}/src/system/drivers/uart_dma.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/src/main.o: src/main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/main.o.d 
	@${RM} ${OBJECTDIR}/src/main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -DUSE_FREERTOS -I"src" -I"src/freertos" -I"src/freertos/include" -I"src/freertos/portable/GCC/ARM_CM4F" -I"src/system" -MMD -MF "${OBJECTDIR}/src/main.o.d" -o ${OBJECTDIR}/src/main.o src/main.c    -DXPRJ_same54_xplained_pro=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	@${FIXDEPS} "${OBJECTDIR}/src/main.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ 
	
else
${OBJECTDIR}/src/freertos/portable/GCC/ARM_CM4F/port.o: src/freertos/portable/GCC/ARM_CM4F/port.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src/freertos/portable/GCC/ARM_CM4F" 
	@${RM} ${OBJECTDIR}/src/freertos/portable/GCC/ARM_CM4F/port.o.d 
	@${RM} ${OBJECTDIR}/src/freertos/portable/GCC/ARM_CM4F/port.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -DUSE_FREERTOS -I"src" -I"src/freertos" -I"src/freertos/include" -I"src/freertos/portable/GCC/ARM_CM4F" -I"src/system" -MMD -MF "${OBJECTDIR}/src/freertos/portable/GCC/ARM_CM4F/port.o.d" -o ${OBJECTDIR}/src/freertos/portable/GCC/ARM_CM4F/port.o src/freertos/portable/GCC/ARM_CM4F/port.c    -DXPRJ_same54_xplained_pro=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	@${FIXDEPS} "${OBJECTDIR}/src/freertos/portable/GCC/ARM_CM4F/port.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/src/freertos/portable/MemMang/heap_4.o: src/freertos/portable/MemMang/heap_4.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src/freertos/portable/MemMang" 
	@${RM} ${OBJECTDIR}/src/freertos/portable/MemMang/heap_4.o.d 
	@${RM} ${OBJECTDIR}/src/freertos/portable/MemMang/heap_4.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -DUSE_FREERTOS -I"src" -I"src/freertos" -I"src/freertos/include" -I"src/freertos/portable/GCC/ARM_CM4F" -I"src/system" -MMD -MF "${OBJECTDIR}/src/freertos/portable/MemMang/heap_4.o.d" -o ${OBJECTDIR}/src/freertos/portable/MemMang/heap_4.o src/freertos/portable/MemMang/heap_4.c    -DXPRJ_same54_xplained_pro=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	@${FIXDEPS} "${OBJECTDIR}/src/freertos/portable/MemMang/heap_4.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/src/freertos/croutine.o: src/freertos/croutine.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src/freertos" 
	@${RM} ${OBJECTDIR}/src/freertos/croutine.o.d 
	@${RM} ${OBJECTDIR}/src/freertos/croutine.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -DUSE_FREERTOS -I"src" -I"src/freertos" -I"src/freertos/include" -I"src/freertos/portable/GCC/ARM_CM4F" -I"src/system" -MMD -MF "${OBJECTDIR}/src/freertos/croutine.o.d" -o ${OBJECTDIR}/src/freertos/croutine.o src/freertos/croutine.c    -DXPRJ_same54_xplained_pro=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	@${FIXDEPS} "${OBJECTDIR}/src/freertos/croutine.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/src/freertos/event_groups.o: src/freertos/event_groups.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src/freertos" 
	@${RM} ${OBJECTDIR}/src/freertos/event_groups.o.d 
	@${RM} ${OBJECTDIR}/src/freertos/event_groups.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -DUSE_FREERTOS -I"src" -I"src/freertos" -I"src/freertos/include" -I"src/freertos/portable/GCC/ARM_CM4F" -I"src/system" -MMD -MF "${OBJECTDIR}/src/freertos/event_groups.o.d" -o ${OBJECTDIR}/src/freertos/event_groups.o src/freertos/event_groups.c    -DXPRJ_same54_xplained_pro=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	@${FIXDEPS} "${OBJECTDIR}/src/freertos/event_groups.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/src/freertos/list.o: src/freertos/list.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src/freertos" 
	@${RM} ${OBJECTDIR}/src/freertos/list.o.d 
	@${RM} ${OBJECTDIR}/src/freertos/list.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -DUSE_FREERTOS -I"src" -I"src/freertos" -I"src/freertos/include" -I"src/freertos/portable/GCC/ARM_CM4F" -I"src/system" -MMD -MF "${OBJECTDIR}/src/freertos/list.o.d" -o ${OBJECTDIR}/src/freertos/list.o src/freertos/list.c    -DXPRJ_same54_xplained_pro=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	@${FIXDEPS} "${OBJECTDIR}/src/freertos/list.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/src/freertos/queue.o: src/freertos/queue.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src/freertos" 
	@${RM} ${OBJECTDIR}/src/freertos/queue.o.d 
	@${RM} ${OBJECTDIR}/src/freertos/queue.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -DUSE_FREERTOS -I"src" -I"src/freertos" -I"src/freertos/include" -I"src/freertos/portable/GCC/ARM_CM4F" -I"src/system" -MMD -MF "${OBJECTDIR}/src/freertos/queue.o.d" -o ${OBJECTDIR}/src/freertos/queue.o src/freertos/queue.c    -DXPRJ_same54_xplained_pro=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	@${FIXDEPS} "${OBJECTDIR}/src/freertos/queue.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/src/freertos/stream_buffer.o: src/freertos/stream_buffer.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src/freertos" 
	@${RM} ${OBJECTDIR}/src/freertos/stream_buffer.o.d 
	@${RM} ${OBJECTDIR}/src/freertos/stream_buffer.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -DUSE_FREERTOS -I"src" -I"src/freertos" -I"src/freertos/include" -I"src/freertos/portable/GCC/ARM_CM4F" -I"src/system" -MMD -MF "${OBJECTDIR}/src/freertos/stream_buffer.o.d" -o ${OBJECTDIR}/src/freertos/stream_buffer.o src/freertos/stream_buffer.c    -DXPRJ_same54_xplained_pro=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	@${FIXDEPS} "${OBJECTDIR}/src/freertos/stream_buffer.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/src/freertos/tasks.o: src/freertos/tasks.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src/freertos" 
	@${RM} ${OBJECTDIR}/src/freertos/tasks.o.d 
	@${RM} ${OBJECTDIR}/src/freertos/tasks.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -DUSE_FREERTOS -I"src" -I"src/freertos" -I"src/freertos/include" -I"src/freertos/portable/GCC/ARM_CM4F" -I"src/system" -MMD -MF "${OBJECTDIR}/src/freertos/tasks.o.d" -o ${OBJECTDIR}/src/freertos/tasks.o src/freertos/tasks.c    -DXPRJ_same54_xplained_pro=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	@${FIXDEPS} "${OBJECTDIR}/src/freertos/tasks.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/src/freertos/timers.o: src/freertos/timers.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src/freertos" 
	@${RM} ${OBJECTDIR}/src/freertos/timers.o.d 
	@${RM} ${OBJECTDIR}/src/freertos/timers.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -DUSE_FREERTOS -I"src" -I"src/freertos" -I"src/freertos/include" -I"src/freertos/portable/GCC/ARM_CM4F" -I"src/system" -MMD -MF "${OBJECTDIR}/src/freertos/timers.o.d" -o ${OBJECTDIR}/src/freertos/timers.o src/freertos/timers.c    -DXPRJ_same54_xplained_pro=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	@${FIXDEPS} "${OBJECTDIR}/src/freertos/timers.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/src/freertos/freertos_hooks.o: src/freertos/freertos_hooks.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src/freertos" 
	@${RM} ${OBJECTDIR}/src/freertos/freertos_hooks.o.d 
	@${RM} ${OBJECTDIR}/src/freertos/freertos_hooks.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -DUSE_FREERTOS -I"src" -I"src/freertos" -I"src/freertos/include" -I"src/freertos/portable/GCC/ARM_CM4F" -I"src/system" -MMD -MF "${OBJECTDIR}/src/freertos/freertos_hooks.o.d" -o ${OBJECTDIR}/src/freertos/freertos_hooks.o src/freertos/freertos_hooks.c    -DXPRJ_same54_xplained_pro=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	@${FIXDEPS} "${OBJECTDIR}/src/freertos/freertos_hooks.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/src/system/common/board.o: src/system/common/board.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src/system/common" 
	@${RM} ${OBJECTDIR}/src/system/common/board.o.d 
	@${RM} ${OBJECTDIR}/src/system/common/board.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -DUSE_FREERTOS -I"src" -I"src/freertos" -I"src/freertos/include" -I"src/freertos/portable/GCC/ARM_CM4F" -I"src/system" -MMD -MF "${OBJECTDIR}/src/system/common/board.o.d" -o ${OBJECTDIR}/src/system/common/board.o src/system/common/board.c    -DXPRJ_same54_xplained_pro=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	@${FIXDEPS} "${OBJECTDIR}/src/system/common/board.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/src/system/common/cpu.o: src/system/common/cpu.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src/system/common" 
	@${RM} ${OBJECTDIR}/src/system/common/cpu.o.d 
	@${RM} ${OBJECTDIR}/src/system/common/cpu.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -DUSE_FREERTOS -I"src" -I"src/freertos" -I"src/freertos/include" -I"src/freertos/portable/GCC/ARM_CM4F" -I"src/system" -MMD -MF "${OBJECTDIR}/src/system/common/cpu.o.d" -o ${OBJECTDIR}/src/system/common/cpu.o src/system/common/cpu.c    -DXPRJ_same54_xplained_pro=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	@${FIXDEPS} "${OBJECTDIR}/src/system/common/cpu.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/src/system/drivers/rtcc.o: src/system/drivers/rtcc.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src/system/drivers" 
	@${RM} ${OBJECTDIR}/src/system/drivers/rtcc.o.d 
	@${RM} ${OBJECTDIR}/src/system/drivers/rtcc.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -DUSE_FREERTOS -I"src" -I"src/freertos" -I"src/freertos/include" -I"src/freertos/portable/GCC/ARM_CM4F" -I"src/system" -MMD -MF "${OBJECTDIR}/src/system/drivers/rtcc.o.d" -o ${OBJECTDIR}/src/system/drivers/rtcc.o src/system/drivers/rtcc.c    -DXPRJ_same54_xplained_pro=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	@${FIXDEPS} "${OBJECTDIR}/src/system/drivers/rtcc.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/src/system/drivers/uart.o: src/system/drivers/uart.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src/system/drivers" 
	@${RM} ${OBJECTDIR}/src/system/drivers/uart.o.d 
	@${RM} ${OBJECTDIR}/src/system/drivers/uart.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -DUSE_FREERTOS -I"src" -I"src/freertos" -I"src/freertos/include" -I"src/freertos/portable/GCC/ARM_CM4F" -I"src/system" -MMD -MF "${OBJECTDIR}/src/system/drivers/uart.o.d" -o ${OBJECTDIR}/src/system/drivers/uart.o src/system/drivers/uart.c    -DXPRJ_same54_xplained_pro=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	@${FIXDEPS} "${OBJECTDIR}/src/system/drivers/uart.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/src/system/drivers/uart_dma.o: src/system/drivers/uart_dma.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src/system/drivers" 
	@${RM} ${OBJECTDIR}/src/system/drivers/uart_dma.o.d 
	@${RM} ${OBJECTDIR}/src/system/drivers/uart_dma.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -DUSE_FREERTOS -I"src" -I"src/freertos" -I"src/freertos/include" -I"src/freertos/portable/GCC/ARM_CM4F" -I"src/system" -MMD -MF "${OBJECTDIR}/src/system/drivers/uart_dma.o.d" -o ${OBJECTDIR}/src/system/drivers/uart_dma.o src/system/drivers/uart_dma.c    -DXPRJ_same54_xplained_pro=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	@${FIXDEPS} "${OBJECTDIR}/src/system/drivers/uart_dma.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/src/main.o: src/main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/main.o.d 
	@${RM} ${OBJECTDIR}/src/main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -DUSE_FREERTOS -I"src" -I"src/freertos" -I"src/freertos/include" -I"src/freertos/portable/GCC/ARM_CM4F" -I"src/system" -MMD -MF "${OBJECTDIR}/src/main.o.d" -o ${OBJECTDIR}/src/main.o src/main.c    -DXPRJ_same54_xplained_pro=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	@${FIXDEPS} "${OBJECTDIR}/src/main.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ 
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compileCPP
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/SAME54FreeRTOS.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -g   -mprocessor=$(MP_PROCESSOR_OPTION)  -o dist/${CND_CONF}/${IMAGE_TYPE}/SAME54FreeRTOS.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_same54_xplained_pro=$(CND_CONF)    $(COMPARISON_BUILD)  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D=__DEBUG_D,--defsym=_min_heap_size=8192,--defsym=_min_stack_size=8192,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml -mdfp="${DFP_DIR}"
	
else
dist/${CND_CONF}/${IMAGE_TYPE}/SAME54FreeRTOS.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mprocessor=$(MP_PROCESSOR_OPTION)  -o dist/${CND_CONF}/${IMAGE_TYPE}/SAME54FreeRTOS.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_same54_xplained_pro=$(CND_CONF)    $(COMPARISON_BUILD)  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=_min_heap_size=8192,--defsym=_min_stack_size=8192,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml -mdfp="${DFP_DIR}"
	${MP_CC_DIR}\\xc32-bin2hex dist/${CND_CONF}/${IMAGE_TYPE}/SAME54FreeRTOS.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} 
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r build/same54_xplained_pro
	${RM} -r dist/same54_xplained_pro

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
