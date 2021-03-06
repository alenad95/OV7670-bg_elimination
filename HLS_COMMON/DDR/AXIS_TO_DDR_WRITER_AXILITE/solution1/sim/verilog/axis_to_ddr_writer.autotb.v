// ==============================================================
// File generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2015.4
// Copyright (C) 2015 Xilinx Inc. All rights reserved.
// 
// ==============================================================

 `timescale 1ns/1ps


`define AUTOTB_DUT      axis_to_ddr_writer
`define AUTOTB_DUT_INST AESL_inst_axis_to_ddr_writer
`define AUTOTB_TOP      apatb_axis_to_ddr_writer_top
`define AUTOTB_LAT_RESULT_FILE "axis_to_ddr_writer.result.lat.rb"
`define AUTOTB_PER_RESULT_TRANS_FILE "axis_to_ddr_writer.performance.result.transaction.xml"
`define AUTOTB_TOP_INST AESL_inst_apatb_axis_to_ddr_writer_top
`define AUTOTB_MAX_ALLOW_LATENCY  15000000
`define AUTOTB_TRANSACTION_NUM  2
`define AUTOTB_CLOCK_PERIOD_DIV2 5.00
`define LENGTH_inputStream_V 128
`define LENGTH_base_ddr_addr 32
`define LENGTH_frame_index_V 1
`define LENGTH_frame_count 1

`define   AESL_DEPTH_inputStream_V 1
`define   AESL_DEPTH_base_ddr_addr 1
`define   AESL_DEPTH_frame_index_V 1
`define   AESL_DEPTH_frame_count 1
`define AUTOTB_TVIN_inputStream_V  "../tv/cdatafile/c.axis_to_ddr_writer.autotvin_inputStream_V.dat"
`define AUTOTB_TVIN_inputStream_V_out_wrapc  "../tv/rtldatafile/rtl.axis_to_ddr_writer.autotvin_inputStream_V.dat"
`define AUTOTB_TVOUT_base_ddr_addr  "../tv/cdatafile/c.axis_to_ddr_writer.autotvout_base_ddr_addr.dat"
`define AUTOTB_TVOUT_frame_index_V  "../tv/cdatafile/c.axis_to_ddr_writer.autotvout_frame_index_V.dat"
`define AUTOTB_TVOUT_frame_count  "../tv/cdatafile/c.axis_to_ddr_writer.autotvout_frame_count.dat"
`define AUTOTB_TVOUT_base_ddr_addr_out_wrapc  "../tv/rtldatafile/rtl.axis_to_ddr_writer.autotvout_base_ddr_addr.dat"
`define AUTOTB_TVOUT_frame_index_V_out_wrapc  "../tv/rtldatafile/rtl.axis_to_ddr_writer.autotvout_frame_index_V.dat"
`define AUTOTB_TVOUT_frame_count_out_wrapc  "../tv/rtldatafile/rtl.axis_to_ddr_writer.autotvout_frame_count.dat"

module `AUTOTB_TOP;

task read_token;
    input integer fp;
    output reg [247 : 0] token;
    reg [7:0] c;
    reg intoken;
    reg done;
    begin
        token = "";
        intoken = 0;
        done = 0;
        while (!done) begin
            c = $fgetc(fp);
            if (c == 8'hff) begin   // EOF
                done = 1;
            end
            else if (c == " " || c == "\011" || c == "\012" || c == "\015") begin   // blank
                if (intoken) begin
                    done = 1;
                end
            end
            else begin              // valid character
                intoken = 1;
                token = (token << 8) | c;
            end
        end
    end
endtask

reg AESL_clock;
reg rst;
reg start;
reg ce;
reg continue;
wire AESL_start;
wire AESL_reset;
wire AESL_ce;
wire AESL_ready;
wire AESL_idle;
wire AESL_continue;
wire AESL_done;
reg AESL_done_delay = 0;
reg AESL_done_delay2 = 0;
reg AESL_ready_delay = 0;
wire ready;
wire ready_wire;
reg [31 : 0] AESL_mLatCnterIn [0 : `AUTOTB_TRANSACTION_NUM + 1];
reg [31 : 0] AESL_mLatCnterIn_addr;
reg [31 : 0] AESL_mLatCnterOut [0 : `AUTOTB_TRANSACTION_NUM + 1];
reg [31 : 0] AESL_mLatCnterOut_addr ;
reg [31 : 0] AESL_clk_counter ;
reg [9 - 1 : 0] AESL_clk_ready[0 : `AUTOTB_TRANSACTION_NUM + 1];
reg [9 - 1 : 0] AESL_clk_done[0 : `AUTOTB_TRANSACTION_NUM + 1];

reg reported_stuck = 0;
reg reported_stuck_cnt = 0;
wire ap_start;
wire ap_done;
wire ap_idle;
wire ap_ready;
wire [7 : 0] inputStream_V_TDATA;
wire  inputStream_V_TVALID;
wire  inputStream_V_TREADY;
wire  base_ddr_addr_AWVALID;
wire  base_ddr_addr_AWREADY;
wire [31 : 0] base_ddr_addr_AWADDR;
wire [0 : 0] base_ddr_addr_AWID;
wire [7 : 0] base_ddr_addr_AWLEN;
wire [2 : 0] base_ddr_addr_AWSIZE;
wire [1 : 0] base_ddr_addr_AWBURST;
wire [1 : 0] base_ddr_addr_AWLOCK;
wire [3 : 0] base_ddr_addr_AWCACHE;
wire [2 : 0] base_ddr_addr_AWPROT;
wire [3 : 0] base_ddr_addr_AWQOS;
wire [3 : 0] base_ddr_addr_AWREGION;
wire [0 : 0] base_ddr_addr_AWUSER;
wire  base_ddr_addr_WVALID;
wire  base_ddr_addr_WREADY;
wire [63 : 0] base_ddr_addr_WDATA;
wire [7 : 0] base_ddr_addr_WSTRB;
wire  base_ddr_addr_WLAST;
wire [0 : 0] base_ddr_addr_WID;
wire [0 : 0] base_ddr_addr_WUSER;
wire  base_ddr_addr_ARVALID;
wire  base_ddr_addr_ARREADY;
wire [31 : 0] base_ddr_addr_ARADDR;
wire [0 : 0] base_ddr_addr_ARID;
wire [7 : 0] base_ddr_addr_ARLEN;
wire [2 : 0] base_ddr_addr_ARSIZE;
wire [1 : 0] base_ddr_addr_ARBURST;
wire [1 : 0] base_ddr_addr_ARLOCK;
wire [3 : 0] base_ddr_addr_ARCACHE;
wire [2 : 0] base_ddr_addr_ARPROT;
wire [3 : 0] base_ddr_addr_ARQOS;
wire [3 : 0] base_ddr_addr_ARREGION;
wire [0 : 0] base_ddr_addr_ARUSER;
wire  base_ddr_addr_RVALID;
wire  base_ddr_addr_RREADY;
wire [63 : 0] base_ddr_addr_RDATA;
wire  base_ddr_addr_RLAST;
wire [0 : 0] base_ddr_addr_RID;
wire [0 : 0] base_ddr_addr_RUSER;
wire [1 : 0] base_ddr_addr_RRESP;
wire  base_ddr_addr_BVALID;
wire  base_ddr_addr_BREADY;
wire [1 : 0] base_ddr_addr_BRESP;
wire [0 : 0] base_ddr_addr_BID;
wire [0 : 0] base_ddr_addr_BUSER;
wire [2 : 0] frame_index_V;
wire [31 : 0] frame_count;
integer done_cnt = 0;
integer AESL_ready_cnt = 0;
integer ready_cnt = 0;
reg ready_initial;
reg ready_initial_n;
reg ready_last_n;
reg ready_delay_last_n;
reg done_delay_last_n;
reg interface_done = 0;

`AUTOTB_DUT `AUTOTB_DUT_INST(
	.ap_clk(ap_clk),
	.ap_rst_n(ap_rst_n),
	.ap_start(ap_start),
	.ap_done(ap_done),
	.ap_idle(ap_idle),
	.ap_ready(ap_ready),
	.inputStream_V_TDATA(inputStream_V_TDATA),
	.inputStream_V_TVALID(inputStream_V_TVALID),
	.inputStream_V_TREADY(inputStream_V_TREADY),
	.m_axi_base_ddr_addr_AWVALID(base_ddr_addr_AWVALID),
	.m_axi_base_ddr_addr_AWREADY(base_ddr_addr_AWREADY),
	.m_axi_base_ddr_addr_AWADDR(base_ddr_addr_AWADDR),
	.m_axi_base_ddr_addr_AWID(base_ddr_addr_AWID),
	.m_axi_base_ddr_addr_AWLEN(base_ddr_addr_AWLEN),
	.m_axi_base_ddr_addr_AWSIZE(base_ddr_addr_AWSIZE),
	.m_axi_base_ddr_addr_AWBURST(base_ddr_addr_AWBURST),
	.m_axi_base_ddr_addr_AWLOCK(base_ddr_addr_AWLOCK),
	.m_axi_base_ddr_addr_AWCACHE(base_ddr_addr_AWCACHE),
	.m_axi_base_ddr_addr_AWPROT(base_ddr_addr_AWPROT),
	.m_axi_base_ddr_addr_AWQOS(base_ddr_addr_AWQOS),
	.m_axi_base_ddr_addr_AWREGION(base_ddr_addr_AWREGION),
	.m_axi_base_ddr_addr_AWUSER(base_ddr_addr_AWUSER),
	.m_axi_base_ddr_addr_WVALID(base_ddr_addr_WVALID),
	.m_axi_base_ddr_addr_WREADY(base_ddr_addr_WREADY),
	.m_axi_base_ddr_addr_WDATA(base_ddr_addr_WDATA),
	.m_axi_base_ddr_addr_WSTRB(base_ddr_addr_WSTRB),
	.m_axi_base_ddr_addr_WLAST(base_ddr_addr_WLAST),
	.m_axi_base_ddr_addr_WID(base_ddr_addr_WID),
	.m_axi_base_ddr_addr_WUSER(base_ddr_addr_WUSER),
	.m_axi_base_ddr_addr_ARVALID(base_ddr_addr_ARVALID),
	.m_axi_base_ddr_addr_ARREADY(base_ddr_addr_ARREADY),
	.m_axi_base_ddr_addr_ARADDR(base_ddr_addr_ARADDR),
	.m_axi_base_ddr_addr_ARID(base_ddr_addr_ARID),
	.m_axi_base_ddr_addr_ARLEN(base_ddr_addr_ARLEN),
	.m_axi_base_ddr_addr_ARSIZE(base_ddr_addr_ARSIZE),
	.m_axi_base_ddr_addr_ARBURST(base_ddr_addr_ARBURST),
	.m_axi_base_ddr_addr_ARLOCK(base_ddr_addr_ARLOCK),
	.m_axi_base_ddr_addr_ARCACHE(base_ddr_addr_ARCACHE),
	.m_axi_base_ddr_addr_ARPROT(base_ddr_addr_ARPROT),
	.m_axi_base_ddr_addr_ARQOS(base_ddr_addr_ARQOS),
	.m_axi_base_ddr_addr_ARREGION(base_ddr_addr_ARREGION),
	.m_axi_base_ddr_addr_ARUSER(base_ddr_addr_ARUSER),
	.m_axi_base_ddr_addr_RVALID(base_ddr_addr_RVALID),
	.m_axi_base_ddr_addr_RREADY(base_ddr_addr_RREADY),
	.m_axi_base_ddr_addr_RDATA(base_ddr_addr_RDATA),
	.m_axi_base_ddr_addr_RLAST(base_ddr_addr_RLAST),
	.m_axi_base_ddr_addr_RID(base_ddr_addr_RID),
	.m_axi_base_ddr_addr_RUSER(base_ddr_addr_RUSER),
	.m_axi_base_ddr_addr_RRESP(base_ddr_addr_RRESP),
	.m_axi_base_ddr_addr_BVALID(base_ddr_addr_BVALID),
	.m_axi_base_ddr_addr_BREADY(base_ddr_addr_BREADY),
	.m_axi_base_ddr_addr_BRESP(base_ddr_addr_BRESP),
	.m_axi_base_ddr_addr_BID(base_ddr_addr_BID),
	.m_axi_base_ddr_addr_BUSER(base_ddr_addr_BUSER),
	.frame_index_V(frame_index_V),
	.frame_count(frame_count));

// Assignment for control signal
assign ap_clk = AESL_clock;
assign ap_rst_n = AESL_reset;
assign ap_rst_n_n = ~AESL_reset;
assign AESL_reset = rst;
assign ap_start = AESL_start;
assign AESL_start = start;
assign AESL_done = ap_done;
assign AESL_idle = ap_idle;
assign AESL_ready = ap_ready;
assign AESL_ce = ce;
assign AESL_continue = continue;
	always @(posedge AESL_clock) begin
		if (AESL_reset === 0) begin
		end else begin
			if (AESL_done !== 1 && AESL_done !== 0) begin
				$display("ERROR: Control signal AESL_done is invalid!");
				$finish;
			end
		end
	end
	always @(posedge AESL_clock) begin
		if (AESL_reset === 0) begin
		end else begin
			if (AESL_ready !== 1 && AESL_ready !== 0) begin
				$display("ERROR: Control signal AESL_ready is invalid!");
				$finish;
			end
		end
	end


// The signal of port frame_index_V
reg [2: 0] AESL_REG_frame_index_V = 0;
always @(posedge AESL_clock)
begin
    if(AESL_reset === 0)
        AESL_REG_frame_index_V = 0; 
    else
        AESL_REG_frame_index_V <= frame_index_V;
end 

initial begin : write_file_process_frame_index_V
	integer fp;
	integer fp_size;
	integer err;
	integer ret;
	integer i;
	integer hls_stream_size;
	integer rand;
	integer frame_index_V_count;
	reg [247:0] token;
	integer transaction_idx;
	reg [8 * 5:1] str;
    wait(AESL_reset === 1);
	fp = $fopen(`AUTOTB_TVOUT_frame_index_V_out_wrapc,"w");
	if(fp == 0) begin       // Failed to open file
		$display("Failed to open file \"%s\"!", `AUTOTB_TVOUT_frame_index_V_out_wrapc);
		$display("ERROR: Simulation using HLS TB failed.");
		$finish;
	end
	$fdisplay(fp,"[[[runtime]]]");
	transaction_idx = 0;
	while (transaction_idx != `AUTOTB_TRANSACTION_NUM) begin
        @(posedge AESL_clock);
	      while(AESL_done !== 1) begin
	          @(posedge AESL_clock);
	      end
        # 0.4;
        $fdisplay(fp,"[[transaction]] %d", transaction_idx);
	      $fdisplay(fp,"0x%x", AESL_REG_frame_index_V);
    transaction_idx = transaction_idx + 1;
	  $fdisplay(fp,"[[/transaction]]");
    end
    $fdisplay(fp,"[[[/runtime]]]");
    $fclose(fp);
end


// The signal of port frame_count
reg [31: 0] AESL_REG_frame_count = 0;
always @(posedge AESL_clock)
begin
    if(AESL_reset === 0)
        AESL_REG_frame_count = 0; 
    else
        AESL_REG_frame_count <= frame_count;
end 

initial begin : write_file_process_frame_count
	integer fp;
	integer fp_size;
	integer err;
	integer ret;
	integer i;
	integer hls_stream_size;
	integer rand;
	integer frame_count_count;
	reg [247:0] token;
	integer transaction_idx;
	reg [8 * 5:1] str;
    wait(AESL_reset === 1);
	fp = $fopen(`AUTOTB_TVOUT_frame_count_out_wrapc,"w");
	if(fp == 0) begin       // Failed to open file
		$display("Failed to open file \"%s\"!", `AUTOTB_TVOUT_frame_count_out_wrapc);
		$display("ERROR: Simulation using HLS TB failed.");
		$finish;
	end
	$fdisplay(fp,"[[[runtime]]]");
	transaction_idx = 0;
	while (transaction_idx != `AUTOTB_TRANSACTION_NUM) begin
        @(posedge AESL_clock);
	      while(AESL_done !== 1) begin
	          @(posedge AESL_clock);
	      end
        # 0.4;
        $fdisplay(fp,"[[transaction]] %d", transaction_idx);
	      $fdisplay(fp,"0x%x", AESL_REG_frame_count);
    transaction_idx = transaction_idx + 1;
	  $fdisplay(fp,"[[/transaction]]");
    end
    $fdisplay(fp,"[[[/runtime]]]");
    $fclose(fp);
end


reg [31:0] ap_c_n_tvin_trans_num_inputStream_V;
reg inputStream_V_ready_reg; // for self-sync

wire inputStream_V_ready;
wire inputStream_V_done;
wire [31:0] inputStream_V_transaction;
wire axi_s_inputStream_V_TVALID;
wire axi_s_inputStream_V_TREADY;

AESL_axi_s_inputStream_V AESL_AXI_S_inputStream_V(
	.clk(AESL_clock),
	.reset(AESL_reset),
	.TRAN_inputStream_V_TDATA(inputStream_V_TDATA),
	.TRAN_inputStream_V_TVALID(axi_s_inputStream_V_TVALID),
	.TRAN_inputStream_V_TREADY(axi_s_inputStream_V_TREADY),
	.ready(inputStream_V_ready),
	.done(inputStream_V_done),
	.transaction(inputStream_V_transaction));

assign inputStream_V_ready = inputStream_V_ready_reg | ready_initial;
assign inputStream_V_done = 0;

reg reg_inputStream_V_TVALID;
initial begin : gen_reg_inputStream_V_TVALID_process
	integer rand;
	reg_inputStream_V_TVALID = axi_s_inputStream_V_TVALID;
	while (1) begin
		@ (axi_s_inputStream_V_TVALID);
		reg_inputStream_V_TVALID = axi_s_inputStream_V_TVALID;
	end
end


assign inputStream_V_TVALID = reg_inputStream_V_TVALID;

assign axi_s_inputStream_V_TREADY = inputStream_V_TREADY;

wire	AESL_axi_master_base_ddr_addr_ready;
wire	AESL_axi_master_base_ddr_addr_done;
AESL_axi_master_base_ddr_addr AESL_AXI_MASTER_base_ddr_addr(
    .clk   (AESL_clock),
    .reset (AESL_reset),
    .TRAN_base_ddr_addr_AWVALID (base_ddr_addr_AWVALID),
    .TRAN_base_ddr_addr_AWREADY (base_ddr_addr_AWREADY),
    .TRAN_base_ddr_addr_AWADDR (base_ddr_addr_AWADDR),
    .TRAN_base_ddr_addr_AWID (base_ddr_addr_AWID),
    .TRAN_base_ddr_addr_AWLEN (base_ddr_addr_AWLEN),
    .TRAN_base_ddr_addr_AWSIZE (base_ddr_addr_AWSIZE),
    .TRAN_base_ddr_addr_AWBURST (base_ddr_addr_AWBURST),
    .TRAN_base_ddr_addr_AWLOCK (base_ddr_addr_AWLOCK),
    .TRAN_base_ddr_addr_AWCACHE (base_ddr_addr_AWCACHE),
    .TRAN_base_ddr_addr_AWPROT (base_ddr_addr_AWPROT),
    .TRAN_base_ddr_addr_AWQOS (base_ddr_addr_AWQOS),
    .TRAN_base_ddr_addr_AWREGION (base_ddr_addr_AWREGION),
    .TRAN_base_ddr_addr_AWUSER (base_ddr_addr_AWUSER),
    .TRAN_base_ddr_addr_WVALID (base_ddr_addr_WVALID),
    .TRAN_base_ddr_addr_WREADY (base_ddr_addr_WREADY),
    .TRAN_base_ddr_addr_WDATA (base_ddr_addr_WDATA),
    .TRAN_base_ddr_addr_WSTRB (base_ddr_addr_WSTRB),
    .TRAN_base_ddr_addr_WLAST (base_ddr_addr_WLAST),
    .TRAN_base_ddr_addr_WID (base_ddr_addr_WID),
    .TRAN_base_ddr_addr_WUSER (base_ddr_addr_WUSER),
    .TRAN_base_ddr_addr_ARVALID (base_ddr_addr_ARVALID),
    .TRAN_base_ddr_addr_ARREADY (base_ddr_addr_ARREADY),
    .TRAN_base_ddr_addr_ARADDR (base_ddr_addr_ARADDR),
    .TRAN_base_ddr_addr_ARID (base_ddr_addr_ARID),
    .TRAN_base_ddr_addr_ARLEN (base_ddr_addr_ARLEN),
    .TRAN_base_ddr_addr_ARSIZE (base_ddr_addr_ARSIZE),
    .TRAN_base_ddr_addr_ARBURST (base_ddr_addr_ARBURST),
    .TRAN_base_ddr_addr_ARLOCK (base_ddr_addr_ARLOCK),
    .TRAN_base_ddr_addr_ARCACHE (base_ddr_addr_ARCACHE),
    .TRAN_base_ddr_addr_ARPROT (base_ddr_addr_ARPROT),
    .TRAN_base_ddr_addr_ARQOS (base_ddr_addr_ARQOS),
    .TRAN_base_ddr_addr_ARREGION (base_ddr_addr_ARREGION),
    .TRAN_base_ddr_addr_ARUSER (base_ddr_addr_ARUSER),
    .TRAN_base_ddr_addr_RVALID (base_ddr_addr_RVALID),
    .TRAN_base_ddr_addr_RREADY (base_ddr_addr_RREADY),
    .TRAN_base_ddr_addr_RDATA (base_ddr_addr_RDATA),
    .TRAN_base_ddr_addr_RLAST (base_ddr_addr_RLAST),
    .TRAN_base_ddr_addr_RID (base_ddr_addr_RID),
    .TRAN_base_ddr_addr_RUSER (base_ddr_addr_RUSER),
    .TRAN_base_ddr_addr_RRESP (base_ddr_addr_RRESP),
    .TRAN_base_ddr_addr_BVALID (base_ddr_addr_BVALID),
    .TRAN_base_ddr_addr_BREADY (base_ddr_addr_BREADY),
    .TRAN_base_ddr_addr_BRESP (base_ddr_addr_BRESP),
    .TRAN_base_ddr_addr_BID (base_ddr_addr_BID),
    .TRAN_base_ddr_addr_BUSER (base_ddr_addr_BUSER),
    .ready (AESL_axi_master_base_ddr_addr_ready),
    .done  (AESL_axi_master_base_ddr_addr_done)
);
assign	AESL_axi_master_base_ddr_addr_ready	=   ready;
assign	AESL_axi_master_base_ddr_addr_done	=   AESL_done_delay;

initial begin : generate_AESL_ready_cnt_proc
    AESL_ready_cnt = 0;
    wait(AESL_reset === 1);
    while(AESL_ready_cnt != `AUTOTB_TRANSACTION_NUM) begin
        while(AESL_ready !== 1) begin
            @(posedge AESL_clock);
            # 0.4;
        end
        @(negedge AESL_clock);
        AESL_ready_cnt = AESL_ready_cnt + 1;
        @(posedge AESL_clock);
        # 0.4;
    end
end

	event next_trigger_ready_cnt;
	
	initial begin : gen_ready_cnt
		ready_cnt = 0;
		wait (AESL_reset === 1);
		forever begin
			@ (posedge AESL_clock);
			if (ready == 1) begin
				if (ready_cnt < `AUTOTB_TRANSACTION_NUM) begin
					ready_cnt = ready_cnt + 1;
				end
			end
			-> next_trigger_ready_cnt;
		end
	end
	
	wire all_finish = (done_cnt == `AUTOTB_TRANSACTION_NUM);
	
	// done_cnt
	always @ (posedge AESL_clock) begin
		if (~AESL_reset) begin
			done_cnt <= 0;
		end else begin
			if (AESL_done == 1) begin
				if (done_cnt < `AUTOTB_TRANSACTION_NUM) begin
					done_cnt <= done_cnt + 1;
				end
			end
		end
	end
	
	initial begin : finish_simulation
		wait (all_finish == 1);
		// last transaction is saved at negedge right after last done
		@ (posedge AESL_clock);
		@ (posedge AESL_clock);
		@ (posedge AESL_clock);
		@ (posedge AESL_clock);
		$finish;
	end
	
initial begin
    AESL_clock = 0;
    forever #`AUTOTB_CLOCK_PERIOD_DIV2 AESL_clock = ~AESL_clock;
end


reg end_inputStream_V;
reg [31:0] size_inputStream_V;
reg end_base_ddr_addr;
reg [31:0] size_base_ddr_addr;
reg end_frame_index_V;
reg [31:0] size_frame_index_V;
reg end_frame_count;
reg [31:0] size_frame_count;

initial begin : initial_process
    integer rand;
    rst = 0;
    # 100;
	  repeat(3) @(posedge AESL_clock);
    rst = 1;
end

initial begin : start_process
	integer rand;
	start = 0;
	ce = 1;
	wait (AESL_reset === 1);
	@ (posedge AESL_clock);
	start = 1;
	while (ready_cnt < `AUTOTB_TRANSACTION_NUM + 1) begin
		@ (posedge AESL_clock);
	end
	start = 0;
end

always @(AESL_done)
begin
    continue = AESL_done;
end

initial begin : ready_initial_process
    ready_initial = 0;
    wait (AESL_start === 1);
    ready_initial = 1;
    @(posedge AESL_clock);
    ready_initial = 0;
end

always @(posedge AESL_clock)
begin
    if(AESL_reset === 0)
      AESL_ready_delay = 0;
  else
      AESL_ready_delay = AESL_ready;
end
initial begin : ready_last_n_process
  ready_last_n = 1;
  wait(ready_cnt == `AUTOTB_TRANSACTION_NUM)
  @(posedge AESL_clock);
  ready_last_n <= 0;
end

always @(posedge AESL_clock)
begin
    if(AESL_reset === 0)
      ready_delay_last_n = 0;
  else
      ready_delay_last_n <= ready_last_n;
end
assign ready = (ready_initial | AESL_ready_delay);
assign ready_wire = ready_initial | AESL_ready_delay;
initial begin : done_delay_last_n_process
  done_delay_last_n = 1;
  while(done_cnt < `AUTOTB_TRANSACTION_NUM)
      @(posedge AESL_clock);
  # 0.1;
  done_delay_last_n = 0;
end

always @(posedge AESL_clock)
begin
    if(AESL_reset === 0)
  begin
      AESL_done_delay <= 0;
      AESL_done_delay2 <= 0;
  end
  else begin
      AESL_done_delay <= AESL_done & done_delay_last_n;
      AESL_done_delay2 <= AESL_done_delay;
  end
end
always @(posedge AESL_clock)
begin
    if(AESL_reset === 0)
      interface_done = 0;
  else begin
      # 0.01;
      if(ready === 1 && ready_cnt > 0 && ready_cnt < `AUTOTB_TRANSACTION_NUM)
          interface_done = 1;
      else if(AESL_done_delay === 1 && done_cnt == `AUTOTB_TRANSACTION_NUM)
          interface_done = 1;
      else
          interface_done = 0;
  end
end
	
	initial begin : proc_gen_axis_internal_ready_inputStream_V
		inputStream_V_ready_reg = 0;
		@ (posedge ready_initial);
		forever begin
			@ (ap_c_n_tvin_trans_num_inputStream_V or inputStream_V_transaction);
			if (ap_c_n_tvin_trans_num_inputStream_V > inputStream_V_transaction) begin
				inputStream_V_ready_reg = 1;
			end else begin
				inputStream_V_ready_reg = 0;
			end
		end
	end
	`define STREAM_SIZE_IN_inputStream_V "../tv/stream_size/stream_size_in_inputStream_V.dat"
	
	initial begin : gen_ap_c_n_tvin_trans_num_inputStream_V
		integer fp_inputStream_V;
		reg [127:0] token_inputStream_V;
		integer ret;
		
		ap_c_n_tvin_trans_num_inputStream_V = 0;
		end_inputStream_V = 0;
		wait (AESL_reset === 1);
		
		fp_inputStream_V = $fopen(`STREAM_SIZE_IN_inputStream_V, "r");
		if(fp_inputStream_V == 0) begin
			$display("Failed to open file \"%s\"!", `STREAM_SIZE_IN_inputStream_V);
			$finish;
		end
		read_token(fp_inputStream_V, token_inputStream_V); // should be [[[runtime]]]
		if (token_inputStream_V != "[[[runtime]]]") begin
			$display("ERROR: token_inputStream_V != \"[[[runtime]]]\"");
			$finish;
		end
		size_inputStream_V = 0;
		while (size_inputStream_V == 0 && end_inputStream_V == 0) begin
			ap_c_n_tvin_trans_num_inputStream_V = ap_c_n_tvin_trans_num_inputStream_V + 1;
			read_token(fp_inputStream_V, token_inputStream_V); // should be [[transaction]] or [[[/runtime]]]
			if (token_inputStream_V == "[[transaction]]") begin
				read_token(fp_inputStream_V, token_inputStream_V); // should be transaction number
				read_token(fp_inputStream_V, token_inputStream_V); // should be size for hls::stream
				ret = $sscanf(token_inputStream_V, "%d", size_inputStream_V);
				read_token(fp_inputStream_V, token_inputStream_V); // should be [[/transaction]]
			end else if (token_inputStream_V == "[[[/runtime]]]") begin
				$fclose(fp_inputStream_V);
				end_inputStream_V = 1;
			end else begin
				$display("ERROR: unknown token_inputStream_V");
				$finish;
			end
		end
		forever begin
			@ (posedge AESL_clock);
			if (end_inputStream_V == 0) begin
				if (inputStream_V_TREADY == 1) begin
					if (size_inputStream_V > 0) begin
						size_inputStream_V = size_inputStream_V - 1;
						while (size_inputStream_V == 0 && end_inputStream_V == 0) begin
							ap_c_n_tvin_trans_num_inputStream_V = ap_c_n_tvin_trans_num_inputStream_V + 1;
							read_token(fp_inputStream_V, token_inputStream_V); // should be [[transaction]] or [[[/runtime]]]
							if (token_inputStream_V == "[[transaction]]") begin
								read_token(fp_inputStream_V, token_inputStream_V); // should be transaction number
								read_token(fp_inputStream_V, token_inputStream_V); // should be size for hls::stream
								ret = $sscanf(token_inputStream_V, "%d", size_inputStream_V);
								read_token(fp_inputStream_V, token_inputStream_V); // should be [[/transaction]]
							end else if (token_inputStream_V == "[[[/runtime]]]") begin
								$fclose(fp_inputStream_V);
								end_inputStream_V = 1;
							end else begin
								$display("ERROR: unknown token_inputStream_V");
								$finish;
							end
						end
					end
				end
			end else begin
				ap_c_n_tvin_trans_num_inputStream_V = ap_c_n_tvin_trans_num_inputStream_V + 1;
			end
		end
	end
	

reg dump_tvout_finish_base_ddr_addr;

initial begin : dump_tvout_runtime_sign_base_ddr_addr
	integer fp;
	dump_tvout_finish_base_ddr_addr = 0;
	fp = $fopen(`AUTOTB_TVOUT_base_ddr_addr_out_wrapc, "w");
	if (fp == 0) begin
		$display("Failed to open file \"%s\"!", `AUTOTB_TVOUT_base_ddr_addr_out_wrapc);
		$display("ERROR: Simulation using HLS TB failed.");
		$finish;
	end
	$fdisplay(fp,"[[[runtime]]]");
	$fclose(fp);
	wait (done_cnt == `AUTOTB_TRANSACTION_NUM);
	// last transaction is saved at negedge right after last done
	@ (posedge AESL_clock);
	@ (posedge AESL_clock);
	@ (posedge AESL_clock);
	fp = $fopen(`AUTOTB_TVOUT_base_ddr_addr_out_wrapc, "a");
	if (fp == 0) begin
		$display("Failed to open file \"%s\"!", `AUTOTB_TVOUT_base_ddr_addr_out_wrapc);
		$display("ERROR: Simulation using HLS TB failed.");
		$finish;
	end
	$fdisplay(fp,"[[[/runtime]]]");
	$fclose(fp);
	dump_tvout_finish_base_ddr_addr = 1;
end

always @ (negedge AESL_clock) begin
    if(AESL_reset === 0)
    begin
        AESL_clk_counter <= 0;
    end 
    else begin
        AESL_clk_counter = AESL_clk_counter + 1;
    end
end

always @ (posedge AESL_clock or negedge AESL_reset) begin
	if (~AESL_reset) begin
		AESL_mLatCnterOut_addr = 0;
		AESL_mLatCnterOut[AESL_mLatCnterOut_addr] = AESL_clk_counter + 1;
	end else if (AESL_done && AESL_mLatCnterOut_addr < `AUTOTB_TRANSACTION_NUM + 1) begin
		AESL_mLatCnterOut[AESL_mLatCnterOut_addr] = AESL_clk_counter;
		AESL_mLatCnterOut_addr = AESL_mLatCnterOut_addr + 1;
	end
end
always @ (posedge AESL_clock or negedge AESL_reset) begin
	if (~AESL_reset) begin
		reported_stuck_cnt <= 0;
	end else if (AESL_done && AESL_mLatCnterOut_addr < `AUTOTB_TRANSACTION_NUM + 1) begin
		reported_stuck <= 0;
	end else if (reported_stuck == 0 && reported_stuck_cnt < 4) begin
		if (AESL_mLatCnterIn_addr > AESL_mLatCnterOut_addr) begin
			if (AESL_clk_counter - AESL_mLatCnterIn[AESL_mLatCnterOut_addr] > 10000 && AESL_clk_counter - AESL_mLatCnterIn[AESL_mLatCnterOut_addr] > 10 * 185) begin
				$display("WARNING: The latency is much larger than expected. Simulation may stuck.");
				reported_stuck <= 1;
				reported_stuck_cnt <= reported_stuck_cnt + 1;
			end
		end
	end
end
always @ (posedge AESL_clock or negedge AESL_reset) begin
	if (~AESL_reset) begin
		AESL_mLatCnterIn_addr = 0;
	end else begin
		if (AESL_start && AESL_mLatCnterIn_addr == 0) begin
			AESL_mLatCnterIn[AESL_mLatCnterIn_addr] = AESL_clk_counter;
			AESL_mLatCnterIn_addr = AESL_mLatCnterIn_addr + 1;
		end else if (AESL_ready && AESL_mLatCnterIn_addr < `AUTOTB_TRANSACTION_NUM + 1) begin
			AESL_mLatCnterIn[AESL_mLatCnterIn_addr] = AESL_clk_counter;
			AESL_mLatCnterIn_addr = AESL_mLatCnterIn_addr + 1;
		end
	end
end

initial begin : performance_check
	integer transaction_counter;
	integer i;
	integer fp;

	integer latthistime;
	integer lattotal;
	integer latmax;
	integer latmin;


	integer thrthistime;
	integer thrtotal;
	integer thrmax;
	integer thrmin;

	integer lataver;
	integer thraver;
	reg [31 : 0] lat_array [0 : `AUTOTB_TRANSACTION_NUM];
	reg [31 : 0] thr_array [0 : `AUTOTB_TRANSACTION_NUM];

	i = 0;
	lattotal = 0;
	latmax = 0;
	latmin = 32'h 7fffffff;
	lataver = 0;

	thrtotal = 0;
	thrmax = 0;
	thrmin = 32'h 7fffffff;
	thraver = 0;

	@(negedge AESL_clock);

	@(posedge AESL_reset);
	while (done_cnt < `AUTOTB_TRANSACTION_NUM) begin
		@(posedge AESL_clock);
	end

	#0.001

	for (i = 0; i < `AUTOTB_TRANSACTION_NUM; i = i + 1) begin
		latthistime = AESL_mLatCnterOut[i] - AESL_mLatCnterIn[i];
		lat_array[i] = latthistime;
		if (latthistime > latmax) latmax = latthistime;
		if (latthistime < latmin) latmin = latthistime;
		lattotal = lattotal + latthistime;
		if (`AUTOTB_TRANSACTION_NUM == 1) begin
			thrthistime = latthistime;
		end else begin
			thrthistime = AESL_mLatCnterIn[i + 1] - AESL_mLatCnterIn[i];
		end
		thr_array[i] = thrthistime;
		if (thrthistime > thrmax) thrmax = thrthistime;
		if (thrthistime < thrmin) thrmin = thrthistime;
		thrtotal = thrtotal + thrthistime;
	end

	lataver = lattotal / `AUTOTB_TRANSACTION_NUM;
	thraver = thrtotal / `AUTOTB_TRANSACTION_NUM;

	fp = $fopen(`AUTOTB_LAT_RESULT_FILE, "w");

	if (`AUTOTB_TRANSACTION_NUM == 1) begin
		thrmax  = 0;
		thrmin  = 0;
		thraver = 0;
		$fdisplay(fp, "$MAX_LATENCY = \"%0d\"", latmax);
		$fdisplay(fp, "$MIN_LATENCY = \"%0d\"", latmin);
		$fdisplay(fp, "$AVER_LATENCY = \"%0d\"", lataver);
		$fdisplay(fp, "$MAX_THROUGHPUT = \"%0d\"", thrmax);
		$fdisplay(fp, "$MIN_THROUGHPUT = \"%0d\"", thrmin);
		$fdisplay(fp, "$AVER_THROUGHPUT = \"%0d\"", thraver);
	end else begin
		// $::AESL_AUTOSIM::gDataflowTaskPipelineFlag && $::AESL_AUTOSIM::gnoPortSwitchingFlag == 0
		$fdisplay(fp, "$MAX_LATENCY = \"%0d\"", latmax );
		$fdisplay(fp, "$MIN_LATENCY = \"%0d\"", latmin );
		$fdisplay(fp, "$AVER_LATENCY = \"%0d\"", lataver );
		$fdisplay(fp, "$MAX_THROUGHPUT = \"%0d\"", thrmax );
		$fdisplay(fp, "$MIN_THROUGHPUT = \"%0d\"", thrmin );
		$fdisplay(fp, "$AVER_THROUGHPUT = \"%0d\"", thraver );
	end

	$fclose(fp);

	fp = $fopen(`AUTOTB_PER_RESULT_TRANS_FILE, "w");
	$fdisplay(fp, "%20s%16s%16s", "", "latency", "interval");
	if (`AUTOTB_TRANSACTION_NUM == 1) begin
		i = 0;
		thr_array[i] = 0;
		$fdisplay(fp, "transaction%8d:%16d%16d", i, lat_array[i], thr_array[i]);
	end else begin
		for (i = 0; i < AESL_mLatCnterOut_addr; i = i + 1) begin
			$fdisplay(fp, "transaction%8d:%16d%16d", i, lat_array[i], thr_array[i]);
		end
	end
	$fclose(fp);
end

endmodule
