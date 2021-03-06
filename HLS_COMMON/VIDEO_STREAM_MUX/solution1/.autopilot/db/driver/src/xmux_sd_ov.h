// ==============================================================
// File generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2016.2
// Copyright (C) 1986-2016 Xilinx, Inc. All Rights Reserved.
// 
// ==============================================================

#ifndef XMUX_SD_OV_H
#define XMUX_SD_OV_H

#ifdef __cplusplus
extern "C" {
#endif

/***************************** Include Files *********************************/
#ifndef __linux__
#include "xil_types.h"
#include "xil_assert.h"
#include "xstatus.h"
#include "xil_io.h"
#else
#include <stdint.h>
#include <assert.h>
#include <dirent.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
#include <unistd.h>
#include <stddef.h>
#endif
#include "xmux_sd_ov_hw.h"

/**************************** Type Definitions ******************************/
#ifdef __linux__
typedef uint8_t u8;
typedef uint16_t u16;
typedef uint32_t u32;
#else
typedef struct {
    u16 DeviceId;
    u32 Axilites_BaseAddress;
} XMux_sd_ov_Config;
#endif

typedef struct {
    u32 Axilites_BaseAddress;
    u32 IsReady;
} XMux_sd_ov;

/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define XMux_sd_ov_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define XMux_sd_ov_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define XMux_sd_ov_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define XMux_sd_ov_ReadReg(BaseAddress, RegOffset) \
    *(volatile u32*)((BaseAddress) + (RegOffset))

#define Xil_AssertVoid(expr)    assert(expr)
#define Xil_AssertNonvoid(expr) assert(expr)

#define XST_SUCCESS             0
#define XST_DEVICE_NOT_FOUND    2
#define XST_OPEN_DEVICE_FAILED  3
#define XIL_COMPONENT_IS_READY  1
#endif

/************************** Function Prototypes *****************************/
#ifndef __linux__
int XMux_sd_ov_Initialize(XMux_sd_ov *InstancePtr, u16 DeviceId);
XMux_sd_ov_Config* XMux_sd_ov_LookupConfig(u16 DeviceId);
int XMux_sd_ov_CfgInitialize(XMux_sd_ov *InstancePtr, XMux_sd_ov_Config *ConfigPtr);
#else
int XMux_sd_ov_Initialize(XMux_sd_ov *InstancePtr, const char* InstanceName);
int XMux_sd_ov_Release(XMux_sd_ov *InstancePtr);
#endif


void XMux_sd_ov_Set_switch_stream(XMux_sd_ov *InstancePtr, u32 Data);
u32 XMux_sd_ov_Get_switch_stream(XMux_sd_ov *InstancePtr);

#ifdef __cplusplus
}
#endif

#endif
