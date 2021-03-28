// ==============================================================
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// ==============================================================
/***************************** Include Files *********************************/
#include "xaxis_to_ddr_writer.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XAxis_to_ddr_writer_CfgInitialize(XAxis_to_ddr_writer *InstancePtr, XAxis_to_ddr_writer_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Axilites_BaseAddress = ConfigPtr->Axilites_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XAxis_to_ddr_writer_Start(XAxis_to_ddr_writer *InstancePtr) {
    u32 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XAxis_to_ddr_writer_ReadReg(InstancePtr->Axilites_BaseAddress, XAXIS_TO_DDR_WRITER_AXILITES_ADDR_AP_CTRL) & 0x80;
    XAxis_to_ddr_writer_WriteReg(InstancePtr->Axilites_BaseAddress, XAXIS_TO_DDR_WRITER_AXILITES_ADDR_AP_CTRL, Data | 0x01);
}

u32 XAxis_to_ddr_writer_IsDone(XAxis_to_ddr_writer *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XAxis_to_ddr_writer_ReadReg(InstancePtr->Axilites_BaseAddress, XAXIS_TO_DDR_WRITER_AXILITES_ADDR_AP_CTRL);
    return (Data >> 1) & 0x1;
}

u32 XAxis_to_ddr_writer_IsIdle(XAxis_to_ddr_writer *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XAxis_to_ddr_writer_ReadReg(InstancePtr->Axilites_BaseAddress, XAXIS_TO_DDR_WRITER_AXILITES_ADDR_AP_CTRL);
    return (Data >> 2) & 0x1;
}

u32 XAxis_to_ddr_writer_IsReady(XAxis_to_ddr_writer *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XAxis_to_ddr_writer_ReadReg(InstancePtr->Axilites_BaseAddress, XAXIS_TO_DDR_WRITER_AXILITES_ADDR_AP_CTRL);
    // check ap_start to see if the pcore is ready for next input
    return !(Data & 0x1);
}

void XAxis_to_ddr_writer_EnableAutoRestart(XAxis_to_ddr_writer *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XAxis_to_ddr_writer_WriteReg(InstancePtr->Axilites_BaseAddress, XAXIS_TO_DDR_WRITER_AXILITES_ADDR_AP_CTRL, 0x80);
}

void XAxis_to_ddr_writer_DisableAutoRestart(XAxis_to_ddr_writer *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XAxis_to_ddr_writer_WriteReg(InstancePtr->Axilites_BaseAddress, XAXIS_TO_DDR_WRITER_AXILITES_ADDR_AP_CTRL, 0);
}

void XAxis_to_ddr_writer_Set_base_address(XAxis_to_ddr_writer *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XAxis_to_ddr_writer_WriteReg(InstancePtr->Axilites_BaseAddress, XAXIS_TO_DDR_WRITER_AXILITES_ADDR_BASE_ADDRESS_DATA, Data);
}

u32 XAxis_to_ddr_writer_Get_base_address(XAxis_to_ddr_writer *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XAxis_to_ddr_writer_ReadReg(InstancePtr->Axilites_BaseAddress, XAXIS_TO_DDR_WRITER_AXILITES_ADDR_BASE_ADDRESS_DATA);
    return Data;
}

void XAxis_to_ddr_writer_Set_frame_buffer_dim(XAxis_to_ddr_writer *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XAxis_to_ddr_writer_WriteReg(InstancePtr->Axilites_BaseAddress, XAXIS_TO_DDR_WRITER_AXILITES_ADDR_FRAME_BUFFER_DIM_DATA, Data);
}

u32 XAxis_to_ddr_writer_Get_frame_buffer_dim(XAxis_to_ddr_writer *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XAxis_to_ddr_writer_ReadReg(InstancePtr->Axilites_BaseAddress, XAXIS_TO_DDR_WRITER_AXILITES_ADDR_FRAME_BUFFER_DIM_DATA);
    return Data;
}

void XAxis_to_ddr_writer_Set_frame_buffer_offset(XAxis_to_ddr_writer *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XAxis_to_ddr_writer_WriteReg(InstancePtr->Axilites_BaseAddress, XAXIS_TO_DDR_WRITER_AXILITES_ADDR_FRAME_BUFFER_OFFSET_DATA, Data);
}

u32 XAxis_to_ddr_writer_Get_frame_buffer_offset(XAxis_to_ddr_writer *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XAxis_to_ddr_writer_ReadReg(InstancePtr->Axilites_BaseAddress, XAXIS_TO_DDR_WRITER_AXILITES_ADDR_FRAME_BUFFER_OFFSET_DATA);
    return Data;
}

void XAxis_to_ddr_writer_Set_frame_buffer_number(XAxis_to_ddr_writer *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XAxis_to_ddr_writer_WriteReg(InstancePtr->Axilites_BaseAddress, XAXIS_TO_DDR_WRITER_AXILITES_ADDR_FRAME_BUFFER_NUMBER_DATA, Data);
}

u32 XAxis_to_ddr_writer_Get_frame_buffer_number(XAxis_to_ddr_writer *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XAxis_to_ddr_writer_ReadReg(InstancePtr->Axilites_BaseAddress, XAXIS_TO_DDR_WRITER_AXILITES_ADDR_FRAME_BUFFER_NUMBER_DATA);
    return Data;
}

void XAxis_to_ddr_writer_Set_update_intr(XAxis_to_ddr_writer *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XAxis_to_ddr_writer_WriteReg(InstancePtr->Axilites_BaseAddress, XAXIS_TO_DDR_WRITER_AXILITES_ADDR_UPDATE_INTR_DATA, Data);
}

u32 XAxis_to_ddr_writer_Get_update_intr(XAxis_to_ddr_writer *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XAxis_to_ddr_writer_ReadReg(InstancePtr->Axilites_BaseAddress, XAXIS_TO_DDR_WRITER_AXILITES_ADDR_UPDATE_INTR_DATA);
    return Data;
}

void XAxis_to_ddr_writer_InterruptGlobalEnable(XAxis_to_ddr_writer *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XAxis_to_ddr_writer_WriteReg(InstancePtr->Axilites_BaseAddress, XAXIS_TO_DDR_WRITER_AXILITES_ADDR_GIE, 1);
}

void XAxis_to_ddr_writer_InterruptGlobalDisable(XAxis_to_ddr_writer *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XAxis_to_ddr_writer_WriteReg(InstancePtr->Axilites_BaseAddress, XAXIS_TO_DDR_WRITER_AXILITES_ADDR_GIE, 0);
}

void XAxis_to_ddr_writer_InterruptEnable(XAxis_to_ddr_writer *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XAxis_to_ddr_writer_ReadReg(InstancePtr->Axilites_BaseAddress, XAXIS_TO_DDR_WRITER_AXILITES_ADDR_IER);
    XAxis_to_ddr_writer_WriteReg(InstancePtr->Axilites_BaseAddress, XAXIS_TO_DDR_WRITER_AXILITES_ADDR_IER, Register | Mask);
}

void XAxis_to_ddr_writer_InterruptDisable(XAxis_to_ddr_writer *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XAxis_to_ddr_writer_ReadReg(InstancePtr->Axilites_BaseAddress, XAXIS_TO_DDR_WRITER_AXILITES_ADDR_IER);
    XAxis_to_ddr_writer_WriteReg(InstancePtr->Axilites_BaseAddress, XAXIS_TO_DDR_WRITER_AXILITES_ADDR_IER, Register & (~Mask));
}

void XAxis_to_ddr_writer_InterruptClear(XAxis_to_ddr_writer *InstancePtr, u32 Mask) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XAxis_to_ddr_writer_WriteReg(InstancePtr->Axilites_BaseAddress, XAXIS_TO_DDR_WRITER_AXILITES_ADDR_ISR, Mask);
}

u32 XAxis_to_ddr_writer_InterruptGetEnabled(XAxis_to_ddr_writer *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XAxis_to_ddr_writer_ReadReg(InstancePtr->Axilites_BaseAddress, XAXIS_TO_DDR_WRITER_AXILITES_ADDR_IER);
}

u32 XAxis_to_ddr_writer_InterruptGetStatus(XAxis_to_ddr_writer *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XAxis_to_ddr_writer_ReadReg(InstancePtr->Axilites_BaseAddress, XAXIS_TO_DDR_WRITER_AXILITES_ADDR_ISR);
}

