/*
 * application.c
 *
 *  Created on: Feb 2, 2017
 *      Author: Mattia Bernasconi
 *        Mail: mattia@studiobernasconi.com
 */

#include "application.h"

int start_application()
{
	int result;

	//RESET PL
	result = reset_PL(100000);
	if(result != XST_SUCCESS)
	{
		xil_printf("There is an error about reset_PL\n\r");
	}
	xil_printf("reset_PL done \n\r");

	//CONFIGURE INTERRUPTS
	result = configure_interrupts();
	if(result != XST_SUCCESS)
	{
		xil_printf("There is an error about configure_interrupts\n\r");
	}
	xil_printf("configure_interrupts done \n\r");

	//DISABLE INTERRUPTS
	result = disable_interrupts();
	if(result != XST_SUCCESS)
	{
		xil_printf("There is an error about disable_interrupts\n\r");
	}
	xil_printf("disable_interrupts done \n\r");

	//CONFIGURE MUX
	result = configure_mux_sd_switch_ov();
	if(result != XST_SUCCESS)
	{
		xil_printf("There is an error about configue_mux_sd_switch_ov\n\r");
	}
	xil_printf("configure_mux_sd_switch_ov done \n\r");

	//CONFIGURE DDR WRITER
	result = configue_axis_to_ddr_writer();
	if(result != XST_SUCCESS)
	{
		xil_printf("There is an error about configue_axis_to_ddr_writer\n\r");
	}
	xil_printf("configue_axis_to_ddr_writer done \n\r");

	//CONFIGURE DDR WRITER LUMA
	result = configue_axis_to_ddr_writer_luma();
	if(result != XST_SUCCESS)
	{
		xil_printf("There is an error about configue_axis_to_ddr_writer\n\r");
	}
	xil_printf("configue_axis_to_ddr_writer done \n\r");

	//CONFIGURE DDR WRITER CHROMA
	result = configue_axis_to_ddr_writer_chroma();
	if(result != XST_SUCCESS)
	{
		xil_printf("There is an error about configue_axis_to_ddr_writer\n\r");
	}
	xil_printf("configue_axis_to_ddr_writer done \n\r");

	//CONFIGURE DDR READER
	result = configue_ddr_to_axis_reader();
	if(result != XST_SUCCESS)
	{
		xil_printf("There is an error about configue_ddr_to_axis_reader\n\r");
	}
	xil_printf("configue_ddr_to_axis_reader done \n\r");

	//CONFIGURE DDR READER_REF
	result = configue_ddr_to_axis_reader_ref();
	if(result != XST_SUCCESS)
	{
		xil_printf("There is an error about configue_ddr_to_axis_reader_ref\n\r");
	}
	xil_printf("configue_ddr_to_axis_reader_ref done \n\r");

	//CONFIGURE DDR READER SD
	if(SD_STREAM_ENABLER)					//check whether the sd reader module should be configured or not
	{
		start_application_SD_funcs();
	}

	//START UDP APPLICATION
	/*result = start_udp();
	if(result != XST_SUCCESS)
	{
		xil_printf("There is an error about start_udp\n\r");
	}
	xil_printf("start_udp done \n\r");*/

	//ENABLE INTERRUPTS
	result = enable_interrupts();
	if(result != XST_SUCCESS)
	{
		xil_printf("There is an error about enable_interrupts\n\r");
	}
	xil_printf("enable_interrupts done \n\r");

	//CONFIGURE CAMERA BY I2C
	result = OV7670_configure();
	if(result != XST_SUCCESS)
	{
		xil_printf("There is an error about configue_camera_by_i2c\n\r");
	}

	printf("[INFO] Output color format set to UYVY\n");

	// OV7670_change_order_for_YUV("UYVY");

	printf("[INFO] Camera is configured, up and running\n");

	//TEST NESTED INTERRUPT
	//Remove comment to test IIC read communication
	// test_neasted_interrupts();

	//START TCP APPLICATION

	/*printf("[INFO] Starting TCP connection...\n");

	result = start_tcp();

	if(result != XST_SUCCESS)
	{
		printf("[ERROR] start_tcp failed\n");
	}

	printf("[INFO] start_tcp done\n");
	printf("[INFO] TCP is up and running\n");*/


	return XST_SUCCESS;


}



int start_application_SD_funcs()
{
	//CONFIGURE DDR READER
	int result = configure_ddr_to_axis_reader_SD();
	if(result != XST_SUCCESS)
	{
		xil_printf("There is an error about configue_ddr_to_axis_reader_SD\n\r");
	}
	xil_printf("configue_ddr_to_axis_reader_SD done \n\r");

	return XST_SUCCESS;
}
