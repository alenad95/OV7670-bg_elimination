// ==============================================================
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// ==============================================================
// AXILiteS
// 0x00 : Control signals
//        bit 0  - ap_start (Read/Write/COH)
//        bit 1  - ap_done (Read/COR)
//        bit 2  - ap_idle (Read)
//        bit 3  - ap_ready (Read)
//        bit 7  - auto_restart (Read/Write)
//        others - reserved
// 0x04 : Global Interrupt Enable Register
//        bit 0  - Global Interrupt Enable (Read/Write)
//        others - reserved
// 0x08 : IP Interrupt Enable Register (Read/Write)
//        bit 0  - Channel 0 (ap_done)
//        bit 1  - Channel 1 (ap_ready)
//        others - reserved
// 0x0c : IP Interrupt Status Register (Read/TOW)
//        bit 0  - Channel 0 (ap_done)
//        bit 1  - Channel 1 (ap_ready)
//        others - reserved
// 0x10 : Data signal of base_address
//        bit 31~0 - base_address[31:0] (Read/Write)
// 0x14 : reserved
// 0x18 : Data signal of frame_buffer_dim
//        bit 31~0 - frame_buffer_dim[31:0] (Read/Write)
// 0x1c : reserved
// 0x20 : Data signal of frame_buffer_offset
//        bit 31~0 - frame_buffer_offset[31:0] (Read/Write)
// 0x24 : reserved
// 0x28 : Data signal of frame_buffer_number
//        bit 7~0 - frame_buffer_number[7:0] (Read/Write)
//        others  - reserved
// 0x2c : reserved
// 0x30 : Data signal of update_intr
//        bit 0  - update_intr[0] (Read/Write)
//        others - reserved
// 0x34 : reserved
// (SC = Self Clear, COR = Clear on Read, TOW = Toggle on Write, COH = Clear on Handshake)

#define XAXIS_TO_DDR_WRITER_AXILITES_ADDR_AP_CTRL                  0x00
#define XAXIS_TO_DDR_WRITER_AXILITES_ADDR_GIE                      0x04
#define XAXIS_TO_DDR_WRITER_AXILITES_ADDR_IER                      0x08
#define XAXIS_TO_DDR_WRITER_AXILITES_ADDR_ISR                      0x0c
#define XAXIS_TO_DDR_WRITER_AXILITES_ADDR_BASE_ADDRESS_DATA        0x10
#define XAXIS_TO_DDR_WRITER_AXILITES_BITS_BASE_ADDRESS_DATA        32
#define XAXIS_TO_DDR_WRITER_AXILITES_ADDR_FRAME_BUFFER_DIM_DATA    0x18
#define XAXIS_TO_DDR_WRITER_AXILITES_BITS_FRAME_BUFFER_DIM_DATA    32
#define XAXIS_TO_DDR_WRITER_AXILITES_ADDR_FRAME_BUFFER_OFFSET_DATA 0x20
#define XAXIS_TO_DDR_WRITER_AXILITES_BITS_FRAME_BUFFER_OFFSET_DATA 32
#define XAXIS_TO_DDR_WRITER_AXILITES_ADDR_FRAME_BUFFER_NUMBER_DATA 0x28
#define XAXIS_TO_DDR_WRITER_AXILITES_BITS_FRAME_BUFFER_NUMBER_DATA 8
#define XAXIS_TO_DDR_WRITER_AXILITES_ADDR_UPDATE_INTR_DATA         0x30
#define XAXIS_TO_DDR_WRITER_AXILITES_BITS_UPDATE_INTR_DATA         1

