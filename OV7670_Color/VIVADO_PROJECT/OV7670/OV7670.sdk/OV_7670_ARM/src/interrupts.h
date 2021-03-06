/*
 * interrupts.h
 *
 *  Created on: Feb 2, 2017
 *      Author: Mattia Bernasconi
 *        Mail: mattia@studiobernasconi.com
 */

#ifndef SRC_INTERRUPTS_INTERRUPTS_H_
#define SRC_INTERRUPTS_INTERRUPTS_H_

#include "platform_config.h"
#include "frame_buffer_interrupt.h"
#include "i2c_interrupt.h"
#include "platform.h"
#include "application.h"

#define SLEEP_TIME 819200 // sleep time in us in order to write 8 frame buffers

int enable_interrupts();
int disable_interrupts();
int configure_interrupts();
int configure_capture_ref_interrupt();

int configure_SW_reset_interrupt();
void SW_reset_handler(void *ptr);
void capture_ref_handler(void *ptr);

#endif /* SRC_INTERRUPTS_INTERRUPTS_H_ */
