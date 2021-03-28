/*
 * platform.c
 *
 *  Created on: Feb 2, 2017
 *      Author: Mattia Bernasconi
 *        Mail: mattia@studiobernasconi.com
 */

#include "platform.h"
#include "ov7670_config_i2c.h"

int init_platform(void)
{
	xil_printf("[INFO] Starting ARM application\n");
	int result;

	//MUX_SD_SWITCH
	result = init_mux_sd_switch_ov();
	if(result != XST_SUCCESS)
	{
		xil_printf("There is an error about mux_sd_switch_ov\n\r");
	}
	xil_printf("mux_sd_switch_ov done \n\r");

	//DDR Writer
	result = init_axis_to_ddr_writer();
	if(result != XST_SUCCESS)
	{
		xil_printf("There is an error about axis_to_ddr_writer\n\r");
	}
	xil_printf("axis_to_ddr_writer done \n\r");

	//DDR Writer LUMA
	result = init_axis_to_ddr_writer_luma();
	if(result != XST_SUCCESS)
	{
		xil_printf("There is an error about axis_to_ddr_writer\n\r");
	}
	xil_printf("axis_to_ddr_writer done \n\r");

	//DDR Writer CHROMA
	result = init_axis_to_ddr_writer_chroma();
	if(result != XST_SUCCESS)
	{
		xil_printf("There is an error about axis_to_ddr_writer\n\r");
	}
	xil_printf("axis_to_ddr_writer done \n\r");

	//DDR Reader
	result = init_ddr_to_axis_reader();
	if(result != XST_SUCCESS)
	{
		xil_printf("There is an error about ddr_to_axis_reader\n\r");
	}
	xil_printf("ddr_to_axis_reader done \n\r");

	//CONVOLUTION FILTER
	result = convolution_filter_init();
	if (result != XST_SUCCESS)
	{
		xil_printf("An error occurred while executing init_convolution_filter\n\r");
	}
	xil_printf("convolution_filter done \n\r");

	//DDR READER SD
	if(SD_STREAM_ENABLER)				//check whether the reader_sd from DDR module should be started or not
	{
		init_platform_SD_funcs();
	}

	//GPIO Frame Intr
	result = init_axi_gpio_frame_intr();
	if(result != XST_SUCCESS)
	{
		xil_printf("There is an error about axi_gpio_frame_intr\n\r");
	}
	xil_printf("axi_gpio_frame_intr done \n\r");

	//GPIO PL Reset
	result = init_axi_gpio_pl_reset();
	if(result != XST_SUCCESS)
	{
		xil_printf("There is an error about axi_gpio_pl_reset\n\r");
	}
	xil_printf("axi_gpio_pl_reset done \n\r");

	//ZYNQ I2C
	result = init_zynq_i2c(IIC_DEVICE_ID, &Iic, &Config);
	if(result != XST_SUCCESS)
	{
		xil_printf("There is an error about zynq_i2c\n\r");
	}
	xil_printf("zynq_i2c done \n\r");

	//ZYNQ GIC
	result = init_zynq_gic();
	if(result != XST_SUCCESS)
	{
		xil_printf("There is an error about init_zynq_gic\n\r");
	}
	xil_printf("init_zynq_gic done \n\r");

	//INIT UDP
	result = init_network();
	if(result != XST_SUCCESS)
	{
		xil_printf("There is an error about init_network\n\r");
	}
	xil_printf("init_network done \n\r");

	return XST_SUCCESS;
}

int init_platform_SD_funcs()
{
	//DDR Reader SD CARD
	int result = init_ddr_to_axis_reader_SD();

	if(result != XST_SUCCESS)
	{
		xil_printf("There is an error about ddr_to_axis_reader_sd\n\r");
	}
	xil_printf("ddr_to_axis_reader_sd done \n\r");

	return XST_SUCCESS;
}
