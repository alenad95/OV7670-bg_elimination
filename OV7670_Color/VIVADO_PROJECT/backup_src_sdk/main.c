/******************************************************************************
*
* Copyright (C) 2009 - 2014 Xilinx, Inc.  All rights reserved.
*
* Permission is hereby granted, free of charge, to any person obtaining a copy
* of this software and associated documentation files (the "Software"), to deal
* in the Software without restriction, including without limitation the rights
* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the Software is
* furnished to do so, subject to the following conditions:
*
* The above copyright notice and this permission notice shall be included in
* all copies or substantial portions of the Software.
*
* Use of the Software is limited solely to applications:
* (a) running on a Xilinx device, or
* (b) that interact with a Xilinx device through a bus or interconnect.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
* XILINX  BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
* WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF
* OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
* SOFTWARE.
*
* Except as contained in this notice, the name of the Xilinx shall not be used
* in advertising or otherwise to promote the sale, use or other dealings in
* this Software without prior written authorization from Xilinx.
*
******************************************************************************/

/*
 * Created on: Feb 2, 2017
 *     Author: Mattia Bernasconi
 *       Mail: mattia@studiobernasconi.com
 * Revised by: Alessio Mingozzi and Federico Bertoli
 *
 * This application configures UART 16550 to baud rate 9600.
 * PS7 UART (Zynq) is not initialized by this application, since
 * bootrom/bsp configures it to baud rate 115200
 *
 * ------------------------------------------------
 * | UART TYPE   BAUD RATE                        |
 * ------------------------------------------------
 *   uartns550   9600
 *   uartlite    Configurable only in HW design
 *   ps7_uart    115200 (configured by bootrom/bsp)
 */

#include "main.h"

int main (void) {

	int result;

	if(SD_STREAM_ENABLER)					/* Parameter check; if 0, OV7670 stream will be selected; else, start loading pictures from the SD card */
	{
		mount_sd_card();					/* Mount the SD card into a pointer */
		read_all_from_directory();			/* Read all the pictures in the main SD card's directory */
	}

	//Platform Initialization
	result = init_platform();
	if(result != XST_SUCCESS)
	{
		xil_printf("There is an error about init_platform\n");
	}
	xil_printf("init_platform done \n\r");

	//Application Starting
	result = start_application();
	if(result != XST_SUCCESS)
	{
		xil_printf("There is an error about start_application\n");
	}
	xil_printf("Application started\n");

	u32 threshold = 0x14; //threshold definition
	while(1){
		result = set_threshold(threshold);
		if(result != XST_SUCCESS)
		{
			xil_printf("There is an error setting threshold\n\r");
		}
		xil_printf("Threshold set! \n\r");
		usleep(SLEEP_TIME);
	}

	return 0;
}

