/*
 * platform_config.h
 *
 *  Created on: Feb 2, 2017
 *      Author: Mattia Bernasconi
 *        Mail: mattia@studiobernasconi.com
 */

#ifndef __PLATFORM_CONFIG_H_
#define __PLATFORM_CONFIG_H_

#define STDOUT_IS_PS7_UART
#define UART_DEVICE_ID 0

#include <stdio.h>
#include "xaxis_to_ddr_writer.h"
#include "xddr_to_axis_reader.h"
#include "xddr_to_axis_reader_sd.h"
#include "xgpio.h"
#include "xscugic.h"
#include "xiicps.h"

#define MTU_SIZE 1500
#define FRAME_SIZE 307200
#define FRAME_UDP_FRAGMENT_SIZE 9600

#define LOCAL_PORT 5454
#define REMOTE_PORT 5555
#define PLATFORM_EMAC_BASEADDR XPAR_XEMACPS_0_BASEADDR

#define FRAME_BUFFER_DIM 307200
#define FRAME_BUFFER_BASE_ADDR 0x10000000
#define FRAME_BUFFER_NUM 8

#define FRAME_BUFFER_BASE_ADDR_SD 0x00FF0000	//indirizzo di partenza per lettura da SD CARD
#define FRAME_BUFFER_NUM_SD 50					//numero di frame utilizzati per il buffer usando SD CARD

#define INTC_DEVICE_ID		XPAR_SCUGIC_SINGLE_DEVICE_ID

#define RESET_ENABLED 0
#define RESET_DISABLED 1

typedef unsigned char BYTE;

typedef struct{
	int count;
	int fragment;
	int frame_index;
	BYTE data[FRAME_UDP_FRAGMENT_SIZE];
	BYTE data_luma[FRAME_UDP_FRAGMENT_SIZE];
	BYTE data_chroma[FRAME_UDP_FRAGMENT_SIZE];
}packet_data;

int frame_index;

#endif
