/*
 * axi_gpio_threshold.h
 *
 *  Created on: 10 mar 2021
 *      Author: Alessandro
 */

#ifndef SRC_AXI_GPIO_THRESHOLD_H_
#define SRC_AXI_GPIO_THRESHOLD_H_

#include <unistd.h>
#include "platform_config.h"

XGpio thresholdGPIO;
XGpio_Config *threshold_gpio_config;

int init_axi_gpio_threshold(void);
int set_threshold(u32 threshold);

#endif /* SRC_AXI_GPIO_THRESHOLD_H_ */
