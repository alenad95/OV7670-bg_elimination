-- ==============================================================
-- RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
-- Version: 2016.2
-- Copyright (C) 1986-2016 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity LF_valid_to_AXIS is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst_n : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    data_in_V : IN STD_LOGIC_VECTOR (7 downto 0);
    frame_valid : IN STD_LOGIC;
    line_valid : IN STD_LOGIC;
    outputStream_V_V_TDATA : OUT STD_LOGIC_VECTOR (7 downto 0);
    outputStream_V_V_TVALID : OUT STD_LOGIC;
    outputStream_V_V_TREADY : IN STD_LOGIC );
end;


architecture behav of LF_valid_to_AXIS is 
    attribute CORE_GENERATION_INFO : STRING;
    attribute CORE_GENERATION_INFO of behav : architecture is
    "LF_valid_to_AXIS,hls_ip_2016_2,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=1,HLS_INPUT_PART=xc7z020clg484-1,HLS_INPUT_CLOCK=10.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=0.000000,HLS_SYN_LAT=0,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=0,HLS_SYN_FF=3,HLS_SYN_LUT=4}";
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_st1_fsm_0 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";

    signal ap_rst_n_inv : STD_LOGIC;
    signal ap_CS_fsm : STD_LOGIC_VECTOR (0 downto 0) := "1";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_sig_cseq_ST_st1_fsm_0 : STD_LOGIC;
    signal ap_sig_18 : BOOLEAN;
    signal res : STD_LOGIC_VECTOR (0 downto 0) := "1";
    signal outputStream_V_V_TDATA_blk_n : STD_LOGIC;
    signal res_load_load_fu_64_p1 : STD_LOGIC_VECTOR (0 downto 0);
    signal frame_valid_read_read_fu_38_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal line_valid_read_read_fu_44_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_sig_ioackin_outputStream_V_V_TREADY : STD_LOGIC;
    signal ap_reg_ioackin_outputStream_V_V_TREADY : STD_LOGIC := '0';
    signal ap_NS_fsm : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_sig_80 : BOOLEAN;
    signal ap_sig_45 : BOOLEAN;


begin




    ap_CS_fsm_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                ap_CS_fsm <= ap_ST_st1_fsm_0;
            else
                ap_CS_fsm <= ap_NS_fsm;
            end if;
        end if;
    end process;


    ap_reg_ioackin_outputStream_V_V_TREADY_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                ap_reg_ioackin_outputStream_V_V_TREADY <= ap_const_logic_0;
            else
                if (ap_sig_45) then
                    if (not(((ap_start = ap_const_logic_0) or ((res_load_load_fu_64_p1 = ap_const_lv1_0) and not((ap_const_lv1_0 = frame_valid_read_read_fu_38_p2)) and not((ap_const_lv1_0 = line_valid_read_read_fu_44_p2)) and (ap_const_logic_0 = ap_sig_ioackin_outputStream_V_V_TREADY))))) then 
                        ap_reg_ioackin_outputStream_V_V_TREADY <= ap_const_logic_0;
                    elsif (ap_sig_80) then 
                        ap_reg_ioackin_outputStream_V_V_TREADY <= ap_const_logic_1;
                    end if;
                end if; 
            end if;
        end if;
    end process;


    res_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                res <= ap_const_lv1_1;
            else
                if (((ap_const_logic_1 = ap_sig_cseq_ST_st1_fsm_0) and (ap_const_lv1_0 = frame_valid_read_read_fu_38_p2) and not(((ap_start = ap_const_logic_0) or ((res_load_load_fu_64_p1 = ap_const_lv1_0) and not((ap_const_lv1_0 = frame_valid_read_read_fu_38_p2)) and not((ap_const_lv1_0 = line_valid_read_read_fu_44_p2)) and (ap_const_logic_0 = ap_sig_ioackin_outputStream_V_V_TREADY)))) and not((res_load_load_fu_64_p1 = ap_const_lv1_0)))) then 
                    res <= ap_const_lv1_0;
                end if; 
            end if;
        end if;
    end process;


    ap_NS_fsm_assign_proc : process (ap_start, ap_CS_fsm, res_load_load_fu_64_p1, frame_valid_read_read_fu_38_p2, line_valid_read_read_fu_44_p2, ap_sig_ioackin_outputStream_V_V_TREADY)
    begin
        case ap_CS_fsm is
            when ap_ST_st1_fsm_0 => 
                ap_NS_fsm <= ap_ST_st1_fsm_0;
            when others =>  
                ap_NS_fsm <= "X";
        end case;
    end process;

    ap_done_assign_proc : process(ap_start, ap_sig_cseq_ST_st1_fsm_0, res_load_load_fu_64_p1, frame_valid_read_read_fu_38_p2, line_valid_read_read_fu_44_p2, ap_sig_ioackin_outputStream_V_V_TREADY)
    begin
        if (((ap_const_logic_1 = ap_sig_cseq_ST_st1_fsm_0) and not(((ap_start = ap_const_logic_0) or ((res_load_load_fu_64_p1 = ap_const_lv1_0) and not((ap_const_lv1_0 = frame_valid_read_read_fu_38_p2)) and not((ap_const_lv1_0 = line_valid_read_read_fu_44_p2)) and (ap_const_logic_0 = ap_sig_ioackin_outputStream_V_V_TREADY)))))) then 
            ap_done <= ap_const_logic_1;
        else 
            ap_done <= ap_const_logic_0;
        end if; 
    end process;


    ap_idle_assign_proc : process(ap_start, ap_sig_cseq_ST_st1_fsm_0)
    begin
        if (((ap_const_logic_0 = ap_start) and (ap_const_logic_1 = ap_sig_cseq_ST_st1_fsm_0))) then 
            ap_idle <= ap_const_logic_1;
        else 
            ap_idle <= ap_const_logic_0;
        end if; 
    end process;


    ap_ready_assign_proc : process(ap_start, ap_sig_cseq_ST_st1_fsm_0, res_load_load_fu_64_p1, frame_valid_read_read_fu_38_p2, line_valid_read_read_fu_44_p2, ap_sig_ioackin_outputStream_V_V_TREADY)
    begin
        if (((ap_const_logic_1 = ap_sig_cseq_ST_st1_fsm_0) and not(((ap_start = ap_const_logic_0) or ((res_load_load_fu_64_p1 = ap_const_lv1_0) and not((ap_const_lv1_0 = frame_valid_read_read_fu_38_p2)) and not((ap_const_lv1_0 = line_valid_read_read_fu_44_p2)) and (ap_const_logic_0 = ap_sig_ioackin_outputStream_V_V_TREADY)))))) then 
            ap_ready <= ap_const_logic_1;
        else 
            ap_ready <= ap_const_logic_0;
        end if; 
    end process;


    ap_rst_n_inv_assign_proc : process(ap_rst_n)
    begin
                ap_rst_n_inv <= not(ap_rst_n);
    end process;


    ap_sig_18_assign_proc : process(ap_CS_fsm)
    begin
                ap_sig_18 <= (ap_CS_fsm(0 downto 0) = ap_const_lv1_1);
    end process;


    ap_sig_45_assign_proc : process(ap_sig_cseq_ST_st1_fsm_0, res_load_load_fu_64_p1, frame_valid_read_read_fu_38_p2, line_valid_read_read_fu_44_p2)
    begin
                ap_sig_45 <= ((ap_const_logic_1 = ap_sig_cseq_ST_st1_fsm_0) and (res_load_load_fu_64_p1 = ap_const_lv1_0) and not((ap_const_lv1_0 = frame_valid_read_read_fu_38_p2)) and not((ap_const_lv1_0 = line_valid_read_read_fu_44_p2)));
    end process;


    ap_sig_80_assign_proc : process(ap_start, outputStream_V_V_TREADY)
    begin
                ap_sig_80 <= (not((ap_start = ap_const_logic_0)) and (ap_const_logic_1 = outputStream_V_V_TREADY));
    end process;


    ap_sig_cseq_ST_st1_fsm_0_assign_proc : process(ap_sig_18)
    begin
        if (ap_sig_18) then 
            ap_sig_cseq_ST_st1_fsm_0 <= ap_const_logic_1;
        else 
            ap_sig_cseq_ST_st1_fsm_0 <= ap_const_logic_0;
        end if; 
    end process;


    ap_sig_ioackin_outputStream_V_V_TREADY_assign_proc : process(outputStream_V_V_TREADY, ap_reg_ioackin_outputStream_V_V_TREADY)
    begin
        if ((ap_const_logic_0 = ap_reg_ioackin_outputStream_V_V_TREADY)) then 
            ap_sig_ioackin_outputStream_V_V_TREADY <= outputStream_V_V_TREADY;
        else 
            ap_sig_ioackin_outputStream_V_V_TREADY <= ap_const_logic_1;
        end if; 
    end process;

    frame_valid_read_read_fu_38_p2 <= (0=>frame_valid, others=>'-');
    line_valid_read_read_fu_44_p2 <= (0=>line_valid, others=>'-');
    outputStream_V_V_TDATA <= data_in_V;

    outputStream_V_V_TDATA_blk_n_assign_proc : process(ap_sig_cseq_ST_st1_fsm_0, outputStream_V_V_TREADY, res_load_load_fu_64_p1, frame_valid_read_read_fu_38_p2, line_valid_read_read_fu_44_p2)
    begin
        if (((ap_const_logic_1 = ap_sig_cseq_ST_st1_fsm_0) and (res_load_load_fu_64_p1 = ap_const_lv1_0) and not((ap_const_lv1_0 = frame_valid_read_read_fu_38_p2)) and not((ap_const_lv1_0 = line_valid_read_read_fu_44_p2)))) then 
            outputStream_V_V_TDATA_blk_n <= outputStream_V_V_TREADY;
        else 
            outputStream_V_V_TDATA_blk_n <= ap_const_logic_1;
        end if; 
    end process;


    outputStream_V_V_TVALID_assign_proc : process(ap_start, ap_sig_cseq_ST_st1_fsm_0, res_load_load_fu_64_p1, frame_valid_read_read_fu_38_p2, line_valid_read_read_fu_44_p2, ap_reg_ioackin_outputStream_V_V_TREADY)
    begin
        if (((ap_const_logic_1 = ap_sig_cseq_ST_st1_fsm_0) and (res_load_load_fu_64_p1 = ap_const_lv1_0) and not((ap_const_lv1_0 = frame_valid_read_read_fu_38_p2)) and not((ap_const_lv1_0 = line_valid_read_read_fu_44_p2)) and not((ap_start = ap_const_logic_0)) and (ap_const_logic_0 = ap_reg_ioackin_outputStream_V_V_TREADY))) then 
            outputStream_V_V_TVALID <= ap_const_logic_1;
        else 
            outputStream_V_V_TVALID <= ap_const_logic_0;
        end if; 
    end process;

    res_load_load_fu_64_p1 <= res;
end behav;
