// ==============================================================
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// ==============================================================
 `timescale 1ns/1ps


`define AUTOTB_DUT      Background_subtractor
`define AUTOTB_DUT_INST AESL_inst_Background_subtractor
`define AUTOTB_TOP      apatb_Background_subtractor_top
`define AUTOTB_LAT_RESULT_FILE "Background_subtractor.result.lat.rb"
`define AUTOTB_PER_RESULT_TRANS_FILE "Background_subtractor.performance.result.transaction.xml"
`define AUTOTB_TOP_INST AESL_inst_apatb_Background_subtractor_top
`define AUTOTB_MAX_ALLOW_LATENCY  15000000
`define AUTOTB_CLOCK_PERIOD_DIV2 5.00

`define AESL_DEPTH_stream_in_V 1
`define AESL_DEPTH_enable_V 1
`define AESL_DEPTH_frame_done_V 1
`define AESL_DEPTH_stream_out_V 1
`define AUTOTB_TVIN_stream_in_V  "../tv/cdatafile/c.Background_subtractor.autotvin_stream_in_V.dat"
`define AUTOTB_TVIN_enable_V  "../tv/cdatafile/c.Background_subtractor.autotvin_enable_V.dat"
`define AUTOTB_TVIN_stream_out_V  "../tv/cdatafile/c.Background_subtractor.autotvin_stream_out_V.dat"
`define AUTOTB_TVIN_stream_in_V_out_wrapc  "../tv/rtldatafile/rtl.Background_subtractor.autotvin_stream_in_V.dat"
`define AUTOTB_TVIN_enable_V_out_wrapc  "../tv/rtldatafile/rtl.Background_subtractor.autotvin_enable_V.dat"
`define AUTOTB_TVIN_stream_out_V_out_wrapc  "../tv/rtldatafile/rtl.Background_subtractor.autotvin_stream_out_V.dat"
`define AUTOTB_TVOUT_frame_done_V  "../tv/cdatafile/c.Background_subtractor.autotvout_frame_done_V.dat"
`define AUTOTB_TVOUT_stream_out_V  "../tv/cdatafile/c.Background_subtractor.autotvout_stream_out_V.dat"
`define AUTOTB_TVOUT_frame_done_V_out_wrapc  "../tv/rtldatafile/rtl.Background_subtractor.autotvout_frame_done_V.dat"
`define AUTOTB_TVOUT_stream_out_V_out_wrapc  "../tv/rtldatafile/rtl.Background_subtractor.autotvout_stream_out_V.dat"
module `AUTOTB_TOP;

parameter AUTOTB_TRANSACTION_NUM = 1;
parameter PROGRESS_TIMEOUT = 10000000;
parameter LATENCY_ESTIMATION = 61;
parameter LENGTH_stream_in_V = 4;
parameter LENGTH_enable_V = 1;
parameter LENGTH_frame_done_V = 1;
parameter LENGTH_stream_out_V = 4;

task read_token;
    input integer fp;
    output reg [175 : 0] token;
    integer ret;
    begin
        token = "";
        ret = 0;
        ret = $fscanf(fp,"%s",token);
    end
endtask

reg AESL_clock;
reg rst;
reg start;
reg ce;
reg tb_continue;
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
wire ap_start;
wire ap_done;
wire ap_idle;
wire ap_ready;
wire [15 : 0] stream_in_V_TDATA;
wire  stream_in_V_TVALID;
wire  stream_in_V_TREADY;
wire [0 : 0] enable_V;
wire [0 : 0] frame_done_V;
wire [7 : 0] stream_out_V_TDATA;
wire  stream_out_V_TVALID;
wire  stream_out_V_TREADY;
integer done_cnt = 0;
integer AESL_ready_cnt = 0;
integer ready_cnt = 0;
reg ready_initial;
reg ready_initial_n;
reg ready_last_n;
reg ready_delay_last_n;
reg done_delay_last_n;
reg interface_done = 0;

wire ap_clk;
wire ap_rst_n;
wire ap_rst_n_n;

`AUTOTB_DUT `AUTOTB_DUT_INST(
    .ap_clk(ap_clk),
    .ap_rst_n(ap_rst_n),
    .ap_start(ap_start),
    .ap_done(ap_done),
    .ap_idle(ap_idle),
    .ap_ready(ap_ready),
    .stream_in_V_TDATA(stream_in_V_TDATA),
    .stream_in_V_TVALID(stream_in_V_TVALID),
    .stream_in_V_TREADY(stream_in_V_TREADY),
    .enable_V(enable_V),
    .frame_done_V(frame_done_V),
    .stream_out_V_TDATA(stream_out_V_TDATA),
    .stream_out_V_TVALID(stream_out_V_TVALID),
    .stream_out_V_TREADY(stream_out_V_TREADY));

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
assign AESL_continue = tb_continue;
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

// The signal of port enable_V
reg [0: 0] AESL_REG_enable_V = 0;
assign enable_V = AESL_REG_enable_V;
initial begin : read_file_process_enable_V
    integer fp;
    integer err;
    integer ret;
    integer proc_rand;
    reg [175  : 0] token;
    integer i;
    reg transaction_finish;
    integer transaction_idx;
    transaction_idx = 0;
    wait(AESL_reset === 1);
    fp = $fopen(`AUTOTB_TVIN_enable_V,"r");
    if(fp == 0) begin       // Failed to open file
        $display("Failed to open file \"%s\"!", `AUTOTB_TVIN_enable_V);
        $display("ERROR: Simulation using HLS TB failed.");
        $finish;
    end
    read_token(fp, token);
    if (token != "[[[runtime]]]") begin
        $display("ERROR: Simulation using HLS TB failed.");
        $finish;
    end
    read_token(fp, token);
    while (token != "[[[/runtime]]]") begin
        if (token != "[[transaction]]") begin
            $display("ERROR: Simulation using HLS TB failed.");
              $finish;
        end
        read_token(fp, token);  // skip transaction number
          read_token(fp, token);
            # 0.2;
            while(ready_wire !== 1) begin
                @(posedge AESL_clock);
                # 0.2;
            end
        if(token != "[[/transaction]]") begin
            ret = $sscanf(token, "0x%x", AESL_REG_enable_V);
              if (ret != 1) begin
                  $display("Failed to parse token!");
                $display("ERROR: Simulation using HLS TB failed.");
                  $finish;
              end
            @(posedge AESL_clock);
              read_token(fp, token);
        end
          read_token(fp, token);
    end
    $fclose(fp);
end


// The signal of port frame_done_V
reg [0: 0] AESL_REG_frame_done_V = 0;
always @(posedge AESL_clock)
begin
    if(AESL_reset === 0)
        AESL_REG_frame_done_V = 0; 
    else
        AESL_REG_frame_done_V <= frame_done_V;
end 

initial begin : write_file_process_frame_done_V
    integer fp;
    integer fp_size;
    integer err;
    integer ret;
    integer i;
    integer hls_stream_size;
    integer proc_rand;
    integer frame_done_V_count;
    reg [175:0] token;
    integer transaction_idx;
    reg [8 * 5:1] str;
    wait(AESL_reset === 1);
    fp = $fopen(`AUTOTB_TVOUT_frame_done_V_out_wrapc,"w");
    if(fp == 0) begin       // Failed to open file
        $display("Failed to open file \"%s\"!", `AUTOTB_TVOUT_frame_done_V_out_wrapc);
        $display("ERROR: Simulation using HLS TB failed.");
        $finish;
    end
    $fdisplay(fp,"[[[runtime]]]");
    transaction_idx = 0;
    while (transaction_idx != AUTOTB_TRANSACTION_NUM) begin
        @(posedge AESL_clock);
          while(AESL_done !== 1) begin
              @(posedge AESL_clock);
          end
        # 0.4;
        $fdisplay(fp,"[[transaction]] %d", transaction_idx);
          $fdisplay(fp,"0x%x", AESL_REG_frame_done_V);
    transaction_idx = transaction_idx + 1;
      $fdisplay(fp,"[[/transaction]]");
    end
    $fdisplay(fp,"[[[/runtime]]]");
    $fclose(fp);
end



reg [31:0] ap_c_n_tvin_trans_num_stream_in_V;

reg stream_in_V_ready_reg; // for self-sync

wire stream_in_V_ready;
wire stream_in_V_done;
wire [31:0] stream_in_V_transaction;
wire axi_s_stream_in_V_TVALID;
wire axi_s_stream_in_V_TREADY;

AESL_axi_s_stream_in_V AESL_AXI_S_stream_in_V(
    .clk(AESL_clock),
    .reset(AESL_reset),
    .TRAN_stream_in_V_TDATA(stream_in_V_TDATA),
    .TRAN_stream_in_V_TVALID(axi_s_stream_in_V_TVALID),
    .TRAN_stream_in_V_TREADY(axi_s_stream_in_V_TREADY),
    .ready(stream_in_V_ready),
    .done(stream_in_V_done),
    .transaction(stream_in_V_transaction));

assign stream_in_V_ready = ready;
assign stream_in_V_done = 0;

assign stream_in_V_TVALID = axi_s_stream_in_V_TVALID;

assign axi_s_stream_in_V_TREADY = stream_in_V_TREADY;
reg [31:0] ap_c_n_tvin_trans_num_stream_out_V;

reg stream_out_V_ready_reg; // for self-sync

wire stream_out_V_ready;
wire stream_out_V_done;
wire [31:0] stream_out_V_transaction;
wire axi_s_stream_out_V_TVALID;
wire axi_s_stream_out_V_TREADY;

AESL_axi_s_stream_out_V AESL_AXI_S_stream_out_V(
    .clk(AESL_clock),
    .reset(AESL_reset),
    .TRAN_stream_out_V_TDATA(stream_out_V_TDATA),
    .TRAN_stream_out_V_TVALID(axi_s_stream_out_V_TVALID),
    .TRAN_stream_out_V_TREADY(axi_s_stream_out_V_TREADY),
    .ready(stream_out_V_ready),
    .done(stream_out_V_done),
    .transaction(stream_out_V_transaction));

assign stream_out_V_ready = 0;
assign stream_out_V_done = AESL_done;

assign axi_s_stream_out_V_TVALID = stream_out_V_TVALID;

reg reg_stream_out_V_TREADY;
initial begin : gen_reg_stream_out_V_TREADY_process
    integer proc_rand;
    reg_stream_out_V_TREADY = axi_s_stream_out_V_TREADY;
    while(1)
    begin
        @(axi_s_stream_out_V_TREADY);
        reg_stream_out_V_TREADY = axi_s_stream_out_V_TREADY;
    end
end


assign stream_out_V_TREADY = reg_stream_out_V_TREADY;

initial begin : generate_AESL_ready_cnt_proc
    AESL_ready_cnt = 0;
    wait(AESL_reset === 1);
    while(AESL_ready_cnt != AUTOTB_TRANSACTION_NUM) begin
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
                if (ready_cnt < AUTOTB_TRANSACTION_NUM) begin
                    ready_cnt = ready_cnt + 1;
                end
            end
            -> next_trigger_ready_cnt;
        end
    end
    
    wire all_finish = (done_cnt == AUTOTB_TRANSACTION_NUM);
    
    // done_cnt
    always @ (posedge AESL_clock) begin
        if (~AESL_reset) begin
            done_cnt <= 0;
        end else begin
            if (AESL_done == 1) begin
                if (done_cnt < AUTOTB_TRANSACTION_NUM) begin
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


reg end_stream_in_V;
reg [31:0] size_stream_in_V;
reg [31:0] size_stream_in_V_backup;
reg end_enable_V;
reg [31:0] size_enable_V;
reg [31:0] size_enable_V_backup;
reg end_stream_out_V;
reg [31:0] size_stream_out_V;
reg [31:0] size_stream_out_V_backup;
reg end_frame_done_V;
reg [31:0] size_frame_done_V;
reg [31:0] size_frame_done_V_backup;

initial begin : initial_process
    integer proc_rand;
    rst = 0;
    # 100;
    repeat(3) @ (posedge AESL_clock);
    rst = 1;
end
initial begin : start_process
    integer proc_rand;
    reg [31:0] start_cnt;
    ce = 1;
    start = 0;
    start_cnt = 0;
    wait (AESL_reset === 1);
    @ (posedge AESL_clock);
    #0 start = 1;
    start_cnt = start_cnt + 1;
    forever begin
        @ (posedge AESL_clock);
        if (start_cnt >= AUTOTB_TRANSACTION_NUM) begin
            // keep pushing garbage in
            #0 start = 1;
        end
        if (AESL_ready) begin
            start_cnt = start_cnt + 1;
        end
    end
end

always @(AESL_done)
begin
    tb_continue = AESL_done;
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
  wait(ready_cnt == AUTOTB_TRANSACTION_NUM)
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
  while(done_cnt < AUTOTB_TRANSACTION_NUM)
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
      if(ready === 1 && ready_cnt > 0 && ready_cnt < AUTOTB_TRANSACTION_NUM)
          interface_done = 1;
      else if(AESL_done_delay === 1 && done_cnt == AUTOTB_TRANSACTION_NUM)
          interface_done = 1;
      else
          interface_done = 0;
  end
end
    
    initial begin : proc_gen_axis_internal_ready_stream_in_V
        stream_in_V_ready_reg = 0;
        @ (posedge ready_initial);
        forever begin
            @ (ap_c_n_tvin_trans_num_stream_in_V or stream_in_V_transaction);
            if (ap_c_n_tvin_trans_num_stream_in_V > stream_in_V_transaction) begin
                stream_in_V_ready_reg = 1;
            end else begin
                stream_in_V_ready_reg = 0;
            end
        end
    end
    
    `define STREAM_SIZE_IN_stream_in_V "../tv/stream_size/stream_size_in_stream_in_V.dat"
    
    initial begin : gen_ap_c_n_tvin_trans_num_stream_in_V
        integer fp_stream_in_V;
        reg [127:0] token_stream_in_V;
        integer ret;
        
        ap_c_n_tvin_trans_num_stream_in_V = 0;
        end_stream_in_V = 0;
        wait (AESL_reset === 1);
        
        fp_stream_in_V = $fopen(`AUTOTB_TVIN_stream_in_V, "r");
        if(fp_stream_in_V == 0) begin
            $display("Failed to open file \"%s\"!", `AUTOTB_TVIN_stream_in_V);
            $finish;
        end
        read_token(fp_stream_in_V, token_stream_in_V); // should be [[[runtime]]]
        if (token_stream_in_V != "[[[runtime]]]") begin
            $display("ERROR: token_stream_in_V != \"[[[runtime]]]\"");
            $finish;
        end
        ap_c_n_tvin_trans_num_stream_in_V = ap_c_n_tvin_trans_num_stream_in_V + 1;
        read_token(fp_stream_in_V, token_stream_in_V); // should be [[transaction]] or [[[/runtime]]]
        if (token_stream_in_V == "[[[/runtime]]]") begin
            $fclose(fp_stream_in_V);
            end_stream_in_V = 1;
        end else begin
            end_stream_in_V = 0;
            read_token(fp_stream_in_V, token_stream_in_V); // should be transaction number
            read_token(fp_stream_in_V, token_stream_in_V);
        end
        while (token_stream_in_V == "[[/transaction]]" && end_stream_in_V == 0) begin
            ap_c_n_tvin_trans_num_stream_in_V = ap_c_n_tvin_trans_num_stream_in_V + 1;
            read_token(fp_stream_in_V, token_stream_in_V); // should be [[transaction]] or [[[/runtime]]]
            if (token_stream_in_V == "[[[/runtime]]]") begin
                $fclose(fp_stream_in_V);
                end_stream_in_V = 1;
            end else begin
                end_stream_in_V = 0;
                read_token(fp_stream_in_V, token_stream_in_V); // should be transaction number
                read_token(fp_stream_in_V, token_stream_in_V);
            end
        end
        forever begin
            @ (posedge AESL_clock);
            if (end_stream_in_V == 0) begin
                if ((stream_in_V_TREADY & stream_in_V_TVALID) == 1) begin
                    read_token(fp_stream_in_V, token_stream_in_V);
                    while (token_stream_in_V == "[[/transaction]]" && end_stream_in_V == 0) begin
                        ap_c_n_tvin_trans_num_stream_in_V = ap_c_n_tvin_trans_num_stream_in_V + 1;
                        read_token(fp_stream_in_V, token_stream_in_V); // should be [[transaction]] or [[[/runtime]]]
                        if (token_stream_in_V == "[[[/runtime]]]") begin
                            $fclose(fp_stream_in_V);
                            end_stream_in_V = 1;
                        end else begin
                            end_stream_in_V = 0;
                            read_token(fp_stream_in_V, token_stream_in_V); // should be transaction number
                            read_token(fp_stream_in_V, token_stream_in_V);
                        end
                    end
                end
            end else begin
                ap_c_n_tvin_trans_num_stream_in_V = ap_c_n_tvin_trans_num_stream_in_V + 1;
            end
        end
    end
    

reg dump_tvout_finish_stream_out_V;

initial begin : dump_tvout_runtime_sign_stream_out_V
    integer fp;
    dump_tvout_finish_stream_out_V = 0;
    fp = $fopen(`AUTOTB_TVOUT_stream_out_V_out_wrapc, "w");
    if (fp == 0) begin
        $display("Failed to open file \"%s\"!", `AUTOTB_TVOUT_stream_out_V_out_wrapc);
        $display("ERROR: Simulation using HLS TB failed.");
        $finish;
    end
    $fdisplay(fp,"[[[runtime]]]");
    $fclose(fp);
    wait (done_cnt == AUTOTB_TRANSACTION_NUM);
    // last transaction is saved at negedge right after last done
    @ (posedge AESL_clock);
    @ (posedge AESL_clock);
    @ (posedge AESL_clock);
    fp = $fopen(`AUTOTB_TVOUT_stream_out_V_out_wrapc, "a");
    if (fp == 0) begin
        $display("Failed to open file \"%s\"!", `AUTOTB_TVOUT_stream_out_V_out_wrapc);
        $display("ERROR: Simulation using HLS TB failed.");
        $finish;
    end
    $fdisplay(fp,"[[[/runtime]]]");
    $fclose(fp);
    dump_tvout_finish_stream_out_V = 1;
end


////////////////////////////////////////////
// progress and performance
////////////////////////////////////////////

task wait_start();
    while (~AESL_start) begin
        @ (posedge AESL_clock);
    end
endtask

reg [31:0] clk_cnt = 0;
reg AESL_ready_p1;
reg AESL_start_p1;

always @ (posedge AESL_clock) begin
    clk_cnt <= clk_cnt + 1;
    AESL_ready_p1 <= AESL_ready;
    AESL_start_p1 <= AESL_start;
end

reg [31:0] start_timestamp [0:AUTOTB_TRANSACTION_NUM - 1];
reg [31:0] start_cnt;
reg [31:0] ready_timestamp [0:AUTOTB_TRANSACTION_NUM - 1];
reg [31:0] ap_ready_cnt;
reg [31:0] finish_timestamp [0:AUTOTB_TRANSACTION_NUM - 1];
reg [31:0] finish_cnt;
event report_progress;

initial begin
    start_cnt = 0;
    finish_cnt = 0;
    ap_ready_cnt = 0;
    wait (AESL_reset == 1);
    wait_start();
    start_timestamp[start_cnt] = clk_cnt;
    start_cnt = start_cnt + 1;
    if (AESL_done) begin
        finish_timestamp[finish_cnt] = clk_cnt;
        finish_cnt = finish_cnt + 1;
    end
    -> report_progress;
    forever begin
        @ (posedge AESL_clock);
        if (start_cnt < AUTOTB_TRANSACTION_NUM) begin
            if ((AESL_start && AESL_ready_p1)||(AESL_start && ~AESL_start_p1)) begin
                start_timestamp[start_cnt] = clk_cnt;
                start_cnt = start_cnt + 1;
            end
        end
        if (ap_ready_cnt < AUTOTB_TRANSACTION_NUM) begin
            if (AESL_start_p1 && AESL_ready_p1) begin
                ready_timestamp[ap_ready_cnt] = clk_cnt;
                ap_ready_cnt = ap_ready_cnt + 1;
            end
        end
        if (finish_cnt < AUTOTB_TRANSACTION_NUM) begin
            if (AESL_done) begin
                finish_timestamp[finish_cnt] = clk_cnt;
                finish_cnt = finish_cnt + 1;
            end
        end
        -> report_progress;
    end
end

reg [31:0] progress_timeout;

initial begin : simulation_progress
    real intra_progress;
    wait (AESL_reset == 1);
    progress_timeout = PROGRESS_TIMEOUT;
    $display("////////////////////////////////////////////////////////////////////////////////////");
    $display("// Inter-Transaction Progress: Completed Transaction / Total Transaction");
    $display("// Intra-Transaction Progress: Measured Latency / Latency Estimation * 100%%");
    $display("//");
    $display("// RTL Simulation : \"Inter-Transaction Progress\" [\"Intra-Transaction Progress\"] @ \"Simulation Time\"");
    $display("////////////////////////////////////////////////////////////////////////////////////");
    print_progress();
    while (finish_cnt < AUTOTB_TRANSACTION_NUM) begin
        @ (report_progress);
        if (finish_cnt < AUTOTB_TRANSACTION_NUM) begin
            if (AESL_done) begin
                print_progress();
                progress_timeout = PROGRESS_TIMEOUT;
            end else begin
                if (progress_timeout == 0) begin
                    print_progress();
                    progress_timeout = PROGRESS_TIMEOUT;
                end else begin
                    progress_timeout = progress_timeout - 1;
                end
            end
        end
    end
    print_progress();
    $display("////////////////////////////////////////////////////////////////////////////////////");
    calculate_performance();
end

task get_intra_progress(output real intra_progress);
    begin
        if (start_cnt > finish_cnt) begin
            intra_progress = clk_cnt - start_timestamp[finish_cnt];
        end else if(finish_cnt > 0) begin
            intra_progress = LATENCY_ESTIMATION;
        end else begin
            intra_progress = 0;
        end
        intra_progress = intra_progress / LATENCY_ESTIMATION;
    end
endtask

task print_progress();
    real intra_progress;
    begin
        if (LATENCY_ESTIMATION > 0) begin
            get_intra_progress(intra_progress);
            $display("// RTL Simulation : %0d / %0d [%2.2f%%] @ \"%0t\"", finish_cnt, AUTOTB_TRANSACTION_NUM, intra_progress * 100, $time);
        end else begin
            $display("// RTL Simulation : %0d / %0d [n/a] @ \"%0t\"", finish_cnt, AUTOTB_TRANSACTION_NUM, $time);
        end
    end
endtask

task calculate_performance();
    integer i;
    integer fp;
    reg [31:0] latency [0:AUTOTB_TRANSACTION_NUM - 1];
    reg [31:0] latency_min;
    reg [31:0] latency_max;
    reg [31:0] latency_total;
    reg [31:0] latency_average;
    reg [31:0] interval [0:AUTOTB_TRANSACTION_NUM - 2];
    reg [31:0] interval_min;
    reg [31:0] interval_max;
    reg [31:0] interval_total;
    reg [31:0] interval_average;
    begin
        latency_min = -1;
        latency_max = 0;
        latency_total = 0;
        interval_min = -1;
        interval_max = 0;
        interval_total = 0;

        for (i = 0; i < AUTOTB_TRANSACTION_NUM; i = i + 1) begin
            // calculate latency
            latency[i] = finish_timestamp[i] - start_timestamp[i];
            if (latency[i] > latency_max) latency_max = latency[i];
            if (latency[i] < latency_min) latency_min = latency[i];
            latency_total = latency_total + latency[i];
            // calculate interval
            if (AUTOTB_TRANSACTION_NUM == 1) begin
                interval[i] = 0;
                interval_max = 0;
                interval_min = 0;
                interval_total = 0;
            end else if (i < AUTOTB_TRANSACTION_NUM - 1) begin
                interval[i] = finish_timestamp[i] - start_timestamp[i]+1;
                if (interval[i] > interval_max) interval_max = interval[i];
                if (interval[i] < interval_min) interval_min = interval[i];
                interval_total = interval_total + interval[i];
            end
        end

        latency_average = latency_total / AUTOTB_TRANSACTION_NUM;
        if (AUTOTB_TRANSACTION_NUM == 1) begin
            interval_average = 0;
        end else begin
            interval_average = interval_total / (AUTOTB_TRANSACTION_NUM - 1);
        end

        fp = $fopen(`AUTOTB_LAT_RESULT_FILE, "w");

        $fdisplay(fp, "$MAX_LATENCY = \"%0d\"", latency_max);
        $fdisplay(fp, "$MIN_LATENCY = \"%0d\"", latency_min);
        $fdisplay(fp, "$AVER_LATENCY = \"%0d\"", latency_average);
        $fdisplay(fp, "$MAX_THROUGHPUT = \"%0d\"", interval_max);
        $fdisplay(fp, "$MIN_THROUGHPUT = \"%0d\"", interval_min);
        $fdisplay(fp, "$AVER_THROUGHPUT = \"%0d\"", interval_average);

        $fclose(fp);

        fp = $fopen(`AUTOTB_PER_RESULT_TRANS_FILE, "w");

        $fdisplay(fp, "%20s%16s%16s", "", "latency", "interval");
        if (AUTOTB_TRANSACTION_NUM == 1) begin
            i = 0;
            $fdisplay(fp, "transaction%8d:%16d%16d", i, latency[i], interval[i]);
        end else begin
            for (i = 0; i < AUTOTB_TRANSACTION_NUM; i = i + 1) begin
                if (i < AUTOTB_TRANSACTION_NUM - 1) begin
                    $fdisplay(fp, "transaction%8d:%16d%16d", i, latency[i], interval[i]);
                end else begin
                    $fdisplay(fp, "transaction%8d:%16d               x", i, latency[i]);
                end
            end
        end

        $fclose(fp);
    end
endtask


////////////////////////////////////////////
// Dependence Check
////////////////////////////////////////////

`ifndef POST_SYN

`endif

endmodule
