/*
 * axi_gpio_threshold.c
 *
 *  Created on: 10 mar 2021
 *      Author: Alessandro
 */

#include "axi_gpio_threshold.h"

int init_axi_gpio_threshold(void){

	xil_printf("Configurazione threshold GPIO\n");

		threshold_gpio_config = XGpio_LookupConfig(XPAR_BACKGROUND_ERASER_THRESHOLD_AXI_GPIO_BASEADDR);
		if (threshold_gpio_config == NULL)
		{
			perror("Device config not found in init_axi_gpio_threshold");
			return XST_FAILURE;
		}

		if (XGpio_CfgInitialize(&thresholdGPIO, threshold_gpio_config, threshold_gpio_config->BaseAddress) != XST_SUCCESS)
		{
			perror("Error init_axi_gpio_threshold");
			return XST_FAILURE;
		}
		return XST_SUCCESS;

}


int set_threshold(u32 threshold){

	XGpio_DiscreteWrite(&thresholdGPIO, 1, threshold);
	return XST_SUCCESS;
}
