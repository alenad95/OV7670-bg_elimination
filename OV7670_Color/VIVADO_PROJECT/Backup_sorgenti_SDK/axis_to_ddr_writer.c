/*
 * axis_to_ddr_writer.c
 *
 *  Created on: Feb 2, 2017
 *      Author: Mattia Bernasconi
 *        Mail: mattia@studiobernasconi.com
 */

#include "axis_to_ddr_writer.h"

int init_axis_to_ddr_writer(void)
{
	int status;
	status = XAxis_to_ddr_writer_Initialize(&writer, XPAR_XAXIS_TO_DDR_WRITER_0_DEVICE_ID);

	if (status != XST_SUCCESS)
	{
		xil_printf("Errore inizializzazione writer\n");
		return status;
	}

	return XST_SUCCESS;
}

int configue_axis_to_ddr_writer(void)
{
	XAxis_to_ddr_writer_Set_base_address(&writer, FRAME_BUFFER_BASE_ADDR);
	XAxis_to_ddr_writer_Set_frame_buffer_dim(&writer, FRAME_BUFFER_DIM);
	XAxis_to_ddr_writer_Set_frame_buffer_number(&writer, FRAME_BUFFER_NUM);
	XAxis_to_ddr_writer_Set_frame_buffer_offset(&writer, FRAME_BUFFER_DIM);
	XAxis_to_ddr_writer_EnableAutoRestart(&writer);
	XAxis_to_ddr_writer_Set_update_intr(&writer, 1);
	XAxis_to_ddr_writer_Start(&writer);

	return XST_SUCCESS;
}

int init_axis_to_ddr_writer_luma(void)
{
	int status;
	status = XAxis_to_ddr_writer_Initialize(&writer_luma, XPAR_VDMA_AXIS_TO_DDR_WRITER_LUMA_DEVICE_ID);

	if (status != XST_SUCCESS)
	{
		xil_printf("Errore inizializzazione writer luma\n");
		return status;
	}

	return XST_SUCCESS;
}

int configue_axis_to_ddr_writer_luma(void)
{
	XAxis_to_ddr_writer_Set_base_address(&writer_luma, FRAME_BUFFER_BASE_ADDR + 0x2000000);
	XAxis_to_ddr_writer_Set_frame_buffer_dim(&writer_luma, FRAME_BUFFER_DIM);
	XAxis_to_ddr_writer_Set_frame_buffer_number(&writer_luma, FRAME_BUFFER_NUM);
	XAxis_to_ddr_writer_Set_frame_buffer_offset(&writer_luma, FRAME_BUFFER_DIM);
	XAxis_to_ddr_writer_EnableAutoRestart(&writer_luma);
	XAxis_to_ddr_writer_Set_update_intr(&writer_luma, 1);
	XAxis_to_ddr_writer_Start(&writer_luma);

	return XST_SUCCESS;
}

int init_axis_to_ddr_writer_chroma(void)
{
	int status;
	status = XAxis_to_ddr_writer_Initialize(&writer_chroma, XPAR_VDMA_AXIS_TO_DDR_WRITER_CHROMA_DEVICE_ID);

	if (status != XST_SUCCESS)
	{
		xil_printf("Errore inizializzazione writer chroma\n");
		return status;
	}

	return XST_SUCCESS;
}

int configue_axis_to_ddr_writer_chroma(void)
{
	XAxis_to_ddr_writer_Set_base_address(&writer_chroma, FRAME_BUFFER_BASE_ADDR + 0x1000000);
	XAxis_to_ddr_writer_Set_frame_buffer_dim(&writer_chroma, FRAME_BUFFER_DIM);
	XAxis_to_ddr_writer_Set_frame_buffer_number(&writer_chroma, FRAME_BUFFER_NUM);
	XAxis_to_ddr_writer_Set_frame_buffer_offset(&writer_chroma, FRAME_BUFFER_DIM);
	XAxis_to_ddr_writer_EnableAutoRestart(&writer_chroma);
	XAxis_to_ddr_writer_Set_update_intr(&writer_chroma, 1);
	XAxis_to_ddr_writer_Start(&writer_chroma);

	return XST_SUCCESS;
}
