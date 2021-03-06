-- ==============================================================
-- RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
-- Version: 2015.4
-- Copyright (C) 2015 Xilinx Inc. All rights reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity axi_stream_to_vga is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst_n : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    selftest : IN STD_LOGIC;
    inStream_V_V_TDATA : IN STD_LOGIC_VECTOR (7 downto 0);
    inStream_V_V_TVALID : IN STD_LOGIC;
    inStream_V_V_TREADY : OUT STD_LOGIC;
    R_V : OUT STD_LOGIC_VECTOR (3 downto 0);
    G_V : OUT STD_LOGIC_VECTOR (3 downto 0);
    B_V : OUT STD_LOGIC_VECTOR (3 downto 0);
    V_SYNC_V : OUT STD_LOGIC_VECTOR (0 downto 0);
    H_SYNC_V : OUT STD_LOGIC_VECTOR (0 downto 0) );
end;


architecture behav of axi_stream_to_vga is 
    attribute CORE_GENERATION_INFO : STRING;
    attribute CORE_GENERATION_INFO of behav : architecture is
    "axi_stream_to_vga,hls_ip_2015_4,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=1,HLS_INPUT_PART=xc7z020clg484-1,HLS_INPUT_CLOCK=10.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=8.249000,HLS_SYN_LAT=420002,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=0,HLS_SYN_FF=95,HLS_SYN_LUT=215}";
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_st1_fsm_0 : STD_LOGIC_VECTOR (2 downto 0) := "001";
    constant ap_ST_pp0_stg0_fsm_1 : STD_LOGIC_VECTOR (2 downto 0) := "010";
    constant ap_ST_st4_fsm_2 : STD_LOGIC_VECTOR (2 downto 0) := "100";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv4_0 : STD_LOGIC_VECTOR (3 downto 0) := "0000";
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv19_0 : STD_LOGIC_VECTOR (18 downto 0) := "0000000000000000000";
    constant ap_const_lv10_0 : STD_LOGIC_VECTOR (9 downto 0) := "0000000000";
    constant ap_const_lv4_F : STD_LOGIC_VECTOR (3 downto 0) := "1111";
    constant ap_const_lv21_3 : STD_LOGIC_VECTOR (20 downto 0) := "000000000000000000011";
    constant ap_const_lv21_2 : STD_LOGIC_VECTOR (20 downto 0) := "000000000000000000010";
    constant ap_const_lv21_1 : STD_LOGIC_VECTOR (20 downto 0) := "000000000000000000001";
    constant ap_const_lv21_0 : STD_LOGIC_VECTOR (20 downto 0) := "000000000000000000000";
    constant ap_const_lv4_1 : STD_LOGIC_VECTOR (3 downto 0) := "0001";
    constant ap_const_lv4_E : STD_LOGIC_VECTOR (3 downto 0) := "1110";
    constant ap_const_lv19_668A0 : STD_LOGIC_VECTOR (18 downto 0) := "1100110100010100000";
    constant ap_const_lv19_1 : STD_LOGIC_VECTOR (18 downto 0) := "0000000000000000001";
    constant ap_const_lv10_320 : STD_LOGIC_VECTOR (9 downto 0) := "1100100000";
    constant ap_const_lv10_1 : STD_LOGIC_VECTOR (9 downto 0) := "0000000001";
    constant ap_const_lv10_3DD : STD_LOGIC_VECTOR (9 downto 0) := "1111011101";
    constant ap_const_lv32_9 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001001";
    constant ap_const_lv9_0 : STD_LOGIC_VECTOR (8 downto 0) := "000000000";
    constant ap_const_lv10_22 : STD_LOGIC_VECTOR (9 downto 0) := "0000100010";
    constant ap_const_lv10_203 : STD_LOGIC_VECTOR (9 downto 0) := "1000000011";
    constant ap_const_lv11_770 : STD_LOGIC_VECTOR (10 downto 0) := "11101110000";
    constant ap_const_lv10_5F : STD_LOGIC_VECTOR (9 downto 0) := "0001011111";
    constant ap_const_lv10_8F : STD_LOGIC_VECTOR (9 downto 0) := "0010001111";
    constant ap_const_lv10_310 : STD_LOGIC_VECTOR (9 downto 0) := "1100010000";
    constant ap_const_lv32_4 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000100";
    constant ap_const_lv32_7 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000111";
    constant ap_const_lv32_5 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000101";
    constant ap_const_lv32_2 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000010";

    signal ap_rst_n_inv : STD_LOGIC;
    signal ap_CS_fsm : STD_LOGIC_VECTOR (2 downto 0) := "001";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_sig_cseq_ST_st1_fsm_0 : STD_LOGIC;
    signal ap_sig_bdd_21 : BOOLEAN;
    signal color_blinking_V : STD_LOGIC_VECTOR (3 downto 0) := "0000";
    signal indvar_flatten_reg_192 : STD_LOGIC_VECTOR (18 downto 0);
    signal y_reg_203 : STD_LOGIC_VECTOR (9 downto 0);
    signal x_reg_214 : STD_LOGIC_VECTOR (9 downto 0);
    signal selftest_read_read_fu_134_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal op2_V_read_assign_fu_252_p2 : STD_LOGIC_VECTOR (3 downto 0);
    signal op2_V_read_assign_reg_498 : STD_LOGIC_VECTOR (3 downto 0);
    signal tmp_nbreadreq_fu_140_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_reg_503 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_6_i_fu_264_p2 : STD_LOGIC_VECTOR (3 downto 0);
    signal tmp_6_i_reg_507 : STD_LOGIC_VECTOR (3 downto 0);
    signal exitcond_flatten_fu_270_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal exitcond_flatten_reg_512 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_sig_cseq_ST_pp0_stg0_fsm_1 : STD_LOGIC;
    signal ap_sig_bdd_63 : BOOLEAN;
    signal or_cond2_fu_386_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_sig_bdd_78 : BOOLEAN;
    signal ap_reg_ppiten_pp0_it0 : STD_LOGIC := '0';
    signal ap_reg_ppiten_pp0_it1 : STD_LOGIC := '0';
    signal indvar_flatten_next_fu_276_p2 : STD_LOGIC_VECTOR (18 downto 0);
    signal y_mid2_fu_302_p3 : STD_LOGIC_VECTOR (9 downto 0);
    signal y_mid2_reg_521 : STD_LOGIC_VECTOR (9 downto 0);
    signal or_cond2_reg_526 : STD_LOGIC_VECTOR (0 downto 0);
    signal x_1_fu_452_p2 : STD_LOGIC_VECTOR (9 downto 0);
    signal y_phi_fu_207_p4 : STD_LOGIC_VECTOR (9 downto 0);
    signal R_temp_V_read_assign_fu_122 : STD_LOGIC_VECTOR (3 downto 0);
    signal tmp_2_i_fu_442_p4 : STD_LOGIC_VECTOR (20 downto 0);
    signal G_temp_V_read_assign_fu_126 : STD_LOGIC_VECTOR (3 downto 0);
    signal B_temp_V_read_assign_fu_130 : STD_LOGIC_VECTOR (3 downto 0);
    signal icmp_fu_326_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal V_SYNC_V_preg : STD_LOGIC_VECTOR (0 downto 0) := "0";
    signal not_1_fu_361_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal H_SYNC_V_preg : STD_LOGIC_VECTOR (0 downto 0) := "0";
    signal R_V_preg : STD_LOGIC_VECTOR (3 downto 0) := "0000";
    signal G_V_preg : STD_LOGIC_VECTOR (3 downto 0) := "0000";
    signal B_V_preg : STD_LOGIC_VECTOR (3 downto 0) := "0000";
    signal exitcond4_fu_282_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal y_s_fu_296_p2 : STD_LOGIC_VECTOR (9 downto 0);
    signal tmp_3_fu_316_p4 : STD_LOGIC_VECTOR (8 downto 0);
    signal tmp_1_fu_333_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_2_fu_339_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal x_mid2_fu_288_p3 : STD_LOGIC_VECTOR (9 downto 0);
    signal tmp_3_cast_fu_351_p1 : STD_LOGIC_VECTOR (10 downto 0);
    signal tmp_4_fu_368_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_5_fu_374_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp2_fu_345_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp1_fu_380_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal p_Val2_1_fu_310_p2 : STD_LOGIC_VECTOR (9 downto 0);
    signal p_Val2_s_fu_355_p2 : STD_LOGIC_VECTOR (10 downto 0);
    signal tmp_7_fu_430_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_1_i_fu_438_p1 : STD_LOGIC_VECTOR (18 downto 0);
    signal tmp_6_fu_422_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_sig_cseq_ST_st4_fsm_2 : STD_LOGIC;
    signal ap_sig_bdd_296 : BOOLEAN;
    signal ap_NS_fsm : STD_LOGIC_VECTOR (2 downto 0);
    signal ap_sig_bdd_106 : BOOLEAN;


begin




    -- B_V_preg assign process. --
    B_V_preg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                B_V_preg <= ap_const_lv4_0;
            else
                if (ap_sig_bdd_106) then
                    if (not((ap_const_lv1_0 = or_cond2_reg_526))) then 
                        B_V_preg <= B_temp_V_read_assign_fu_130;
                    elsif ((ap_const_lv1_0 = or_cond2_reg_526)) then 
                        B_V_preg <= ap_const_lv4_0;
                    end if;
                end if; 
            end if;
        end if;
    end process;


    -- G_V_preg assign process. --
    G_V_preg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                G_V_preg <= ap_const_lv4_0;
            else
                if (ap_sig_bdd_106) then
                    if (not((ap_const_lv1_0 = or_cond2_reg_526))) then 
                        G_V_preg <= G_temp_V_read_assign_fu_126;
                    elsif ((ap_const_lv1_0 = or_cond2_reg_526)) then 
                        G_V_preg <= ap_const_lv4_0;
                    end if;
                end if; 
            end if;
        end if;
    end process;


    -- H_SYNC_V_preg assign process. --
    H_SYNC_V_preg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                H_SYNC_V_preg <= ap_const_lv1_0;
            else
                if ((((ap_const_logic_1 = ap_sig_cseq_ST_pp0_stg0_fsm_1) and (exitcond_flatten_fu_270_p2 = ap_const_lv1_0) and (ap_const_lv1_0 = or_cond2_fu_386_p2) and (ap_const_logic_1 = ap_reg_ppiten_pp0_it0) and not((ap_sig_bdd_78 and (ap_const_logic_1 = ap_reg_ppiten_pp0_it0)))) or ((ap_const_logic_1 = ap_sig_cseq_ST_pp0_stg0_fsm_1) and (exitcond_flatten_fu_270_p2 = ap_const_lv1_0) and not((ap_const_lv1_0 = or_cond2_fu_386_p2)) and (ap_const_logic_1 = ap_reg_ppiten_pp0_it0) and not((ap_sig_bdd_78 and (ap_const_logic_1 = ap_reg_ppiten_pp0_it0)))))) then 
                    H_SYNC_V_preg <= not_1_fu_361_p2;
                end if; 
            end if;
        end if;
    end process;


    -- R_V_preg assign process. --
    R_V_preg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                R_V_preg <= ap_const_lv4_0;
            else
                if (ap_sig_bdd_106) then
                    if (not((ap_const_lv1_0 = or_cond2_reg_526))) then 
                        R_V_preg <= R_temp_V_read_assign_fu_122;
                    elsif ((ap_const_lv1_0 = or_cond2_reg_526)) then 
                        R_V_preg <= ap_const_lv4_0;
                    end if;
                end if; 
            end if;
        end if;
    end process;


    -- V_SYNC_V_preg assign process. --
    V_SYNC_V_preg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                V_SYNC_V_preg <= ap_const_lv1_0;
            else
                if ((((ap_const_logic_1 = ap_sig_cseq_ST_pp0_stg0_fsm_1) and (exitcond_flatten_fu_270_p2 = ap_const_lv1_0) and (ap_const_lv1_0 = or_cond2_fu_386_p2) and (ap_const_logic_1 = ap_reg_ppiten_pp0_it0) and not((ap_sig_bdd_78 and (ap_const_logic_1 = ap_reg_ppiten_pp0_it0)))) or ((ap_const_logic_1 = ap_sig_cseq_ST_pp0_stg0_fsm_1) and (exitcond_flatten_fu_270_p2 = ap_const_lv1_0) and not((ap_const_lv1_0 = or_cond2_fu_386_p2)) and (ap_const_logic_1 = ap_reg_ppiten_pp0_it0) and not((ap_sig_bdd_78 and (ap_const_logic_1 = ap_reg_ppiten_pp0_it0)))))) then 
                    V_SYNC_V_preg <= icmp_fu_326_p2;
                end if; 
            end if;
        end if;
    end process;


    -- the current state (ap_CS_fsm) of the state machine. --
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


    -- ap_reg_ppiten_pp0_it0 assign process. --
    ap_reg_ppiten_pp0_it0_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                ap_reg_ppiten_pp0_it0 <= ap_const_logic_0;
            else
                if (((ap_const_logic_1 = ap_sig_cseq_ST_pp0_stg0_fsm_1) and not((ap_sig_bdd_78 and (ap_const_logic_1 = ap_reg_ppiten_pp0_it0))) and not((exitcond_flatten_fu_270_p2 = ap_const_lv1_0)))) then 
                    ap_reg_ppiten_pp0_it0 <= ap_const_logic_0;
                elsif (((ap_const_logic_1 = ap_sig_cseq_ST_st1_fsm_0) and not((ap_start = ap_const_logic_0)))) then 
                    ap_reg_ppiten_pp0_it0 <= ap_const_logic_1;
                end if; 
            end if;
        end if;
    end process;


    -- ap_reg_ppiten_pp0_it1 assign process. --
    ap_reg_ppiten_pp0_it1_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                ap_reg_ppiten_pp0_it1 <= ap_const_logic_0;
            else
                if (((ap_const_logic_1 = ap_sig_cseq_ST_pp0_stg0_fsm_1) and (exitcond_flatten_fu_270_p2 = ap_const_lv1_0) and not((ap_sig_bdd_78 and (ap_const_logic_1 = ap_reg_ppiten_pp0_it0))))) then 
                    ap_reg_ppiten_pp0_it1 <= ap_const_logic_1;
                elsif ((((ap_const_logic_1 = ap_sig_cseq_ST_st1_fsm_0) and not((ap_start = ap_const_logic_0))) or ((ap_const_logic_1 = ap_sig_cseq_ST_pp0_stg0_fsm_1) and not((ap_sig_bdd_78 and (ap_const_logic_1 = ap_reg_ppiten_pp0_it0))) and not((exitcond_flatten_fu_270_p2 = ap_const_lv1_0))))) then 
                    ap_reg_ppiten_pp0_it1 <= ap_const_logic_0;
                end if; 
            end if;
        end if;
    end process;


    -- color_blinking_V assign process. --
    color_blinking_V_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                color_blinking_V <= ap_const_lv4_0;
            else
                if (((ap_const_logic_1 = ap_sig_cseq_ST_st1_fsm_0) and not((ap_start = ap_const_logic_0)))) then 
                    color_blinking_V <= op2_V_read_assign_fu_252_p2;
                end if; 
            end if;
        end if;
    end process;


    -- B_temp_V_read_assign_fu_130 assign process. --
    B_temp_V_read_assign_fu_130_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((((ap_const_logic_1 = ap_sig_cseq_ST_pp0_stg0_fsm_1) and (exitcond_flatten_fu_270_p2 = ap_const_lv1_0) and not((ap_const_lv1_0 = or_cond2_fu_386_p2)) and (ap_const_logic_1 = ap_reg_ppiten_pp0_it0) and not((ap_sig_bdd_78 and (ap_const_logic_1 = ap_reg_ppiten_pp0_it0))) and not((selftest_read_read_fu_134_p2 = ap_const_lv1_0)) and (tmp_2_i_fu_442_p4 = ap_const_lv21_2)) or ((ap_const_logic_1 = ap_sig_cseq_ST_pp0_stg0_fsm_1) and (exitcond_flatten_fu_270_p2 = ap_const_lv1_0) and not((ap_const_lv1_0 = or_cond2_fu_386_p2)) and (ap_const_logic_1 = ap_reg_ppiten_pp0_it0) and not((ap_sig_bdd_78 and (ap_const_logic_1 = ap_reg_ppiten_pp0_it0))) and not((selftest_read_read_fu_134_p2 = ap_const_lv1_0)) and (tmp_2_i_fu_442_p4 = ap_const_lv21_1)))) then 
                B_temp_V_read_assign_fu_130 <= tmp_6_i_reg_507;
            elsif (((ap_const_logic_1 = ap_sig_cseq_ST_pp0_stg0_fsm_1) and (exitcond_flatten_fu_270_p2 = ap_const_lv1_0) and not((ap_const_lv1_0 = or_cond2_fu_386_p2)) and (selftest_read_read_fu_134_p2 = ap_const_lv1_0) and not((tmp_reg_503 = ap_const_lv1_0)) and (ap_const_logic_1 = ap_reg_ppiten_pp0_it0) and not((ap_sig_bdd_78 and (ap_const_logic_1 = ap_reg_ppiten_pp0_it0))))) then 
                B_temp_V_read_assign_fu_130 <= inStream_V_V_TDATA(7 downto 4);
            elsif ((((ap_const_logic_1 = ap_sig_cseq_ST_pp0_stg0_fsm_1) and (exitcond_flatten_fu_270_p2 = ap_const_lv1_0) and not((ap_const_lv1_0 = or_cond2_fu_386_p2)) and (selftest_read_read_fu_134_p2 = ap_const_lv1_0) and (tmp_reg_503 = ap_const_lv1_0) and (ap_const_logic_1 = ap_reg_ppiten_pp0_it0) and not((ap_sig_bdd_78 and (ap_const_logic_1 = ap_reg_ppiten_pp0_it0)))) or ((ap_const_logic_1 = ap_sig_cseq_ST_pp0_stg0_fsm_1) and (exitcond_flatten_fu_270_p2 = ap_const_lv1_0) and not((ap_const_lv1_0 = or_cond2_fu_386_p2)) and (ap_const_logic_1 = ap_reg_ppiten_pp0_it0) and not((ap_sig_bdd_78 and (ap_const_logic_1 = ap_reg_ppiten_pp0_it0))) and not((selftest_read_read_fu_134_p2 = ap_const_lv1_0)) and (tmp_2_i_fu_442_p4 = ap_const_lv21_3)) or ((ap_const_logic_1 = ap_sig_cseq_ST_pp0_stg0_fsm_1) and (exitcond_flatten_fu_270_p2 = ap_const_lv1_0) and not((ap_const_lv1_0 = or_cond2_fu_386_p2)) and (ap_const_logic_1 = ap_reg_ppiten_pp0_it0) and not((ap_sig_bdd_78 and (ap_const_logic_1 = ap_reg_ppiten_pp0_it0))) and not((selftest_read_read_fu_134_p2 = ap_const_lv1_0)) and (tmp_2_i_fu_442_p4 = ap_const_lv21_0)))) then 
                B_temp_V_read_assign_fu_130 <= ap_const_lv4_0;
            end if; 
        end if;
    end process;

    -- G_temp_V_read_assign_fu_126 assign process. --
    G_temp_V_read_assign_fu_126_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_sig_cseq_ST_pp0_stg0_fsm_1) and (exitcond_flatten_fu_270_p2 = ap_const_lv1_0) and not((ap_const_lv1_0 = or_cond2_fu_386_p2)) and (selftest_read_read_fu_134_p2 = ap_const_lv1_0) and not((tmp_reg_503 = ap_const_lv1_0)) and (ap_const_logic_1 = ap_reg_ppiten_pp0_it0) and not((ap_sig_bdd_78 and (ap_const_logic_1 = ap_reg_ppiten_pp0_it0))))) then 
                G_temp_V_read_assign_fu_126 <= inStream_V_V_TDATA(7 downto 4);
            elsif ((((ap_const_logic_1 = ap_sig_cseq_ST_pp0_stg0_fsm_1) and (exitcond_flatten_fu_270_p2 = ap_const_lv1_0) and not((ap_const_lv1_0 = or_cond2_fu_386_p2)) and (selftest_read_read_fu_134_p2 = ap_const_lv1_0) and (tmp_reg_503 = ap_const_lv1_0) and (ap_const_logic_1 = ap_reg_ppiten_pp0_it0) and not((ap_sig_bdd_78 and (ap_const_logic_1 = ap_reg_ppiten_pp0_it0)))) or ((ap_const_logic_1 = ap_sig_cseq_ST_pp0_stg0_fsm_1) and (exitcond_flatten_fu_270_p2 = ap_const_lv1_0) and not((ap_const_lv1_0 = or_cond2_fu_386_p2)) and (ap_const_logic_1 = ap_reg_ppiten_pp0_it0) and not((ap_sig_bdd_78 and (ap_const_logic_1 = ap_reg_ppiten_pp0_it0))) and not((selftest_read_read_fu_134_p2 = ap_const_lv1_0)) and (tmp_2_i_fu_442_p4 = ap_const_lv21_3)) or ((ap_const_logic_1 = ap_sig_cseq_ST_pp0_stg0_fsm_1) and (exitcond_flatten_fu_270_p2 = ap_const_lv1_0) and not((ap_const_lv1_0 = or_cond2_fu_386_p2)) and (ap_const_logic_1 = ap_reg_ppiten_pp0_it0) and not((ap_sig_bdd_78 and (ap_const_logic_1 = ap_reg_ppiten_pp0_it0))) and not((selftest_read_read_fu_134_p2 = ap_const_lv1_0)) and (tmp_2_i_fu_442_p4 = ap_const_lv21_2)) or ((ap_const_logic_1 = ap_sig_cseq_ST_pp0_stg0_fsm_1) and (exitcond_flatten_fu_270_p2 = ap_const_lv1_0) and not((ap_const_lv1_0 = or_cond2_fu_386_p2)) and (ap_const_logic_1 = ap_reg_ppiten_pp0_it0) and not((ap_sig_bdd_78 and (ap_const_logic_1 = ap_reg_ppiten_pp0_it0))) and not((selftest_read_read_fu_134_p2 = ap_const_lv1_0)) and (tmp_2_i_fu_442_p4 = ap_const_lv21_1)) or ((ap_const_logic_1 = ap_sig_cseq_ST_pp0_stg0_fsm_1) and (exitcond_flatten_fu_270_p2 = ap_const_lv1_0) and not((ap_const_lv1_0 = or_cond2_fu_386_p2)) and (ap_const_logic_1 = ap_reg_ppiten_pp0_it0) and not((ap_sig_bdd_78 and (ap_const_logic_1 = ap_reg_ppiten_pp0_it0))) and not((selftest_read_read_fu_134_p2 = ap_const_lv1_0)) and (tmp_2_i_fu_442_p4 = ap_const_lv21_0)))) then 
                G_temp_V_read_assign_fu_126 <= ap_const_lv4_0;
            end if; 
        end if;
    end process;

    -- R_temp_V_read_assign_fu_122 assign process. --
    R_temp_V_read_assign_fu_122_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((((ap_const_logic_1 = ap_sig_cseq_ST_pp0_stg0_fsm_1) and (exitcond_flatten_fu_270_p2 = ap_const_lv1_0) and not((ap_const_lv1_0 = or_cond2_fu_386_p2)) and (ap_const_logic_1 = ap_reg_ppiten_pp0_it0) and not((ap_sig_bdd_78 and (ap_const_logic_1 = ap_reg_ppiten_pp0_it0))) and not((selftest_read_read_fu_134_p2 = ap_const_lv1_0)) and (tmp_2_i_fu_442_p4 = ap_const_lv21_2)) or ((ap_const_logic_1 = ap_sig_cseq_ST_pp0_stg0_fsm_1) and (exitcond_flatten_fu_270_p2 = ap_const_lv1_0) and not((ap_const_lv1_0 = or_cond2_fu_386_p2)) and (ap_const_logic_1 = ap_reg_ppiten_pp0_it0) and not((ap_sig_bdd_78 and (ap_const_logic_1 = ap_reg_ppiten_pp0_it0))) and not((selftest_read_read_fu_134_p2 = ap_const_lv1_0)) and (tmp_2_i_fu_442_p4 = ap_const_lv21_1)))) then 
                R_temp_V_read_assign_fu_122 <= ap_const_lv4_0;
            elsif ((((ap_const_logic_1 = ap_sig_cseq_ST_pp0_stg0_fsm_1) and (exitcond_flatten_fu_270_p2 = ap_const_lv1_0) and not((ap_const_lv1_0 = or_cond2_fu_386_p2)) and (ap_const_logic_1 = ap_reg_ppiten_pp0_it0) and not((ap_sig_bdd_78 and (ap_const_logic_1 = ap_reg_ppiten_pp0_it0))) and not((selftest_read_read_fu_134_p2 = ap_const_lv1_0)) and (tmp_2_i_fu_442_p4 = ap_const_lv21_3)) or ((ap_const_logic_1 = ap_sig_cseq_ST_pp0_stg0_fsm_1) and (exitcond_flatten_fu_270_p2 = ap_const_lv1_0) and not((ap_const_lv1_0 = or_cond2_fu_386_p2)) and (ap_const_logic_1 = ap_reg_ppiten_pp0_it0) and not((ap_sig_bdd_78 and (ap_const_logic_1 = ap_reg_ppiten_pp0_it0))) and not((selftest_read_read_fu_134_p2 = ap_const_lv1_0)) and (tmp_2_i_fu_442_p4 = ap_const_lv21_0)))) then 
                R_temp_V_read_assign_fu_122 <= op2_V_read_assign_reg_498;
            elsif (((ap_const_logic_1 = ap_sig_cseq_ST_pp0_stg0_fsm_1) and (exitcond_flatten_fu_270_p2 = ap_const_lv1_0) and not((ap_const_lv1_0 = or_cond2_fu_386_p2)) and (selftest_read_read_fu_134_p2 = ap_const_lv1_0) and not((tmp_reg_503 = ap_const_lv1_0)) and (ap_const_logic_1 = ap_reg_ppiten_pp0_it0) and not((ap_sig_bdd_78 and (ap_const_logic_1 = ap_reg_ppiten_pp0_it0))))) then 
                R_temp_V_read_assign_fu_122 <= inStream_V_V_TDATA(7 downto 4);
            elsif (((ap_const_logic_1 = ap_sig_cseq_ST_pp0_stg0_fsm_1) and (exitcond_flatten_fu_270_p2 = ap_const_lv1_0) and not((ap_const_lv1_0 = or_cond2_fu_386_p2)) and (selftest_read_read_fu_134_p2 = ap_const_lv1_0) and (tmp_reg_503 = ap_const_lv1_0) and (ap_const_logic_1 = ap_reg_ppiten_pp0_it0) and not((ap_sig_bdd_78 and (ap_const_logic_1 = ap_reg_ppiten_pp0_it0))))) then 
                R_temp_V_read_assign_fu_122 <= ap_const_lv4_F;
            end if; 
        end if;
    end process;

    -- indvar_flatten_reg_192 assign process. --
    indvar_flatten_reg_192_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_sig_cseq_ST_pp0_stg0_fsm_1) and (exitcond_flatten_fu_270_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_reg_ppiten_pp0_it0) and not((ap_sig_bdd_78 and (ap_const_logic_1 = ap_reg_ppiten_pp0_it0))))) then 
                indvar_flatten_reg_192 <= indvar_flatten_next_fu_276_p2;
            elsif (((ap_const_logic_1 = ap_sig_cseq_ST_st1_fsm_0) and not((ap_start = ap_const_logic_0)))) then 
                indvar_flatten_reg_192 <= ap_const_lv19_0;
            end if; 
        end if;
    end process;

    -- x_reg_214 assign process. --
    x_reg_214_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_sig_cseq_ST_pp0_stg0_fsm_1) and (exitcond_flatten_fu_270_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_reg_ppiten_pp0_it0) and not((ap_sig_bdd_78 and (ap_const_logic_1 = ap_reg_ppiten_pp0_it0))))) then 
                x_reg_214 <= x_1_fu_452_p2;
            elsif (((ap_const_logic_1 = ap_sig_cseq_ST_st1_fsm_0) and not((ap_start = ap_const_logic_0)))) then 
                x_reg_214 <= ap_const_lv10_0;
            end if; 
        end if;
    end process;

    -- y_reg_203 assign process. --
    y_reg_203_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_sig_cseq_ST_pp0_stg0_fsm_1) and (ap_const_logic_1 = ap_reg_ppiten_pp0_it1) and not((ap_sig_bdd_78 and (ap_const_logic_1 = ap_reg_ppiten_pp0_it0))) and (exitcond_flatten_reg_512 = ap_const_lv1_0))) then 
                y_reg_203 <= y_mid2_reg_521;
            elsif (((ap_const_logic_1 = ap_sig_cseq_ST_st1_fsm_0) and not((ap_start = ap_const_logic_0)))) then 
                y_reg_203 <= ap_const_lv10_0;
            end if; 
        end if;
    end process;

    -- assign process. --
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_sig_cseq_ST_pp0_stg0_fsm_1) and not((ap_sig_bdd_78 and (ap_const_logic_1 = ap_reg_ppiten_pp0_it0))))) then
                exitcond_flatten_reg_512 <= exitcond_flatten_fu_270_p2;
            end if;
        end if;
    end process;

    -- assign process. --
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_sig_cseq_ST_st1_fsm_0) and not((ap_start = ap_const_logic_0)))) then
                op2_V_read_assign_reg_498 <= op2_V_read_assign_fu_252_p2;
                tmp_6_i_reg_507 <= tmp_6_i_fu_264_p2;
                tmp_reg_503 <= tmp_nbreadreq_fu_140_p3;
            end if;
        end if;
    end process;

    -- assign process. --
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_sig_cseq_ST_pp0_stg0_fsm_1) and (exitcond_flatten_fu_270_p2 = ap_const_lv1_0) and not((ap_sig_bdd_78 and (ap_const_logic_1 = ap_reg_ppiten_pp0_it0))))) then
                or_cond2_reg_526 <= or_cond2_fu_386_p2;
            end if;
        end if;
    end process;

    -- assign process. --
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_sig_cseq_ST_pp0_stg0_fsm_1) and (exitcond_flatten_fu_270_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_reg_ppiten_pp0_it0) and not((ap_sig_bdd_78 and (ap_const_logic_1 = ap_reg_ppiten_pp0_it0))))) then
                y_mid2_reg_521 <= y_mid2_fu_302_p3;
            end if;
        end if;
    end process;

    -- the next state (ap_NS_fsm) of the state machine. --
    ap_NS_fsm_assign_proc : process (ap_start, ap_CS_fsm, exitcond_flatten_fu_270_p2, ap_sig_bdd_78, ap_reg_ppiten_pp0_it0)
    begin
        case ap_CS_fsm is
            when ap_ST_st1_fsm_0 => 
                if (not((ap_start = ap_const_logic_0))) then
                    ap_NS_fsm <= ap_ST_pp0_stg0_fsm_1;
                else
                    ap_NS_fsm <= ap_ST_st1_fsm_0;
                end if;
            when ap_ST_pp0_stg0_fsm_1 => 
                if (not(((ap_const_logic_1 = ap_reg_ppiten_pp0_it0) and not((ap_sig_bdd_78 and (ap_const_logic_1 = ap_reg_ppiten_pp0_it0))) and not((exitcond_flatten_fu_270_p2 = ap_const_lv1_0))))) then
                    ap_NS_fsm <= ap_ST_pp0_stg0_fsm_1;
                elsif (((ap_const_logic_1 = ap_reg_ppiten_pp0_it0) and not((ap_sig_bdd_78 and (ap_const_logic_1 = ap_reg_ppiten_pp0_it0))) and not((exitcond_flatten_fu_270_p2 = ap_const_lv1_0)))) then
                    ap_NS_fsm <= ap_ST_st4_fsm_2;
                else
                    ap_NS_fsm <= ap_ST_pp0_stg0_fsm_1;
                end if;
            when ap_ST_st4_fsm_2 => 
                ap_NS_fsm <= ap_ST_st1_fsm_0;
            when others =>  
                ap_NS_fsm <= "XXX";
        end case;
    end process;

    -- B_V assign process. --
    B_V_assign_proc : process(or_cond2_reg_526, B_temp_V_read_assign_fu_130, B_V_preg, ap_sig_bdd_106)
    begin
        if (ap_sig_bdd_106) then
            if (not((ap_const_lv1_0 = or_cond2_reg_526))) then 
                B_V <= B_temp_V_read_assign_fu_130;
            elsif ((ap_const_lv1_0 = or_cond2_reg_526)) then 
                B_V <= ap_const_lv4_0;
            else 
                B_V <= B_V_preg;
            end if;
        else 
            B_V <= B_V_preg;
        end if; 
    end process;


    -- G_V assign process. --
    G_V_assign_proc : process(or_cond2_reg_526, G_temp_V_read_assign_fu_126, G_V_preg, ap_sig_bdd_106)
    begin
        if (ap_sig_bdd_106) then
            if (not((ap_const_lv1_0 = or_cond2_reg_526))) then 
                G_V <= G_temp_V_read_assign_fu_126;
            elsif ((ap_const_lv1_0 = or_cond2_reg_526)) then 
                G_V <= ap_const_lv4_0;
            else 
                G_V <= G_V_preg;
            end if;
        else 
            G_V <= G_V_preg;
        end if; 
    end process;


    -- H_SYNC_V assign process. --
    H_SYNC_V_assign_proc : process(exitcond_flatten_fu_270_p2, ap_sig_cseq_ST_pp0_stg0_fsm_1, or_cond2_fu_386_p2, ap_sig_bdd_78, ap_reg_ppiten_pp0_it0, not_1_fu_361_p2, H_SYNC_V_preg)
    begin
        if ((((ap_const_logic_1 = ap_sig_cseq_ST_pp0_stg0_fsm_1) and (exitcond_flatten_fu_270_p2 = ap_const_lv1_0) and (ap_const_lv1_0 = or_cond2_fu_386_p2) and (ap_const_logic_1 = ap_reg_ppiten_pp0_it0) and not((ap_sig_bdd_78 and (ap_const_logic_1 = ap_reg_ppiten_pp0_it0)))) or ((ap_const_logic_1 = ap_sig_cseq_ST_pp0_stg0_fsm_1) and (exitcond_flatten_fu_270_p2 = ap_const_lv1_0) and not((ap_const_lv1_0 = or_cond2_fu_386_p2)) and (ap_const_logic_1 = ap_reg_ppiten_pp0_it0) and not((ap_sig_bdd_78 and (ap_const_logic_1 = ap_reg_ppiten_pp0_it0)))))) then 
            H_SYNC_V <= not_1_fu_361_p2;
        else 
            H_SYNC_V <= H_SYNC_V_preg;
        end if; 
    end process;


    -- R_V assign process. --
    R_V_assign_proc : process(or_cond2_reg_526, R_temp_V_read_assign_fu_122, R_V_preg, ap_sig_bdd_106)
    begin
        if (ap_sig_bdd_106) then
            if (not((ap_const_lv1_0 = or_cond2_reg_526))) then 
                R_V <= R_temp_V_read_assign_fu_122;
            elsif ((ap_const_lv1_0 = or_cond2_reg_526)) then 
                R_V <= ap_const_lv4_0;
            else 
                R_V <= R_V_preg;
            end if;
        else 
            R_V <= R_V_preg;
        end if; 
    end process;


    -- V_SYNC_V assign process. --
    V_SYNC_V_assign_proc : process(exitcond_flatten_fu_270_p2, ap_sig_cseq_ST_pp0_stg0_fsm_1, or_cond2_fu_386_p2, ap_sig_bdd_78, ap_reg_ppiten_pp0_it0, icmp_fu_326_p2, V_SYNC_V_preg)
    begin
        if ((((ap_const_logic_1 = ap_sig_cseq_ST_pp0_stg0_fsm_1) and (exitcond_flatten_fu_270_p2 = ap_const_lv1_0) and (ap_const_lv1_0 = or_cond2_fu_386_p2) and (ap_const_logic_1 = ap_reg_ppiten_pp0_it0) and not((ap_sig_bdd_78 and (ap_const_logic_1 = ap_reg_ppiten_pp0_it0)))) or ((ap_const_logic_1 = ap_sig_cseq_ST_pp0_stg0_fsm_1) and (exitcond_flatten_fu_270_p2 = ap_const_lv1_0) and not((ap_const_lv1_0 = or_cond2_fu_386_p2)) and (ap_const_logic_1 = ap_reg_ppiten_pp0_it0) and not((ap_sig_bdd_78 and (ap_const_logic_1 = ap_reg_ppiten_pp0_it0)))))) then 
            V_SYNC_V <= icmp_fu_326_p2;
        else 
            V_SYNC_V <= V_SYNC_V_preg;
        end if; 
    end process;


    -- ap_done assign process. --
    ap_done_assign_proc : process(ap_sig_cseq_ST_st4_fsm_2)
    begin
        if ((ap_const_logic_1 = ap_sig_cseq_ST_st4_fsm_2)) then 
            ap_done <= ap_const_logic_1;
        else 
            ap_done <= ap_const_logic_0;
        end if; 
    end process;


    -- ap_idle assign process. --
    ap_idle_assign_proc : process(ap_start, ap_sig_cseq_ST_st1_fsm_0)
    begin
        if ((not((ap_const_logic_1 = ap_start)) and (ap_const_logic_1 = ap_sig_cseq_ST_st1_fsm_0))) then 
            ap_idle <= ap_const_logic_1;
        else 
            ap_idle <= ap_const_logic_0;
        end if; 
    end process;


    -- ap_ready assign process. --
    ap_ready_assign_proc : process(ap_sig_cseq_ST_st4_fsm_2)
    begin
        if ((ap_const_logic_1 = ap_sig_cseq_ST_st4_fsm_2)) then 
            ap_ready <= ap_const_logic_1;
        else 
            ap_ready <= ap_const_logic_0;
        end if; 
    end process;


    -- ap_rst_n_inv assign process. --
    ap_rst_n_inv_assign_proc : process(ap_rst_n)
    begin
                ap_rst_n_inv <= not(ap_rst_n);
    end process;


    -- ap_sig_bdd_106 assign process. --
    ap_sig_bdd_106_assign_proc : process(ap_sig_cseq_ST_pp0_stg0_fsm_1, ap_sig_bdd_78, ap_reg_ppiten_pp0_it0, ap_reg_ppiten_pp0_it1)
    begin
                ap_sig_bdd_106 <= ((ap_const_logic_1 = ap_sig_cseq_ST_pp0_stg0_fsm_1) and (ap_const_logic_1 = ap_reg_ppiten_pp0_it1) and not((ap_sig_bdd_78 and (ap_const_logic_1 = ap_reg_ppiten_pp0_it0))));
    end process;


    -- ap_sig_bdd_21 assign process. --
    ap_sig_bdd_21_assign_proc : process(ap_CS_fsm)
    begin
                ap_sig_bdd_21 <= (ap_CS_fsm(0 downto 0) = ap_const_lv1_1);
    end process;


    -- ap_sig_bdd_296 assign process. --
    ap_sig_bdd_296_assign_proc : process(ap_CS_fsm)
    begin
                ap_sig_bdd_296 <= (ap_const_lv1_1 = ap_CS_fsm(2 downto 2));
    end process;


    -- ap_sig_bdd_63 assign process. --
    ap_sig_bdd_63_assign_proc : process(ap_CS_fsm)
    begin
                ap_sig_bdd_63 <= (ap_const_lv1_1 = ap_CS_fsm(1 downto 1));
    end process;


    -- ap_sig_bdd_78 assign process. --
    ap_sig_bdd_78_assign_proc : process(inStream_V_V_TVALID, selftest_read_read_fu_134_p2, tmp_reg_503, exitcond_flatten_fu_270_p2, or_cond2_fu_386_p2)
    begin
                ap_sig_bdd_78 <= ((inStream_V_V_TVALID = ap_const_logic_0) and (exitcond_flatten_fu_270_p2 = ap_const_lv1_0) and not((ap_const_lv1_0 = or_cond2_fu_386_p2)) and (selftest_read_read_fu_134_p2 = ap_const_lv1_0) and not((tmp_reg_503 = ap_const_lv1_0)));
    end process;


    -- ap_sig_cseq_ST_pp0_stg0_fsm_1 assign process. --
    ap_sig_cseq_ST_pp0_stg0_fsm_1_assign_proc : process(ap_sig_bdd_63)
    begin
        if (ap_sig_bdd_63) then 
            ap_sig_cseq_ST_pp0_stg0_fsm_1 <= ap_const_logic_1;
        else 
            ap_sig_cseq_ST_pp0_stg0_fsm_1 <= ap_const_logic_0;
        end if; 
    end process;


    -- ap_sig_cseq_ST_st1_fsm_0 assign process. --
    ap_sig_cseq_ST_st1_fsm_0_assign_proc : process(ap_sig_bdd_21)
    begin
        if (ap_sig_bdd_21) then 
            ap_sig_cseq_ST_st1_fsm_0 <= ap_const_logic_1;
        else 
            ap_sig_cseq_ST_st1_fsm_0 <= ap_const_logic_0;
        end if; 
    end process;


    -- ap_sig_cseq_ST_st4_fsm_2 assign process. --
    ap_sig_cseq_ST_st4_fsm_2_assign_proc : process(ap_sig_bdd_296)
    begin
        if (ap_sig_bdd_296) then 
            ap_sig_cseq_ST_st4_fsm_2 <= ap_const_logic_1;
        else 
            ap_sig_cseq_ST_st4_fsm_2 <= ap_const_logic_0;
        end if; 
    end process;

    exitcond4_fu_282_p2 <= "1" when (x_reg_214 = ap_const_lv10_320) else "0";
    exitcond_flatten_fu_270_p2 <= "1" when (indvar_flatten_reg_192 = ap_const_lv19_668A0) else "0";
    icmp_fu_326_p2 <= "0" when (tmp_3_fu_316_p4 = ap_const_lv9_0) else "1";

    -- inStream_V_V_TREADY assign process. --
    inStream_V_V_TREADY_assign_proc : process(selftest_read_read_fu_134_p2, tmp_reg_503, exitcond_flatten_fu_270_p2, ap_sig_cseq_ST_pp0_stg0_fsm_1, or_cond2_fu_386_p2, ap_sig_bdd_78, ap_reg_ppiten_pp0_it0)
    begin
        if (((ap_const_logic_1 = ap_sig_cseq_ST_pp0_stg0_fsm_1) and (exitcond_flatten_fu_270_p2 = ap_const_lv1_0) and not((ap_const_lv1_0 = or_cond2_fu_386_p2)) and (selftest_read_read_fu_134_p2 = ap_const_lv1_0) and not((tmp_reg_503 = ap_const_lv1_0)) and (ap_const_logic_1 = ap_reg_ppiten_pp0_it0) and not((ap_sig_bdd_78 and (ap_const_logic_1 = ap_reg_ppiten_pp0_it0))))) then 
            inStream_V_V_TREADY <= ap_const_logic_1;
        else 
            inStream_V_V_TREADY <= ap_const_logic_0;
        end if; 
    end process;

    indvar_flatten_next_fu_276_p2 <= std_logic_vector(unsigned(indvar_flatten_reg_192) + unsigned(ap_const_lv19_1));
    not_1_fu_361_p2 <= "1" when (unsigned(x_mid2_fu_288_p3) > unsigned(ap_const_lv10_5F)) else "0";
    op2_V_read_assign_fu_252_p2 <= std_logic_vector(unsigned(color_blinking_V) + unsigned(ap_const_lv4_1));
    or_cond2_fu_386_p2 <= (tmp2_fu_345_p2 and tmp1_fu_380_p2);
    p_Val2_1_fu_310_p2 <= std_logic_vector(unsigned(y_mid2_fu_302_p3) + unsigned(ap_const_lv10_3DD));
    p_Val2_s_fu_355_p2 <= std_logic_vector(unsigned(tmp_3_cast_fu_351_p1) + unsigned(ap_const_lv11_770));
    selftest_read_read_fu_134_p2 <= (0=>selftest, others=>'-');
    tmp1_fu_380_p2 <= (tmp_4_fu_368_p2 and tmp_5_fu_374_p2);
    tmp2_fu_345_p2 <= (tmp_1_fu_333_p2 and tmp_2_fu_339_p2);
    tmp_1_fu_333_p2 <= "1" when (unsigned(y_mid2_fu_302_p3) > unsigned(ap_const_lv10_22)) else "0";
    tmp_1_i_fu_438_p1 <= std_logic_vector(resize(unsigned(tmp_7_fu_430_p3),19));
    tmp_2_fu_339_p2 <= "1" when (unsigned(y_mid2_fu_302_p3) < unsigned(ap_const_lv10_203)) else "0";
    tmp_2_i_fu_442_p4 <= ((ap_const_lv1_0 & tmp_1_i_fu_438_p1) & tmp_6_fu_422_p3);
    tmp_3_cast_fu_351_p1 <= std_logic_vector(resize(unsigned(x_mid2_fu_288_p3),11));
    tmp_3_fu_316_p4 <= y_mid2_fu_302_p3(9 downto 1);
    tmp_4_fu_368_p2 <= "1" when (unsigned(x_mid2_fu_288_p3) > unsigned(ap_const_lv10_8F)) else "0";
    tmp_5_fu_374_p2 <= "1" when (unsigned(x_mid2_fu_288_p3) < unsigned(ap_const_lv10_310)) else "0";
    tmp_6_fu_422_p3 <= p_Val2_1_fu_310_p2(5 downto 5);
    tmp_6_i_fu_264_p2 <= std_logic_vector(signed(ap_const_lv4_E) - signed(color_blinking_V));
    tmp_7_fu_430_p3 <= p_Val2_s_fu_355_p2(5 downto 5);
    tmp_nbreadreq_fu_140_p3 <= (0=>inStream_V_V_TVALID, others=>'-');
    x_1_fu_452_p2 <= std_logic_vector(unsigned(x_mid2_fu_288_p3) + unsigned(ap_const_lv10_1));
    x_mid2_fu_288_p3 <= 
        ap_const_lv10_0 when (exitcond4_fu_282_p2(0) = '1') else 
        x_reg_214;
    y_mid2_fu_302_p3 <= 
        y_s_fu_296_p2 when (exitcond4_fu_282_p2(0) = '1') else 
        y_phi_fu_207_p4;

    -- y_phi_fu_207_p4 assign process. --
    y_phi_fu_207_p4_assign_proc : process(y_reg_203, exitcond_flatten_reg_512, ap_sig_cseq_ST_pp0_stg0_fsm_1, ap_reg_ppiten_pp0_it1, y_mid2_reg_521)
    begin
        if (((ap_const_logic_1 = ap_sig_cseq_ST_pp0_stg0_fsm_1) and (ap_const_logic_1 = ap_reg_ppiten_pp0_it1) and (exitcond_flatten_reg_512 = ap_const_lv1_0))) then 
            y_phi_fu_207_p4 <= y_mid2_reg_521;
        else 
            y_phi_fu_207_p4 <= y_reg_203;
        end if; 
    end process;

    y_s_fu_296_p2 <= std_logic_vector(unsigned(y_phi_fu_207_p4) + unsigned(ap_const_lv10_1));
end behav;
