// ==============================================================
// File generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2016.2
// Copyright (C) 1986-2016 Xilinx, Inc. All Rights Reserved.
// 
// ==============================================================

#ifndef __linux__

#include "xstatus.h"
#include "xparameters.h"
#include "xsep_convolution_filter.h"

extern XSep_convolution_filter_Config XSep_convolution_filter_ConfigTable[];

XSep_convolution_filter_Config *XSep_convolution_filter_LookupConfig(u16 DeviceId) {
	XSep_convolution_filter_Config *ConfigPtr = NULL;

	int Index;

	for (Index = 0; Index < XPAR_XSEP_CONVOLUTION_FILTER_NUM_INSTANCES; Index++) {
		if (XSep_convolution_filter_ConfigTable[Index].DeviceId == DeviceId) {
			ConfigPtr = &XSep_convolution_filter_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XSep_convolution_filter_Initialize(XSep_convolution_filter *InstancePtr, u16 DeviceId) {
	XSep_convolution_filter_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XSep_convolution_filter_LookupConfig(DeviceId);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XSep_convolution_filter_CfgInitialize(InstancePtr, ConfigPtr);
}

#endif

