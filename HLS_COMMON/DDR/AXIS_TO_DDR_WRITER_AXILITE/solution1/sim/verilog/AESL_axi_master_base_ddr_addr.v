// ==============================================================
// File generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2015.4
// Copyright (C) 2015 Xilinx Inc. All rights reserved.
// 
// ==============================================================


`timescale 1 ns / 1 ps

module AESL_axi_master_base_ddr_addr (
    clk,
    reset,
    TRAN_base_ddr_addr_AWVALID,
    TRAN_base_ddr_addr_AWREADY,
    TRAN_base_ddr_addr_AWADDR,
    TRAN_base_ddr_addr_AWID,
    TRAN_base_ddr_addr_AWLEN,
    TRAN_base_ddr_addr_AWSIZE,
    TRAN_base_ddr_addr_AWBURST,
    TRAN_base_ddr_addr_AWLOCK,
    TRAN_base_ddr_addr_AWCACHE,
    TRAN_base_ddr_addr_AWPROT,
    TRAN_base_ddr_addr_AWQOS,
    TRAN_base_ddr_addr_AWREGION,
    TRAN_base_ddr_addr_AWUSER,
    TRAN_base_ddr_addr_WVALID,
    TRAN_base_ddr_addr_WREADY,
    TRAN_base_ddr_addr_WDATA,
    TRAN_base_ddr_addr_WSTRB,
    TRAN_base_ddr_addr_WLAST,
    TRAN_base_ddr_addr_WID,
    TRAN_base_ddr_addr_WUSER,
    TRAN_base_ddr_addr_ARVALID,
    TRAN_base_ddr_addr_ARREADY,
    TRAN_base_ddr_addr_ARADDR,
    TRAN_base_ddr_addr_ARID,
    TRAN_base_ddr_addr_ARLEN,
    TRAN_base_ddr_addr_ARSIZE,
    TRAN_base_ddr_addr_ARBURST,
    TRAN_base_ddr_addr_ARLOCK,
    TRAN_base_ddr_addr_ARCACHE,
    TRAN_base_ddr_addr_ARPROT,
    TRAN_base_ddr_addr_ARQOS,
    TRAN_base_ddr_addr_ARREGION,
    TRAN_base_ddr_addr_ARUSER,
    TRAN_base_ddr_addr_RVALID,
    TRAN_base_ddr_addr_RREADY,
    TRAN_base_ddr_addr_RDATA,
    TRAN_base_ddr_addr_RLAST,
    TRAN_base_ddr_addr_RID,
    TRAN_base_ddr_addr_RUSER,
    TRAN_base_ddr_addr_RRESP,
    TRAN_base_ddr_addr_BVALID,
    TRAN_base_ddr_addr_BREADY,
    TRAN_base_ddr_addr_BRESP,
    TRAN_base_ddr_addr_BID,
    TRAN_base_ddr_addr_BUSER,
    ready,
    done
    );

//------------------------Parameter----------------------
`define TV_IN_base_ddr_addr "../tv/cdatafile/c.axis_to_ddr_writer.autotvin_base_ddr_addr.dat"
`define TV_OUT_base_ddr_addr "../tv/rtldatafile/rtl.axis_to_ddr_writer.autotvout_base_ddr_addr.dat"
 parameter base_ddr_addr_ADDR_BITWIDTH = 32'd 32;
 parameter base_ddr_addr_AWUSER_BITWIDTH = 32'd 1;
 parameter base_ddr_addr_DATA_BITWIDTH = 32'd 64;
 parameter base_ddr_addr_WUSER_BITWIDTH = 32'd 1;
 parameter base_ddr_addr_ID_BITWIDTH = 32'd 1;
 parameter base_ddr_addr_RUSER_BITWIDTH = 32'd 1;
 parameter base_ddr_addr_BUSER_BITWIDTH = 32'd 1;
 parameter   FIFO_DEPTH            =   1 + 1;
 parameter   mem_page_num            =   32'd 2;
 parameter   FIFO_DEPTH_ADDR_WIDTH   =    32'd 32;
parameter base_ddr_addr_C_DATA_BITWIDTH = 32'd 64;
parameter base_ddr_addr_mem_depth = 32'd 32;
parameter ReadReqLatency = 32'd 1;
parameter WriteReqLatency = 32'd 1;
// Input and Output
input clk;
input reset;
input  TRAN_base_ddr_addr_AWVALID;
output  TRAN_base_ddr_addr_AWREADY;
input [base_ddr_addr_ADDR_BITWIDTH - 1 : 0] TRAN_base_ddr_addr_AWADDR;
input [base_ddr_addr_ID_BITWIDTH - 1 : 0] TRAN_base_ddr_addr_AWID;
input [8 - 1 : 0] TRAN_base_ddr_addr_AWLEN;
input [3 - 1 : 0] TRAN_base_ddr_addr_AWSIZE;
input [2 - 1 : 0] TRAN_base_ddr_addr_AWBURST;
input [2 - 1 : 0] TRAN_base_ddr_addr_AWLOCK;
input [4 - 1 : 0] TRAN_base_ddr_addr_AWCACHE;
input [3 - 1 : 0] TRAN_base_ddr_addr_AWPROT;
input [4 - 1 : 0] TRAN_base_ddr_addr_AWQOS;
input [4 - 1 : 0] TRAN_base_ddr_addr_AWREGION;
input [base_ddr_addr_AWUSER_BITWIDTH - 1 : 0] TRAN_base_ddr_addr_AWUSER;
input  TRAN_base_ddr_addr_WVALID;
output  TRAN_base_ddr_addr_WREADY;
input [base_ddr_addr_DATA_BITWIDTH - 1 : 0] TRAN_base_ddr_addr_WDATA;
input [base_ddr_addr_DATA_BITWIDTH/8 - 1 : 0] TRAN_base_ddr_addr_WSTRB;
input  TRAN_base_ddr_addr_WLAST;
input  TRAN_base_ddr_addr_WID;
input [base_ddr_addr_WUSER_BITWIDTH - 1 : 0] TRAN_base_ddr_addr_WUSER;
input  TRAN_base_ddr_addr_ARVALID;
output  TRAN_base_ddr_addr_ARREADY;
input [base_ddr_addr_ADDR_BITWIDTH - 1 : 0] TRAN_base_ddr_addr_ARADDR;
input [base_ddr_addr_ID_BITWIDTH - 1 : 0] TRAN_base_ddr_addr_ARID;
input [8 - 1 : 0] TRAN_base_ddr_addr_ARLEN;
input [3 - 1 : 0] TRAN_base_ddr_addr_ARSIZE;
input [2 - 1 : 0] TRAN_base_ddr_addr_ARBURST;
input [2 - 1 : 0] TRAN_base_ddr_addr_ARLOCK;
input [4 - 1 : 0] TRAN_base_ddr_addr_ARCACHE;
input [3 - 1 : 0] TRAN_base_ddr_addr_ARPROT;
input [4 - 1 : 0] TRAN_base_ddr_addr_ARQOS;
input [4 - 1 : 0] TRAN_base_ddr_addr_ARREGION;
input  TRAN_base_ddr_addr_ARUSER;
output  TRAN_base_ddr_addr_RVALID;
input  TRAN_base_ddr_addr_RREADY;
output [base_ddr_addr_DATA_BITWIDTH - 1 : 0] TRAN_base_ddr_addr_RDATA;
output  TRAN_base_ddr_addr_RLAST;
output [base_ddr_addr_ID_BITWIDTH - 1 : 0] TRAN_base_ddr_addr_RID;
output [base_ddr_addr_RUSER_BITWIDTH - 1 : 0] TRAN_base_ddr_addr_RUSER;
output [2 - 1 : 0] TRAN_base_ddr_addr_RRESP;
output  TRAN_base_ddr_addr_BVALID;
input  TRAN_base_ddr_addr_BREADY;
output [2 - 1 : 0] TRAN_base_ddr_addr_BRESP;
output [base_ddr_addr_ID_BITWIDTH - 1 : 0] TRAN_base_ddr_addr_BID;
output [base_ddr_addr_BUSER_BITWIDTH - 1 : 0] TRAN_base_ddr_addr_BUSER;
input ready;
input done;

// Inner signals
// AW request fifo
reg    [base_ddr_addr_ADDR_BITWIDTH - 1 : 0]         FIFO_AW_req_ADDR           [0 : FIFO_DEPTH - 1]; 
reg    [base_ddr_addr_ADDR_BITWIDTH - 1 : 0]         FIFO_AW_req_ADDR_tmp; 
reg    [8 - 1 : 0]                     FIFO_AW_req_LEN           [0 : FIFO_DEPTH - 1]; 
reg    [8 - 1 : 0]                     FIFO_AW_req_LEN_tmp; 
reg    [3 - 1 : 0]                     FIFO_AW_req_SIZE           [0 : FIFO_DEPTH - 1]; 
reg    [3 - 1 : 0]                     FIFO_AW_req_SIZE_tmp; 
reg    [2 - 1 : 0]                     FIFO_AW_req_BURST           [0 : FIFO_DEPTH - 1]; 
reg    [2 - 1 : 0]                     FIFO_AW_req_BURST_tmp; 
reg    [31  : 0]                     FIFO_AW_req_transaction_number [0 : FIFO_DEPTH - 1]; 
reg    [31  : 0]                     FIFO_AW_req_cycle_number [0 : FIFO_DEPTH - 1]; 
reg    [FIFO_DEPTH_ADDR_WIDTH - 1 : 0]    FIFO_AW_req_ptr_r = 0; 
reg    [FIFO_DEPTH_ADDR_WIDTH - 1 : 0]    FIFO_AW_req_ptr_r_tmp = 0; 
reg    [FIFO_DEPTH_ADDR_WIDTH - 1 : 0]    FIFO_AW_req_ptr_w = 0; 
reg    FIFO_AW_req_flag    =   0;        // '0' for empty, '1' for full 
reg    FIFO_AW_req_empty = 1; 
reg    FIFO_AW_req_read = 0; 
reg    FIFO_AW_req_full = 0; 

// AR request fifo
reg    [base_ddr_addr_ADDR_BITWIDTH - 1 : 0]         FIFO_AR_req_ADDR           [0 : FIFO_DEPTH - 1]; 
reg    [base_ddr_addr_ADDR_BITWIDTH - 1 : 0]         FIFO_AR_req_ADDR_tmp; 
reg    [8 - 1 : 0]                     FIFO_AR_req_LEN           [0 : FIFO_DEPTH - 1]; 
reg    [8 - 1 : 0]                     FIFO_AR_req_LEN_tmp; 
reg    [3 - 1 : 0]                     FIFO_AR_req_SIZE           [0 : FIFO_DEPTH - 1]; 
reg    [3 - 1 : 0]                     FIFO_AR_req_SIZE_tmp; 
reg    [2 - 1 : 0]                     FIFO_AR_req_BURST           [0 : FIFO_DEPTH - 1]; 
reg    [2 - 1 : 0]                     FIFO_AR_req_BURST_tmp; 
reg    [31  : 0]                     FIFO_AR_req_transaction_number [0 : FIFO_DEPTH - 1]; 
reg    [31  : 0]                     FIFO_AR_req_cycle_number [0 : FIFO_DEPTH - 1]; 
reg    [FIFO_DEPTH_ADDR_WIDTH - 1 : 0]    FIFO_AR_req_ptr_r = 0; 
reg    [FIFO_DEPTH_ADDR_WIDTH - 1 : 0]    FIFO_AR_req_ptr_r_tmp = 0; 
reg    [FIFO_DEPTH_ADDR_WIDTH - 1 : 0]    FIFO_AR_req_ptr_w = 0; 
reg    FIFO_AR_req_flag    =   0;        // '0' for empty, '1' for full 
reg    FIFO_AR_req_empty = 1; 
reg    FIFO_AR_req_read = 0; 
reg    FIFO_AR_req_full = 0; 

// WDATA fifo
reg    [base_ddr_addr_DATA_BITWIDTH - 1 : 0]         FIFO_WDATA           [0 : FIFO_DEPTH - 1]; 
reg    [base_ddr_addr_DATA_BITWIDTH/8 - 1 : 0]       FIFO_WSTRB           [0 : FIFO_DEPTH - 1]; 
reg    [FIFO_DEPTH_ADDR_WIDTH - 1 : 0]    FIFO_WDATA_req_ptr_r = 0; 
reg    [FIFO_DEPTH_ADDR_WIDTH - 1 : 0]    FIFO_WDATA_req_ptr_w = 0; 
reg    FIFO_WDATA_req_flag    =   0;        // '0' for empty, '1' for full 
reg    FIFO_WDATA_req_empty = 1; 
reg    FIFO_WDATA_read = 0; 
reg    FIFO_WDATA_req_full = 0; 

// WDATA size fifo
reg    [FIFO_DEPTH_ADDR_WIDTH - 1 : 0]         FIFO_WDATA_size           [0 : FIFO_DEPTH - 1]; 
reg    [FIFO_DEPTH_ADDR_WIDTH - 1 : 0]    FIFO_WDATA_size_ptr_r = 0; 
reg    [FIFO_DEPTH_ADDR_WIDTH - 1 : 0]    FIFO_WDATA_size_ptr_w = 0; 
reg    FIFO_WDATA_size_flag    =   0;        // '0' for empty, '1' for full 
reg    FIFO_WDATA_size_empty = 1; 
reg    FIFO_WDATA_size_full = 0; 
reg    [FIFO_DEPTH_ADDR_WIDTH : 0] WDATA_size = 0; 
reg    BRESP_tmp = 0;
reg    send_one_BRESP = 0;
reg    [31 : 0] BRESP_counter = 0;

reg [base_ddr_addr_DATA_BITWIDTH - 1:0] RDATA_tmp = 0;
reg [2 - 1:0] RRESP_tmp = 0;
reg RLAST_tmp = 0;
reg RVALID_tmp = 0;
reg [base_ddr_addr_DATA_BITWIDTH - 1 : 0] base_ddr_addr_mem [0 : base_ddr_addr_mem_depth * mem_page_num  - 1]; 
reg [31 : 0] clk_counter ;
reg [31 : 0] current_AW_req_transaction = 0 ;
reg [31 : 0] current_AR_req_transaction = -1 ;

assign TRAN_base_ddr_addr_AWREADY    =    !FIFO_AW_req_full; 
assign TRAN_base_ddr_addr_ARREADY    =    !FIFO_AR_req_full; 
assign TRAN_base_ddr_addr_WREADY    =     !(FIFO_WDATA_req_full || FIFO_WDATA_size_full); 
assign TRAN_base_ddr_addr_BVALID = (BRESP_counter == 0) ? 0 : 1;
assign TRAN_base_ddr_addr_BRESP = BRESP_tmp;
assign TRAN_base_ddr_addr_RDATA = RDATA_tmp;
assign TRAN_base_ddr_addr_RRESP = RRESP_tmp;
assign TRAN_base_ddr_addr_RLAST = RLAST_tmp;
assign TRAN_base_ddr_addr_RVALID = RVALID_tmp;

initial begin : initialize_offset
  integer DATA_byte_num; 
  integer c_bitwidth;
  DATA_byte_num = 0; 
  c_bitwidth = base_ddr_addr_C_DATA_BITWIDTH;
  count_c_data_byte_num_by_bitwidth (c_bitwidth , DATA_byte_num);
end

initial begin : initialize_base_ddr_addr_mem
  integer i;
  for (i = 0; i < base_ddr_addr_mem_depth * mem_page_num; i = i + 1) begin
      base_ddr_addr_mem[i] = 0;
  end
end

always @ (posedge clk or reset) begin 
    if(reset === 0) begin 
        clk_counter <= 0;
    end else begin
        clk_counter = clk_counter + 1;
    end
end

// Generate "FIFO_req_empty" and "FIFO_req_full" 
always @ (FIFO_AW_req_ptr_r or FIFO_AW_req_ptr_w or FIFO_AW_req_flag) begin 
    if(FIFO_AW_req_ptr_r == FIFO_AW_req_ptr_w) begin 
        if(FIFO_AW_req_flag) begin 
            FIFO_AW_req_full   <= 1; 
            FIFO_AW_req_empty  <= 0; 
        end else begin 
            FIFO_AW_req_full   <= 0; 
            FIFO_AW_req_empty  <= 1; 
        end 
    end else begin 
        FIFO_AW_req_full     <= 0; 
        FIFO_AW_req_empty    <= 0; 
    end 
end 

always @ (done) begin 
    if (done == 1) begin
        current_AW_req_transaction <= current_AW_req_transaction + 1;
    end 
end 

always @ (FIFO_AR_req_ptr_r or FIFO_AR_req_ptr_w or FIFO_AR_req_flag) begin 
    if(FIFO_AR_req_ptr_r == FIFO_AR_req_ptr_w) begin 
        if(FIFO_AR_req_flag) begin 
            FIFO_AR_req_full   <= 1; 
            FIFO_AR_req_empty  <= 0; 
        end else begin 
            FIFO_AR_req_full   <= 0; 
            FIFO_AR_req_empty  <= 1; 
        end 
    end else begin 
        FIFO_AR_req_full     <= 0; 
        FIFO_AR_req_empty    <= 0; 
    end 
end 

always @ (ready) begin 
    if (ready == 1) begin
        current_AR_req_transaction <= current_AR_req_transaction + 1;
    end 
end 
 
always @ (FIFO_WDATA_req_ptr_r or FIFO_WDATA_req_ptr_w or FIFO_WDATA_req_flag) begin 
    if(FIFO_WDATA_req_ptr_r == FIFO_WDATA_req_ptr_w) begin 
        if(FIFO_WDATA_req_flag) begin 
            FIFO_WDATA_req_full   <= 1; 
            FIFO_WDATA_req_empty  <= 0; 
        end else begin 
            FIFO_WDATA_req_full   <= 0; 
            FIFO_WDATA_req_empty  <= 1; 
        end 
    end else begin 
        FIFO_WDATA_req_full     <= 0; 
        FIFO_WDATA_req_empty    <= 0; 
    end 
end 
 
always @ (FIFO_WDATA_size_ptr_r or FIFO_WDATA_size_ptr_w or FIFO_WDATA_size_flag) begin 
    if(FIFO_WDATA_size_ptr_r == FIFO_WDATA_size_ptr_w) begin 
        if(FIFO_WDATA_size_flag) begin 
            FIFO_WDATA_size_full   <= 1; 
            FIFO_WDATA_size_empty  <= 0; 
        end else begin 
            FIFO_WDATA_size_full   <= 0; 
            FIFO_WDATA_size_empty  <= 1; 
        end 
    end else begin 
        FIFO_WDATA_size_full     <= 0; 
        FIFO_WDATA_size_empty    <= 0; 
    end 
end 
 
// Push RTL's req into FIFO_req 
always @ (posedge clk or reset) begin 
    if(reset === 0) begin 
        FIFO_AW_req_ptr_w <= 0; 
    end else begin 
        if(TRAN_base_ddr_addr_AWREADY & TRAN_base_ddr_addr_AWVALID ) begin    // RTL is sending a AW_request to the bus         
            FIFO_AW_req_SIZE [FIFO_AW_req_ptr_w]    =   TRAN_base_ddr_addr_AWSIZE; 
            FIFO_AW_req_ADDR [FIFO_AW_req_ptr_w]    =   TRAN_base_ddr_addr_AWADDR; 
            FIFO_AW_req_LEN  [FIFO_AW_req_ptr_w]    =   TRAN_base_ddr_addr_AWLEN; 
            FIFO_AW_req_BURST[FIFO_AW_req_ptr_w]    =   TRAN_base_ddr_addr_AWBURST; 
            FIFO_AW_req_transaction_number[FIFO_AW_req_ptr_w]    =   current_AW_req_transaction; 
            FIFO_AW_req_cycle_number[FIFO_AW_req_ptr_w]    =   clk_counter; 
            if(FIFO_AW_req_ptr_w != FIFO_DEPTH - 1) 
                FIFO_AW_req_ptr_w <= FIFO_AW_req_ptr_w + 1; 
            else 
                FIFO_AW_req_ptr_w <= 0; 
       end 
    end 
end 
 
always @ (posedge clk or reset) begin 
    if(reset === 0) begin 
        FIFO_AR_req_ptr_w <= 0; 
    end else begin 
        if(TRAN_base_ddr_addr_ARREADY & TRAN_base_ddr_addr_ARVALID ) begin    // RTL is sending a AR_request to the bus         
            FIFO_AR_req_SIZE [FIFO_AR_req_ptr_w]    =   TRAN_base_ddr_addr_ARSIZE; 
            FIFO_AR_req_ADDR [FIFO_AR_req_ptr_w]    =   TRAN_base_ddr_addr_ARADDR; 
            FIFO_AR_req_LEN  [FIFO_AR_req_ptr_w]    =   TRAN_base_ddr_addr_ARLEN; 
            FIFO_AR_req_BURST[FIFO_AR_req_ptr_w]    =   TRAN_base_ddr_addr_ARBURST; 
            FIFO_AR_req_transaction_number[FIFO_AR_req_ptr_w]    =   current_AR_req_transaction; 
            FIFO_AR_req_cycle_number[FIFO_AR_req_ptr_w]    =   clk_counter; 
            if(FIFO_AR_req_ptr_w != FIFO_DEPTH - 1) 
                FIFO_AR_req_ptr_w <= FIFO_AR_req_ptr_w + 1; 
            else 
                FIFO_AR_req_ptr_w <= 0; 
       end 
    end 
end

always @ (posedge clk or reset) begin 
    if(reset === 0) begin 
        FIFO_WDATA_req_ptr_w <= 0; 
    end else begin 
        if(TRAN_base_ddr_addr_WREADY & TRAN_base_ddr_addr_WVALID ) begin    // RTL is sending a WDATA data 
            FIFO_WDATA [FIFO_WDATA_req_ptr_w]    <=   TRAN_base_ddr_addr_WDATA; 
            FIFO_WSTRB [FIFO_WDATA_req_ptr_w]    <=   TRAN_base_ddr_addr_WSTRB; 
            if(FIFO_WDATA_req_ptr_w != FIFO_DEPTH - 1) 
                FIFO_WDATA_req_ptr_w <= FIFO_WDATA_req_ptr_w + 1; 
            else 
                FIFO_WDATA_req_ptr_w <= 0; 
            if (TRAN_base_ddr_addr_WLAST == 1 ) begin
                FIFO_WDATA_size [FIFO_WDATA_size_ptr_w] <= WDATA_size + 1;
                if(FIFO_WDATA_size_ptr_w != FIFO_DEPTH - 1) 
                    FIFO_WDATA_size_ptr_w <= FIFO_WDATA_size_ptr_w + 1; 
                else 
                    FIFO_WDATA_size_ptr_w <= 0; 
                WDATA_size <= 0;
            end else begin
                WDATA_size <= WDATA_size + 1;
            end
       end 
    end 
end

// Generate "FIFO_AW_req_flag" 
always @(posedge clk or reset) begin 
    if(reset === 0) begin 
      FIFO_AW_req_flag <= 0; 
    end else begin 
      if(TRAN_base_ddr_addr_AWVALID && TRAN_base_ddr_addr_AWREADY && (FIFO_AW_req_ptr_w == FIFO_DEPTH - 1)) 
          FIFO_AW_req_flag <= 1; 
      # 0.4;
      if(FIFO_AW_req_read && !FIFO_AW_req_empty && (FIFO_AW_req_ptr_r == 0)) 
          FIFO_AW_req_flag <= 0; 
    end 
end 

// Generate "FIFO_AR_req_flag" 
always @(posedge clk or reset) begin 
    if(reset === 0) begin 
      FIFO_AR_req_flag <= 0; 
    end else begin 
      if(TRAN_base_ddr_addr_ARVALID && TRAN_base_ddr_addr_ARREADY && (FIFO_AR_req_ptr_w == FIFO_DEPTH - 1)) 
          FIFO_AR_req_flag <= 1; 
      # 0.4;
      if(FIFO_AR_req_read && !FIFO_AR_req_empty && (FIFO_AR_req_ptr_r == 0)) 
          FIFO_AR_req_flag <= 0; 
    end 
end 

// Generate "FIFO_WDATA_req_flag" 
always @(posedge clk or reset) begin 
    if(reset === 0) begin 
      FIFO_WDATA_req_flag <= 0; 
    end else begin 
      if(TRAN_base_ddr_addr_WVALID && TRAN_base_ddr_addr_WREADY && (FIFO_WDATA_req_ptr_w == FIFO_DEPTH - 1)) 
          FIFO_WDATA_req_flag <= 1; 
      # 0.4;
      if(FIFO_WDATA_read && !FIFO_WDATA_req_empty && (FIFO_WDATA_req_ptr_r == 0)) 
          FIFO_WDATA_req_flag <= 0; 
    end 
end 

// Generate "FIFO_WDATA_size_flag" 
always @(posedge clk or reset) begin 
    if(reset === 0) begin 
      FIFO_WDATA_size_flag <= 0; 
    end
end 

always @(posedge clk or reset) begin 
    if(reset === 0) begin 
        FIFO_AW_req_read <= 0;
        FIFO_AW_req_ptr_r <= 0;
    end else begin 
        #0.2;
        if (FIFO_AW_req_ptr_r_tmp > FIFO_AW_req_ptr_r) begin
            FIFO_AW_req_read <= 1;
            FIFO_AW_req_ptr_r <= FIFO_AW_req_ptr_r + 1;
        end else if (FIFO_AW_req_ptr_r_tmp == 0 && FIFO_AW_req_ptr_r == FIFO_DEPTH - 1) begin
            FIFO_AW_req_read <= 1;
            FIFO_AW_req_ptr_r <= 0;
        end else begin 
            FIFO_AW_req_read <= 0;
        end
    end 
end

always @(posedge clk or reset) begin 
    if(reset === 0) begin 
        BRESP_counter <= 0;
        BRESP_tmp <= 0;
    end else begin
        if ( send_one_BRESP == 'b1 && !(BRESP_counter != 32'h0 && TRAN_base_ddr_addr_BREADY) ) begin
            BRESP_counter <= BRESP_counter + 1;
        end else if (send_one_BRESP != 'b1 && (BRESP_counter != 32'h0 && TRAN_base_ddr_addr_BREADY)) begin
            BRESP_counter <= BRESP_counter - 1;
        end
    end
end

initial begin : AW_request_proc
    integer counter;
    integer i;
    integer j;
    integer data_byte_size;
    integer output_length;
    integer FIFO_AW_req_transaction_tmp;
    integer FIFO_AW_req_clk_tmp;
    integer WDATA_size_tmp;
    reg [base_ddr_addr_DATA_BITWIDTH - 1 : 0] FIFO_WDATA_tmp;
    reg [base_ddr_addr_DATA_BITWIDTH - 1 : 0] WDATA_tmp;
    reg [base_ddr_addr_DATA_BITWIDTH/8 - 1 : 0] FIFO_WSTRB_tmp;
    @(posedge clk);

    while (1) begin
        if (FIFO_AW_req_empty === 1 || BRESP_counter == 32) begin
            @(posedge clk);
        end else begin
            if(FIFO_AW_req_ptr_r_tmp != FIFO_DEPTH - 1)
                FIFO_AW_req_ptr_r_tmp = FIFO_AW_req_ptr_r_tmp + 1;
            else
                FIFO_AW_req_ptr_r_tmp = 0;

            FIFO_AW_req_ADDR_tmp    =  FIFO_AW_req_ADDR   [FIFO_AW_req_ptr_r]  ;
            FIFO_AW_req_SIZE_tmp    =  FIFO_AW_req_SIZE   [FIFO_AW_req_ptr_r]  ;
            FIFO_AW_req_LEN_tmp     =  FIFO_AW_req_LEN    [FIFO_AW_req_ptr_r]  ; 
            FIFO_AW_req_BURST_tmp   =  FIFO_AW_req_BURST  [FIFO_AW_req_ptr_r]  ;
            FIFO_AW_req_transaction_tmp   =  FIFO_AW_req_transaction_number[FIFO_AW_req_ptr_r]  ;
            FIFO_AW_req_clk_tmp   =  FIFO_AW_req_cycle_number[FIFO_AW_req_ptr_r]  ;
            
            while (clk_counter < FIFO_AW_req_clk_tmp + WriteReqLatency ) begin
                @(posedge clk);
            end
            
            data_byte_size = 1;
            for (i=0;i<FIFO_AW_req_SIZE_tmp; i=i+1) begin
                data_byte_size = data_byte_size * 2;
            end
            
            if (FIFO_AW_req_ADDR_tmp/data_byte_size > base_ddr_addr_mem_depth) begin
                $display ("Write request address %d exceed AXI master base_ddr_addr array depth: %d",FIFO_AW_req_ADDR_tmp/data_byte_size, base_ddr_addr_mem_depth); 
                $finish;
            end
            
            if (FIFO_AW_req_BURST_tmp === 1) begin
                counter = 0;
                output_length = FIFO_AW_req_LEN_tmp;
                while (counter != output_length + 1) begin
                    if (FIFO_WDATA_req_empty != 1) begin 
                        FIFO_WDATA_read <= 1;
                        if(FIFO_WDATA_req_ptr_r != FIFO_DEPTH - 1)
                            FIFO_WDATA_req_ptr_r <= FIFO_WDATA_req_ptr_r + 1;
                        else
                            FIFO_WDATA_req_ptr_r <= 0;
                        FIFO_WDATA_tmp = FIFO_WDATA [FIFO_WDATA_req_ptr_r];
                        FIFO_WSTRB_tmp = FIFO_WSTRB [FIFO_WDATA_req_ptr_r];
                        for (i = 0 ; i < data_byte_size; i = i + 1) begin
                            if (FIFO_WSTRB_tmp[i] == 1) begin 
                                for (j=(i*8); j< (i+1)*8 ; j= j+1) begin
                                    WDATA_tmp[j] = FIFO_WDATA_tmp[j];
                                end
                            end else begin
                                for (j=(i*8); j< (i+1)*8 ; j= j+1) begin
                                    WDATA_tmp[j] = base_ddr_addr_mem [(FIFO_AW_req_transaction_tmp % mem_page_num) * base_ddr_addr_mem_depth + FIFO_AW_req_ADDR_tmp/data_byte_size + counter][j];
                                end
                            end
                        end
                        base_ddr_addr_mem [(FIFO_AW_req_transaction_tmp % mem_page_num) * base_ddr_addr_mem_depth + FIFO_AW_req_ADDR_tmp/data_byte_size + counter] <= WDATA_tmp;
                        if (counter === output_length && FIFO_WDATA_size_empty != 1 ) begin
                            if(FIFO_WDATA_size_ptr_r != FIFO_DEPTH - 1)
                                FIFO_WDATA_size_ptr_r <= FIFO_WDATA_size_ptr_r + 1;
                            else
                                FIFO_WDATA_size_ptr_r <= 0;
                            WDATA_size_tmp = FIFO_WDATA_size [FIFO_WDATA_size_ptr_r];
                            if (WDATA_size_tmp !== output_length + 1) begin
                                $display ("Burst output data size incorrect.");
                                $finish;
                            end    
                            send_one_BRESP <= 1;
                        end   
                        counter = counter + 1;
                    end 
                    @(posedge clk);
                    send_one_BRESP <= 0;
                    FIFO_WDATA_read <= 0;
                end
            end else begin
                counter = 0;
                output_length = FIFO_AW_req_LEN_tmp;
                while (counter != output_length + 1) begin
                    if (FIFO_WDATA_req_empty != 1) begin 
                        FIFO_WDATA_read <= 1;
                        if(FIFO_WDATA_req_ptr_r != FIFO_DEPTH - 1)
                            FIFO_WDATA_req_ptr_r <= FIFO_WDATA_req_ptr_r + 1;
                        else
                            FIFO_WDATA_req_ptr_r <= 0;
                        FIFO_WDATA_tmp = FIFO_WDATA [FIFO_WDATA_req_ptr_r];
                        FIFO_WSTRB_tmp = FIFO_WSTRB [FIFO_WDATA_req_ptr_r];
                        for (i = 0 ; i < data_byte_size; i = i + 1) begin
                            if (FIFO_WSTRB_tmp[i] == 1) begin 
                                for (j=(i*8); j< (i+1)*8 ; j= j+1) begin
                                    WDATA_tmp[j] = FIFO_WDATA_tmp[j];
                                end
                            end else begin
                                for (j=(i*8); j< (i+1)*8 ; j= j+1) begin
                                    WDATA_tmp[j] = base_ddr_addr_mem [(FIFO_AW_req_transaction_tmp % mem_page_num) * base_ddr_addr_mem_depth + FIFO_AW_req_ADDR_tmp/data_byte_size][j];
                                end
                            end    
                        end
                        base_ddr_addr_mem [(FIFO_AW_req_transaction_tmp % mem_page_num) * base_ddr_addr_mem_depth + FIFO_AW_req_ADDR_tmp/data_byte_size] <= WDATA_tmp;
                        if (FIFO_WDATA_size_empty != 1 ) begin
                            if(FIFO_WDATA_size_ptr_r != FIFO_DEPTH - 1)
                                FIFO_WDATA_size_ptr_r <= FIFO_WDATA_size_ptr_r + 1;
                            else
                                FIFO_WDATA_size_ptr_r <= 0;
                            WDATA_size_tmp = FIFO_WDATA_size [FIFO_WDATA_size_ptr_r];
                            if (WDATA_size_tmp !== output_length + 1) begin
                                $display ("Burst output data size incorrect.");
                                $finish;
                            end    
                        end    
                        send_one_BRESP <= 1;
                        counter = counter + 1;
                    end 
                    @(posedge clk);
                    send_one_BRESP <= 0;
                    FIFO_WDATA_read <= 0;
                end
            end   
        end
    end
end

always @(posedge clk or reset) begin 
    if(reset === 0) begin 
        FIFO_AR_req_read <= 0;
        FIFO_AR_req_ptr_r <= 0;
    end else begin 
        #0.2;
        if (FIFO_AR_req_ptr_r_tmp > FIFO_AR_req_ptr_r) begin
            FIFO_AR_req_read <= 1;
            FIFO_AR_req_ptr_r <= FIFO_AR_req_ptr_r + 1;
        end else if (FIFO_AR_req_ptr_r_tmp == 0 && FIFO_AR_req_ptr_r == FIFO_DEPTH - 1) begin
            FIFO_AR_req_read <= 1;
            FIFO_AR_req_ptr_r <= 0;
        end else begin 
            FIFO_AR_req_read <= 0;
        end
    end 
end

initial begin : AR_request_proc
    integer counter;
    integer i;
    integer data_byte_size;
    integer input_length;
    integer FIFO_AR_req_transaction_tmp;
    integer FIFO_AR_req_clk_tmp;
    @(posedge clk);

    while (1) begin
        RVALID_tmp <= 0;
        if (FIFO_AR_req_empty) begin
            @(posedge clk);
        end else begin
            if(FIFO_AR_req_ptr_r_tmp != FIFO_DEPTH - 1)
                FIFO_AR_req_ptr_r_tmp = FIFO_AR_req_ptr_r_tmp + 1;
            else
                FIFO_AR_req_ptr_r_tmp = 0;

            FIFO_AR_req_ADDR_tmp    =  FIFO_AR_req_ADDR [FIFO_AR_req_ptr_r]  ;
            FIFO_AR_req_SIZE_tmp    =  FIFO_AR_req_SIZE [FIFO_AR_req_ptr_r]  ;
            FIFO_AR_req_LEN_tmp     =  FIFO_AR_req_LEN  [FIFO_AR_req_ptr_r]  ; 
            FIFO_AR_req_BURST_tmp   =  FIFO_AR_req_BURST[FIFO_AR_req_ptr_r]  ;
            FIFO_AR_req_transaction_tmp   =  FIFO_AR_req_transaction_number[FIFO_AR_req_ptr_r]  ;
            FIFO_AR_req_clk_tmp   =  FIFO_AR_req_cycle_number[FIFO_AR_req_ptr_r]  ;
            while (clk_counter < FIFO_AR_req_clk_tmp + ReadReqLatency ) begin
                @(posedge clk);
            end

            data_byte_size = 1;
            for (i=0;i<FIFO_AR_req_SIZE_tmp; i=i+1) begin
                data_byte_size = data_byte_size * 2;
            end

            if (FIFO_AR_req_ADDR_tmp/data_byte_size > base_ddr_addr_mem_depth) begin
                $display ("Read request address %d exceed AXI master base_ddr_addr array depth: %d",FIFO_AR_req_ADDR_tmp/data_byte_size, base_ddr_addr_mem_depth); 
                $finish;
            end

            if (FIFO_AR_req_BURST_tmp === 1) begin
                counter = 0;
                RLAST_tmp <= 0;
                input_length = FIFO_AR_req_LEN_tmp;
                while (counter != input_length + 1) begin
                    RDATA_tmp <= base_ddr_addr_mem [(FIFO_AR_req_transaction_tmp % mem_page_num) * base_ddr_addr_mem_depth + FIFO_AR_req_ADDR_tmp/data_byte_size +   counter] ;
                    RVALID_tmp <= 1;
                    RRESP_tmp <= 0;
                    if (counter === input_length ) begin
                        RLAST_tmp <= 1;
                    end else begin
                        RLAST_tmp <= 0;
                    end
                        
                    @(posedge clk);
                    if (RVALID_tmp && TRAN_base_ddr_addr_RREADY) begin
                        counter = counter + 1;
                    end 
                end
                RVALID_tmp <= 0;
                RLAST_tmp <= 0;
            end else begin
                counter = 0;
                RLAST_tmp <= 0;
                input_length = FIFO_AR_req_LEN_tmp;
                while (counter != input_length + 1) begin
                    RDATA_tmp <= base_ddr_addr_mem [(FIFO_AR_req_transaction_tmp % mem_page_num) * base_ddr_addr_mem_depth + FIFO_AR_req_ADDR_tmp/data_byte_size ] ;
                    RVALID_tmp <= 1;
                    RRESP_tmp <= 0;
                    RLAST_tmp <= 1;
                    @(posedge clk);
                    if (RVALID_tmp && TRAN_base_ddr_addr_RREADY) begin
                        counter = counter + 1;
                    end 
                end
                RVALID_tmp <= 0;
                RLAST_tmp <= 0;
            end    
        end
    end
end

//------------------------Task and function--------------


	function is_blank_char(input [7:0] char);
		if (char == " " || char == "\011" || char == "\012" || char == "\015") begin
			is_blank_char = 1;
		end else begin
			is_blank_char = 0;
		end
	endfunction

	function [151:0] read_token(input integer fp);
		reg [7:0] char;
		begin
			read_token = "";
			char = " ";
			while (is_blank_char(char) && char != 8'hff) begin
				char = $fgetc(fp);
			end
			while (~is_blank_char(char) && char != 8'hff) begin
				read_token = {read_token[151 - 8:0], char[7:0]};
				char = $fgetc(fp);
			end
		end
	endfunction

	function [151:0] rm_0x(input [151:0] token);
		reg [151:0] token_tmp;
		integer i;
		begin
			token_tmp = "";
			for (i = 0; token[15:0] != "0x"; token = token >> 8) begin
				token_tmp = (token[7:0] << (8 * i)) | token_tmp;
				i = i + 1;
			end
			rm_0x = token_tmp;
		end
	endfunction

task count_c_data_byte_num_by_bitwidth;
input  integer bitwidth;
output integer num;
integer factor;
integer i;
begin
    factor = 8;
    if (bitwidth <= 8) begin
        num = 1;
    end
    for (i = 2; i <= 128; i = i * 2) begin
        if (bitwidth > factor &&  bitwidth <= factor * 2) begin
            num = i;
        end
        factor = factor * 2;
    end    
end    
endtask

task count_seperate_factor_by_bitwidth;
input  integer bitwidth;
output integer factor;
begin
    if (bitwidth <= 8 ) begin
        factor=4;
    end
    if (bitwidth <= 16 & bitwidth > 8 ) begin
        factor=2;
    end
    if (bitwidth <= 32 & bitwidth > 16 ) begin
        factor=1;
    end
    if (bitwidth <= 1024 & bitwidth > 32 ) begin
        factor=1;
    end
end    
endtask

//------------------------Read file------------------------ 
 
// Read data from file 
initial begin : read_file_process 
  integer fp; 
  reg [ 100*8 : 1] str;
  integer err; 
  integer ret; 
  integer factor; 
  integer transaction_num; 
  integer mem_page; 
  integer base_page; 
  integer base_ddr_addr_bitwidth; 
  reg [151 : 0] token; 
  reg [base_ddr_addr_C_DATA_BITWIDTH - 1 : 0] token_tmp; 
  reg [base_ddr_addr_DATA_BITWIDTH - 1 : 0] mem_tmp; 
  integer i; 
  transaction_num = 0;
  base_ddr_addr_bitwidth = base_ddr_addr_C_DATA_BITWIDTH; 
  count_seperate_factor_by_bitwidth (base_ddr_addr_bitwidth , factor);
  fp = $fopen(`TV_IN_base_ddr_addr,"r"); 
  if(fp == 0) begin                               // Failed to open file 
      $display("Failed to open file \"%s\"!", `TV_IN_base_ddr_addr); 
      $finish; 
  end 
  token = read_token(fp); 
  if (token != "[[[runtime]]]") begin             // Illegal format 
      $display("ERROR: Simulation using HLS TB failed.");
      $finish; 
  end 
  token = read_token(fp); 
  while (token != "[[[/runtime]]]") begin 
      if (token != "[[transaction]]") begin 
          $display("ERROR: Simulation using HLS TB failed.");
          $finish; 
      end 
      token = read_token(fp);                        // skip transaction number 
      @(posedge clk);
      # 0.2;
      while(ready !== 1) begin
          @(posedge clk); 
          # 0.2;
      end
      mem_page = transaction_num % mem_page_num ;
      base_page = mem_page * base_ddr_addr_mem_depth ;
      mem_tmp [base_ddr_addr_DATA_BITWIDTH - 1: 0] = 0;
      for(i = 0; i < 32 ; i = i + 1) begin 
          token = read_token(fp);
          ret = $sscanf(token, "0x%x", token_tmp); 
          if (factor == 4) begin
              if (i%factor == 0) begin
                  mem_tmp [7 : 0] = token_tmp;
              end
              if (i%factor == 1) begin
                  mem_tmp [15 : 8] = token_tmp;
              end
              if (i%factor == 2) begin
                  mem_tmp [23 : 16] = token_tmp;
              end
              if (i%factor == 3) begin
                  mem_tmp [31 : 24] = token_tmp;
                  base_ddr_addr_mem[base_page + i/factor] = mem_tmp;
                  mem_tmp [base_ddr_addr_DATA_BITWIDTH - 1 : 0] = 0;
              end
          end
          if (factor == 2) begin
              if (i%factor == 0) begin
                  mem_tmp [15 : 0] = token_tmp;
              end
              if (i%factor == 1) begin
                  mem_tmp [31 : 16] = token_tmp;
                  base_ddr_addr_mem[base_page + i/factor] = mem_tmp;
                  mem_tmp [base_ddr_addr_DATA_BITWIDTH - 1: 0] = 0;
              end
          end
          if (factor == 1) begin
              mem_tmp = token_tmp;
              base_ddr_addr_mem[base_page + i] = mem_tmp;
              mem_tmp [base_ddr_addr_DATA_BITWIDTH - 1: 0] = 0;
          end
      end 
      if (factor == 4) begin
          if (i%factor != 0) begin
              base_ddr_addr_mem[base_page + i/factor] = mem_tmp;
          end
      end
      if (factor == 2) begin
          if (i%factor != 0) begin
              base_ddr_addr_mem[base_page + i/factor] = mem_tmp;
          end
      end 
      token = read_token(fp);
      transaction_num = transaction_num + 1;
      if(token != "[[/transaction]]") begin 
          $display("ERROR: Simulation using HLS TB failed.");
          $finish; 
      end 
      token = read_token(fp); //[[transaction]]
  end 
  $fclose(fp); 
end 
 
//------------------------Write file----------------------- 
 
// Write data to file 
 
initial begin : write_file_proc 
  integer fp; 
  reg [ 100*8 : 1] str;
  integer transaction_num; 
  integer i; 
  integer factor; 
  integer mem_page; 
  integer base_page; 
  integer base_ddr_addr_bitwidth; 
  reg [base_ddr_addr_C_DATA_BITWIDTH - 1 : 0] mem_tmp; 
  transaction_num = 0; 
  base_ddr_addr_bitwidth = base_ddr_addr_C_DATA_BITWIDTH; 
  count_seperate_factor_by_bitwidth (base_ddr_addr_bitwidth , factor);
  while(1) begin 
      @(posedge clk);
      while(done !== 1) begin
          @(posedge clk);
      end
      mem_page = transaction_num % mem_page_num ;
      base_page = mem_page * base_ddr_addr_mem_depth ;
      # 0.1;
      fp = $fopen(`TV_OUT_base_ddr_addr, "a"); 
      if(fp == 0) begin       // Failed to open file 
          $display("Failed to open file \"%s\"!", `TV_OUT_base_ddr_addr); 
          $finish; 
      end 
      $fdisplay(fp, "[[transaction]] %d", transaction_num);
      for(i = 0; i < (base_ddr_addr_mem_depth - base_ddr_addr_mem_depth % factor); i = i + 1) begin 
          if (factor == 4) begin
              if (i%factor == 0) begin
                  mem_tmp = base_ddr_addr_mem[base_page + i/factor][7:0];
              end
              if (i%factor == 1) begin
                  mem_tmp = base_ddr_addr_mem[base_page + i/factor][15:8];
              end
              if (i%factor == 2) begin
                  mem_tmp = base_ddr_addr_mem[base_page + i/factor][23:16];
              end
              if (i%factor == 3) begin
                  mem_tmp = base_ddr_addr_mem[base_page + i/factor][31:24];
              end
              $fdisplay(fp,"0x%x",mem_tmp);
          end
          if (factor == 2) begin
              if (i%factor == 0) begin
                  mem_tmp = base_ddr_addr_mem[base_page + i/factor][15:0];
              end
              if (i%factor == 1) begin
                  mem_tmp = base_ddr_addr_mem[base_page + i/factor][31:16];
              end
              $fdisplay(fp,"0x%x",mem_tmp);
          end
          if (factor == 1) begin
              $fdisplay(fp,"0x%x",base_ddr_addr_mem[base_page + i]);
          end
      end 
      if (factor == 4) begin
          if ((base_ddr_addr_mem_depth - 1) % factor == 2) begin
              $fdisplay(fp,"0x%x",base_ddr_addr_mem[base_page + base_ddr_addr_mem_depth/factor][7:0]);
              $fdisplay(fp,"0x%x",base_ddr_addr_mem[base_page + base_ddr_addr_mem_depth/factor][15:8]);
              $fdisplay(fp,"0x%x",base_ddr_addr_mem[base_page + base_ddr_addr_mem_depth/factor][23:16]);
          end
          if ((base_ddr_addr_mem_depth - 1) % factor == 1) begin
              $fdisplay(fp,"0x%x",base_ddr_addr_mem[base_page + base_ddr_addr_mem_depth/factor][7:0]);
              $fdisplay(fp,"0x%x",base_ddr_addr_mem[base_page + base_ddr_addr_mem_depth/factor][15:8]);
          end
          if ((base_ddr_addr_mem_depth - 1) % factor == 0) begin
              $fdisplay(fp,"0x%x",base_ddr_addr_mem[base_page + base_ddr_addr_mem_depth/factor][7:0]);
          end
      end
      if (factor == 2) begin
          if ((base_ddr_addr_mem_depth - 1) % factor == 0) begin
              $fdisplay(fp,"0x%x",base_ddr_addr_mem[base_page + base_ddr_addr_mem_depth/factor][15:0]);
          end
      end
      
      $fdisplay(fp, "[[/transaction]]");
      transaction_num = transaction_num + 1;
      $fclose(fp); 
  end 
end 
endmodule
