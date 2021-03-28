/*
 * ddr_to_axis_reader.c
 *
 *  Created on: Feb 2, 2017
 *      Author: Mattia Bernasconi
 *        Mail: mattia@studiobernasconi.com
 */

#include "ddr_to_axis_reader.h"

int init_ddr_to_axis_reader(void)
{
	int status;

	status = XDdr_to_axis_reader_Initialize(&reader, XPAR_XDDR_TO_AXIS_READER_0_DEVICE_ID);

	if (status != XST_SUCCESS)
	{
		xil_printf("Errore inizializzazione reader\n");
		return status;
	}
	return XST_SUCCESS;
}

int configue_ddr_to_axis_reader(void)
{
	XDdr_to_axis_reader_Set_base_address(&reader, FRAME_BUFFER_BASE_ADDR);
	XDdr_to_axis_reader_Set_frame_buffer_dim(&reader, FRAME_BUFFER_DIM);
	XDdr_to_axis_reader_Set_frame_buffer_number(&reader, FRAME_BUFFER_NUM);
	XDdr_to_axis_reader_Set_frame_buffer_offset(&reader, FRAME_BUFFER_DIM);
	XDdr_to_axis_reader_Set_update_intr(&reader, 1);
	XDdr_to_axis_reader_EnableAutoRestart(&reader);
	XDdr_to_axis_reader_Start(&reader);

	return XST_SUCCESS;
}


int init_ddr_to_axis_reader_ref(void)
{
	int status;

	status = XDdr_to_axis_reader_Initialize(&reader_ref, XPAR_VDMA_DDR_TO_AXIS_READER_REF_DEVICE_ID);

	if (status != XST_SUCCESS)
	{
		xil_printf("Errore inizializzazione reader\n");
		return status;
	}
	return XST_SUCCESS;
}

int configue_ddr_to_axis_reader_ref(void)
{
	XDdr_to_axis_reader_Set_base_address(&reader_ref, FRAME_BUFFER_BASE_ADDR_REF);
	XDdr_to_axis_reader_Set_frame_buffer_dim(&reader_ref, FRAME_BUFFER_DIM);
	XDdr_to_axis_reader_Set_frame_buffer_number(&reader_ref, FRAME_BUFFER_NUM);
	XDdr_to_axis_reader_Set_frame_buffer_offset(&reader_ref, FRAME_BUFFER_DIM);
	XDdr_to_axis_reader_Set_update_intr(&reader_ref, 1);
	XDdr_to_axis_reader_EnableAutoRestart(&reader_ref);
	XDdr_to_axis_reader_Start(&reader_ref);

	return XST_SUCCESS;
}
