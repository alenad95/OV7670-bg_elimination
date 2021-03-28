// ==============================================================
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __linux__

#include "xstatus.h"
#include "xparameters.h"
#include "xaxis_to_ddr_writer.h"

extern XAxis_to_ddr_writer_Config XAxis_to_ddr_writer_ConfigTable[];

XAxis_to_ddr_writer_Config *XAxis_to_ddr_writer_LookupConfig(u16 DeviceId) {
	XAxis_to_ddr_writer_Config *ConfigPtr = NULL;

	int Index;

	for (Index = 0; Index < XPAR_XAXIS_TO_DDR_WRITER_NUM_INSTANCES; Index++) {
		if (XAxis_to_ddr_writer_ConfigTable[Index].DeviceId == DeviceId) {
			ConfigPtr = &XAxis_to_ddr_writer_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XAxis_to_ddr_writer_Initialize(XAxis_to_ddr_writer *InstancePtr, u16 DeviceId) {
	XAxis_to_ddr_writer_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XAxis_to_ddr_writer_LookupConfig(DeviceId);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XAxis_to_ddr_writer_CfgInitialize(InstancePtr, ConfigPtr);
}

#endif

