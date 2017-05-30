/*
 * system.h - SOPC Builder system and BSP software package information
 *
 * Machine generated for CPU 'nios2_qsys' in SOPC Builder design 'DE2_115_QSYS'
 * SOPC Builder design path: ../../DE2_115_QSYS.sopcinfo
 *
 * Generated: Mon May 29 14:15:56 CEST 2017
 */

/*
 * DO NOT MODIFY THIS FILE
 *
 * Changing this file will have subtle consequences
 * which will almost certainly lead to a nonfunctioning
 * system. If you do modify this file, be aware that your
 * changes will be overwritten and lost when this file
 * is generated again.
 *
 * DO NOT MODIFY THIS FILE
 */

/*
 * License Agreement
 *
 * Copyright (c) 2008
 * Altera Corporation, San Jose, California, USA.
 * All rights reserved.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a
 * copy of this software and associated documentation files (the "Software"),
 * to deal in the Software without restriction, including without limitation
 * the rights to use, copy, modify, merge, publish, distribute, sublicense,
 * and/or sell copies of the Software, and to permit persons to whom the
 * Software is furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
 * DEALINGS IN THE SOFTWARE.
 *
 * This agreement shall be governed in all respects by the laws of the State
 * of California and by the laws of the United States of America.
 */

#ifndef __SYSTEM_H_
#define __SYSTEM_H_

/* Include definitions from linker script generator */
#include "linker.h"


/*
 * CPU configuration
 *
 */

#define ALT_CPU_ARCHITECTURE "altera_nios2_gen2"
#define ALT_CPU_BIG_ENDIAN 0
#define ALT_CPU_BREAK_ADDR 0x00040820
#define ALT_CPU_CPU_ARCH_NIOS2_R1
#define ALT_CPU_CPU_FREQ 50000000u
#define ALT_CPU_CPU_ID_SIZE 1
#define ALT_CPU_CPU_ID_VALUE 0x00000000
#define ALT_CPU_CPU_IMPLEMENTATION "tiny"
#define ALT_CPU_DATA_ADDR_WIDTH 0x14
#define ALT_CPU_DCACHE_LINE_SIZE 0
#define ALT_CPU_DCACHE_LINE_SIZE_LOG2 0
#define ALT_CPU_DCACHE_SIZE 0
#define ALT_CPU_EXCEPTION_ADDR 0x00020020
#define ALT_CPU_FLASH_ACCELERATOR_LINES 0
#define ALT_CPU_FLASH_ACCELERATOR_LINE_SIZE 0
#define ALT_CPU_FLUSHDA_SUPPORTED
#define ALT_CPU_FREQ 50000000
#define ALT_CPU_HARDWARE_DIVIDE_PRESENT 0
#define ALT_CPU_HARDWARE_MULTIPLY_PRESENT 0
#define ALT_CPU_HARDWARE_MULX_PRESENT 0
#define ALT_CPU_HAS_DEBUG_CORE 1
#define ALT_CPU_HAS_DEBUG_STUB
#define ALT_CPU_HAS_ILLEGAL_INSTRUCTION_EXCEPTION
#define ALT_CPU_HAS_JMPI_INSTRUCTION
#define ALT_CPU_ICACHE_LINE_SIZE 0
#define ALT_CPU_ICACHE_LINE_SIZE_LOG2 0
#define ALT_CPU_ICACHE_SIZE 0
#define ALT_CPU_INST_ADDR_WIDTH 0x13
#define ALT_CPU_NAME "nios2_qsys"
#define ALT_CPU_OCI_VERSION 1
#define ALT_CPU_RESET_ADDR 0x00020000


/*
 * CPU configuration (with legacy prefix - don't use these anymore)
 *
 */

#define NIOS2_BIG_ENDIAN 0
#define NIOS2_BREAK_ADDR 0x00040820
#define NIOS2_CPU_ARCH_NIOS2_R1
#define NIOS2_CPU_FREQ 50000000u
#define NIOS2_CPU_ID_SIZE 1
#define NIOS2_CPU_ID_VALUE 0x00000000
#define NIOS2_CPU_IMPLEMENTATION "tiny"
#define NIOS2_DATA_ADDR_WIDTH 0x14
#define NIOS2_DCACHE_LINE_SIZE 0
#define NIOS2_DCACHE_LINE_SIZE_LOG2 0
#define NIOS2_DCACHE_SIZE 0
#define NIOS2_EXCEPTION_ADDR 0x00020020
#define NIOS2_FLASH_ACCELERATOR_LINES 0
#define NIOS2_FLASH_ACCELERATOR_LINE_SIZE 0
#define NIOS2_FLUSHDA_SUPPORTED
#define NIOS2_HARDWARE_DIVIDE_PRESENT 0
#define NIOS2_HARDWARE_MULTIPLY_PRESENT 0
#define NIOS2_HARDWARE_MULX_PRESENT 0
#define NIOS2_HAS_DEBUG_CORE 1
#define NIOS2_HAS_DEBUG_STUB
#define NIOS2_HAS_ILLEGAL_INSTRUCTION_EXCEPTION
#define NIOS2_HAS_JMPI_INSTRUCTION
#define NIOS2_ICACHE_LINE_SIZE 0
#define NIOS2_ICACHE_LINE_SIZE_LOG2 0
#define NIOS2_ICACHE_SIZE 0
#define NIOS2_INST_ADDR_WIDTH 0x13
#define NIOS2_OCI_VERSION 1
#define NIOS2_RESET_ADDR 0x00020000


/*
 * Define for each module class mastered by the CPU
 *
 */

#define __ALTERA_AVALON_JTAG_UART
#define __ALTERA_AVALON_LCD_16207
#define __ALTERA_AVALON_ONCHIP_MEMORY2
#define __ALTERA_AVALON_PIO
#define __ALTERA_AVALON_SYSID_QSYS
#define __ALTERA_AVALON_TIMER
#define __ALTERA_NIOS2_GEN2


/*
 * System configuration
 *
 */

#define ALT_DEVICE_FAMILY "Cyclone IV E"
#define ALT_ENHANCED_INTERRUPT_API_PRESENT
#define ALT_IRQ_BASE NULL
#define ALT_LOG_PORT "/dev/null"
#define ALT_LOG_PORT_BASE 0x0
#define ALT_LOG_PORT_DEV null
#define ALT_LOG_PORT_TYPE ""
#define ALT_NUM_EXTERNAL_INTERRUPT_CONTROLLERS 0
#define ALT_NUM_INTERNAL_INTERRUPT_CONTROLLERS 1
#define ALT_NUM_INTERRUPT_CONTROLLERS 1
#define ALT_STDERR "/dev/jtag_uart"
#define ALT_STDERR_BASE 0x81108
#define ALT_STDERR_DEV jtag_uart
#define ALT_STDERR_IS_JTAG_UART
#define ALT_STDERR_PRESENT
#define ALT_STDERR_TYPE "altera_avalon_jtag_uart"
#define ALT_STDIN "/dev/jtag_uart"
#define ALT_STDIN_BASE 0x81108
#define ALT_STDIN_DEV jtag_uart
#define ALT_STDIN_IS_JTAG_UART
#define ALT_STDIN_PRESENT
#define ALT_STDIN_TYPE "altera_avalon_jtag_uart"
#define ALT_STDOUT "/dev/jtag_uart"
#define ALT_STDOUT_BASE 0x81108
#define ALT_STDOUT_DEV jtag_uart
#define ALT_STDOUT_IS_JTAG_UART
#define ALT_STDOUT_PRESENT
#define ALT_STDOUT_TYPE "altera_avalon_jtag_uart"
#define ALT_SYSTEM_NAME "DE2_115_QSYS"


/*
 * framebuffer_addr configuration
 *
 */

#define ALT_MODULE_CLASS_framebuffer_addr altera_avalon_pio
#define FRAMEBUFFER_ADDR_BASE 0x41220
#define FRAMEBUFFER_ADDR_BIT_CLEARING_EDGE_REGISTER 0
#define FRAMEBUFFER_ADDR_BIT_MODIFYING_OUTPUT_REGISTER 0
#define FRAMEBUFFER_ADDR_CAPTURE 0
#define FRAMEBUFFER_ADDR_DATA_WIDTH 24
#define FRAMEBUFFER_ADDR_DO_TEST_BENCH_WIRING 0
#define FRAMEBUFFER_ADDR_DRIVEN_SIM_VALUE 0
#define FRAMEBUFFER_ADDR_EDGE_TYPE "NONE"
#define FRAMEBUFFER_ADDR_FREQ 50000000
#define FRAMEBUFFER_ADDR_HAS_IN 0
#define FRAMEBUFFER_ADDR_HAS_OUT 1
#define FRAMEBUFFER_ADDR_HAS_TRI 0
#define FRAMEBUFFER_ADDR_IRQ -1
#define FRAMEBUFFER_ADDR_IRQ_INTERRUPT_CONTROLLER_ID -1
#define FRAMEBUFFER_ADDR_IRQ_TYPE "NONE"
#define FRAMEBUFFER_ADDR_NAME "/dev/framebuffer_addr"
#define FRAMEBUFFER_ADDR_RESET_VALUE 0
#define FRAMEBUFFER_ADDR_SPAN 16
#define FRAMEBUFFER_ADDR_TYPE "altera_avalon_pio"


/*
 * framebuffer_clk configuration
 *
 */

#define ALT_MODULE_CLASS_framebuffer_clk altera_avalon_pio
#define FRAMEBUFFER_CLK_BASE 0x41210
#define FRAMEBUFFER_CLK_BIT_CLEARING_EDGE_REGISTER 0
#define FRAMEBUFFER_CLK_BIT_MODIFYING_OUTPUT_REGISTER 0
#define FRAMEBUFFER_CLK_CAPTURE 0
#define FRAMEBUFFER_CLK_DATA_WIDTH 1
#define FRAMEBUFFER_CLK_DO_TEST_BENCH_WIRING 0
#define FRAMEBUFFER_CLK_DRIVEN_SIM_VALUE 0
#define FRAMEBUFFER_CLK_EDGE_TYPE "NONE"
#define FRAMEBUFFER_CLK_FREQ 50000000
#define FRAMEBUFFER_CLK_HAS_IN 0
#define FRAMEBUFFER_CLK_HAS_OUT 1
#define FRAMEBUFFER_CLK_HAS_TRI 0
#define FRAMEBUFFER_CLK_IRQ -1
#define FRAMEBUFFER_CLK_IRQ_INTERRUPT_CONTROLLER_ID -1
#define FRAMEBUFFER_CLK_IRQ_TYPE "NONE"
#define FRAMEBUFFER_CLK_NAME "/dev/framebuffer_clk"
#define FRAMEBUFFER_CLK_RESET_VALUE 0
#define FRAMEBUFFER_CLK_SPAN 16
#define FRAMEBUFFER_CLK_TYPE "altera_avalon_pio"


/*
 * framebuffer_data configuration
 *
 */

#define ALT_MODULE_CLASS_framebuffer_data altera_avalon_pio
#define FRAMEBUFFER_DATA_BASE 0x41200
#define FRAMEBUFFER_DATA_BIT_CLEARING_EDGE_REGISTER 0
#define FRAMEBUFFER_DATA_BIT_MODIFYING_OUTPUT_REGISTER 0
#define FRAMEBUFFER_DATA_CAPTURE 0
#define FRAMEBUFFER_DATA_DATA_WIDTH 19
#define FRAMEBUFFER_DATA_DO_TEST_BENCH_WIRING 0
#define FRAMEBUFFER_DATA_DRIVEN_SIM_VALUE 0
#define FRAMEBUFFER_DATA_EDGE_TYPE "NONE"
#define FRAMEBUFFER_DATA_FREQ 50000000
#define FRAMEBUFFER_DATA_HAS_IN 0
#define FRAMEBUFFER_DATA_HAS_OUT 1
#define FRAMEBUFFER_DATA_HAS_TRI 0
#define FRAMEBUFFER_DATA_IRQ -1
#define FRAMEBUFFER_DATA_IRQ_INTERRUPT_CONTROLLER_ID -1
#define FRAMEBUFFER_DATA_IRQ_TYPE "NONE"
#define FRAMEBUFFER_DATA_NAME "/dev/framebuffer_data"
#define FRAMEBUFFER_DATA_RESET_VALUE 0
#define FRAMEBUFFER_DATA_SPAN 16
#define FRAMEBUFFER_DATA_TYPE "altera_avalon_pio"


/*
 * hal configuration
 *
 */

#define ALT_INCLUDE_INSTRUCTION_RELATED_EXCEPTION_API
#define ALT_MAX_FD 32
#define ALT_SYS_CLK none
#define ALT_TIMESTAMP_CLK none


/*
 * jtag_uart configuration
 *
 */

#define ALT_MODULE_CLASS_jtag_uart altera_avalon_jtag_uart
#define JTAG_UART_BASE 0x81108
#define JTAG_UART_IRQ 0
#define JTAG_UART_IRQ_INTERRUPT_CONTROLLER_ID 0
#define JTAG_UART_NAME "/dev/jtag_uart"
#define JTAG_UART_READ_DEPTH 64
#define JTAG_UART_READ_THRESHOLD 8
#define JTAG_UART_SPAN 8
#define JTAG_UART_TYPE "altera_avalon_jtag_uart"
#define JTAG_UART_WRITE_DEPTH 64
#define JTAG_UART_WRITE_THRESHOLD 8


/*
 * key configuration
 *
 */

#define ALT_MODULE_CLASS_key altera_avalon_pio
#define KEY_BASE 0x410c0
#define KEY_BIT_CLEARING_EDGE_REGISTER 0
#define KEY_BIT_MODIFYING_OUTPUT_REGISTER 0
#define KEY_CAPTURE 0
#define KEY_DATA_WIDTH 4
#define KEY_DO_TEST_BENCH_WIRING 0
#define KEY_DRIVEN_SIM_VALUE 0
#define KEY_EDGE_TYPE "NONE"
#define KEY_FREQ 50000000
#define KEY_HAS_IN 1
#define KEY_HAS_OUT 0
#define KEY_HAS_TRI 0
#define KEY_IRQ -1
#define KEY_IRQ_INTERRUPT_CONTROLLER_ID -1
#define KEY_IRQ_TYPE "NONE"
#define KEY_NAME "/dev/key"
#define KEY_RESET_VALUE 0
#define KEY_SPAN 16
#define KEY_TYPE "altera_avalon_pio"


/*
 * lcd_0 configuration
 *
 */

#define ALT_MODULE_CLASS_lcd_0 altera_avalon_lcd_16207
#define LCD_0_BASE 0x411d0
#define LCD_0_IRQ -1
#define LCD_0_IRQ_INTERRUPT_CONTROLLER_ID -1
#define LCD_0_NAME "/dev/lcd_0"
#define LCD_0_SPAN 16
#define LCD_0_TYPE "altera_avalon_lcd_16207"


/*
 * ledg configuration
 *
 */

#define ALT_MODULE_CLASS_ledg altera_avalon_pio
#define LEDG_BASE 0x410e0
#define LEDG_BIT_CLEARING_EDGE_REGISTER 0
#define LEDG_BIT_MODIFYING_OUTPUT_REGISTER 0
#define LEDG_CAPTURE 0
#define LEDG_DATA_WIDTH 9
#define LEDG_DO_TEST_BENCH_WIRING 0
#define LEDG_DRIVEN_SIM_VALUE 0
#define LEDG_EDGE_TYPE "NONE"
#define LEDG_FREQ 50000000
#define LEDG_HAS_IN 0
#define LEDG_HAS_OUT 1
#define LEDG_HAS_TRI 0
#define LEDG_IRQ -1
#define LEDG_IRQ_INTERRUPT_CONTROLLER_ID -1
#define LEDG_IRQ_TYPE "NONE"
#define LEDG_NAME "/dev/ledg"
#define LEDG_RESET_VALUE 0
#define LEDG_SPAN 16
#define LEDG_TYPE "altera_avalon_pio"


/*
 * ledr configuration
 *
 */

#define ALT_MODULE_CLASS_ledr altera_avalon_pio
#define LEDR_BASE 0x411e0
#define LEDR_BIT_CLEARING_EDGE_REGISTER 0
#define LEDR_BIT_MODIFYING_OUTPUT_REGISTER 0
#define LEDR_CAPTURE 0
#define LEDR_DATA_WIDTH 18
#define LEDR_DO_TEST_BENCH_WIRING 0
#define LEDR_DRIVEN_SIM_VALUE 0
#define LEDR_EDGE_TYPE "NONE"
#define LEDR_FREQ 50000000
#define LEDR_HAS_IN 0
#define LEDR_HAS_OUT 1
#define LEDR_HAS_TRI 0
#define LEDR_IRQ -1
#define LEDR_IRQ_INTERRUPT_CONTROLLER_ID -1
#define LEDR_IRQ_TYPE "NONE"
#define LEDR_NAME "/dev/ledr"
#define LEDR_RESET_VALUE 0
#define LEDR_SPAN 16
#define LEDR_TYPE "altera_avalon_pio"


/*
 * onchip_memory2 configuration
 *
 */

#define ALT_MODULE_CLASS_onchip_memory2 altera_avalon_onchip_memory2
#define ONCHIP_MEMORY2_ALLOW_IN_SYSTEM_MEMORY_CONTENT_EDITOR 0
#define ONCHIP_MEMORY2_ALLOW_MRAM_SIM_CONTENTS_ONLY_FILE 0
#define ONCHIP_MEMORY2_BASE 0x20000
#define ONCHIP_MEMORY2_CONTENTS_INFO ""
#define ONCHIP_MEMORY2_DUAL_PORT 0
#define ONCHIP_MEMORY2_GUI_RAM_BLOCK_TYPE "AUTO"
#define ONCHIP_MEMORY2_INIT_CONTENTS_FILE "DE2_115_QSYS_onchip_memory2"
#define ONCHIP_MEMORY2_INIT_MEM_CONTENT 1
#define ONCHIP_MEMORY2_INSTANCE_ID "NONE"
#define ONCHIP_MEMORY2_IRQ -1
#define ONCHIP_MEMORY2_IRQ_INTERRUPT_CONTROLLER_ID -1
#define ONCHIP_MEMORY2_NAME "/dev/onchip_memory2"
#define ONCHIP_MEMORY2_NON_DEFAULT_INIT_FILE_ENABLED 0
#define ONCHIP_MEMORY2_RAM_BLOCK_TYPE "AUTO"
#define ONCHIP_MEMORY2_READ_DURING_WRITE_MODE "DONT_CARE"
#define ONCHIP_MEMORY2_SINGLE_CLOCK_OP 0
#define ONCHIP_MEMORY2_SIZE_MULTIPLE 1
#define ONCHIP_MEMORY2_SIZE_VALUE 100000
#define ONCHIP_MEMORY2_SPAN 100000
#define ONCHIP_MEMORY2_TYPE "altera_avalon_onchip_memory2"
#define ONCHIP_MEMORY2_WRITABLE 1


/*
 * sevseg_0 configuration
 *
 */

#define ALT_MODULE_CLASS_sevseg_0 altera_avalon_pio
#define SEVSEG_0_BASE 0x411a0
#define SEVSEG_0_BIT_CLEARING_EDGE_REGISTER 0
#define SEVSEG_0_BIT_MODIFYING_OUTPUT_REGISTER 0
#define SEVSEG_0_CAPTURE 0
#define SEVSEG_0_DATA_WIDTH 8
#define SEVSEG_0_DO_TEST_BENCH_WIRING 0
#define SEVSEG_0_DRIVEN_SIM_VALUE 0
#define SEVSEG_0_EDGE_TYPE "NONE"
#define SEVSEG_0_FREQ 50000000
#define SEVSEG_0_HAS_IN 0
#define SEVSEG_0_HAS_OUT 1
#define SEVSEG_0_HAS_TRI 0
#define SEVSEG_0_IRQ -1
#define SEVSEG_0_IRQ_INTERRUPT_CONTROLLER_ID -1
#define SEVSEG_0_IRQ_TYPE "NONE"
#define SEVSEG_0_NAME "/dev/sevseg_0"
#define SEVSEG_0_RESET_VALUE 0
#define SEVSEG_0_SPAN 16
#define SEVSEG_0_TYPE "altera_avalon_pio"


/*
 * sevseg_1 configuration
 *
 */

#define ALT_MODULE_CLASS_sevseg_1 altera_avalon_pio
#define SEVSEG_1_BASE 0x411b0
#define SEVSEG_1_BIT_CLEARING_EDGE_REGISTER 0
#define SEVSEG_1_BIT_MODIFYING_OUTPUT_REGISTER 0
#define SEVSEG_1_CAPTURE 0
#define SEVSEG_1_DATA_WIDTH 8
#define SEVSEG_1_DO_TEST_BENCH_WIRING 0
#define SEVSEG_1_DRIVEN_SIM_VALUE 0
#define SEVSEG_1_EDGE_TYPE "NONE"
#define SEVSEG_1_FREQ 50000000
#define SEVSEG_1_HAS_IN 0
#define SEVSEG_1_HAS_OUT 1
#define SEVSEG_1_HAS_TRI 0
#define SEVSEG_1_IRQ -1
#define SEVSEG_1_IRQ_INTERRUPT_CONTROLLER_ID -1
#define SEVSEG_1_IRQ_TYPE "NONE"
#define SEVSEG_1_NAME "/dev/sevseg_1"
#define SEVSEG_1_RESET_VALUE 0
#define SEVSEG_1_SPAN 16
#define SEVSEG_1_TYPE "altera_avalon_pio"


/*
 * sevseg_2 configuration
 *
 */

#define ALT_MODULE_CLASS_sevseg_2 altera_avalon_pio
#define SEVSEG_2_BASE 0x411c0
#define SEVSEG_2_BIT_CLEARING_EDGE_REGISTER 0
#define SEVSEG_2_BIT_MODIFYING_OUTPUT_REGISTER 0
#define SEVSEG_2_CAPTURE 0
#define SEVSEG_2_DATA_WIDTH 16
#define SEVSEG_2_DO_TEST_BENCH_WIRING 0
#define SEVSEG_2_DRIVEN_SIM_VALUE 0
#define SEVSEG_2_EDGE_TYPE "NONE"
#define SEVSEG_2_FREQ 50000000
#define SEVSEG_2_HAS_IN 0
#define SEVSEG_2_HAS_OUT 1
#define SEVSEG_2_HAS_TRI 0
#define SEVSEG_2_IRQ -1
#define SEVSEG_2_IRQ_INTERRUPT_CONTROLLER_ID -1
#define SEVSEG_2_IRQ_TYPE "NONE"
#define SEVSEG_2_NAME "/dev/sevseg_2"
#define SEVSEG_2_RESET_VALUE 0
#define SEVSEG_2_SPAN 16
#define SEVSEG_2_TYPE "altera_avalon_pio"


/*
 * sw configuration
 *
 */

#define ALT_MODULE_CLASS_sw altera_avalon_pio
#define SW_BASE 0x410d0
#define SW_BIT_CLEARING_EDGE_REGISTER 0
#define SW_BIT_MODIFYING_OUTPUT_REGISTER 0
#define SW_CAPTURE 0
#define SW_DATA_WIDTH 10
#define SW_DO_TEST_BENCH_WIRING 0
#define SW_DRIVEN_SIM_VALUE 0
#define SW_EDGE_TYPE "NONE"
#define SW_FREQ 50000000
#define SW_HAS_IN 1
#define SW_HAS_OUT 0
#define SW_HAS_TRI 0
#define SW_IRQ -1
#define SW_IRQ_INTERRUPT_CONTROLLER_ID -1
#define SW_IRQ_TYPE "NONE"
#define SW_NAME "/dev/sw"
#define SW_RESET_VALUE 0
#define SW_SPAN 16
#define SW_TYPE "altera_avalon_pio"


/*
 * sysid_qsys configuration
 *
 */

#define ALT_MODULE_CLASS_sysid_qsys altera_avalon_sysid_qsys
#define SYSID_QSYS_BASE 0x41100
#define SYSID_QSYS_ID 0
#define SYSID_QSYS_IRQ -1
#define SYSID_QSYS_IRQ_INTERRUPT_CONTROLLER_ID -1
#define SYSID_QSYS_NAME "/dev/sysid_qsys"
#define SYSID_QSYS_SPAN 8
#define SYSID_QSYS_TIMESTAMP 1496058854
#define SYSID_QSYS_TYPE "altera_avalon_sysid_qsys"


/*
 * timer configuration
 *
 */

#define ALT_MODULE_CLASS_timer altera_avalon_timer
#define TIMER_ALWAYS_RUN 0
#define TIMER_BASE 0x0
#define TIMER_COUNTER_SIZE 32
#define TIMER_FIXED_PERIOD 0
#define TIMER_FREQ 50000000
#define TIMER_IRQ 3
#define TIMER_IRQ_INTERRUPT_CONTROLLER_ID 0
#define TIMER_LOAD_VALUE 49999
#define TIMER_MULT 0.001
#define TIMER_NAME "/dev/timer"
#define TIMER_PERIOD 1
#define TIMER_PERIOD_UNITS "ms"
#define TIMER_RESET_OUTPUT 0
#define TIMER_SNAPSHOT 1
#define TIMER_SPAN 32
#define TIMER_TICKS_PER_SEC 1000
#define TIMER_TIMEOUT_PULSE_OUTPUT 0
#define TIMER_TYPE "altera_avalon_timer"

#endif /* __SYSTEM_H_ */
