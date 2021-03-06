// ==============================================================
// File generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2016.2
// Copyright (C) 1986-2016 Xilinx, Inc. All Rights Reserved.
// 
// ==============================================================

#ifndef __linux__

#include "xstatus.h"
#include "xparameters.h"
#include "xmux_sd_ov.h"

extern XMux_sd_ov_Config XMux_sd_ov_ConfigTable[];

XMux_sd_ov_Config *XMux_sd_ov_LookupConfig(u16 DeviceId) {
	XMux_sd_ov_Config *ConfigPtr = NULL;

	int Index;

	for (Index = 0; Index < XPAR_XMUX_SD_OV_NUM_INSTANCES; Index++) {
		if (XMux_sd_ov_ConfigTable[Index].DeviceId == DeviceId) {
			ConfigPtr = &XMux_sd_ov_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XMux_sd_ov_Initialize(XMux_sd_ov *InstancePtr, u16 DeviceId) {
	XMux_sd_ov_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XMux_sd_ov_LookupConfig(DeviceId);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XMux_sd_ov_CfgInitialize(InstancePtr, ConfigPtr);
}

#endif

