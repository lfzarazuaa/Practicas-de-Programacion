--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor: Xilinx
-- \   \   \/     Version: P.20131013
--  \   \         Application: netgen
--  /   /         Filename: plotdot_top_synthesis.vhd
-- /___/   /\     Timestamp: Fri Apr 28 10:16:04 2017
-- \   \  /  \ 
--  \___\/\___\
--             
-- Command	: -intstyle ise -ar Structure -tm plotdot_top -w -dir netgen/synthesis -ofmt vhdl -sim plotdot_top.ngc plotdot_top_synthesis.vhd 
-- Device	: xc3s500e-4-fg320
-- Input file	: plotdot_top.ngc
-- Output file	: \\VBOXSVR\vhdl\practica_video_imagen\Escribir_Pixel\vgaplot\netgen\synthesis\plotdot_top_synthesis.vhd
-- # of Entities	: 1
-- Design Name	: plotdot_top
-- Xilinx	: C:\Xilinx\14.7\ISE_DS\ISE\
--             
-- Purpose:    
--     This VHDL netlist is a verification model and uses simulation 
--     primitives which may not represent the true implementation of the 
--     device, however the netlist is functionally correct and should not 
--     be modified. This file cannot be synthesized and should only be used 
--     with supported simulation tools.
--             
-- Reference:  
--     Command Line Tools User Guide, Chapter 23
--     Synthesis and Simulation Design Guide, Chapter 6
--             
--------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
use UNISIM.VPKG.ALL;

entity plotdot_top is
  port (
    RamCLK : out STD_LOGIC; 
    WE_L : out STD_LOGIC; 
    vsync : out STD_LOGIC; 
    CE_L : out STD_LOGIC; 
    RamCRE : out STD_LOGIC; 
    FlashCE_L : out STD_LOGIC; 
    UB_L : out STD_LOGIC; 
    RamADV_L : out STD_LOGIC; 
    LB_L : out STD_LOGIC; 
    hsync : out STD_LOGIC; 
    mclk : in STD_LOGIC := 'X'; 
    OE_L : out STD_LOGIC; 
    DQ : inout STD_LOGIC_VECTOR ( 15 downto 0 ); 
    blue : out STD_LOGIC_VECTOR ( 1 downto 0 ); 
    green : out STD_LOGIC_VECTOR ( 2 downto 0 ); 
    A : out STD_LOGIC_VECTOR ( 22 downto 0 ); 
    red : out STD_LOGIC_VECTOR ( 2 downto 0 ); 
    btn : in STD_LOGIC_VECTOR ( 3 downto 0 ); 
    sw : in STD_LOGIC_VECTOR ( 7 downto 0 ) 
  );
end plotdot_top;

architecture Structure of plotdot_top is
  signal A_0_OBUF_23 : STD_LOGIC; 
  signal A_10_OBUF_24 : STD_LOGIC; 
  signal A_11_OBUF_25 : STD_LOGIC; 
  signal A_12_OBUF_26 : STD_LOGIC; 
  signal A_13_OBUF_27 : STD_LOGIC; 
  signal A_14_OBUF_28 : STD_LOGIC; 
  signal A_15_OBUF_29 : STD_LOGIC; 
  signal A_16_OBUF_30 : STD_LOGIC; 
  signal A_17_OBUF_31 : STD_LOGIC; 
  signal A_18_OBUF_32 : STD_LOGIC; 
  signal A_19_OBUF_33 : STD_LOGIC; 
  signal A_1_OBUF_34 : STD_LOGIC; 
  signal A_22_OBUF_35 : STD_LOGIC; 
  signal A_2_OBUF_36 : STD_LOGIC; 
  signal A_3_OBUF_37 : STD_LOGIC; 
  signal A_4_OBUF_38 : STD_LOGIC; 
  signal A_5_OBUF_39 : STD_LOGIC; 
  signal A_6_OBUF_40 : STD_LOGIC; 
  signal A_7_OBUF_41 : STD_LOGIC; 
  signal A_8_OBUF_42 : STD_LOGIC; 
  signal A_9_OBUF_43 : STD_LOGIC; 
  signal Din1_0_Q : STD_LOGIC; 
  signal Din1_10_Q : STD_LOGIC; 
  signal Din1_11_Q : STD_LOGIC; 
  signal Din1_12_Q : STD_LOGIC; 
  signal Din1_13_Q : STD_LOGIC; 
  signal Din1_14_Q : STD_LOGIC; 
  signal Din1_15_Q : STD_LOGIC; 
  signal Din1_8_Q : STD_LOGIC; 
  signal Din1_9_Q : STD_LOGIC; 
  signal FlashCE_L_OBUF_71 : STD_LOGIC; 
  signal N27 : STD_LOGIC; 
  signal N33 : STD_LOGIC; 
  signal N34 : STD_LOGIC; 
  signal N35 : STD_LOGIC; 
  signal N36 : STD_LOGIC; 
  signal N37 : STD_LOGIC; 
  signal N38 : STD_LOGIC; 
  signal N39 : STD_LOGIC; 
  signal N40 : STD_LOGIC; 
  signal N41 : STD_LOGIC; 
  signal N42 : STD_LOGIC; 
  signal N43 : STD_LOGIC; 
  signal N44 : STD_LOGIC; 
  signal N45 : STD_LOGIC; 
  signal N46 : STD_LOGIC; 
  signal N47 : STD_LOGIC; 
  signal N48 : STD_LOGIC; 
  signal N65 : STD_LOGIC; 
  signal N67 : STD_LOGIC; 
  signal N69 : STD_LOGIC; 
  signal N71 : STD_LOGIC; 
  signal N72 : STD_LOGIC; 
  signal N73 : STD_LOGIC; 
  signal N74 : STD_LOGIC; 
  signal N75 : STD_LOGIC; 
  signal N76 : STD_LOGIC; 
  signal N77 : STD_LOGIC; 
  signal N78 : STD_LOGIC; 
  signal OE_L_OBUF_102 : STD_LOGIC; 
  signal WE_L_OBUF_126 : STD_LOGIC; 
  signal blue_0_OBUF_129 : STD_LOGIC; 
  signal blue_1_OBUF_130 : STD_LOGIC; 
  signal btn_0_IBUF_134 : STD_LOGIC; 
  signal btn_2_IBUF_135 : STD_LOGIC; 
  signal btn_3_IBUF_136 : STD_LOGIC; 
  signal btnd_0_Q : STD_LOGIC; 
  signal btnd_2_Q : STD_LOGIC; 
  signal green_0_OBUF_142 : STD_LOGIC; 
  signal green_1_OBUF_143 : STD_LOGIC; 
  signal green_2_OBUF_144 : STD_LOGIC; 
  signal hsync_OBUF_146 : STD_LOGIC; 
  signal mclk_IBUF_148 : STD_LOGIC; 
  signal mclk_IBUF1 : STD_LOGIC; 
  signal red_0_OBUF_153 : STD_LOGIC; 
  signal red_1_OBUF_154 : STD_LOGIC; 
  signal red_2_OBUF_155 : STD_LOGIC; 
  signal sw_0_IBUF_164 : STD_LOGIC; 
  signal sw_1_IBUF_165 : STD_LOGIC; 
  signal sw_2_IBUF_166 : STD_LOGIC; 
  signal sw_3_IBUF_167 : STD_LOGIC; 
  signal sw_4_IBUF_168 : STD_LOGIC; 
  signal sw_5_IBUF_169 : STD_LOGIC; 
  signal sw_6_IBUF_170 : STD_LOGIC; 
  signal sw_7_IBUF_171 : STD_LOGIC; 
  signal u1_Mcount_q_cy_10_rt_174 : STD_LOGIC; 
  signal u1_Mcount_q_cy_11_rt_176 : STD_LOGIC; 
  signal u1_Mcount_q_cy_12_rt_178 : STD_LOGIC; 
  signal u1_Mcount_q_cy_13_rt_180 : STD_LOGIC; 
  signal u1_Mcount_q_cy_14_rt_182 : STD_LOGIC; 
  signal u1_Mcount_q_cy_15_rt_184 : STD_LOGIC; 
  signal u1_Mcount_q_cy_16_rt_186 : STD_LOGIC; 
  signal u1_Mcount_q_cy_1_rt_188 : STD_LOGIC; 
  signal u1_Mcount_q_cy_2_rt_190 : STD_LOGIC; 
  signal u1_Mcount_q_cy_3_rt_192 : STD_LOGIC; 
  signal u1_Mcount_q_cy_4_rt_194 : STD_LOGIC; 
  signal u1_Mcount_q_cy_5_rt_196 : STD_LOGIC; 
  signal u1_Mcount_q_cy_6_rt_198 : STD_LOGIC; 
  signal u1_Mcount_q_cy_7_rt_200 : STD_LOGIC; 
  signal u1_Mcount_q_cy_8_rt_202 : STD_LOGIC; 
  signal u1_Mcount_q_cy_9_rt_204 : STD_LOGIC; 
  signal u1_Mcount_q_xor_17_rt_206 : STD_LOGIC; 
  signal u1_q_01 : STD_LOGIC; 
  signal u1_q_18 : STD_LOGIC; 
  signal u11_y : STD_LOGIC; 
  signal u2_Mcount_hcs_cy_1_rt_230 : STD_LOGIC; 
  signal u2_Mcount_hcs_cy_2_rt_232 : STD_LOGIC; 
  signal u2_Mcount_hcs_cy_3_rt_234 : STD_LOGIC; 
  signal u2_Mcount_hcs_cy_4_rt_236 : STD_LOGIC; 
  signal u2_Mcount_hcs_cy_5_rt_238 : STD_LOGIC; 
  signal u2_Mcount_hcs_cy_6_rt_240 : STD_LOGIC; 
  signal u2_Mcount_hcs_cy_7_rt_242 : STD_LOGIC; 
  signal u2_Mcount_hcs_cy_8_rt_244 : STD_LOGIC; 
  signal u2_Mcount_hcs_eqn_0 : STD_LOGIC; 
  signal u2_Mcount_hcs_eqn_1 : STD_LOGIC; 
  signal u2_Mcount_hcs_eqn_2 : STD_LOGIC; 
  signal u2_Mcount_hcs_eqn_3 : STD_LOGIC; 
  signal u2_Mcount_hcs_eqn_4 : STD_LOGIC; 
  signal u2_Mcount_hcs_eqn_5 : STD_LOGIC; 
  signal u2_Mcount_hcs_eqn_6 : STD_LOGIC; 
  signal u2_Mcount_hcs_eqn_7 : STD_LOGIC; 
  signal u2_Mcount_hcs_eqn_8 : STD_LOGIC; 
  signal u2_Mcount_hcs_eqn_9 : STD_LOGIC; 
  signal u2_Mcount_hcs_xor_9_rt_256 : STD_LOGIC; 
  signal u2_Mcount_vcs_cy_1_rt_259 : STD_LOGIC; 
  signal u2_Mcount_vcs_cy_2_rt_261 : STD_LOGIC; 
  signal u2_Mcount_vcs_cy_3_rt_263 : STD_LOGIC; 
  signal u2_Mcount_vcs_cy_4_rt_265 : STD_LOGIC; 
  signal u2_Mcount_vcs_cy_5_rt_267 : STD_LOGIC; 
  signal u2_Mcount_vcs_cy_6_rt_269 : STD_LOGIC; 
  signal u2_Mcount_vcs_cy_7_rt_271 : STD_LOGIC; 
  signal u2_Mcount_vcs_cy_8_rt_273 : STD_LOGIC; 
  signal u2_Mcount_vcs_eqn_0 : STD_LOGIC; 
  signal u2_Mcount_vcs_eqn_1 : STD_LOGIC; 
  signal u2_Mcount_vcs_eqn_2 : STD_LOGIC; 
  signal u2_Mcount_vcs_eqn_3 : STD_LOGIC; 
  signal u2_Mcount_vcs_eqn_4 : STD_LOGIC; 
  signal u2_Mcount_vcs_eqn_5 : STD_LOGIC; 
  signal u2_Mcount_vcs_eqn_6 : STD_LOGIC; 
  signal u2_Mcount_vcs_eqn_7 : STD_LOGIC; 
  signal u2_Mcount_vcs_eqn_8 : STD_LOGIC; 
  signal u2_Mcount_vcs_eqn_9 : STD_LOGIC; 
  signal u2_Mcount_vcs_xor_9_rt_285 : STD_LOGIC; 
  signal u2_N2 : STD_LOGIC; 
  signal u2_N3 : STD_LOGIC; 
  signal u2_Result_0_1 : STD_LOGIC; 
  signal u2_Result_1_1 : STD_LOGIC; 
  signal u2_Result_2_1 : STD_LOGIC; 
  signal u2_Result_3_1 : STD_LOGIC; 
  signal u2_Result_4_1 : STD_LOGIC; 
  signal u2_Result_5_1 : STD_LOGIC; 
  signal u2_Result_6_1 : STD_LOGIC; 
  signal u2_Result_7_1 : STD_LOGIC; 
  signal u2_Result_8_1 : STD_LOGIC; 
  signal u2_Result_9_1 : STD_LOGIC; 
  signal u2_clr_inv : STD_LOGIC; 
  signal u2_hcs_cmp_eq0000 : STD_LOGIC; 
  signal u2_hcs_cmp_eq000010_320 : STD_LOGIC; 
  signal u2_hcs_cmp_eq00002_321 : STD_LOGIC; 
  signal u2_vcs_cmp_eq0000_332 : STD_LOGIC; 
  signal u2_vidon_and00001_333 : STD_LOGIC; 
  signal u2_vidon_and0000110_334 : STD_LOGIC; 
  signal u2_vidon_and000014 : STD_LOGIC; 
  signal u2_vidon_and0000141_336 : STD_LOGIC; 
  signal u2_vidon_and000042 : STD_LOGIC; 
  signal u2_vidon_and0000421_338 : STD_LOGIC; 
  signal u2_vidon_and000073_339 : STD_LOGIC; 
  signal u2_vidon_and000094_340 : STD_LOGIC; 
  signal u2_vsenable_341 : STD_LOGIC; 
  signal u3_Mcount_addr_count_cy_10_rt_344 : STD_LOGIC; 
  signal u3_Mcount_addr_count_cy_11_rt_346 : STD_LOGIC; 
  signal u3_Mcount_addr_count_cy_12_rt_348 : STD_LOGIC; 
  signal u3_Mcount_addr_count_cy_13_rt_350 : STD_LOGIC; 
  signal u3_Mcount_addr_count_cy_14_rt_352 : STD_LOGIC; 
  signal u3_Mcount_addr_count_cy_15_rt_354 : STD_LOGIC; 
  signal u3_Mcount_addr_count_cy_16_rt_356 : STD_LOGIC; 
  signal u3_Mcount_addr_count_cy_17_rt_358 : STD_LOGIC; 
  signal u3_Mcount_addr_count_cy_18_rt_360 : STD_LOGIC; 
  signal u3_Mcount_addr_count_cy_1_rt_362 : STD_LOGIC; 
  signal u3_Mcount_addr_count_cy_2_rt_364 : STD_LOGIC; 
  signal u3_Mcount_addr_count_cy_3_rt_366 : STD_LOGIC; 
  signal u3_Mcount_addr_count_cy_4_rt_368 : STD_LOGIC; 
  signal u3_Mcount_addr_count_cy_5_rt_370 : STD_LOGIC; 
  signal u3_Mcount_addr_count_cy_6_rt_372 : STD_LOGIC; 
  signal u3_Mcount_addr_count_cy_7_rt_374 : STD_LOGIC; 
  signal u3_Mcount_addr_count_cy_8_rt_376 : STD_LOGIC; 
  signal u3_Mcount_addr_count_cy_9_rt_378 : STD_LOGIC; 
  signal u3_Mcount_addr_count_eqn_0 : STD_LOGIC; 
  signal u3_Mcount_addr_count_eqn_1 : STD_LOGIC; 
  signal u3_Mcount_addr_count_eqn_10 : STD_LOGIC; 
  signal u3_Mcount_addr_count_eqn_11 : STD_LOGIC; 
  signal u3_Mcount_addr_count_eqn_12 : STD_LOGIC; 
  signal u3_Mcount_addr_count_eqn_13 : STD_LOGIC; 
  signal u3_Mcount_addr_count_eqn_14 : STD_LOGIC; 
  signal u3_Mcount_addr_count_eqn_15 : STD_LOGIC; 
  signal u3_Mcount_addr_count_eqn_16 : STD_LOGIC; 
  signal u3_Mcount_addr_count_eqn_17 : STD_LOGIC; 
  signal u3_Mcount_addr_count_eqn_18 : STD_LOGIC; 
  signal u3_Mcount_addr_count_eqn_19 : STD_LOGIC; 
  signal u3_Mcount_addr_count_eqn_2 : STD_LOGIC; 
  signal u3_Mcount_addr_count_eqn_3 : STD_LOGIC; 
  signal u3_Mcount_addr_count_eqn_4 : STD_LOGIC; 
  signal u3_Mcount_addr_count_eqn_5 : STD_LOGIC; 
  signal u3_Mcount_addr_count_eqn_6 : STD_LOGIC; 
  signal u3_Mcount_addr_count_eqn_7 : STD_LOGIC; 
  signal u3_Mcount_addr_count_eqn_8 : STD_LOGIC; 
  signal u3_Mcount_addr_count_eqn_9 : STD_LOGIC; 
  signal u3_Mcount_addr_count_xor_19_rt_400 : STD_LOGIC; 
  signal u3_addr_count_cmp_eq0000 : STD_LOGIC; 
  signal u3_addr_count_not0001 : STD_LOGIC; 
  signal u4_en_inv : STD_LOGIC; 
  signal u5_Madd_addr_count_addsub0000_cy_10_rt_471 : STD_LOGIC; 
  signal u5_Madd_addr_count_addsub0000_cy_11_rt_473 : STD_LOGIC; 
  signal u5_Madd_addr_count_addsub0000_cy_12_rt_475 : STD_LOGIC; 
  signal u5_Madd_addr_count_addsub0000_cy_13_rt_477 : STD_LOGIC; 
  signal u5_Madd_addr_count_addsub0000_cy_14_rt_479 : STD_LOGIC; 
  signal u5_Madd_addr_count_addsub0000_cy_15_rt_481 : STD_LOGIC; 
  signal u5_Madd_addr_count_addsub0000_cy_16_rt_483 : STD_LOGIC; 
  signal u5_Madd_addr_count_addsub0000_cy_17_rt_485 : STD_LOGIC; 
  signal u5_Madd_addr_count_addsub0000_cy_18_rt_487 : STD_LOGIC; 
  signal u5_Madd_addr_count_addsub0000_cy_1_rt_489 : STD_LOGIC; 
  signal u5_Madd_addr_count_addsub0000_cy_2_rt_491 : STD_LOGIC; 
  signal u5_Madd_addr_count_addsub0000_cy_3_rt_493 : STD_LOGIC; 
  signal u5_Madd_addr_count_addsub0000_cy_4_rt_495 : STD_LOGIC; 
  signal u5_Madd_addr_count_addsub0000_cy_5_rt_497 : STD_LOGIC; 
  signal u5_Madd_addr_count_addsub0000_cy_6_rt_499 : STD_LOGIC; 
  signal u5_Madd_addr_count_addsub0000_cy_7_rt_501 : STD_LOGIC; 
  signal u5_Madd_addr_count_addsub0000_cy_8_rt_503 : STD_LOGIC; 
  signal u5_Madd_addr_count_addsub0000_cy_9_rt_505 : STD_LOGIC; 
  signal u5_Madd_addr_count_addsub0000_xor_19_rt_507 : STD_LOGIC; 
  signal u5_N11 : STD_LOGIC; 
  signal u5_N2 : STD_LOGIC; 
  signal u5_addr_count_mux0000_0_215_551 : STD_LOGIC; 
  signal u5_addr_count_mux0000_0_219_552 : STD_LOGIC; 
  signal u5_addr_count_mux0000_0_252_553 : STD_LOGIC; 
  signal u5_done_out_573 : STD_LOGIC; 
  signal u5_done_out_mux0002 : STD_LOGIC; 
  signal u5_state_FSM_FFd1_575 : STD_LOGIC; 
  signal u5_state_FSM_FFd1_In : STD_LOGIC; 
  signal u5_state_FSM_FFd1_In17_577 : STD_LOGIC; 
  signal u5_state_FSM_FFd2_578 : STD_LOGIC; 
  signal u5_state_FSM_FFd2_In : STD_LOGIC; 
  signal u6_delay1_0_Q : STD_LOGIC; 
  signal u6_delay1_2_Q : STD_LOGIC; 
  signal u6_delay2_0_Q : STD_LOGIC; 
  signal u6_delay2_2_Q : STD_LOGIC; 
  signal u6_delay3_0_Q : STD_LOGIC; 
  signal u6_delay3_2_Q : STD_LOGIC; 
  signal u7_y_11_Q : STD_LOGIC; 
  signal u7_y_12_Q : STD_LOGIC; 
  signal u7_y_13_Q : STD_LOGIC; 
  signal u7_y_14_Q : STD_LOGIC; 
  signal u7_y_15_Q : STD_LOGIC; 
  signal u7_y_16_Q : STD_LOGIC; 
  signal u7_y_17_Q : STD_LOGIC; 
  signal u7_y_4_Q : STD_LOGIC; 
  signal u7_y_5_Q : STD_LOGIC; 
  signal u7_y_6_Q : STD_LOGIC; 
  signal u7_y_7_Q : STD_LOGIC; 
  signal u7_y_8_Q : STD_LOGIC; 
  signal u7_y_9_Q : STD_LOGIC; 
  signal u8_Madd_ram_addrR : STD_LOGIC; 
  signal u8_Madd_ram_addrR1 : STD_LOGIC; 
  signal u8_Madd_ram_addr_Madd_cy_14_Q : STD_LOGIC; 
  signal u8_Madd_ram_addr_Madd_cy_5_Q : STD_LOGIC; 
  signal u8_Madd_ram_addr_Madd_lut_12_Q : STD_LOGIC; 
  signal u8_Madd_ram_addr_Madd_lut_5_Q : STD_LOGIC; 
  signal u8_mux0000 : STD_LOGIC; 
  signal u8_addrp_11_Q : STD_LOGIC; 
  signal u8_addrp_12_Q : STD_LOGIC; 
  signal u8_addrp_13_Q : STD_LOGIC; 
  signal u8_addrp_14_Q : STD_LOGIC; 
  signal u8_addrp_15_Q : STD_LOGIC; 
  signal u8_addrp_16_Q : STD_LOGIC; 
  signal u8_addrp_17_Q : STD_LOGIC; 
  signal u8_addrp_4_Q : STD_LOGIC; 
  signal u8_addrp_5_Q : STD_LOGIC; 
  signal u8_addrp_6_Q : STD_LOGIC; 
  signal u8_addrp_7_Q : STD_LOGIC; 
  signal u8_addrp_8_Q : STD_LOGIC; 
  signal u8_addrp_9_Q : STD_LOGIC; 
  signal u8_data_and0000 : STD_LOGIC; 
  signal u8_datap_and0000 : STD_LOGIC; 
  signal u8_donep_637 : STD_LOGIC; 
  signal u8_donep_mux0000 : STD_LOGIC; 
  signal u8_donep_mux000010_639 : STD_LOGIC; 
  signal u8_donep_mux00005_640 : STD_LOGIC; 
  signal u8_ram_addr_15_Q : STD_LOGIC; 
  signal u8_ram_addr_16_Q : STD_LOGIC; 
  signal u8_ram_addr_8_Q : STD_LOGIC; 
  signal u8_state_FSM_FFd1_644 : STD_LOGIC; 
  signal u8_state_FSM_FFd1_In : STD_LOGIC; 
  signal u8_state_FSM_FFd2_646 : STD_LOGIC; 
  signal u8_state_FSM_FFd3_647 : STD_LOGIC; 
  signal u8_state_FSM_FFd4_648 : STD_LOGIC; 
  signal u8_state_FSM_FFd5_649 : STD_LOGIC; 
  signal u8_state_FSM_FFd6_650 : STD_LOGIC; 
  signal u8_state_FSM_FFd6_In : STD_LOGIC; 
  signal u8_state_FSM_FFd7_652 : STD_LOGIC; 
  signal u8_state_FSM_FFd7_In : STD_LOGIC; 
  signal u8_wep_654 : STD_LOGIC; 
  signal vidon : STD_LOGIC; 
  signal vsync_OBUF_657 : STD_LOGIC; 
  signal Result : STD_LOGIC_VECTOR ( 17 downto 0 ); 
  signal u1_Mcount_q_cy : STD_LOGIC_VECTOR ( 16 downto 0 ); 
  signal u1_Mcount_q_lut : STD_LOGIC_VECTOR ( 0 downto 0 ); 
  signal u1_q : STD_LOGIC_VECTOR ( 17 downto 0 ); 
  signal u2_Mcount_hcs_cy : STD_LOGIC_VECTOR ( 8 downto 0 ); 
  signal u2_Mcount_hcs_lut : STD_LOGIC_VECTOR ( 0 downto 0 ); 
  signal u2_Mcount_vcs_cy : STD_LOGIC_VECTOR ( 8 downto 0 ); 
  signal u2_Mcount_vcs_lut : STD_LOGIC_VECTOR ( 0 downto 0 ); 
  signal u2_Result : STD_LOGIC_VECTOR ( 9 downto 0 ); 
  signal u2_hcs : STD_LOGIC_VECTOR ( 9 downto 0 ); 
  signal u2_vcs : STD_LOGIC_VECTOR ( 9 downto 0 ); 
  signal u3_Mcount_addr_count_cy : STD_LOGIC_VECTOR ( 18 downto 0 ); 
  signal u3_Mcount_addr_count_lut : STD_LOGIC_VECTOR ( 0 downto 0 ); 
  signal u3_Result : STD_LOGIC_VECTOR ( 19 downto 0 ); 
  signal u3_addr_count : STD_LOGIC_VECTOR ( 19 downto 0 ); 
  signal u3_addr_count_cmp_eq0000_wg_cy : STD_LOGIC_VECTOR ( 3 downto 0 ); 
  signal u3_addr_count_cmp_eq0000_wg_lut : STD_LOGIC_VECTOR ( 4 downto 0 ); 
  signal u3_pixel : STD_LOGIC_VECTOR ( 7 downto 0 ); 
  signal u3_pixel_mux0001 : STD_LOGIC_VECTOR ( 15 downto 8 ); 
  signal u5_Madd_addr_count_addsub0000_cy : STD_LOGIC_VECTOR ( 18 downto 0 ); 
  signal u5_Madd_addr_count_addsub0000_lut : STD_LOGIC_VECTOR ( 0 downto 0 ); 
  signal u5_addr_count : STD_LOGIC_VECTOR ( 19 downto 0 ); 
  signal u5_addr_count_addsub0000 : STD_LOGIC_VECTOR ( 19 downto 0 ); 
  signal u5_addr_count_mux0000 : STD_LOGIC_VECTOR ( 19 downto 0 ); 
  signal u8_data : STD_LOGIC_VECTOR ( 15 downto 8 ); 
  signal u8_datap : STD_LOGIC_VECTOR ( 15 downto 8 ); 
begin
  XST_GND : GND
    port map (
      G => A_22_OBUF_35
    );
  XST_VCC : VCC
    port map (
      P => FlashCE_L_OBUF_71
    );
  u1_q_0 : FDC
    port map (
      C => mclk_IBUF_148,
      CLR => btn_3_IBUF_136,
      D => Result(0),
      Q => u1_q_01
    );
  u1_q_1 : FDC
    port map (
      C => mclk_IBUF_148,
      CLR => btn_3_IBUF_136,
      D => Result(1),
      Q => u1_q_18
    );
  u1_q_2 : FDC
    port map (
      C => mclk_IBUF_148,
      CLR => btn_3_IBUF_136,
      D => Result(2),
      Q => u1_q(2)
    );
  u1_q_3 : FDC
    port map (
      C => mclk_IBUF_148,
      CLR => btn_3_IBUF_136,
      D => Result(3),
      Q => u1_q(3)
    );
  u1_q_4 : FDC
    port map (
      C => mclk_IBUF_148,
      CLR => btn_3_IBUF_136,
      D => Result(4),
      Q => u1_q(4)
    );
  u1_q_5 : FDC
    port map (
      C => mclk_IBUF_148,
      CLR => btn_3_IBUF_136,
      D => Result(5),
      Q => u1_q(5)
    );
  u1_q_6 : FDC
    port map (
      C => mclk_IBUF_148,
      CLR => btn_3_IBUF_136,
      D => Result(6),
      Q => u1_q(6)
    );
  u1_q_7 : FDC
    port map (
      C => mclk_IBUF_148,
      CLR => btn_3_IBUF_136,
      D => Result(7),
      Q => u1_q(7)
    );
  u1_q_8 : FDC
    port map (
      C => mclk_IBUF_148,
      CLR => btn_3_IBUF_136,
      D => Result(8),
      Q => u1_q(8)
    );
  u1_q_9 : FDC
    port map (
      C => mclk_IBUF_148,
      CLR => btn_3_IBUF_136,
      D => Result(9),
      Q => u1_q(9)
    );
  u1_q_10 : FDC
    port map (
      C => mclk_IBUF_148,
      CLR => btn_3_IBUF_136,
      D => Result(10),
      Q => u1_q(10)
    );
  u1_q_11 : FDC
    port map (
      C => mclk_IBUF_148,
      CLR => btn_3_IBUF_136,
      D => Result(11),
      Q => u1_q(11)
    );
  u1_q_12 : FDC
    port map (
      C => mclk_IBUF_148,
      CLR => btn_3_IBUF_136,
      D => Result(12),
      Q => u1_q(12)
    );
  u1_q_13 : FDC
    port map (
      C => mclk_IBUF_148,
      CLR => btn_3_IBUF_136,
      D => Result(13),
      Q => u1_q(13)
    );
  u1_q_14 : FDC
    port map (
      C => mclk_IBUF_148,
      CLR => btn_3_IBUF_136,
      D => Result(14),
      Q => u1_q(14)
    );
  u1_q_15 : FDC
    port map (
      C => mclk_IBUF_148,
      CLR => btn_3_IBUF_136,
      D => Result(15),
      Q => u1_q(15)
    );
  u1_q_16 : FDC
    port map (
      C => mclk_IBUF_148,
      CLR => btn_3_IBUF_136,
      D => Result(16),
      Q => u1_q(16)
    );
  u1_q_17 : FDC
    port map (
      C => mclk_IBUF_148,
      CLR => btn_3_IBUF_136,
      D => Result(17),
      Q => u1_q(17)
    );
  u1_Mcount_q_cy_0_Q : MUXCY
    port map (
      CI => A_22_OBUF_35,
      DI => FlashCE_L_OBUF_71,
      S => u1_Mcount_q_lut(0),
      O => u1_Mcount_q_cy(0)
    );
  u1_Mcount_q_xor_0_Q : XORCY
    port map (
      CI => A_22_OBUF_35,
      LI => u1_Mcount_q_lut(0),
      O => Result(0)
    );
  u1_Mcount_q_cy_1_Q : MUXCY
    port map (
      CI => u1_Mcount_q_cy(0),
      DI => A_22_OBUF_35,
      S => u1_Mcount_q_cy_1_rt_188,
      O => u1_Mcount_q_cy(1)
    );
  u1_Mcount_q_xor_1_Q : XORCY
    port map (
      CI => u1_Mcount_q_cy(0),
      LI => u1_Mcount_q_cy_1_rt_188,
      O => Result(1)
    );
  u1_Mcount_q_cy_2_Q : MUXCY
    port map (
      CI => u1_Mcount_q_cy(1),
      DI => A_22_OBUF_35,
      S => u1_Mcount_q_cy_2_rt_190,
      O => u1_Mcount_q_cy(2)
    );
  u1_Mcount_q_xor_2_Q : XORCY
    port map (
      CI => u1_Mcount_q_cy(1),
      LI => u1_Mcount_q_cy_2_rt_190,
      O => Result(2)
    );
  u1_Mcount_q_cy_3_Q : MUXCY
    port map (
      CI => u1_Mcount_q_cy(2),
      DI => A_22_OBUF_35,
      S => u1_Mcount_q_cy_3_rt_192,
      O => u1_Mcount_q_cy(3)
    );
  u1_Mcount_q_xor_3_Q : XORCY
    port map (
      CI => u1_Mcount_q_cy(2),
      LI => u1_Mcount_q_cy_3_rt_192,
      O => Result(3)
    );
  u1_Mcount_q_cy_4_Q : MUXCY
    port map (
      CI => u1_Mcount_q_cy(3),
      DI => A_22_OBUF_35,
      S => u1_Mcount_q_cy_4_rt_194,
      O => u1_Mcount_q_cy(4)
    );
  u1_Mcount_q_xor_4_Q : XORCY
    port map (
      CI => u1_Mcount_q_cy(3),
      LI => u1_Mcount_q_cy_4_rt_194,
      O => Result(4)
    );
  u1_Mcount_q_cy_5_Q : MUXCY
    port map (
      CI => u1_Mcount_q_cy(4),
      DI => A_22_OBUF_35,
      S => u1_Mcount_q_cy_5_rt_196,
      O => u1_Mcount_q_cy(5)
    );
  u1_Mcount_q_xor_5_Q : XORCY
    port map (
      CI => u1_Mcount_q_cy(4),
      LI => u1_Mcount_q_cy_5_rt_196,
      O => Result(5)
    );
  u1_Mcount_q_cy_6_Q : MUXCY
    port map (
      CI => u1_Mcount_q_cy(5),
      DI => A_22_OBUF_35,
      S => u1_Mcount_q_cy_6_rt_198,
      O => u1_Mcount_q_cy(6)
    );
  u1_Mcount_q_xor_6_Q : XORCY
    port map (
      CI => u1_Mcount_q_cy(5),
      LI => u1_Mcount_q_cy_6_rt_198,
      O => Result(6)
    );
  u1_Mcount_q_cy_7_Q : MUXCY
    port map (
      CI => u1_Mcount_q_cy(6),
      DI => A_22_OBUF_35,
      S => u1_Mcount_q_cy_7_rt_200,
      O => u1_Mcount_q_cy(7)
    );
  u1_Mcount_q_xor_7_Q : XORCY
    port map (
      CI => u1_Mcount_q_cy(6),
      LI => u1_Mcount_q_cy_7_rt_200,
      O => Result(7)
    );
  u1_Mcount_q_cy_8_Q : MUXCY
    port map (
      CI => u1_Mcount_q_cy(7),
      DI => A_22_OBUF_35,
      S => u1_Mcount_q_cy_8_rt_202,
      O => u1_Mcount_q_cy(8)
    );
  u1_Mcount_q_xor_8_Q : XORCY
    port map (
      CI => u1_Mcount_q_cy(7),
      LI => u1_Mcount_q_cy_8_rt_202,
      O => Result(8)
    );
  u1_Mcount_q_cy_9_Q : MUXCY
    port map (
      CI => u1_Mcount_q_cy(8),
      DI => A_22_OBUF_35,
      S => u1_Mcount_q_cy_9_rt_204,
      O => u1_Mcount_q_cy(9)
    );
  u1_Mcount_q_xor_9_Q : XORCY
    port map (
      CI => u1_Mcount_q_cy(8),
      LI => u1_Mcount_q_cy_9_rt_204,
      O => Result(9)
    );
  u1_Mcount_q_cy_10_Q : MUXCY
    port map (
      CI => u1_Mcount_q_cy(9),
      DI => A_22_OBUF_35,
      S => u1_Mcount_q_cy_10_rt_174,
      O => u1_Mcount_q_cy(10)
    );
  u1_Mcount_q_xor_10_Q : XORCY
    port map (
      CI => u1_Mcount_q_cy(9),
      LI => u1_Mcount_q_cy_10_rt_174,
      O => Result(10)
    );
  u1_Mcount_q_cy_11_Q : MUXCY
    port map (
      CI => u1_Mcount_q_cy(10),
      DI => A_22_OBUF_35,
      S => u1_Mcount_q_cy_11_rt_176,
      O => u1_Mcount_q_cy(11)
    );
  u1_Mcount_q_xor_11_Q : XORCY
    port map (
      CI => u1_Mcount_q_cy(10),
      LI => u1_Mcount_q_cy_11_rt_176,
      O => Result(11)
    );
  u1_Mcount_q_cy_12_Q : MUXCY
    port map (
      CI => u1_Mcount_q_cy(11),
      DI => A_22_OBUF_35,
      S => u1_Mcount_q_cy_12_rt_178,
      O => u1_Mcount_q_cy(12)
    );
  u1_Mcount_q_xor_12_Q : XORCY
    port map (
      CI => u1_Mcount_q_cy(11),
      LI => u1_Mcount_q_cy_12_rt_178,
      O => Result(12)
    );
  u1_Mcount_q_cy_13_Q : MUXCY
    port map (
      CI => u1_Mcount_q_cy(12),
      DI => A_22_OBUF_35,
      S => u1_Mcount_q_cy_13_rt_180,
      O => u1_Mcount_q_cy(13)
    );
  u1_Mcount_q_xor_13_Q : XORCY
    port map (
      CI => u1_Mcount_q_cy(12),
      LI => u1_Mcount_q_cy_13_rt_180,
      O => Result(13)
    );
  u1_Mcount_q_cy_14_Q : MUXCY
    port map (
      CI => u1_Mcount_q_cy(13),
      DI => A_22_OBUF_35,
      S => u1_Mcount_q_cy_14_rt_182,
      O => u1_Mcount_q_cy(14)
    );
  u1_Mcount_q_xor_14_Q : XORCY
    port map (
      CI => u1_Mcount_q_cy(13),
      LI => u1_Mcount_q_cy_14_rt_182,
      O => Result(14)
    );
  u1_Mcount_q_cy_15_Q : MUXCY
    port map (
      CI => u1_Mcount_q_cy(14),
      DI => A_22_OBUF_35,
      S => u1_Mcount_q_cy_15_rt_184,
      O => u1_Mcount_q_cy(15)
    );
  u1_Mcount_q_xor_15_Q : XORCY
    port map (
      CI => u1_Mcount_q_cy(14),
      LI => u1_Mcount_q_cy_15_rt_184,
      O => Result(15)
    );
  u1_Mcount_q_cy_16_Q : MUXCY
    port map (
      CI => u1_Mcount_q_cy(15),
      DI => A_22_OBUF_35,
      S => u1_Mcount_q_cy_16_rt_186,
      O => u1_Mcount_q_cy(16)
    );
  u1_Mcount_q_xor_16_Q : XORCY
    port map (
      CI => u1_Mcount_q_cy(15),
      LI => u1_Mcount_q_cy_16_rt_186,
      O => Result(16)
    );
  u1_Mcount_q_xor_17_Q : XORCY
    port map (
      CI => u1_Mcount_q_cy(16),
      LI => u1_Mcount_q_xor_17_rt_206,
      O => Result(17)
    );
  u2_Mcount_hcs_xor_9_Q : XORCY
    port map (
      CI => u2_Mcount_hcs_cy(8),
      LI => u2_Mcount_hcs_xor_9_rt_256,
      O => u2_Result_9_1
    );
  u2_Mcount_hcs_xor_8_Q : XORCY
    port map (
      CI => u2_Mcount_hcs_cy(7),
      LI => u2_Mcount_hcs_cy_8_rt_244,
      O => u2_Result_8_1
    );
  u2_Mcount_hcs_cy_8_Q : MUXCY
    port map (
      CI => u2_Mcount_hcs_cy(7),
      DI => A_22_OBUF_35,
      S => u2_Mcount_hcs_cy_8_rt_244,
      O => u2_Mcount_hcs_cy(8)
    );
  u2_Mcount_hcs_xor_7_Q : XORCY
    port map (
      CI => u2_Mcount_hcs_cy(6),
      LI => u2_Mcount_hcs_cy_7_rt_242,
      O => u2_Result_7_1
    );
  u2_Mcount_hcs_cy_7_Q : MUXCY
    port map (
      CI => u2_Mcount_hcs_cy(6),
      DI => A_22_OBUF_35,
      S => u2_Mcount_hcs_cy_7_rt_242,
      O => u2_Mcount_hcs_cy(7)
    );
  u2_Mcount_hcs_xor_6_Q : XORCY
    port map (
      CI => u2_Mcount_hcs_cy(5),
      LI => u2_Mcount_hcs_cy_6_rt_240,
      O => u2_Result_6_1
    );
  u2_Mcount_hcs_cy_6_Q : MUXCY
    port map (
      CI => u2_Mcount_hcs_cy(5),
      DI => A_22_OBUF_35,
      S => u2_Mcount_hcs_cy_6_rt_240,
      O => u2_Mcount_hcs_cy(6)
    );
  u2_Mcount_hcs_xor_5_Q : XORCY
    port map (
      CI => u2_Mcount_hcs_cy(4),
      LI => u2_Mcount_hcs_cy_5_rt_238,
      O => u2_Result_5_1
    );
  u2_Mcount_hcs_cy_5_Q : MUXCY
    port map (
      CI => u2_Mcount_hcs_cy(4),
      DI => A_22_OBUF_35,
      S => u2_Mcount_hcs_cy_5_rt_238,
      O => u2_Mcount_hcs_cy(5)
    );
  u2_Mcount_hcs_xor_4_Q : XORCY
    port map (
      CI => u2_Mcount_hcs_cy(3),
      LI => u2_Mcount_hcs_cy_4_rt_236,
      O => u2_Result_4_1
    );
  u2_Mcount_hcs_cy_4_Q : MUXCY
    port map (
      CI => u2_Mcount_hcs_cy(3),
      DI => A_22_OBUF_35,
      S => u2_Mcount_hcs_cy_4_rt_236,
      O => u2_Mcount_hcs_cy(4)
    );
  u2_Mcount_hcs_xor_3_Q : XORCY
    port map (
      CI => u2_Mcount_hcs_cy(2),
      LI => u2_Mcount_hcs_cy_3_rt_234,
      O => u2_Result_3_1
    );
  u2_Mcount_hcs_cy_3_Q : MUXCY
    port map (
      CI => u2_Mcount_hcs_cy(2),
      DI => A_22_OBUF_35,
      S => u2_Mcount_hcs_cy_3_rt_234,
      O => u2_Mcount_hcs_cy(3)
    );
  u2_Mcount_hcs_xor_2_Q : XORCY
    port map (
      CI => u2_Mcount_hcs_cy(1),
      LI => u2_Mcount_hcs_cy_2_rt_232,
      O => u2_Result_2_1
    );
  u2_Mcount_hcs_cy_2_Q : MUXCY
    port map (
      CI => u2_Mcount_hcs_cy(1),
      DI => A_22_OBUF_35,
      S => u2_Mcount_hcs_cy_2_rt_232,
      O => u2_Mcount_hcs_cy(2)
    );
  u2_Mcount_hcs_xor_1_Q : XORCY
    port map (
      CI => u2_Mcount_hcs_cy(0),
      LI => u2_Mcount_hcs_cy_1_rt_230,
      O => u2_Result_1_1
    );
  u2_Mcount_hcs_cy_1_Q : MUXCY
    port map (
      CI => u2_Mcount_hcs_cy(0),
      DI => A_22_OBUF_35,
      S => u2_Mcount_hcs_cy_1_rt_230,
      O => u2_Mcount_hcs_cy(1)
    );
  u2_Mcount_hcs_xor_0_Q : XORCY
    port map (
      CI => A_22_OBUF_35,
      LI => u2_Mcount_hcs_lut(0),
      O => u2_Result_0_1
    );
  u2_Mcount_hcs_cy_0_Q : MUXCY
    port map (
      CI => A_22_OBUF_35,
      DI => FlashCE_L_OBUF_71,
      S => u2_Mcount_hcs_lut(0),
      O => u2_Mcount_hcs_cy(0)
    );
  u2_Mcount_vcs_xor_9_Q : XORCY
    port map (
      CI => u2_Mcount_vcs_cy(8),
      LI => u2_Mcount_vcs_xor_9_rt_285,
      O => u2_Result(9)
    );
  u2_Mcount_vcs_xor_8_Q : XORCY
    port map (
      CI => u2_Mcount_vcs_cy(7),
      LI => u2_Mcount_vcs_cy_8_rt_273,
      O => u2_Result(8)
    );
  u2_Mcount_vcs_cy_8_Q : MUXCY
    port map (
      CI => u2_Mcount_vcs_cy(7),
      DI => A_22_OBUF_35,
      S => u2_Mcount_vcs_cy_8_rt_273,
      O => u2_Mcount_vcs_cy(8)
    );
  u2_Mcount_vcs_xor_7_Q : XORCY
    port map (
      CI => u2_Mcount_vcs_cy(6),
      LI => u2_Mcount_vcs_cy_7_rt_271,
      O => u2_Result(7)
    );
  u2_Mcount_vcs_cy_7_Q : MUXCY
    port map (
      CI => u2_Mcount_vcs_cy(6),
      DI => A_22_OBUF_35,
      S => u2_Mcount_vcs_cy_7_rt_271,
      O => u2_Mcount_vcs_cy(7)
    );
  u2_Mcount_vcs_xor_6_Q : XORCY
    port map (
      CI => u2_Mcount_vcs_cy(5),
      LI => u2_Mcount_vcs_cy_6_rt_269,
      O => u2_Result(6)
    );
  u2_Mcount_vcs_cy_6_Q : MUXCY
    port map (
      CI => u2_Mcount_vcs_cy(5),
      DI => A_22_OBUF_35,
      S => u2_Mcount_vcs_cy_6_rt_269,
      O => u2_Mcount_vcs_cy(6)
    );
  u2_Mcount_vcs_xor_5_Q : XORCY
    port map (
      CI => u2_Mcount_vcs_cy(4),
      LI => u2_Mcount_vcs_cy_5_rt_267,
      O => u2_Result(5)
    );
  u2_Mcount_vcs_cy_5_Q : MUXCY
    port map (
      CI => u2_Mcount_vcs_cy(4),
      DI => A_22_OBUF_35,
      S => u2_Mcount_vcs_cy_5_rt_267,
      O => u2_Mcount_vcs_cy(5)
    );
  u2_Mcount_vcs_xor_4_Q : XORCY
    port map (
      CI => u2_Mcount_vcs_cy(3),
      LI => u2_Mcount_vcs_cy_4_rt_265,
      O => u2_Result(4)
    );
  u2_Mcount_vcs_cy_4_Q : MUXCY
    port map (
      CI => u2_Mcount_vcs_cy(3),
      DI => A_22_OBUF_35,
      S => u2_Mcount_vcs_cy_4_rt_265,
      O => u2_Mcount_vcs_cy(4)
    );
  u2_Mcount_vcs_xor_3_Q : XORCY
    port map (
      CI => u2_Mcount_vcs_cy(2),
      LI => u2_Mcount_vcs_cy_3_rt_263,
      O => u2_Result(3)
    );
  u2_Mcount_vcs_cy_3_Q : MUXCY
    port map (
      CI => u2_Mcount_vcs_cy(2),
      DI => A_22_OBUF_35,
      S => u2_Mcount_vcs_cy_3_rt_263,
      O => u2_Mcount_vcs_cy(3)
    );
  u2_Mcount_vcs_xor_2_Q : XORCY
    port map (
      CI => u2_Mcount_vcs_cy(1),
      LI => u2_Mcount_vcs_cy_2_rt_261,
      O => u2_Result(2)
    );
  u2_Mcount_vcs_cy_2_Q : MUXCY
    port map (
      CI => u2_Mcount_vcs_cy(1),
      DI => A_22_OBUF_35,
      S => u2_Mcount_vcs_cy_2_rt_261,
      O => u2_Mcount_vcs_cy(2)
    );
  u2_Mcount_vcs_xor_1_Q : XORCY
    port map (
      CI => u2_Mcount_vcs_cy(0),
      LI => u2_Mcount_vcs_cy_1_rt_259,
      O => u2_Result(1)
    );
  u2_Mcount_vcs_cy_1_Q : MUXCY
    port map (
      CI => u2_Mcount_vcs_cy(0),
      DI => A_22_OBUF_35,
      S => u2_Mcount_vcs_cy_1_rt_259,
      O => u2_Mcount_vcs_cy(1)
    );
  u2_Mcount_vcs_xor_0_Q : XORCY
    port map (
      CI => A_22_OBUF_35,
      LI => u2_Mcount_vcs_lut(0),
      O => u2_Result(0)
    );
  u2_Mcount_vcs_cy_0_Q : MUXCY
    port map (
      CI => A_22_OBUF_35,
      DI => FlashCE_L_OBUF_71,
      S => u2_Mcount_vcs_lut(0),
      O => u2_Mcount_vcs_cy(0)
    );
  u2_hcs_9 : FDC
    port map (
      C => u1_q(0),
      CLR => btn_3_IBUF_136,
      D => u2_Mcount_hcs_eqn_9,
      Q => u2_hcs(9)
    );
  u2_hcs_8 : FDC
    port map (
      C => u1_q(0),
      CLR => btn_3_IBUF_136,
      D => u2_Mcount_hcs_eqn_8,
      Q => u2_hcs(8)
    );
  u2_hcs_7 : FDC
    port map (
      C => u1_q(0),
      CLR => btn_3_IBUF_136,
      D => u2_Mcount_hcs_eqn_7,
      Q => u2_hcs(7)
    );
  u2_hcs_6 : FDC
    port map (
      C => u1_q(0),
      CLR => btn_3_IBUF_136,
      D => u2_Mcount_hcs_eqn_6,
      Q => u2_hcs(6)
    );
  u2_hcs_5 : FDC
    port map (
      C => u1_q(0),
      CLR => btn_3_IBUF_136,
      D => u2_Mcount_hcs_eqn_5,
      Q => u2_hcs(5)
    );
  u2_hcs_4 : FDC
    port map (
      C => u1_q(0),
      CLR => btn_3_IBUF_136,
      D => u2_Mcount_hcs_eqn_4,
      Q => u2_hcs(4)
    );
  u2_hcs_3 : FDC
    port map (
      C => u1_q(0),
      CLR => btn_3_IBUF_136,
      D => u2_Mcount_hcs_eqn_3,
      Q => u2_hcs(3)
    );
  u2_hcs_2 : FDC
    port map (
      C => u1_q(0),
      CLR => btn_3_IBUF_136,
      D => u2_Mcount_hcs_eqn_2,
      Q => u2_hcs(2)
    );
  u2_hcs_1 : FDC
    port map (
      C => u1_q(0),
      CLR => btn_3_IBUF_136,
      D => u2_Mcount_hcs_eqn_1,
      Q => u2_hcs(1)
    );
  u2_hcs_0 : FDC
    port map (
      C => u1_q(0),
      CLR => btn_3_IBUF_136,
      D => u2_Mcount_hcs_eqn_0,
      Q => u2_hcs(0)
    );
  u2_vcs_9 : FDCE
    port map (
      C => u1_q(0),
      CE => u2_vsenable_341,
      CLR => btn_3_IBUF_136,
      D => u2_Mcount_vcs_eqn_9,
      Q => u2_vcs(9)
    );
  u2_vcs_8 : FDCE
    port map (
      C => u1_q(0),
      CE => u2_vsenable_341,
      CLR => btn_3_IBUF_136,
      D => u2_Mcount_vcs_eqn_8,
      Q => u2_vcs(8)
    );
  u2_vcs_7 : FDCE
    port map (
      C => u1_q(0),
      CE => u2_vsenable_341,
      CLR => btn_3_IBUF_136,
      D => u2_Mcount_vcs_eqn_7,
      Q => u2_vcs(7)
    );
  u2_vcs_6 : FDCE
    port map (
      C => u1_q(0),
      CE => u2_vsenable_341,
      CLR => btn_3_IBUF_136,
      D => u2_Mcount_vcs_eqn_6,
      Q => u2_vcs(6)
    );
  u2_vcs_5 : FDCE
    port map (
      C => u1_q(0),
      CE => u2_vsenable_341,
      CLR => btn_3_IBUF_136,
      D => u2_Mcount_vcs_eqn_5,
      Q => u2_vcs(5)
    );
  u2_vcs_4 : FDCE
    port map (
      C => u1_q(0),
      CE => u2_vsenable_341,
      CLR => btn_3_IBUF_136,
      D => u2_Mcount_vcs_eqn_4,
      Q => u2_vcs(4)
    );
  u2_vcs_3 : FDCE
    port map (
      C => u1_q(0),
      CE => u2_vsenable_341,
      CLR => btn_3_IBUF_136,
      D => u2_Mcount_vcs_eqn_3,
      Q => u2_vcs(3)
    );
  u2_vcs_2 : FDCE
    port map (
      C => u1_q(0),
      CE => u2_vsenable_341,
      CLR => btn_3_IBUF_136,
      D => u2_Mcount_vcs_eqn_2,
      Q => u2_vcs(2)
    );
  u2_vcs_1 : FDCE
    port map (
      C => u1_q(0),
      CE => u2_vsenable_341,
      CLR => btn_3_IBUF_136,
      D => u2_Mcount_vcs_eqn_1,
      Q => u2_vcs(1)
    );
  u2_vcs_0 : FDCE
    port map (
      C => u1_q(0),
      CE => u2_vsenable_341,
      CLR => btn_3_IBUF_136,
      D => u2_Mcount_vcs_eqn_0,
      Q => u2_vcs(0)
    );
  u2_vsenable : FDE
    port map (
      C => u1_q(0),
      CE => u2_clr_inv,
      D => u2_hcs_cmp_eq0000,
      Q => u2_vsenable_341
    );
  u3_Mcount_addr_count_xor_19_Q : XORCY
    port map (
      CI => u3_Mcount_addr_count_cy(18),
      LI => u3_Mcount_addr_count_xor_19_rt_400,
      O => u3_Result(19)
    );
  u3_Mcount_addr_count_xor_18_Q : XORCY
    port map (
      CI => u3_Mcount_addr_count_cy(17),
      LI => u3_Mcount_addr_count_cy_18_rt_360,
      O => u3_Result(18)
    );
  u3_Mcount_addr_count_cy_18_Q : MUXCY
    port map (
      CI => u3_Mcount_addr_count_cy(17),
      DI => A_22_OBUF_35,
      S => u3_Mcount_addr_count_cy_18_rt_360,
      O => u3_Mcount_addr_count_cy(18)
    );
  u3_Mcount_addr_count_xor_17_Q : XORCY
    port map (
      CI => u3_Mcount_addr_count_cy(16),
      LI => u3_Mcount_addr_count_cy_17_rt_358,
      O => u3_Result(17)
    );
  u3_Mcount_addr_count_cy_17_Q : MUXCY
    port map (
      CI => u3_Mcount_addr_count_cy(16),
      DI => A_22_OBUF_35,
      S => u3_Mcount_addr_count_cy_17_rt_358,
      O => u3_Mcount_addr_count_cy(17)
    );
  u3_Mcount_addr_count_xor_16_Q : XORCY
    port map (
      CI => u3_Mcount_addr_count_cy(15),
      LI => u3_Mcount_addr_count_cy_16_rt_356,
      O => u3_Result(16)
    );
  u3_Mcount_addr_count_cy_16_Q : MUXCY
    port map (
      CI => u3_Mcount_addr_count_cy(15),
      DI => A_22_OBUF_35,
      S => u3_Mcount_addr_count_cy_16_rt_356,
      O => u3_Mcount_addr_count_cy(16)
    );
  u3_Mcount_addr_count_xor_15_Q : XORCY
    port map (
      CI => u3_Mcount_addr_count_cy(14),
      LI => u3_Mcount_addr_count_cy_15_rt_354,
      O => u3_Result(15)
    );
  u3_Mcount_addr_count_cy_15_Q : MUXCY
    port map (
      CI => u3_Mcount_addr_count_cy(14),
      DI => A_22_OBUF_35,
      S => u3_Mcount_addr_count_cy_15_rt_354,
      O => u3_Mcount_addr_count_cy(15)
    );
  u3_Mcount_addr_count_xor_14_Q : XORCY
    port map (
      CI => u3_Mcount_addr_count_cy(13),
      LI => u3_Mcount_addr_count_cy_14_rt_352,
      O => u3_Result(14)
    );
  u3_Mcount_addr_count_cy_14_Q : MUXCY
    port map (
      CI => u3_Mcount_addr_count_cy(13),
      DI => A_22_OBUF_35,
      S => u3_Mcount_addr_count_cy_14_rt_352,
      O => u3_Mcount_addr_count_cy(14)
    );
  u3_Mcount_addr_count_xor_13_Q : XORCY
    port map (
      CI => u3_Mcount_addr_count_cy(12),
      LI => u3_Mcount_addr_count_cy_13_rt_350,
      O => u3_Result(13)
    );
  u3_Mcount_addr_count_cy_13_Q : MUXCY
    port map (
      CI => u3_Mcount_addr_count_cy(12),
      DI => A_22_OBUF_35,
      S => u3_Mcount_addr_count_cy_13_rt_350,
      O => u3_Mcount_addr_count_cy(13)
    );
  u3_Mcount_addr_count_xor_12_Q : XORCY
    port map (
      CI => u3_Mcount_addr_count_cy(11),
      LI => u3_Mcount_addr_count_cy_12_rt_348,
      O => u3_Result(12)
    );
  u3_Mcount_addr_count_cy_12_Q : MUXCY
    port map (
      CI => u3_Mcount_addr_count_cy(11),
      DI => A_22_OBUF_35,
      S => u3_Mcount_addr_count_cy_12_rt_348,
      O => u3_Mcount_addr_count_cy(12)
    );
  u3_Mcount_addr_count_xor_11_Q : XORCY
    port map (
      CI => u3_Mcount_addr_count_cy(10),
      LI => u3_Mcount_addr_count_cy_11_rt_346,
      O => u3_Result(11)
    );
  u3_Mcount_addr_count_cy_11_Q : MUXCY
    port map (
      CI => u3_Mcount_addr_count_cy(10),
      DI => A_22_OBUF_35,
      S => u3_Mcount_addr_count_cy_11_rt_346,
      O => u3_Mcount_addr_count_cy(11)
    );
  u3_Mcount_addr_count_xor_10_Q : XORCY
    port map (
      CI => u3_Mcount_addr_count_cy(9),
      LI => u3_Mcount_addr_count_cy_10_rt_344,
      O => u3_Result(10)
    );
  u3_Mcount_addr_count_cy_10_Q : MUXCY
    port map (
      CI => u3_Mcount_addr_count_cy(9),
      DI => A_22_OBUF_35,
      S => u3_Mcount_addr_count_cy_10_rt_344,
      O => u3_Mcount_addr_count_cy(10)
    );
  u3_Mcount_addr_count_xor_9_Q : XORCY
    port map (
      CI => u3_Mcount_addr_count_cy(8),
      LI => u3_Mcount_addr_count_cy_9_rt_378,
      O => u3_Result(9)
    );
  u3_Mcount_addr_count_cy_9_Q : MUXCY
    port map (
      CI => u3_Mcount_addr_count_cy(8),
      DI => A_22_OBUF_35,
      S => u3_Mcount_addr_count_cy_9_rt_378,
      O => u3_Mcount_addr_count_cy(9)
    );
  u3_Mcount_addr_count_xor_8_Q : XORCY
    port map (
      CI => u3_Mcount_addr_count_cy(7),
      LI => u3_Mcount_addr_count_cy_8_rt_376,
      O => u3_Result(8)
    );
  u3_Mcount_addr_count_cy_8_Q : MUXCY
    port map (
      CI => u3_Mcount_addr_count_cy(7),
      DI => A_22_OBUF_35,
      S => u3_Mcount_addr_count_cy_8_rt_376,
      O => u3_Mcount_addr_count_cy(8)
    );
  u3_Mcount_addr_count_xor_7_Q : XORCY
    port map (
      CI => u3_Mcount_addr_count_cy(6),
      LI => u3_Mcount_addr_count_cy_7_rt_374,
      O => u3_Result(7)
    );
  u3_Mcount_addr_count_cy_7_Q : MUXCY
    port map (
      CI => u3_Mcount_addr_count_cy(6),
      DI => A_22_OBUF_35,
      S => u3_Mcount_addr_count_cy_7_rt_374,
      O => u3_Mcount_addr_count_cy(7)
    );
  u3_Mcount_addr_count_xor_6_Q : XORCY
    port map (
      CI => u3_Mcount_addr_count_cy(5),
      LI => u3_Mcount_addr_count_cy_6_rt_372,
      O => u3_Result(6)
    );
  u3_Mcount_addr_count_cy_6_Q : MUXCY
    port map (
      CI => u3_Mcount_addr_count_cy(5),
      DI => A_22_OBUF_35,
      S => u3_Mcount_addr_count_cy_6_rt_372,
      O => u3_Mcount_addr_count_cy(6)
    );
  u3_Mcount_addr_count_xor_5_Q : XORCY
    port map (
      CI => u3_Mcount_addr_count_cy(4),
      LI => u3_Mcount_addr_count_cy_5_rt_370,
      O => u3_Result(5)
    );
  u3_Mcount_addr_count_cy_5_Q : MUXCY
    port map (
      CI => u3_Mcount_addr_count_cy(4),
      DI => A_22_OBUF_35,
      S => u3_Mcount_addr_count_cy_5_rt_370,
      O => u3_Mcount_addr_count_cy(5)
    );
  u3_Mcount_addr_count_xor_4_Q : XORCY
    port map (
      CI => u3_Mcount_addr_count_cy(3),
      LI => u3_Mcount_addr_count_cy_4_rt_368,
      O => u3_Result(4)
    );
  u3_Mcount_addr_count_cy_4_Q : MUXCY
    port map (
      CI => u3_Mcount_addr_count_cy(3),
      DI => A_22_OBUF_35,
      S => u3_Mcount_addr_count_cy_4_rt_368,
      O => u3_Mcount_addr_count_cy(4)
    );
  u3_Mcount_addr_count_xor_3_Q : XORCY
    port map (
      CI => u3_Mcount_addr_count_cy(2),
      LI => u3_Mcount_addr_count_cy_3_rt_366,
      O => u3_Result(3)
    );
  u3_Mcount_addr_count_cy_3_Q : MUXCY
    port map (
      CI => u3_Mcount_addr_count_cy(2),
      DI => A_22_OBUF_35,
      S => u3_Mcount_addr_count_cy_3_rt_366,
      O => u3_Mcount_addr_count_cy(3)
    );
  u3_Mcount_addr_count_xor_2_Q : XORCY
    port map (
      CI => u3_Mcount_addr_count_cy(1),
      LI => u3_Mcount_addr_count_cy_2_rt_364,
      O => u3_Result(2)
    );
  u3_Mcount_addr_count_cy_2_Q : MUXCY
    port map (
      CI => u3_Mcount_addr_count_cy(1),
      DI => A_22_OBUF_35,
      S => u3_Mcount_addr_count_cy_2_rt_364,
      O => u3_Mcount_addr_count_cy(2)
    );
  u3_Mcount_addr_count_xor_1_Q : XORCY
    port map (
      CI => u3_Mcount_addr_count_cy(0),
      LI => u3_Mcount_addr_count_cy_1_rt_362,
      O => u3_Result(1)
    );
  u3_Mcount_addr_count_cy_1_Q : MUXCY
    port map (
      CI => u3_Mcount_addr_count_cy(0),
      DI => A_22_OBUF_35,
      S => u3_Mcount_addr_count_cy_1_rt_362,
      O => u3_Mcount_addr_count_cy(1)
    );
  u3_Mcount_addr_count_xor_0_Q : XORCY
    port map (
      CI => A_22_OBUF_35,
      LI => u3_Mcount_addr_count_lut(0),
      O => u3_Result(0)
    );
  u3_Mcount_addr_count_cy_0_Q : MUXCY
    port map (
      CI => A_22_OBUF_35,
      DI => FlashCE_L_OBUF_71,
      S => u3_Mcount_addr_count_lut(0),
      O => u3_Mcount_addr_count_cy(0)
    );
  u3_addr_count_19 : FDCE
    port map (
      C => u1_q(1),
      CE => u3_addr_count_not0001,
      CLR => btn_3_IBUF_136,
      D => u3_Mcount_addr_count_eqn_19,
      Q => u3_addr_count(19)
    );
  u3_addr_count_18 : FDCE
    port map (
      C => u1_q(1),
      CE => u3_addr_count_not0001,
      CLR => btn_3_IBUF_136,
      D => u3_Mcount_addr_count_eqn_18,
      Q => u3_addr_count(18)
    );
  u3_addr_count_17 : FDCE
    port map (
      C => u1_q(1),
      CE => u3_addr_count_not0001,
      CLR => btn_3_IBUF_136,
      D => u3_Mcount_addr_count_eqn_17,
      Q => u3_addr_count(17)
    );
  u3_addr_count_16 : FDCE
    port map (
      C => u1_q(1),
      CE => u3_addr_count_not0001,
      CLR => btn_3_IBUF_136,
      D => u3_Mcount_addr_count_eqn_16,
      Q => u3_addr_count(16)
    );
  u3_addr_count_15 : FDCE
    port map (
      C => u1_q(1),
      CE => u3_addr_count_not0001,
      CLR => btn_3_IBUF_136,
      D => u3_Mcount_addr_count_eqn_15,
      Q => u3_addr_count(15)
    );
  u3_addr_count_14 : FDCE
    port map (
      C => u1_q(1),
      CE => u3_addr_count_not0001,
      CLR => btn_3_IBUF_136,
      D => u3_Mcount_addr_count_eqn_14,
      Q => u3_addr_count(14)
    );
  u3_addr_count_13 : FDCE
    port map (
      C => u1_q(1),
      CE => u3_addr_count_not0001,
      CLR => btn_3_IBUF_136,
      D => u3_Mcount_addr_count_eqn_13,
      Q => u3_addr_count(13)
    );
  u3_addr_count_12 : FDCE
    port map (
      C => u1_q(1),
      CE => u3_addr_count_not0001,
      CLR => btn_3_IBUF_136,
      D => u3_Mcount_addr_count_eqn_12,
      Q => u3_addr_count(12)
    );
  u3_addr_count_11 : FDCE
    port map (
      C => u1_q(1),
      CE => u3_addr_count_not0001,
      CLR => btn_3_IBUF_136,
      D => u3_Mcount_addr_count_eqn_11,
      Q => u3_addr_count(11)
    );
  u3_addr_count_10 : FDCE
    port map (
      C => u1_q(1),
      CE => u3_addr_count_not0001,
      CLR => btn_3_IBUF_136,
      D => u3_Mcount_addr_count_eqn_10,
      Q => u3_addr_count(10)
    );
  u3_addr_count_9 : FDCE
    port map (
      C => u1_q(1),
      CE => u3_addr_count_not0001,
      CLR => btn_3_IBUF_136,
      D => u3_Mcount_addr_count_eqn_9,
      Q => u3_addr_count(9)
    );
  u3_addr_count_8 : FDCE
    port map (
      C => u1_q(1),
      CE => u3_addr_count_not0001,
      CLR => btn_3_IBUF_136,
      D => u3_Mcount_addr_count_eqn_8,
      Q => u3_addr_count(8)
    );
  u3_addr_count_7 : FDCE
    port map (
      C => u1_q(1),
      CE => u3_addr_count_not0001,
      CLR => btn_3_IBUF_136,
      D => u3_Mcount_addr_count_eqn_7,
      Q => u3_addr_count(7)
    );
  u3_addr_count_6 : FDCE
    port map (
      C => u1_q(1),
      CE => u3_addr_count_not0001,
      CLR => btn_3_IBUF_136,
      D => u3_Mcount_addr_count_eqn_6,
      Q => u3_addr_count(6)
    );
  u3_addr_count_5 : FDCE
    port map (
      C => u1_q(1),
      CE => u3_addr_count_not0001,
      CLR => btn_3_IBUF_136,
      D => u3_Mcount_addr_count_eqn_5,
      Q => u3_addr_count(5)
    );
  u3_addr_count_4 : FDCE
    port map (
      C => u1_q(1),
      CE => u3_addr_count_not0001,
      CLR => btn_3_IBUF_136,
      D => u3_Mcount_addr_count_eqn_4,
      Q => u3_addr_count(4)
    );
  u3_addr_count_3 : FDCE
    port map (
      C => u1_q(1),
      CE => u3_addr_count_not0001,
      CLR => btn_3_IBUF_136,
      D => u3_Mcount_addr_count_eqn_3,
      Q => u3_addr_count(3)
    );
  u3_addr_count_2 : FDCE
    port map (
      C => u1_q(1),
      CE => u3_addr_count_not0001,
      CLR => btn_3_IBUF_136,
      D => u3_Mcount_addr_count_eqn_2,
      Q => u3_addr_count(2)
    );
  u3_addr_count_1 : FDCE
    port map (
      C => u1_q(1),
      CE => u3_addr_count_not0001,
      CLR => btn_3_IBUF_136,
      D => u3_Mcount_addr_count_eqn_1,
      Q => u3_addr_count(1)
    );
  u3_addr_count_0 : FDCE
    port map (
      C => u1_q(1),
      CE => u3_addr_count_not0001,
      CLR => btn_3_IBUF_136,
      D => u3_Mcount_addr_count_eqn_0,
      Q => u3_addr_count(0)
    );
  u3_pixel_7 : FDC
    port map (
      C => u1_q(0),
      CLR => btn_3_IBUF_136,
      D => u3_pixel_mux0001(15),
      Q => u3_pixel(7)
    );
  u3_pixel_6 : FDC
    port map (
      C => u1_q(0),
      CLR => btn_3_IBUF_136,
      D => u3_pixel_mux0001(14),
      Q => u3_pixel(6)
    );
  u3_pixel_5 : FDC
    port map (
      C => u1_q(0),
      CLR => btn_3_IBUF_136,
      D => u3_pixel_mux0001(13),
      Q => u3_pixel(5)
    );
  u3_pixel_4 : FDC
    port map (
      C => u1_q(0),
      CLR => btn_3_IBUF_136,
      D => u3_pixel_mux0001(12),
      Q => u3_pixel(4)
    );
  u3_pixel_3 : FDC
    port map (
      C => u1_q(0),
      CLR => btn_3_IBUF_136,
      D => u3_pixel_mux0001(11),
      Q => u3_pixel(3)
    );
  u3_pixel_2 : FDC
    port map (
      C => u1_q(0),
      CLR => btn_3_IBUF_136,
      D => u3_pixel_mux0001(10),
      Q => u3_pixel(2)
    );
  u3_pixel_1 : FDC
    port map (
      C => u1_q(0),
      CLR => btn_3_IBUF_136,
      D => u3_pixel_mux0001(9),
      Q => u3_pixel(1)
    );
  u3_pixel_0 : FDC
    port map (
      C => u1_q(0),
      CLR => btn_3_IBUF_136,
      D => u3_pixel_mux0001(8),
      Q => u3_pixel(0)
    );
  u5_Madd_addr_count_addsub0000_xor_19_Q : XORCY
    port map (
      CI => u5_Madd_addr_count_addsub0000_cy(18),
      LI => u5_Madd_addr_count_addsub0000_xor_19_rt_507,
      O => u5_addr_count_addsub0000(19)
    );
  u5_Madd_addr_count_addsub0000_xor_18_Q : XORCY
    port map (
      CI => u5_Madd_addr_count_addsub0000_cy(17),
      LI => u5_Madd_addr_count_addsub0000_cy_18_rt_487,
      O => u5_addr_count_addsub0000(18)
    );
  u5_Madd_addr_count_addsub0000_cy_18_Q : MUXCY
    port map (
      CI => u5_Madd_addr_count_addsub0000_cy(17),
      DI => A_22_OBUF_35,
      S => u5_Madd_addr_count_addsub0000_cy_18_rt_487,
      O => u5_Madd_addr_count_addsub0000_cy(18)
    );
  u5_Madd_addr_count_addsub0000_xor_17_Q : XORCY
    port map (
      CI => u5_Madd_addr_count_addsub0000_cy(16),
      LI => u5_Madd_addr_count_addsub0000_cy_17_rt_485,
      O => u5_addr_count_addsub0000(17)
    );
  u5_Madd_addr_count_addsub0000_cy_17_Q : MUXCY
    port map (
      CI => u5_Madd_addr_count_addsub0000_cy(16),
      DI => A_22_OBUF_35,
      S => u5_Madd_addr_count_addsub0000_cy_17_rt_485,
      O => u5_Madd_addr_count_addsub0000_cy(17)
    );
  u5_Madd_addr_count_addsub0000_xor_16_Q : XORCY
    port map (
      CI => u5_Madd_addr_count_addsub0000_cy(15),
      LI => u5_Madd_addr_count_addsub0000_cy_16_rt_483,
      O => u5_addr_count_addsub0000(16)
    );
  u5_Madd_addr_count_addsub0000_cy_16_Q : MUXCY
    port map (
      CI => u5_Madd_addr_count_addsub0000_cy(15),
      DI => A_22_OBUF_35,
      S => u5_Madd_addr_count_addsub0000_cy_16_rt_483,
      O => u5_Madd_addr_count_addsub0000_cy(16)
    );
  u5_Madd_addr_count_addsub0000_xor_15_Q : XORCY
    port map (
      CI => u5_Madd_addr_count_addsub0000_cy(14),
      LI => u5_Madd_addr_count_addsub0000_cy_15_rt_481,
      O => u5_addr_count_addsub0000(15)
    );
  u5_Madd_addr_count_addsub0000_cy_15_Q : MUXCY
    port map (
      CI => u5_Madd_addr_count_addsub0000_cy(14),
      DI => A_22_OBUF_35,
      S => u5_Madd_addr_count_addsub0000_cy_15_rt_481,
      O => u5_Madd_addr_count_addsub0000_cy(15)
    );
  u5_Madd_addr_count_addsub0000_xor_14_Q : XORCY
    port map (
      CI => u5_Madd_addr_count_addsub0000_cy(13),
      LI => u5_Madd_addr_count_addsub0000_cy_14_rt_479,
      O => u5_addr_count_addsub0000(14)
    );
  u5_Madd_addr_count_addsub0000_cy_14_Q : MUXCY
    port map (
      CI => u5_Madd_addr_count_addsub0000_cy(13),
      DI => A_22_OBUF_35,
      S => u5_Madd_addr_count_addsub0000_cy_14_rt_479,
      O => u5_Madd_addr_count_addsub0000_cy(14)
    );
  u5_Madd_addr_count_addsub0000_xor_13_Q : XORCY
    port map (
      CI => u5_Madd_addr_count_addsub0000_cy(12),
      LI => u5_Madd_addr_count_addsub0000_cy_13_rt_477,
      O => u5_addr_count_addsub0000(13)
    );
  u5_Madd_addr_count_addsub0000_cy_13_Q : MUXCY
    port map (
      CI => u5_Madd_addr_count_addsub0000_cy(12),
      DI => A_22_OBUF_35,
      S => u5_Madd_addr_count_addsub0000_cy_13_rt_477,
      O => u5_Madd_addr_count_addsub0000_cy(13)
    );
  u5_Madd_addr_count_addsub0000_xor_12_Q : XORCY
    port map (
      CI => u5_Madd_addr_count_addsub0000_cy(11),
      LI => u5_Madd_addr_count_addsub0000_cy_12_rt_475,
      O => u5_addr_count_addsub0000(12)
    );
  u5_Madd_addr_count_addsub0000_cy_12_Q : MUXCY
    port map (
      CI => u5_Madd_addr_count_addsub0000_cy(11),
      DI => A_22_OBUF_35,
      S => u5_Madd_addr_count_addsub0000_cy_12_rt_475,
      O => u5_Madd_addr_count_addsub0000_cy(12)
    );
  u5_Madd_addr_count_addsub0000_xor_11_Q : XORCY
    port map (
      CI => u5_Madd_addr_count_addsub0000_cy(10),
      LI => u5_Madd_addr_count_addsub0000_cy_11_rt_473,
      O => u5_addr_count_addsub0000(11)
    );
  u5_Madd_addr_count_addsub0000_cy_11_Q : MUXCY
    port map (
      CI => u5_Madd_addr_count_addsub0000_cy(10),
      DI => A_22_OBUF_35,
      S => u5_Madd_addr_count_addsub0000_cy_11_rt_473,
      O => u5_Madd_addr_count_addsub0000_cy(11)
    );
  u5_Madd_addr_count_addsub0000_xor_10_Q : XORCY
    port map (
      CI => u5_Madd_addr_count_addsub0000_cy(9),
      LI => u5_Madd_addr_count_addsub0000_cy_10_rt_471,
      O => u5_addr_count_addsub0000(10)
    );
  u5_Madd_addr_count_addsub0000_cy_10_Q : MUXCY
    port map (
      CI => u5_Madd_addr_count_addsub0000_cy(9),
      DI => A_22_OBUF_35,
      S => u5_Madd_addr_count_addsub0000_cy_10_rt_471,
      O => u5_Madd_addr_count_addsub0000_cy(10)
    );
  u5_Madd_addr_count_addsub0000_xor_9_Q : XORCY
    port map (
      CI => u5_Madd_addr_count_addsub0000_cy(8),
      LI => u5_Madd_addr_count_addsub0000_cy_9_rt_505,
      O => u5_addr_count_addsub0000(9)
    );
  u5_Madd_addr_count_addsub0000_cy_9_Q : MUXCY
    port map (
      CI => u5_Madd_addr_count_addsub0000_cy(8),
      DI => A_22_OBUF_35,
      S => u5_Madd_addr_count_addsub0000_cy_9_rt_505,
      O => u5_Madd_addr_count_addsub0000_cy(9)
    );
  u5_Madd_addr_count_addsub0000_xor_8_Q : XORCY
    port map (
      CI => u5_Madd_addr_count_addsub0000_cy(7),
      LI => u5_Madd_addr_count_addsub0000_cy_8_rt_503,
      O => u5_addr_count_addsub0000(8)
    );
  u5_Madd_addr_count_addsub0000_cy_8_Q : MUXCY
    port map (
      CI => u5_Madd_addr_count_addsub0000_cy(7),
      DI => A_22_OBUF_35,
      S => u5_Madd_addr_count_addsub0000_cy_8_rt_503,
      O => u5_Madd_addr_count_addsub0000_cy(8)
    );
  u5_Madd_addr_count_addsub0000_xor_7_Q : XORCY
    port map (
      CI => u5_Madd_addr_count_addsub0000_cy(6),
      LI => u5_Madd_addr_count_addsub0000_cy_7_rt_501,
      O => u5_addr_count_addsub0000(7)
    );
  u5_Madd_addr_count_addsub0000_cy_7_Q : MUXCY
    port map (
      CI => u5_Madd_addr_count_addsub0000_cy(6),
      DI => A_22_OBUF_35,
      S => u5_Madd_addr_count_addsub0000_cy_7_rt_501,
      O => u5_Madd_addr_count_addsub0000_cy(7)
    );
  u5_Madd_addr_count_addsub0000_xor_6_Q : XORCY
    port map (
      CI => u5_Madd_addr_count_addsub0000_cy(5),
      LI => u5_Madd_addr_count_addsub0000_cy_6_rt_499,
      O => u5_addr_count_addsub0000(6)
    );
  u5_Madd_addr_count_addsub0000_cy_6_Q : MUXCY
    port map (
      CI => u5_Madd_addr_count_addsub0000_cy(5),
      DI => A_22_OBUF_35,
      S => u5_Madd_addr_count_addsub0000_cy_6_rt_499,
      O => u5_Madd_addr_count_addsub0000_cy(6)
    );
  u5_Madd_addr_count_addsub0000_xor_5_Q : XORCY
    port map (
      CI => u5_Madd_addr_count_addsub0000_cy(4),
      LI => u5_Madd_addr_count_addsub0000_cy_5_rt_497,
      O => u5_addr_count_addsub0000(5)
    );
  u5_Madd_addr_count_addsub0000_cy_5_Q : MUXCY
    port map (
      CI => u5_Madd_addr_count_addsub0000_cy(4),
      DI => A_22_OBUF_35,
      S => u5_Madd_addr_count_addsub0000_cy_5_rt_497,
      O => u5_Madd_addr_count_addsub0000_cy(5)
    );
  u5_Madd_addr_count_addsub0000_xor_4_Q : XORCY
    port map (
      CI => u5_Madd_addr_count_addsub0000_cy(3),
      LI => u5_Madd_addr_count_addsub0000_cy_4_rt_495,
      O => u5_addr_count_addsub0000(4)
    );
  u5_Madd_addr_count_addsub0000_cy_4_Q : MUXCY
    port map (
      CI => u5_Madd_addr_count_addsub0000_cy(3),
      DI => A_22_OBUF_35,
      S => u5_Madd_addr_count_addsub0000_cy_4_rt_495,
      O => u5_Madd_addr_count_addsub0000_cy(4)
    );
  u5_Madd_addr_count_addsub0000_xor_3_Q : XORCY
    port map (
      CI => u5_Madd_addr_count_addsub0000_cy(2),
      LI => u5_Madd_addr_count_addsub0000_cy_3_rt_493,
      O => u5_addr_count_addsub0000(3)
    );
  u5_Madd_addr_count_addsub0000_cy_3_Q : MUXCY
    port map (
      CI => u5_Madd_addr_count_addsub0000_cy(2),
      DI => A_22_OBUF_35,
      S => u5_Madd_addr_count_addsub0000_cy_3_rt_493,
      O => u5_Madd_addr_count_addsub0000_cy(3)
    );
  u5_Madd_addr_count_addsub0000_xor_2_Q : XORCY
    port map (
      CI => u5_Madd_addr_count_addsub0000_cy(1),
      LI => u5_Madd_addr_count_addsub0000_cy_2_rt_491,
      O => u5_addr_count_addsub0000(2)
    );
  u5_Madd_addr_count_addsub0000_cy_2_Q : MUXCY
    port map (
      CI => u5_Madd_addr_count_addsub0000_cy(1),
      DI => A_22_OBUF_35,
      S => u5_Madd_addr_count_addsub0000_cy_2_rt_491,
      O => u5_Madd_addr_count_addsub0000_cy(2)
    );
  u5_Madd_addr_count_addsub0000_xor_1_Q : XORCY
    port map (
      CI => u5_Madd_addr_count_addsub0000_cy(0),
      LI => u5_Madd_addr_count_addsub0000_cy_1_rt_489,
      O => u5_addr_count_addsub0000(1)
    );
  u5_Madd_addr_count_addsub0000_cy_1_Q : MUXCY
    port map (
      CI => u5_Madd_addr_count_addsub0000_cy(0),
      DI => A_22_OBUF_35,
      S => u5_Madd_addr_count_addsub0000_cy_1_rt_489,
      O => u5_Madd_addr_count_addsub0000_cy(1)
    );
  u5_Madd_addr_count_addsub0000_xor_0_Q : XORCY
    port map (
      CI => A_22_OBUF_35,
      LI => u5_Madd_addr_count_addsub0000_lut(0),
      O => u5_addr_count_addsub0000(0)
    );
  u5_Madd_addr_count_addsub0000_cy_0_Q : MUXCY
    port map (
      CI => A_22_OBUF_35,
      DI => FlashCE_L_OBUF_71,
      S => u5_Madd_addr_count_addsub0000_lut(0),
      O => u5_Madd_addr_count_addsub0000_cy(0)
    );
  u5_state_FSM_FFd2 : FDC
    generic map(
      INIT => '0'
    )
    port map (
      C => u1_q(1),
      CLR => btn_3_IBUF_136,
      D => u5_state_FSM_FFd2_In,
      Q => u5_state_FSM_FFd2_578
    );
  u5_state_FSM_FFd1 : FDC
    generic map(
      INIT => '0'
    )
    port map (
      C => u1_q(1),
      CLR => btn_3_IBUF_136,
      D => u5_state_FSM_FFd1_In,
      Q => u5_state_FSM_FFd1_575
    );
  u5_done_out : FDP
    port map (
      C => u1_q(1),
      D => u5_done_out_mux0002,
      PRE => btn_3_IBUF_136,
      Q => u5_done_out_573
    );
  u5_addr_count_19 : FDC
    port map (
      C => u1_q(1),
      CLR => btn_3_IBUF_136,
      D => u5_addr_count_mux0000(0),
      Q => u5_addr_count(19)
    );
  u5_addr_count_18 : FDC
    port map (
      C => u1_q(1),
      CLR => btn_3_IBUF_136,
      D => u5_addr_count_mux0000(1),
      Q => u5_addr_count(18)
    );
  u5_addr_count_17 : FDC
    port map (
      C => u1_q(1),
      CLR => btn_3_IBUF_136,
      D => u5_addr_count_mux0000(2),
      Q => u5_addr_count(17)
    );
  u5_addr_count_16 : FDC
    port map (
      C => u1_q(1),
      CLR => btn_3_IBUF_136,
      D => u5_addr_count_mux0000(3),
      Q => u5_addr_count(16)
    );
  u5_addr_count_15 : FDC
    port map (
      C => u1_q(1),
      CLR => btn_3_IBUF_136,
      D => u5_addr_count_mux0000(4),
      Q => u5_addr_count(15)
    );
  u5_addr_count_14 : FDC
    port map (
      C => u1_q(1),
      CLR => btn_3_IBUF_136,
      D => u5_addr_count_mux0000(5),
      Q => u5_addr_count(14)
    );
  u5_addr_count_13 : FDC
    port map (
      C => u1_q(1),
      CLR => btn_3_IBUF_136,
      D => u5_addr_count_mux0000(6),
      Q => u5_addr_count(13)
    );
  u5_addr_count_12 : FDC
    port map (
      C => u1_q(1),
      CLR => btn_3_IBUF_136,
      D => u5_addr_count_mux0000(7),
      Q => u5_addr_count(12)
    );
  u5_addr_count_11 : FDC
    port map (
      C => u1_q(1),
      CLR => btn_3_IBUF_136,
      D => u5_addr_count_mux0000(8),
      Q => u5_addr_count(11)
    );
  u5_addr_count_10 : FDC
    port map (
      C => u1_q(1),
      CLR => btn_3_IBUF_136,
      D => u5_addr_count_mux0000(9),
      Q => u5_addr_count(10)
    );
  u5_addr_count_9 : FDC
    port map (
      C => u1_q(1),
      CLR => btn_3_IBUF_136,
      D => u5_addr_count_mux0000(10),
      Q => u5_addr_count(9)
    );
  u5_addr_count_8 : FDC
    port map (
      C => u1_q(1),
      CLR => btn_3_IBUF_136,
      D => u5_addr_count_mux0000(11),
      Q => u5_addr_count(8)
    );
  u5_addr_count_7 : FDC
    port map (
      C => u1_q(1),
      CLR => btn_3_IBUF_136,
      D => u5_addr_count_mux0000(12),
      Q => u5_addr_count(7)
    );
  u5_addr_count_6 : FDC
    port map (
      C => u1_q(1),
      CLR => btn_3_IBUF_136,
      D => u5_addr_count_mux0000(13),
      Q => u5_addr_count(6)
    );
  u5_addr_count_5 : FDC
    port map (
      C => u1_q(1),
      CLR => btn_3_IBUF_136,
      D => u5_addr_count_mux0000(14),
      Q => u5_addr_count(5)
    );
  u5_addr_count_4 : FDC
    port map (
      C => u1_q(1),
      CLR => btn_3_IBUF_136,
      D => u5_addr_count_mux0000(15),
      Q => u5_addr_count(4)
    );
  u5_addr_count_3 : FDC
    port map (
      C => u1_q(1),
      CLR => btn_3_IBUF_136,
      D => u5_addr_count_mux0000(16),
      Q => u5_addr_count(3)
    );
  u5_addr_count_2 : FDC
    port map (
      C => u1_q(1),
      CLR => btn_3_IBUF_136,
      D => u5_addr_count_mux0000(17),
      Q => u5_addr_count(2)
    );
  u5_addr_count_1 : FDC
    port map (
      C => u1_q(1),
      CLR => btn_3_IBUF_136,
      D => u5_addr_count_mux0000(18),
      Q => u5_addr_count(1)
    );
  u5_addr_count_0 : FDC
    port map (
      C => u1_q(1),
      CLR => btn_3_IBUF_136,
      D => u5_addr_count_mux0000(19),
      Q => u5_addr_count(0)
    );
  u6_delay3_2 : FDC
    port map (
      C => u1_q(17),
      CLR => btn_3_IBUF_136,
      D => u6_delay2_2_Q,
      Q => u6_delay3_2_Q
    );
  u6_delay3_0 : FDC
    port map (
      C => u1_q(17),
      CLR => btn_3_IBUF_136,
      D => u6_delay2_0_Q,
      Q => u6_delay3_0_Q
    );
  u6_delay2_2 : FDC
    port map (
      C => u1_q(17),
      CLR => btn_3_IBUF_136,
      D => u6_delay1_2_Q,
      Q => u6_delay2_2_Q
    );
  u6_delay2_0 : FDC
    port map (
      C => u1_q(17),
      CLR => btn_3_IBUF_136,
      D => u6_delay1_0_Q,
      Q => u6_delay2_0_Q
    );
  u6_delay1_2 : FDC
    port map (
      C => u1_q(17),
      CLR => btn_3_IBUF_136,
      D => btn_2_IBUF_135,
      Q => u6_delay1_2_Q
    );
  u6_delay1_0 : FDC
    port map (
      C => u1_q(17),
      CLR => btn_3_IBUF_136,
      D => btn_0_IBUF_134,
      Q => u6_delay1_0_Q
    );
  u8_state_FSM_FFd2 : FDC
    generic map(
      INIT => '0'
    )
    port map (
      C => u1_q(1),
      CLR => btn_3_IBUF_136,
      D => u8_state_FSM_FFd3_647,
      Q => u8_state_FSM_FFd2_646
    );
  u8_state_FSM_FFd3 : FDC
    generic map(
      INIT => '0'
    )
    port map (
      C => u1_q(1),
      CLR => btn_3_IBUF_136,
      D => u8_state_FSM_FFd4_648,
      Q => u8_state_FSM_FFd3_647
    );
  u8_state_FSM_FFd4 : FDC
    generic map(
      INIT => '0'
    )
    port map (
      C => u1_q(1),
      CLR => btn_3_IBUF_136,
      D => u8_state_FSM_FFd5_649,
      Q => u8_state_FSM_FFd4_648
    );
  u8_state_FSM_FFd5 : FDC
    generic map(
      INIT => '0'
    )
    port map (
      C => u1_q(1),
      CLR => btn_3_IBUF_136,
      D => u8_state_FSM_FFd6_650,
      Q => u8_state_FSM_FFd5_649
    );
  u8_state_FSM_FFd6 : FDC
    generic map(
      INIT => '0'
    )
    port map (
      C => u1_q(1),
      CLR => btn_3_IBUF_136,
      D => u8_state_FSM_FFd6_In,
      Q => u8_state_FSM_FFd6_650
    );
  u8_state_FSM_FFd7 : FDP
    generic map(
      INIT => '1'
    )
    port map (
      C => u1_q(1),
      D => u8_state_FSM_FFd7_In,
      PRE => btn_3_IBUF_136,
      Q => u8_state_FSM_FFd7_652
    );
  u8_state_FSM_FFd1 : FDC
    generic map(
      INIT => '0'
    )
    port map (
      C => u1_q(1),
      CLR => btn_3_IBUF_136,
      D => u8_state_FSM_FFd1_In,
      Q => u8_state_FSM_FFd1_644
    );
  u8_addrp_17 : FDCE
    port map (
      C => u1_q(1),
      CE => u8_state_FSM_FFd6_650,
      CLR => btn_3_IBUF_136,
      D => u8_Madd_ram_addr_Madd_cy_14_Q,
      Q => u8_addrp_17_Q
    );
  u8_addrp_16 : FDCE
    port map (
      C => u1_q(1),
      CE => u8_state_FSM_FFd6_650,
      CLR => btn_3_IBUF_136,
      D => u8_ram_addr_16_Q,
      Q => u8_addrp_16_Q
    );
  u8_addrp_15 : FDCE
    port map (
      C => u1_q(1),
      CE => u8_state_FSM_FFd6_650,
      CLR => btn_3_IBUF_136,
      D => u8_ram_addr_15_Q,
      Q => u8_addrp_15_Q
    );
  u8_addrp_14 : FDCE
    port map (
      C => u1_q(1),
      CE => u8_state_FSM_FFd6_650,
      CLR => btn_3_IBUF_136,
      D => u8_Madd_ram_addr_Madd_lut_12_Q,
      Q => u8_addrp_14_Q
    );
  u8_addrp_13 : FDCE
    port map (
      C => u1_q(1),
      CE => u8_state_FSM_FFd6_650,
      CLR => btn_3_IBUF_136,
      D => u8_Madd_ram_addrR1,
      Q => u8_addrp_13_Q
    );
  u8_addrp_12 : FDCE
    port map (
      C => u1_q(1),
      CE => u8_state_FSM_FFd6_650,
      CLR => btn_3_IBUF_136,
      D => sw_5_IBUF_169,
      Q => u8_addrp_12_Q
    );
  u8_addrp_11 : FDCE
    port map (
      C => u1_q(1),
      CE => u8_state_FSM_FFd6_650,
      CLR => btn_3_IBUF_136,
      D => sw_4_IBUF_168,
      Q => u8_addrp_11_Q
    );
  u8_addrp_9 : FDCE
    port map (
      C => u1_q(1),
      CE => u8_state_FSM_FFd6_650,
      CLR => btn_3_IBUF_136,
      D => u8_Madd_ram_addr_Madd_cy_5_Q,
      Q => u8_addrp_9_Q
    );
  u8_addrp_8 : FDCE
    port map (
      C => u1_q(1),
      CE => u8_state_FSM_FFd6_650,
      CLR => btn_3_IBUF_136,
      D => u8_ram_addr_8_Q,
      Q => u8_addrp_8_Q
    );
  u8_addrp_7 : FDCE
    port map (
      C => u1_q(1),
      CE => u8_state_FSM_FFd6_650,
      CLR => btn_3_IBUF_136,
      D => u8_Madd_ram_addr_Madd_lut_5_Q,
      Q => u8_addrp_7_Q
    );
  u8_addrp_6 : FDCE
    port map (
      C => u1_q(1),
      CE => u8_state_FSM_FFd6_650,
      CLR => btn_3_IBUF_136,
      D => u8_Madd_ram_addrR,
      Q => u8_addrp_6_Q
    );
  u8_addrp_5 : FDCE
    port map (
      C => u1_q(1),
      CE => u8_state_FSM_FFd6_650,
      CLR => btn_3_IBUF_136,
      D => sw_1_IBUF_165,
      Q => u8_addrp_5_Q
    );
  u8_addrp_4 : FDCE
    port map (
      C => u1_q(1),
      CE => u8_state_FSM_FFd6_650,
      CLR => btn_3_IBUF_136,
      D => sw_0_IBUF_164,
      Q => u8_addrp_4_Q
    );
  u8_wep : FDP
    port map (
      C => u1_q(1),
      D => u8_mux0000,
      PRE => btn_3_IBUF_136,
      Q => u8_wep_654
    );
  u8_data_15 : FDE
    port map (
      C => u1_q(1),
      CE => u8_data_and0000,
      D => N33,
      Q => u8_data(15)
    );
  u8_data_14 : FDE
    port map (
      C => u1_q(1),
      CE => u8_data_and0000,
      D => N34,
      Q => u8_data(14)
    );
  u8_data_13 : FDE
    port map (
      C => u1_q(1),
      CE => u8_data_and0000,
      D => N35,
      Q => u8_data(13)
    );
  u8_data_12 : FDE
    port map (
      C => u1_q(1),
      CE => u8_data_and0000,
      D => N36,
      Q => u8_data(12)
    );
  u8_data_11 : FDE
    port map (
      C => u1_q(1),
      CE => u8_data_and0000,
      D => N37,
      Q => u8_data(11)
    );
  u8_data_10 : FDE
    port map (
      C => u1_q(1),
      CE => u8_data_and0000,
      D => N38,
      Q => u8_data(10)
    );
  u8_data_9 : FDE
    port map (
      C => u1_q(1),
      CE => u8_data_and0000,
      D => N39,
      Q => u8_data(9)
    );
  u8_data_8 : FDE
    port map (
      C => u1_q(1),
      CE => u8_data_and0000,
      D => N40,
      Q => u8_data(8)
    );
  u8_datap_15 : FDE
    port map (
      C => u1_q(1),
      CE => u8_datap_and0000,
      D => u8_data(15),
      Q => u8_datap(15)
    );
  u8_datap_14 : FDE
    port map (
      C => u1_q(1),
      CE => u8_datap_and0000,
      D => u8_data(14),
      Q => u8_datap(14)
    );
  u8_datap_13 : FDE
    port map (
      C => u1_q(1),
      CE => u8_datap_and0000,
      D => u8_data(13),
      Q => u8_datap(13)
    );
  u8_datap_12 : FDE
    port map (
      C => u1_q(1),
      CE => u8_datap_and0000,
      D => u8_data(12),
      Q => u8_datap(12)
    );
  u8_datap_11 : FDE
    port map (
      C => u1_q(1),
      CE => u8_datap_and0000,
      D => u8_data(11),
      Q => u8_datap(11)
    );
  u8_datap_10 : FDE
    port map (
      C => u1_q(1),
      CE => u8_datap_and0000,
      D => u8_data(10),
      Q => u8_datap(10)
    );
  u8_datap_9 : FDE
    port map (
      C => u1_q(1),
      CE => u8_datap_and0000,
      D => u8_data(9),
      Q => u8_datap(9)
    );
  u8_datap_8 : FDE
    port map (
      C => u1_q(1),
      CE => u8_datap_and0000,
      D => u8_data(8),
      Q => u8_datap(8)
    );
  u8_donep : FDP
    port map (
      C => u1_q(1),
      D => u8_donep_mux0000,
      PRE => btn_3_IBUF_136,
      Q => u8_donep_637
    );
  u3_addr_count_cmp_eq0000_wg_lut_0_Q : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => u3_addr_count(7),
      I1 => u3_addr_count(5),
      I2 => u3_addr_count(4),
      I3 => u3_addr_count(6),
      O => u3_addr_count_cmp_eq0000_wg_lut(0)
    );
  u3_addr_count_cmp_eq0000_wg_cy_0_Q : MUXCY
    port map (
      CI => FlashCE_L_OBUF_71,
      DI => A_22_OBUF_35,
      S => u3_addr_count_cmp_eq0000_wg_lut(0),
      O => u3_addr_count_cmp_eq0000_wg_cy(0)
    );
  u3_addr_count_cmp_eq0000_wg_lut_1_Q : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => u3_addr_count(8),
      I1 => u3_addr_count(9),
      I2 => u3_addr_count(3),
      I3 => u3_addr_count(12),
      O => u3_addr_count_cmp_eq0000_wg_lut(1)
    );
  u3_addr_count_cmp_eq0000_wg_cy_1_Q : MUXCY
    port map (
      CI => u3_addr_count_cmp_eq0000_wg_cy(0),
      DI => A_22_OBUF_35,
      S => u3_addr_count_cmp_eq0000_wg_lut(1),
      O => u3_addr_count_cmp_eq0000_wg_cy(1)
    );
  u3_addr_count_cmp_eq0000_wg_lut_2_Q : LUT4
    generic map(
      INIT => X"0020"
    )
    port map (
      I0 => u3_addr_count(10),
      I1 => u3_addr_count(11),
      I2 => u3_addr_count(1),
      I3 => u3_addr_count(13),
      O => u3_addr_count_cmp_eq0000_wg_lut(2)
    );
  u3_addr_count_cmp_eq0000_wg_cy_2_Q : MUXCY
    port map (
      CI => u3_addr_count_cmp_eq0000_wg_cy(1),
      DI => A_22_OBUF_35,
      S => u3_addr_count_cmp_eq0000_wg_lut(2),
      O => u3_addr_count_cmp_eq0000_wg_cy(2)
    );
  u3_addr_count_cmp_eq0000_wg_lut_3_Q : LUT4
    generic map(
      INIT => X"2000"
    )
    port map (
      I0 => u3_addr_count(17),
      I1 => u3_addr_count(15),
      I2 => u3_addr_count(0),
      I3 => u3_addr_count(14),
      O => u3_addr_count_cmp_eq0000_wg_lut(3)
    );
  u3_addr_count_cmp_eq0000_wg_cy_3_Q : MUXCY
    port map (
      CI => u3_addr_count_cmp_eq0000_wg_cy(2),
      DI => A_22_OBUF_35,
      S => u3_addr_count_cmp_eq0000_wg_lut(3),
      O => u3_addr_count_cmp_eq0000_wg_cy(3)
    );
  u3_addr_count_cmp_eq0000_wg_lut_4_Q : LUT4
    generic map(
      INIT => X"0002"
    )
    port map (
      I0 => u3_addr_count(2),
      I1 => u3_addr_count(16),
      I2 => u3_addr_count(18),
      I3 => u3_addr_count(19),
      O => u3_addr_count_cmp_eq0000_wg_lut(4)
    );
  u3_addr_count_cmp_eq0000_wg_cy_4_Q : MUXCY
    port map (
      CI => u3_addr_count_cmp_eq0000_wg_cy(3),
      DI => A_22_OBUF_35,
      S => u3_addr_count_cmp_eq0000_wg_lut(4),
      O => u3_addr_count_cmp_eq0000
    );
  u6_outp_2_1 : LUT3
    generic map(
      INIT => X"80"
    )
    port map (
      I0 => u6_delay3_2_Q,
      I1 => u6_delay2_2_Q,
      I2 => u6_delay1_2_Q,
      O => btnd_2_Q
    );
  u6_outp_0_1 : LUT3
    generic map(
      INIT => X"80"
    )
    port map (
      I0 => u6_delay3_0_Q,
      I1 => u6_delay2_0_Q,
      I2 => u6_delay1_0_Q,
      O => btnd_0_Q
    );
  u3_pixel_mux0001_9_1 : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => u1_q_18,
      I1 => N47,
      I2 => N39,
      O => u3_pixel_mux0001(9)
    );
  u3_pixel_mux0001_8_1 : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => u1_q_18,
      I1 => N48,
      I2 => N40,
      O => u3_pixel_mux0001(8)
    );
  u3_pixel_mux0001_15_1 : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => u1_q_18,
      I1 => N41,
      I2 => N33,
      O => u3_pixel_mux0001(15)
    );
  u3_pixel_mux0001_14_1 : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => u1_q_18,
      I1 => N42,
      I2 => N34,
      O => u3_pixel_mux0001(14)
    );
  u3_pixel_mux0001_13_1 : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => u1_q_18,
      I1 => N43,
      I2 => N35,
      O => u3_pixel_mux0001(13)
    );
  u3_pixel_mux0001_12_1 : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => u1_q_18,
      I1 => N44,
      I2 => N36,
      O => u3_pixel_mux0001(12)
    );
  u3_pixel_mux0001_11_1 : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => u1_q_18,
      I1 => N45,
      I2 => N37,
      O => u3_pixel_mux0001(11)
    );
  u3_pixel_mux0001_10_1 : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => u1_q_18,
      I1 => N46,
      I2 => N38,
      O => u3_pixel_mux0001(10)
    );
  u8_Madd_ram_addrR11 : LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => sw_4_IBUF_168,
      I1 => sw_6_IBUF_170,
      O => u8_Madd_ram_addrR1
    );
  u8_Madd_ram_addr_Madd_cy_14_1 : LUT4
    generic map(
      INIT => X"C080"
    )
    port map (
      I0 => sw_4_IBUF_168,
      I1 => sw_7_IBUF_171,
      I2 => sw_6_IBUF_170,
      I3 => sw_5_IBUF_169,
      O => u8_Madd_ram_addr_Madd_cy_14_Q
    );
  u8_Madd_ram_addr_Madd_lut_12_11 : LUT4
    generic map(
      INIT => X"963C"
    )
    port map (
      I0 => sw_6_IBUF_170,
      I1 => sw_7_IBUF_171,
      I2 => sw_5_IBUF_169,
      I3 => sw_4_IBUF_168,
      O => u8_Madd_ram_addr_Madd_lut_12_Q
    );
  u8_ram_addr_16_1 : LUT4
    generic map(
      INIT => X"644C"
    )
    port map (
      I0 => sw_6_IBUF_170,
      I1 => sw_7_IBUF_171,
      I2 => sw_5_IBUF_169,
      I3 => sw_4_IBUF_168,
      O => u8_ram_addr_16_Q
    );
  u8_ram_addr_15_1 : LUT4
    generic map(
      INIT => X"246C"
    )
    port map (
      I0 => sw_5_IBUF_169,
      I1 => sw_6_IBUF_170,
      I2 => sw_7_IBUF_171,
      I3 => sw_4_IBUF_168,
      O => u8_ram_addr_15_Q
    );
  u2_hsync1 : LUT3
    generic map(
      INIT => X"FE"
    )
    port map (
      I0 => u2_hcs(7),
      I1 => u2_hcs(8),
      I2 => u2_hcs(9),
      O => hsync_OBUF_146
    );
  u7_y_3_1 : LUT4
    generic map(
      INIT => X"A820"
    )
    port map (
      I0 => u8_donep_637,
      I1 => u5_done_out_573,
      I2 => u5_addr_count(3),
      I3 => u3_addr_count(3),
      O => A_3_OBUF_37
    );
  u7_y_2_1 : LUT4
    generic map(
      INIT => X"A820"
    )
    port map (
      I0 => u8_donep_637,
      I1 => u5_done_out_573,
      I2 => u5_addr_count(2),
      I3 => u3_addr_count(2),
      O => A_2_OBUF_36
    );
  u7_y_1_1 : LUT4
    generic map(
      INIT => X"A820"
    )
    port map (
      I0 => u8_donep_637,
      I1 => u5_done_out_573,
      I2 => u5_addr_count(1),
      I3 => u3_addr_count(1),
      O => A_1_OBUF_34
    );
  u7_y_19_1 : LUT4
    generic map(
      INIT => X"A820"
    )
    port map (
      I0 => u8_donep_637,
      I1 => u5_done_out_573,
      I2 => u5_addr_count(19),
      I3 => u3_addr_count(19),
      O => A_19_OBUF_33
    );
  u7_y_18_1 : LUT4
    generic map(
      INIT => X"A820"
    )
    port map (
      I0 => u8_donep_637,
      I1 => u5_done_out_573,
      I2 => u5_addr_count(18),
      I3 => u3_addr_count(18),
      O => A_18_OBUF_32
    );
  u7_y_10_1 : LUT4
    generic map(
      INIT => X"A820"
    )
    port map (
      I0 => u8_donep_637,
      I1 => u5_done_out_573,
      I2 => u5_addr_count(10),
      I3 => u3_addr_count(10),
      O => A_10_OBUF_24
    );
  u7_y_0_1 : LUT4
    generic map(
      INIT => X"A820"
    )
    port map (
      I0 => u8_donep_637,
      I1 => u5_done_out_573,
      I2 => u5_addr_count(0),
      I3 => u3_addr_count(0),
      O => A_0_OBUF_23
    );
  u10_y_9_1 : LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => u8_datap(9),
      I1 => u8_donep_637,
      O => Din1_9_Q
    );
  u10_y_8_1 : LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => u8_datap(8),
      I1 => u8_donep_637,
      O => Din1_8_Q
    );
  u10_y_15_1 : LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => u8_datap(15),
      I1 => u8_donep_637,
      O => Din1_15_Q
    );
  u10_y_14_1 : LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => u8_datap(14),
      I1 => u8_donep_637,
      O => Din1_14_Q
    );
  u10_y_13_1 : LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => u8_datap(13),
      I1 => u8_donep_637,
      O => Din1_13_Q
    );
  u10_y_12_1 : LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => u8_datap(12),
      I1 => u8_donep_637,
      O => Din1_12_Q
    );
  u10_y_11_1 : LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => u8_datap(11),
      I1 => u8_donep_637,
      O => Din1_11_Q
    );
  u10_y_10_1 : LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => u8_datap(10),
      I1 => u8_donep_637,
      O => Din1_10_Q
    );
  u8_state_FSM_FFd7_In1 : LUT3
    generic map(
      INIT => X"32"
    )
    port map (
      I0 => u8_state_FSM_FFd7_652,
      I1 => btnd_0_Q,
      I2 => u8_state_FSM_FFd1_644,
      O => u8_state_FSM_FFd7_In
    );
  u8_state_FSM_FFd1_In1 : LUT3
    generic map(
      INIT => X"F8"
    )
    port map (
      I0 => btnd_0_Q,
      I1 => u8_state_FSM_FFd1_644,
      I2 => u8_state_FSM_FFd2_646,
      O => u8_state_FSM_FFd1_In
    );
  u5_state_FSM_FFd2_In1 : LUT3
    generic map(
      INIT => X"BA"
    )
    port map (
      I0 => btnd_2_Q,
      I1 => u5_state_FSM_FFd1_575,
      I2 => u5_state_FSM_FFd2_578,
      O => u5_state_FSM_FFd2_In
    );
  u8_datap_and00001 : LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => u8_state_FSM_FFd4_648,
      I1 => btn_3_IBUF_136,
      O => u8_datap_and0000
    );
  u8_data_and00001 : LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => u8_state_FSM_FFd5_649,
      I1 => btn_3_IBUF_136,
      O => u8_data_and0000
    );
  u2_vsync_SW0 : LUT3
    generic map(
      INIT => X"FE"
    )
    port map (
      I0 => u2_vcs(3),
      I1 => u2_vcs(2),
      I2 => u2_vcs(1),
      O => N27
    );
  u2_vsync : LUT4
    generic map(
      INIT => X"FEFF"
    )
    port map (
      I0 => N27,
      I1 => u2_vcs(9),
      I2 => u2_vcs(4),
      I3 => u2_N2,
      O => vsync_OBUF_657
    );
  en1 : LUT2
    generic map(
      INIT => X"7"
    )
    port map (
      I0 => u5_done_out_573,
      I1 => u8_donep_637,
      O => OE_L_OBUF_102
    );
  u8_Madd_ram_addr_Madd_lut_5_1 : LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => sw_2_IBUF_166,
      I1 => sw_3_IBUF_167,
      O => u8_Madd_ram_addr_Madd_lut_5_Q
    );
  u8_donep_mux00005 : LUT3
    generic map(
      INIT => X"BA"
    )
    port map (
      I0 => u8_state_FSM_FFd1_644,
      I1 => btnd_0_Q,
      I2 => u8_state_FSM_FFd7_652,
      O => u8_donep_mux00005_640
    );
  u8_donep_mux000028 : LUT4
    generic map(
      INIT => X"FFA8"
    )
    port map (
      I0 => u8_donep_637,
      I1 => u8_donep_mux00005_640,
      I2 => u8_donep_mux000010_639,
      I3 => u8_state_FSM_FFd2_646,
      O => u8_donep_mux0000
    );
  u2_Mcount_vcs_eqn_01 : LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => u2_Result(0),
      I1 => u2_vcs_cmp_eq0000_332,
      O => u2_Mcount_vcs_eqn_0
    );
  u2_vcs_cmp_eq000011 : LUT4
    generic map(
      INIT => X"0001"
    )
    port map (
      I0 => u2_vcs(8),
      I1 => u2_vcs(6),
      I2 => u2_vcs(5),
      I3 => u2_vcs(7),
      O => u2_N2
    );
  u2_hcs_cmp_eq000012 : LUT3
    generic map(
      INIT => X"80"
    )
    port map (
      I0 => N75,
      I1 => u2_hcs_cmp_eq00002_321,
      I2 => u2_hcs_cmp_eq000010_320,
      O => u2_hcs_cmp_eq0000
    );
  u3_Mcount_addr_count_eqn_01 : LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => u3_Result(0),
      I1 => u3_addr_count_cmp_eq0000,
      O => u3_Mcount_addr_count_eqn_0
    );
  u3_addr_count_not00011 : LUT2
    generic map(
      INIT => X"E"
    )
    port map (
      I0 => vidon,
      I1 => u3_addr_count_cmp_eq0000,
      O => u3_addr_count_not0001
    );
  u3_Mcount_addr_count_eqn_110 : LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => u3_Result(1),
      I1 => u3_addr_count_cmp_eq0000,
      O => u3_Mcount_addr_count_eqn_1
    );
  u3_Mcount_addr_count_eqn_21 : LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => u3_Result(2),
      I1 => u3_addr_count_cmp_eq0000,
      O => u3_Mcount_addr_count_eqn_2
    );
  u3_Mcount_addr_count_eqn_31 : LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => u3_Result(3),
      I1 => u3_addr_count_cmp_eq0000,
      O => u3_Mcount_addr_count_eqn_3
    );
  u2_Mcount_vcs_eqn_31 : LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => u2_Result(3),
      I1 => u2_vcs_cmp_eq0000_332,
      O => u2_Mcount_vcs_eqn_3
    );
  u2_Mcount_vcs_eqn_21 : LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => u2_Result(2),
      I1 => u2_vcs_cmp_eq0000_332,
      O => u2_Mcount_vcs_eqn_2
    );
  u2_Mcount_vcs_eqn_11 : LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => u2_Result(1),
      I1 => u2_vcs_cmp_eq0000_332,
      O => u2_Mcount_vcs_eqn_1
    );
  u3_Mcount_addr_count_eqn_41 : LUT2
    generic map(
      INIT => X"4"
    )
    port map (
      I0 => u3_addr_count_cmp_eq0000,
      I1 => u3_Result(4),
      O => u3_Mcount_addr_count_eqn_4
    );
  u2_Mcount_vcs_eqn_41 : LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => u2_Result(4),
      I1 => u2_vcs_cmp_eq0000_332,
      O => u2_Mcount_vcs_eqn_4
    );
  u3_Mcount_addr_count_eqn_51 : LUT2
    generic map(
      INIT => X"4"
    )
    port map (
      I0 => u3_addr_count_cmp_eq0000,
      I1 => u3_Result(5),
      O => u3_Mcount_addr_count_eqn_5
    );
  u2_Mcount_vcs_eqn_51 : LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => u2_Result(5),
      I1 => u2_vcs_cmp_eq0000_332,
      O => u2_Mcount_vcs_eqn_5
    );
  u3_Mcount_addr_count_eqn_61 : LUT2
    generic map(
      INIT => X"4"
    )
    port map (
      I0 => u3_addr_count_cmp_eq0000,
      I1 => u3_Result(6),
      O => u3_Mcount_addr_count_eqn_6
    );
  u2_Mcount_vcs_eqn_61 : LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => u2_Result(6),
      I1 => u2_vcs_cmp_eq0000_332,
      O => u2_Mcount_vcs_eqn_6
    );
  u3_Mcount_addr_count_eqn_71 : LUT2
    generic map(
      INIT => X"4"
    )
    port map (
      I0 => u3_addr_count_cmp_eq0000,
      I1 => u3_Result(7),
      O => u3_Mcount_addr_count_eqn_7
    );
  u2_Mcount_vcs_eqn_71 : LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => u2_Result(7),
      I1 => u2_vcs_cmp_eq0000_332,
      O => u2_Mcount_vcs_eqn_7
    );
  u3_Mcount_addr_count_eqn_81 : LUT2
    generic map(
      INIT => X"4"
    )
    port map (
      I0 => u3_addr_count_cmp_eq0000,
      I1 => u3_Result(8),
      O => u3_Mcount_addr_count_eqn_8
    );
  u2_Mcount_vcs_eqn_81 : LUT2
    generic map(
      INIT => X"4"
    )
    port map (
      I0 => N77,
      I1 => u2_Result(8),
      O => u2_Mcount_vcs_eqn_8
    );
  u3_Mcount_addr_count_eqn_91 : LUT2
    generic map(
      INIT => X"4"
    )
    port map (
      I0 => u3_addr_count_cmp_eq0000,
      I1 => u3_Result(9),
      O => u3_Mcount_addr_count_eqn_9
    );
  u2_Mcount_vcs_eqn_91 : LUT2
    generic map(
      INIT => X"4"
    )
    port map (
      I0 => u2_vcs_cmp_eq0000_332,
      I1 => u2_Result(9),
      O => u2_Mcount_vcs_eqn_9
    );
  u5_addr_count_mux0000_19_1 : LUT4
    generic map(
      INIT => X"F888"
    )
    port map (
      I0 => u5_addr_count(0),
      I1 => u5_state_FSM_FFd1_575,
      I2 => u5_addr_count_addsub0000(0),
      I3 => N76,
      O => u5_addr_count_mux0000(19)
    );
  u5_addr_count_mux0000_18_1 : LUT4
    generic map(
      INIT => X"F888"
    )
    port map (
      I0 => u5_addr_count(1),
      I1 => u5_state_FSM_FFd1_575,
      I2 => u5_addr_count_addsub0000(1),
      I3 => u5_N2,
      O => u5_addr_count_mux0000(18)
    );
  u5_addr_count_mux0000_17_1 : LUT4
    generic map(
      INIT => X"F888"
    )
    port map (
      I0 => u5_addr_count(2),
      I1 => u5_state_FSM_FFd1_575,
      I2 => u5_addr_count_addsub0000(2),
      I3 => u5_N2,
      O => u5_addr_count_mux0000(17)
    );
  u5_addr_count_mux0000_16_1 : LUT4
    generic map(
      INIT => X"F888"
    )
    port map (
      I0 => u5_addr_count(3),
      I1 => u5_state_FSM_FFd1_575,
      I2 => u5_addr_count_addsub0000(3),
      I3 => u5_N2,
      O => u5_addr_count_mux0000(16)
    );
  u5_addr_count_mux0000_15_1 : LUT4
    generic map(
      INIT => X"F888"
    )
    port map (
      I0 => u5_addr_count(4),
      I1 => u5_state_FSM_FFd1_575,
      I2 => u5_addr_count_addsub0000(4),
      I3 => u5_N2,
      O => u5_addr_count_mux0000(15)
    );
  u5_addr_count_mux0000_14_1 : LUT4
    generic map(
      INIT => X"F888"
    )
    port map (
      I0 => u5_addr_count(5),
      I1 => u5_state_FSM_FFd1_575,
      I2 => u5_addr_count_addsub0000(5),
      I3 => u5_N2,
      O => u5_addr_count_mux0000(14)
    );
  u5_addr_count_mux0000_13_1 : LUT4
    generic map(
      INIT => X"F888"
    )
    port map (
      I0 => u5_addr_count(6),
      I1 => u5_state_FSM_FFd1_575,
      I2 => u5_addr_count_addsub0000(6),
      I3 => u5_N2,
      O => u5_addr_count_mux0000(13)
    );
  u5_addr_count_mux0000_12_1 : LUT4
    generic map(
      INIT => X"F888"
    )
    port map (
      I0 => u5_addr_count(7),
      I1 => u5_state_FSM_FFd1_575,
      I2 => u5_addr_count_addsub0000(7),
      I3 => u5_N2,
      O => u5_addr_count_mux0000(12)
    );
  u5_addr_count_mux0000_11_1 : LUT4
    generic map(
      INIT => X"F888"
    )
    port map (
      I0 => u5_addr_count(8),
      I1 => u5_state_FSM_FFd1_575,
      I2 => u5_addr_count_addsub0000(8),
      I3 => u5_N2,
      O => u5_addr_count_mux0000(11)
    );
  u5_addr_count_mux0000_10_1 : LUT4
    generic map(
      INIT => X"F888"
    )
    port map (
      I0 => u5_addr_count(9),
      I1 => u5_state_FSM_FFd1_575,
      I2 => u5_addr_count_addsub0000(9),
      I3 => u5_N2,
      O => u5_addr_count_mux0000(10)
    );
  u5_state_FSM_FFd1_In2 : LUT4
    generic map(
      INIT => X"ACA0"
    )
    port map (
      I0 => btnd_2_Q,
      I1 => u5_state_FSM_FFd2_578,
      I2 => u5_state_FSM_FFd1_575,
      I3 => N78,
      O => u5_state_FSM_FFd1_In
    );
  u5_done_out_mux00021 : LUT4
    generic map(
      INIT => X"FDF1"
    )
    port map (
      I0 => btnd_2_Q,
      I1 => u5_state_FSM_FFd2_578,
      I2 => u5_state_FSM_FFd1_575,
      I3 => u5_N11,
      O => u5_done_out_mux0002
    );
  u5_addr_count_mux0000_0_215 : LUT4
    generic map(
      INIT => X"1F3F"
    )
    port map (
      I0 => u5_addr_count(11),
      I1 => u5_addr_count(13),
      I2 => u5_addr_count(14),
      I3 => u5_addr_count(12),
      O => u5_addr_count_mux0000_0_215_551
    );
  u5_addr_count_mux0000_0_219 : LUT2
    generic map(
      INIT => X"1"
    )
    port map (
      I0 => u5_addr_count(15),
      I1 => u5_addr_count(16),
      O => u5_addr_count_mux0000_0_219_552
    );
  u5_addr_count_mux0000_0_252 : LUT4
    generic map(
      INIT => X"0002"
    )
    port map (
      I0 => u5_state_FSM_FFd2_578,
      I1 => u5_addr_count(19),
      I2 => u5_addr_count(18),
      I3 => u5_state_FSM_FFd1_575,
      O => u5_addr_count_mux0000_0_252_553
    );
  u3_Mcount_addr_count_eqn_101 : LUT2
    generic map(
      INIT => X"4"
    )
    port map (
      I0 => u3_addr_count_cmp_eq0000,
      I1 => u3_Result(10),
      O => u3_Mcount_addr_count_eqn_10
    );
  u5_addr_count_mux0000_9_1 : LUT4
    generic map(
      INIT => X"F888"
    )
    port map (
      I0 => u5_addr_count(10),
      I1 => u5_state_FSM_FFd1_575,
      I2 => u5_addr_count_addsub0000(10),
      I3 => u5_N2,
      O => u5_addr_count_mux0000(9)
    );
  u3_Mcount_addr_count_eqn_111 : LUT2
    generic map(
      INIT => X"4"
    )
    port map (
      I0 => u3_addr_count_cmp_eq0000,
      I1 => u3_Result(11),
      O => u3_Mcount_addr_count_eqn_11
    );
  u5_addr_count_mux0000_8_1 : LUT4
    generic map(
      INIT => X"F888"
    )
    port map (
      I0 => u5_addr_count(11),
      I1 => u5_state_FSM_FFd1_575,
      I2 => u5_addr_count_addsub0000(11),
      I3 => u5_N2,
      O => u5_addr_count_mux0000(8)
    );
  u2_vidon_and00001 : LUT2
    generic map(
      INIT => X"E"
    )
    port map (
      I0 => u2_vcs(6),
      I1 => u2_vcs(7),
      O => u2_vidon_and00001_333
    );
  u2_vidon_and000094 : LUT4
    generic map(
      INIT => X"5DFF"
    )
    port map (
      I0 => u2_hcs(9),
      I1 => u2_N3,
      I2 => u2_hcs(4),
      I3 => u2_hcs(8),
      O => u2_vidon_and000094_340
    );
  u2_vidon_and0000129 : LUT3
    generic map(
      INIT => X"80"
    )
    port map (
      I0 => u2_vidon_and000073_339,
      I1 => u2_vidon_and000094_340,
      I2 => u2_vidon_and0000110_334,
      O => vidon
    );
  u3_Mcount_addr_count_eqn_121 : LUT2
    generic map(
      INIT => X"4"
    )
    port map (
      I0 => u3_addr_count_cmp_eq0000,
      I1 => u3_Result(12),
      O => u3_Mcount_addr_count_eqn_12
    );
  u5_addr_count_mux0000_7_1 : LUT4
    generic map(
      INIT => X"F888"
    )
    port map (
      I0 => u5_addr_count(12),
      I1 => u5_state_FSM_FFd1_575,
      I2 => u5_addr_count_addsub0000(12),
      I3 => u5_N2,
      O => u5_addr_count_mux0000(7)
    );
  u3_Mcount_addr_count_eqn_131 : LUT2
    generic map(
      INIT => X"4"
    )
    port map (
      I0 => u3_addr_count_cmp_eq0000,
      I1 => u3_Result(13),
      O => u3_Mcount_addr_count_eqn_13
    );
  u5_addr_count_mux0000_6_1 : LUT4
    generic map(
      INIT => X"F888"
    )
    port map (
      I0 => u5_addr_count(13),
      I1 => u5_state_FSM_FFd1_575,
      I2 => u5_addr_count_addsub0000(13),
      I3 => u5_N2,
      O => u5_addr_count_mux0000(6)
    );
  u3_Mcount_addr_count_eqn_141 : LUT2
    generic map(
      INIT => X"4"
    )
    port map (
      I0 => u3_addr_count_cmp_eq0000,
      I1 => u3_Result(14),
      O => u3_Mcount_addr_count_eqn_14
    );
  u5_addr_count_mux0000_5_1 : LUT4
    generic map(
      INIT => X"F888"
    )
    port map (
      I0 => u5_addr_count(14),
      I1 => u5_state_FSM_FFd1_575,
      I2 => u5_addr_count_addsub0000(14),
      I3 => u5_N2,
      O => u5_addr_count_mux0000(5)
    );
  u3_Mcount_addr_count_eqn_151 : LUT2
    generic map(
      INIT => X"4"
    )
    port map (
      I0 => u3_addr_count_cmp_eq0000,
      I1 => u3_Result(15),
      O => u3_Mcount_addr_count_eqn_15
    );
  u5_addr_count_mux0000_4_1 : LUT4
    generic map(
      INIT => X"F888"
    )
    port map (
      I0 => u5_addr_count(15),
      I1 => u5_state_FSM_FFd1_575,
      I2 => u5_addr_count_addsub0000(15),
      I3 => u5_N2,
      O => u5_addr_count_mux0000(4)
    );
  u3_Mcount_addr_count_eqn_161 : LUT2
    generic map(
      INIT => X"4"
    )
    port map (
      I0 => u3_addr_count_cmp_eq0000,
      I1 => u3_Result(16),
      O => u3_Mcount_addr_count_eqn_16
    );
  u5_addr_count_mux0000_3_1 : LUT4
    generic map(
      INIT => X"F888"
    )
    port map (
      I0 => u5_addr_count(16),
      I1 => u5_state_FSM_FFd1_575,
      I2 => u5_addr_count_addsub0000(16),
      I3 => u5_N2,
      O => u5_addr_count_mux0000(3)
    );
  u3_Mcount_addr_count_eqn_171 : LUT2
    generic map(
      INIT => X"4"
    )
    port map (
      I0 => u3_addr_count_cmp_eq0000,
      I1 => u3_Result(17),
      O => u3_Mcount_addr_count_eqn_17
    );
  u5_addr_count_mux0000_2_1 : LUT4
    generic map(
      INIT => X"F888"
    )
    port map (
      I0 => u5_addr_count(17),
      I1 => u5_state_FSM_FFd1_575,
      I2 => u5_addr_count_addsub0000(17),
      I3 => u5_N2,
      O => u5_addr_count_mux0000(2)
    );
  u3_Mcount_addr_count_eqn_181 : LUT2
    generic map(
      INIT => X"4"
    )
    port map (
      I0 => u3_addr_count_cmp_eq0000,
      I1 => u3_Result(18),
      O => u3_Mcount_addr_count_eqn_18
    );
  u5_addr_count_mux0000_1_1 : LUT4
    generic map(
      INIT => X"F888"
    )
    port map (
      I0 => u5_addr_count(18),
      I1 => u5_state_FSM_FFd1_575,
      I2 => u5_addr_count_addsub0000(18),
      I3 => u5_N2,
      O => u5_addr_count_mux0000(1)
    );
  u3_Mcount_addr_count_eqn_191 : LUT2
    generic map(
      INIT => X"4"
    )
    port map (
      I0 => u3_addr_count_cmp_eq0000,
      I1 => u3_Result(19),
      O => u3_Mcount_addr_count_eqn_19
    );
  u5_addr_count_mux0000_0_1 : LUT4
    generic map(
      INIT => X"F888"
    )
    port map (
      I0 => u5_addr_count(19),
      I1 => u5_state_FSM_FFd1_575,
      I2 => u5_addr_count_addsub0000(19),
      I3 => u5_N2,
      O => u5_addr_count_mux0000(0)
    );
  mclk_IBUF : IBUF
    port map (
      I => mclk,
      O => mclk_IBUF1
    );
  btn_3_IBUF : IBUF
    port map (
      I => btn(3),
      O => btn_3_IBUF_136
    );
  btn_2_IBUF : IBUF
    port map (
      I => btn(2),
      O => btn_2_IBUF_135
    );
  btn_0_IBUF : IBUF
    port map (
      I => btn(0),
      O => btn_0_IBUF_134
    );
  sw_7_IBUF : IBUF
    port map (
      I => sw(7),
      O => sw_7_IBUF_171
    );
  sw_6_IBUF : IBUF
    port map (
      I => sw(6),
      O => sw_6_IBUF_170
    );
  sw_5_IBUF : IBUF
    port map (
      I => sw(5),
      O => sw_5_IBUF_169
    );
  sw_4_IBUF : IBUF
    port map (
      I => sw(4),
      O => sw_4_IBUF_168
    );
  sw_3_IBUF : IBUF
    port map (
      I => sw(3),
      O => sw_3_IBUF_167
    );
  sw_2_IBUF : IBUF
    port map (
      I => sw(2),
      O => sw_2_IBUF_166
    );
  sw_1_IBUF : IBUF
    port map (
      I => sw(1),
      O => sw_1_IBUF_165
    );
  sw_0_IBUF : IBUF
    port map (
      I => sw(0),
      O => sw_0_IBUF_164
    );
  DQ_15_IOBUF : IOBUF
    port map (
      I => Din1_15_Q,
      T => u4_en_inv,
      O => N33,
      IO => DQ(15)
    );
  DQ_14_IOBUF : IOBUF
    port map (
      I => Din1_14_Q,
      T => u4_en_inv,
      O => N34,
      IO => DQ(14)
    );
  DQ_13_IOBUF : IOBUF
    port map (
      I => Din1_13_Q,
      T => u4_en_inv,
      O => N35,
      IO => DQ(13)
    );
  DQ_12_IOBUF : IOBUF
    port map (
      I => Din1_12_Q,
      T => u4_en_inv,
      O => N36,
      IO => DQ(12)
    );
  DQ_11_IOBUF : IOBUF
    port map (
      I => Din1_11_Q,
      T => u4_en_inv,
      O => N37,
      IO => DQ(11)
    );
  DQ_10_IOBUF : IOBUF
    port map (
      I => Din1_10_Q,
      T => u4_en_inv,
      O => N38,
      IO => DQ(10)
    );
  DQ_9_IOBUF : IOBUF
    port map (
      I => Din1_9_Q,
      T => u4_en_inv,
      O => N39,
      IO => DQ(9)
    );
  DQ_8_IOBUF : IOBUF
    port map (
      I => Din1_8_Q,
      T => u4_en_inv,
      O => N40,
      IO => DQ(8)
    );
  DQ_7_IOBUF : IOBUF
    port map (
      I => Din1_0_Q,
      T => u4_en_inv,
      O => N41,
      IO => DQ(7)
    );
  DQ_6_IOBUF : IOBUF
    port map (
      I => Din1_0_Q,
      T => u4_en_inv,
      O => N42,
      IO => DQ(6)
    );
  DQ_5_IOBUF : IOBUF
    port map (
      I => Din1_0_Q,
      T => u4_en_inv,
      O => N43,
      IO => DQ(5)
    );
  DQ_4_IOBUF : IOBUF
    port map (
      I => Din1_0_Q,
      T => u4_en_inv,
      O => N44,
      IO => DQ(4)
    );
  DQ_3_IOBUF : IOBUF
    port map (
      I => Din1_0_Q,
      T => u4_en_inv,
      O => N45,
      IO => DQ(3)
    );
  DQ_2_IOBUF : IOBUF
    port map (
      I => Din1_0_Q,
      T => u4_en_inv,
      O => N46,
      IO => DQ(2)
    );
  DQ_1_IOBUF : IOBUF
    port map (
      I => Din1_0_Q,
      T => u4_en_inv,
      O => N47,
      IO => DQ(1)
    );
  DQ_0_IOBUF : IOBUF
    port map (
      I => Din1_0_Q,
      T => u4_en_inv,
      O => N48,
      IO => DQ(0)
    );
  RamCLK_OBUF : OBUF
    port map (
      I => A_22_OBUF_35,
      O => RamCLK
    );
  WE_L_OBUF : OBUF
    port map (
      I => WE_L_OBUF_126,
      O => WE_L
    );
  vsync_OBUF : OBUF
    port map (
      I => vsync_OBUF_657,
      O => vsync
    );
  CE_L_OBUF : OBUF
    port map (
      I => A_22_OBUF_35,
      O => CE_L
    );
  RamCRE_OBUF : OBUF
    port map (
      I => A_22_OBUF_35,
      O => RamCRE
    );
  FlashCE_L_OBUF : OBUF
    port map (
      I => FlashCE_L_OBUF_71,
      O => FlashCE_L
    );
  UB_L_OBUF : OBUF
    port map (
      I => A_22_OBUF_35,
      O => UB_L
    );
  RamADV_L_OBUF : OBUF
    port map (
      I => A_22_OBUF_35,
      O => RamADV_L
    );
  LB_L_OBUF : OBUF
    port map (
      I => A_22_OBUF_35,
      O => LB_L
    );
  hsync_OBUF : OBUF
    port map (
      I => hsync_OBUF_146,
      O => hsync
    );
  OE_L_OBUF : OBUF
    port map (
      I => OE_L_OBUF_102,
      O => OE_L
    );
  blue_1_OBUF : OBUF
    port map (
      I => blue_1_OBUF_130,
      O => blue(1)
    );
  blue_0_OBUF : OBUF
    port map (
      I => blue_0_OBUF_129,
      O => blue(0)
    );
  green_2_OBUF : OBUF
    port map (
      I => green_2_OBUF_144,
      O => green(2)
    );
  green_1_OBUF : OBUF
    port map (
      I => green_1_OBUF_143,
      O => green(1)
    );
  green_0_OBUF : OBUF
    port map (
      I => green_0_OBUF_142,
      O => green(0)
    );
  A_22_OBUF : OBUF
    port map (
      I => A_22_OBUF_35,
      O => A(22)
    );
  A_21_OBUF : OBUF
    port map (
      I => A_22_OBUF_35,
      O => A(21)
    );
  A_20_OBUF : OBUF
    port map (
      I => A_22_OBUF_35,
      O => A(20)
    );
  A_19_OBUF : OBUF
    port map (
      I => A_19_OBUF_33,
      O => A(19)
    );
  A_18_OBUF : OBUF
    port map (
      I => A_18_OBUF_32,
      O => A(18)
    );
  A_17_OBUF : OBUF
    port map (
      I => A_17_OBUF_31,
      O => A(17)
    );
  A_16_OBUF : OBUF
    port map (
      I => A_16_OBUF_30,
      O => A(16)
    );
  A_15_OBUF : OBUF
    port map (
      I => A_15_OBUF_29,
      O => A(15)
    );
  A_14_OBUF : OBUF
    port map (
      I => A_14_OBUF_28,
      O => A(14)
    );
  A_13_OBUF : OBUF
    port map (
      I => A_13_OBUF_27,
      O => A(13)
    );
  A_12_OBUF : OBUF
    port map (
      I => A_12_OBUF_26,
      O => A(12)
    );
  A_11_OBUF : OBUF
    port map (
      I => A_11_OBUF_25,
      O => A(11)
    );
  A_10_OBUF : OBUF
    port map (
      I => A_10_OBUF_24,
      O => A(10)
    );
  A_9_OBUF : OBUF
    port map (
      I => A_9_OBUF_43,
      O => A(9)
    );
  A_8_OBUF : OBUF
    port map (
      I => A_8_OBUF_42,
      O => A(8)
    );
  A_7_OBUF : OBUF
    port map (
      I => A_7_OBUF_41,
      O => A(7)
    );
  A_6_OBUF : OBUF
    port map (
      I => A_6_OBUF_40,
      O => A(6)
    );
  A_5_OBUF : OBUF
    port map (
      I => A_5_OBUF_39,
      O => A(5)
    );
  A_4_OBUF : OBUF
    port map (
      I => A_4_OBUF_38,
      O => A(4)
    );
  A_3_OBUF : OBUF
    port map (
      I => A_3_OBUF_37,
      O => A(3)
    );
  A_2_OBUF : OBUF
    port map (
      I => A_2_OBUF_36,
      O => A(2)
    );
  A_1_OBUF : OBUF
    port map (
      I => A_1_OBUF_34,
      O => A(1)
    );
  A_0_OBUF : OBUF
    port map (
      I => A_0_OBUF_23,
      O => A(0)
    );
  red_2_OBUF : OBUF
    port map (
      I => red_2_OBUF_155,
      O => red(2)
    );
  red_1_OBUF : OBUF
    port map (
      I => red_1_OBUF_154,
      O => red(1)
    );
  red_0_OBUF : OBUF
    port map (
      I => red_0_OBUF_153,
      O => red(0)
    );
  u1_Mcount_q_cy_1_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => u1_q_18,
      O => u1_Mcount_q_cy_1_rt_188
    );
  u1_Mcount_q_cy_2_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => u1_q(2),
      O => u1_Mcount_q_cy_2_rt_190
    );
  u1_Mcount_q_cy_3_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => u1_q(3),
      O => u1_Mcount_q_cy_3_rt_192
    );
  u1_Mcount_q_cy_4_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => u1_q(4),
      O => u1_Mcount_q_cy_4_rt_194
    );
  u1_Mcount_q_cy_5_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => u1_q(5),
      O => u1_Mcount_q_cy_5_rt_196
    );
  u1_Mcount_q_cy_6_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => u1_q(6),
      O => u1_Mcount_q_cy_6_rt_198
    );
  u1_Mcount_q_cy_7_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => u1_q(7),
      O => u1_Mcount_q_cy_7_rt_200
    );
  u1_Mcount_q_cy_8_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => u1_q(8),
      O => u1_Mcount_q_cy_8_rt_202
    );
  u1_Mcount_q_cy_9_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => u1_q(9),
      O => u1_Mcount_q_cy_9_rt_204
    );
  u1_Mcount_q_cy_10_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => u1_q(10),
      O => u1_Mcount_q_cy_10_rt_174
    );
  u1_Mcount_q_cy_11_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => u1_q(11),
      O => u1_Mcount_q_cy_11_rt_176
    );
  u1_Mcount_q_cy_12_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => u1_q(12),
      O => u1_Mcount_q_cy_12_rt_178
    );
  u1_Mcount_q_cy_13_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => u1_q(13),
      O => u1_Mcount_q_cy_13_rt_180
    );
  u1_Mcount_q_cy_14_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => u1_q(14),
      O => u1_Mcount_q_cy_14_rt_182
    );
  u1_Mcount_q_cy_15_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => u1_q(15),
      O => u1_Mcount_q_cy_15_rt_184
    );
  u1_Mcount_q_cy_16_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => u1_q(16),
      O => u1_Mcount_q_cy_16_rt_186
    );
  u2_Mcount_hcs_cy_8_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => u2_hcs(8),
      O => u2_Mcount_hcs_cy_8_rt_244
    );
  u2_Mcount_hcs_cy_7_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => u2_hcs(7),
      O => u2_Mcount_hcs_cy_7_rt_242
    );
  u2_Mcount_hcs_cy_6_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => u2_hcs(6),
      O => u2_Mcount_hcs_cy_6_rt_240
    );
  u2_Mcount_hcs_cy_5_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => u2_hcs(5),
      O => u2_Mcount_hcs_cy_5_rt_238
    );
  u2_Mcount_hcs_cy_4_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => u2_hcs(4),
      O => u2_Mcount_hcs_cy_4_rt_236
    );
  u2_Mcount_hcs_cy_3_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => u2_hcs(3),
      O => u2_Mcount_hcs_cy_3_rt_234
    );
  u2_Mcount_hcs_cy_2_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => u2_hcs(2),
      O => u2_Mcount_hcs_cy_2_rt_232
    );
  u2_Mcount_hcs_cy_1_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => u2_hcs(1),
      O => u2_Mcount_hcs_cy_1_rt_230
    );
  u2_Mcount_vcs_cy_8_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => u2_vcs(8),
      O => u2_Mcount_vcs_cy_8_rt_273
    );
  u2_Mcount_vcs_cy_7_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => u2_vcs(7),
      O => u2_Mcount_vcs_cy_7_rt_271
    );
  u2_Mcount_vcs_cy_6_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => u2_vcs(6),
      O => u2_Mcount_vcs_cy_6_rt_269
    );
  u2_Mcount_vcs_cy_5_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => u2_vcs(5),
      O => u2_Mcount_vcs_cy_5_rt_267
    );
  u2_Mcount_vcs_cy_4_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => u2_vcs(4),
      O => u2_Mcount_vcs_cy_4_rt_265
    );
  u2_Mcount_vcs_cy_3_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => u2_vcs(3),
      O => u2_Mcount_vcs_cy_3_rt_263
    );
  u2_Mcount_vcs_cy_2_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => u2_vcs(2),
      O => u2_Mcount_vcs_cy_2_rt_261
    );
  u2_Mcount_vcs_cy_1_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => u2_vcs(1),
      O => u2_Mcount_vcs_cy_1_rt_259
    );
  u3_Mcount_addr_count_cy_18_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => u3_addr_count(18),
      O => u3_Mcount_addr_count_cy_18_rt_360
    );
  u3_Mcount_addr_count_cy_17_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => u3_addr_count(17),
      O => u3_Mcount_addr_count_cy_17_rt_358
    );
  u3_Mcount_addr_count_cy_16_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => u3_addr_count(16),
      O => u3_Mcount_addr_count_cy_16_rt_356
    );
  u3_Mcount_addr_count_cy_15_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => u3_addr_count(15),
      O => u3_Mcount_addr_count_cy_15_rt_354
    );
  u3_Mcount_addr_count_cy_14_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => u3_addr_count(14),
      O => u3_Mcount_addr_count_cy_14_rt_352
    );
  u3_Mcount_addr_count_cy_13_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => u3_addr_count(13),
      O => u3_Mcount_addr_count_cy_13_rt_350
    );
  u3_Mcount_addr_count_cy_12_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => u3_addr_count(12),
      O => u3_Mcount_addr_count_cy_12_rt_348
    );
  u3_Mcount_addr_count_cy_11_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => u3_addr_count(11),
      O => u3_Mcount_addr_count_cy_11_rt_346
    );
  u3_Mcount_addr_count_cy_10_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => u3_addr_count(10),
      O => u3_Mcount_addr_count_cy_10_rt_344
    );
  u3_Mcount_addr_count_cy_9_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => u3_addr_count(9),
      O => u3_Mcount_addr_count_cy_9_rt_378
    );
  u3_Mcount_addr_count_cy_8_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => u3_addr_count(8),
      O => u3_Mcount_addr_count_cy_8_rt_376
    );
  u3_Mcount_addr_count_cy_7_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => u3_addr_count(7),
      O => u3_Mcount_addr_count_cy_7_rt_374
    );
  u3_Mcount_addr_count_cy_6_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => u3_addr_count(6),
      O => u3_Mcount_addr_count_cy_6_rt_372
    );
  u3_Mcount_addr_count_cy_5_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => u3_addr_count(5),
      O => u3_Mcount_addr_count_cy_5_rt_370
    );
  u3_Mcount_addr_count_cy_4_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => u3_addr_count(4),
      O => u3_Mcount_addr_count_cy_4_rt_368
    );
  u3_Mcount_addr_count_cy_3_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => u3_addr_count(3),
      O => u3_Mcount_addr_count_cy_3_rt_366
    );
  u3_Mcount_addr_count_cy_2_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => u3_addr_count(2),
      O => u3_Mcount_addr_count_cy_2_rt_364
    );
  u3_Mcount_addr_count_cy_1_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => u3_addr_count(1),
      O => u3_Mcount_addr_count_cy_1_rt_362
    );
  u5_Madd_addr_count_addsub0000_cy_18_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => u5_addr_count(18),
      O => u5_Madd_addr_count_addsub0000_cy_18_rt_487
    );
  u5_Madd_addr_count_addsub0000_cy_17_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => u5_addr_count(17),
      O => u5_Madd_addr_count_addsub0000_cy_17_rt_485
    );
  u5_Madd_addr_count_addsub0000_cy_16_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => u5_addr_count(16),
      O => u5_Madd_addr_count_addsub0000_cy_16_rt_483
    );
  u5_Madd_addr_count_addsub0000_cy_15_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => u5_addr_count(15),
      O => u5_Madd_addr_count_addsub0000_cy_15_rt_481
    );
  u5_Madd_addr_count_addsub0000_cy_14_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => u5_addr_count(14),
      O => u5_Madd_addr_count_addsub0000_cy_14_rt_479
    );
  u5_Madd_addr_count_addsub0000_cy_13_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => u5_addr_count(13),
      O => u5_Madd_addr_count_addsub0000_cy_13_rt_477
    );
  u5_Madd_addr_count_addsub0000_cy_12_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => u5_addr_count(12),
      O => u5_Madd_addr_count_addsub0000_cy_12_rt_475
    );
  u5_Madd_addr_count_addsub0000_cy_11_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => u5_addr_count(11),
      O => u5_Madd_addr_count_addsub0000_cy_11_rt_473
    );
  u5_Madd_addr_count_addsub0000_cy_10_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => u5_addr_count(10),
      O => u5_Madd_addr_count_addsub0000_cy_10_rt_471
    );
  u5_Madd_addr_count_addsub0000_cy_9_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => u5_addr_count(9),
      O => u5_Madd_addr_count_addsub0000_cy_9_rt_505
    );
  u5_Madd_addr_count_addsub0000_cy_8_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => u5_addr_count(8),
      O => u5_Madd_addr_count_addsub0000_cy_8_rt_503
    );
  u5_Madd_addr_count_addsub0000_cy_7_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => u5_addr_count(7),
      O => u5_Madd_addr_count_addsub0000_cy_7_rt_501
    );
  u5_Madd_addr_count_addsub0000_cy_6_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => u5_addr_count(6),
      O => u5_Madd_addr_count_addsub0000_cy_6_rt_499
    );
  u5_Madd_addr_count_addsub0000_cy_5_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => u5_addr_count(5),
      O => u5_Madd_addr_count_addsub0000_cy_5_rt_497
    );
  u5_Madd_addr_count_addsub0000_cy_4_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => u5_addr_count(4),
      O => u5_Madd_addr_count_addsub0000_cy_4_rt_495
    );
  u5_Madd_addr_count_addsub0000_cy_3_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => u5_addr_count(3),
      O => u5_Madd_addr_count_addsub0000_cy_3_rt_493
    );
  u5_Madd_addr_count_addsub0000_cy_2_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => u5_addr_count(2),
      O => u5_Madd_addr_count_addsub0000_cy_2_rt_491
    );
  u5_Madd_addr_count_addsub0000_cy_1_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => u5_addr_count(1),
      O => u5_Madd_addr_count_addsub0000_cy_1_rt_489
    );
  u1_Mcount_q_xor_17_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => u1_q(17),
      O => u1_Mcount_q_xor_17_rt_206
    );
  u2_Mcount_hcs_xor_9_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => u2_hcs(9),
      O => u2_Mcount_hcs_xor_9_rt_256
    );
  u2_Mcount_vcs_xor_9_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => u2_vcs(9),
      O => u2_Mcount_vcs_xor_9_rt_285
    );
  u3_Mcount_addr_count_xor_19_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => u3_addr_count(19),
      O => u3_Mcount_addr_count_xor_19_rt_400
    );
  u5_Madd_addr_count_addsub0000_xor_19_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => u5_addr_count(19),
      O => u5_Madd_addr_count_addsub0000_xor_19_rt_507
    );
  u2_vcs_cmp_eq0000_SW0_SW0 : LUT4
    generic map(
      INIT => X"EFFF"
    )
    port map (
      I0 => u2_vcs(4),
      I1 => u2_vcs(2),
      I2 => u2_vcs(3),
      I3 => u2_vcs(9),
      O => N65
    );
  u2_vidon_and0000110_SW0 : LUT4
    generic map(
      INIT => X"AAA8"
    )
    port map (
      I0 => u2_hcs(7),
      I1 => u2_hcs(4),
      I2 => u2_hcs(5),
      I3 => u2_hcs(6),
      O => N67
    );
  u2_vidon_and0000110 : LUT4
    generic map(
      INIT => X"5554"
    )
    port map (
      I0 => u2_vcs(9),
      I1 => u2_hcs(8),
      I2 => u2_hcs(9),
      I3 => N67,
      O => u2_vidon_and0000110_334
    );
  u5_state_FSM_FFd1_In121_SW0 : LUT3
    generic map(
      INIT => X"FE"
    )
    port map (
      I0 => u5_addr_count(15),
      I1 => u5_addr_count(16),
      I2 => u5_state_FSM_FFd1_In17_577,
      O => N69
    );
  u2_Mcount_hcs_eqn_01 : LUT4
    generic map(
      INIT => X"2AAA"
    )
    port map (
      I0 => u2_Result_0_1,
      I1 => u2_N3,
      I2 => u2_hcs_cmp_eq00002_321,
      I3 => u2_hcs_cmp_eq000010_320,
      O => u2_Mcount_hcs_eqn_0
    );
  u8_state_FSM_FFd6_In1 : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => u6_delay3_0_Q,
      I1 => u6_delay2_0_Q,
      I2 => u6_delay1_0_Q,
      I3 => u8_state_FSM_FFd7_652,
      O => u8_state_FSM_FFd6_In
    );
  u2_Mcount_hcs_eqn_21 : LUT4
    generic map(
      INIT => X"2AAA"
    )
    port map (
      I0 => u2_Result_2_1,
      I1 => u2_N3,
      I2 => u2_hcs_cmp_eq00002_321,
      I3 => u2_hcs_cmp_eq000010_320,
      O => u2_Mcount_hcs_eqn_2
    );
  u2_Mcount_hcs_eqn_11 : LUT4
    generic map(
      INIT => X"2AAA"
    )
    port map (
      I0 => u2_Result_1_1,
      I1 => u2_N3,
      I2 => u2_hcs_cmp_eq00002_321,
      I3 => u2_hcs_cmp_eq000010_320,
      O => u2_Mcount_hcs_eqn_1
    );
  u8_Madd_ram_addr_Madd_cy_5_11 : LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => sw_2_IBUF_166,
      I1 => sw_3_IBUF_167,
      O => u8_Madd_ram_addr_Madd_cy_5_Q
    );
  u4_en_inv1 : LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => u5_done_out_573,
      I1 => u8_donep_637,
      O => u4_en_inv
    );
  u3_red_2_1 : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => u2_vidon_and000073_339,
      I1 => u2_vidon_and000094_340,
      I2 => u2_vidon_and0000110_334,
      I3 => u3_pixel(7),
      O => red_2_OBUF_155
    );
  u3_red_1_1 : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => u2_vidon_and000073_339,
      I1 => u2_vidon_and000094_340,
      I2 => u2_vidon_and0000110_334,
      I3 => u3_pixel(6),
      O => red_1_OBUF_154
    );
  u3_red_0_1 : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => u2_vidon_and000073_339,
      I1 => u2_vidon_and000094_340,
      I2 => u2_vidon_and0000110_334,
      I3 => u3_pixel(5),
      O => red_0_OBUF_153
    );
  u3_green_2_1 : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => u2_vidon_and000073_339,
      I1 => u2_vidon_and000094_340,
      I2 => u2_vidon_and0000110_334,
      I3 => u3_pixel(4),
      O => green_2_OBUF_144
    );
  u3_green_1_1 : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => u2_vidon_and000073_339,
      I1 => u2_vidon_and000094_340,
      I2 => u2_vidon_and0000110_334,
      I3 => u3_pixel(3),
      O => green_1_OBUF_143
    );
  u3_green_0_1 : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => u2_vidon_and000073_339,
      I1 => u2_vidon_and000094_340,
      I2 => u2_vidon_and0000110_334,
      I3 => u3_pixel(2),
      O => green_0_OBUF_142
    );
  u3_blue_1_1 : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => u2_vidon_and000073_339,
      I1 => u2_vidon_and000094_340,
      I2 => u2_vidon_and0000110_334,
      I3 => u3_pixel(1),
      O => blue_1_OBUF_130
    );
  u3_blue_0_1 : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => u2_vidon_and000073_339,
      I1 => u2_vidon_and000094_340,
      I2 => u2_vidon_and0000110_334,
      I3 => u3_pixel(0),
      O => blue_0_OBUF_129
    );
  u8_Madd_ram_addr_Madd_xor_6_11 : LUT2
    generic map(
      INIT => X"7"
    )
    port map (
      I0 => sw_2_IBUF_166,
      I1 => sw_3_IBUF_167,
      O => u8_ram_addr_8_Q
    );
  u2_Mcount_hcs_eqn_31 : LUT4
    generic map(
      INIT => X"2AAA"
    )
    port map (
      I0 => u2_Result_3_1,
      I1 => u2_N3,
      I2 => u2_hcs_cmp_eq00002_321,
      I3 => u2_hcs_cmp_eq000010_320,
      O => u2_Mcount_hcs_eqn_3
    );
  u2_Mcount_hcs_eqn_41 : LUT4
    generic map(
      INIT => X"2AAA"
    )
    port map (
      I0 => u2_Result_4_1,
      I1 => u2_N3,
      I2 => u2_hcs_cmp_eq00002_321,
      I3 => u2_hcs_cmp_eq000010_320,
      O => u2_Mcount_hcs_eqn_4
    );
  u2_Mcount_hcs_eqn_51 : LUT4
    generic map(
      INIT => X"7F00"
    )
    port map (
      I0 => N74,
      I1 => u2_hcs_cmp_eq00002_321,
      I2 => u2_N3,
      I3 => u2_Result_5_1,
      O => u2_Mcount_hcs_eqn_5
    );
  u2_Mcount_hcs_eqn_61 : LUT4
    generic map(
      INIT => X"7F00"
    )
    port map (
      I0 => u2_hcs_cmp_eq000010_320,
      I1 => N73,
      I2 => u2_N3,
      I3 => u2_Result_6_1,
      O => u2_Mcount_hcs_eqn_6
    );
  u2_Mcount_hcs_eqn_71 : LUT4
    generic map(
      INIT => X"7F00"
    )
    port map (
      I0 => u2_hcs_cmp_eq000010_320,
      I1 => u2_hcs_cmp_eq00002_321,
      I2 => u2_N3,
      I3 => u2_Result_7_1,
      O => u2_Mcount_hcs_eqn_7
    );
  u2_Mcount_hcs_eqn_81 : LUT4
    generic map(
      INIT => X"7F00"
    )
    port map (
      I0 => u2_hcs_cmp_eq000010_320,
      I1 => u2_hcs_cmp_eq00002_321,
      I2 => u2_N3,
      I3 => u2_Result_8_1,
      O => u2_Mcount_hcs_eqn_8
    );
  u2_Mcount_hcs_eqn_91 : LUT4
    generic map(
      INIT => X"7F00"
    )
    port map (
      I0 => u2_hcs_cmp_eq000010_320,
      I1 => u2_hcs_cmp_eq00002_321,
      I2 => u2_N3,
      I3 => u2_Result_9_1,
      O => u2_Mcount_hcs_eqn_9
    );
  u1_q_1_BUFG : BUFG
    port map (
      I => u1_q_18,
      O => u1_q(1)
    );
  u1_q_0_BUFG : BUFG
    port map (
      I => u1_q_01,
      O => u1_q(0)
    );
  mclk_IBUF_BUFG : BUFG
    port map (
      I => mclk_IBUF1,
      O => mclk_IBUF_148
    );
  u1_Mcount_q_lut_0_INV_0 : INV
    port map (
      I => u1_q_01,
      O => u1_Mcount_q_lut(0)
    );
  u2_Mcount_hcs_lut_0_INV_0 : INV
    port map (
      I => u2_hcs(0),
      O => u2_Mcount_hcs_lut(0)
    );
  u2_Mcount_vcs_lut_0_INV_0 : INV
    port map (
      I => u2_vcs(0),
      O => u2_Mcount_vcs_lut(0)
    );
  u3_Mcount_addr_count_lut_0_INV_0 : INV
    port map (
      I => u3_addr_count(0),
      O => u3_Mcount_addr_count_lut(0)
    );
  u5_Madd_addr_count_addsub0000_lut_0_INV_0 : INV
    port map (
      I => u5_addr_count(0),
      O => u5_Madd_addr_count_addsub0000_lut(0)
    );
  u8_Madd_ram_addrR2_INV_0 : INV
    port map (
      I => sw_2_IBUF_166,
      O => u8_Madd_ram_addrR
    );
  u2_clr_inv1_INV_0 : INV
    port map (
      I => btn_3_IBUF_136,
      O => u2_clr_inv
    );
  u10_y_7_1_INV_0 : INV
    port map (
      I => u8_donep_637,
      O => Din1_0_Q
    );
  u8_state_FSM_Out71_INV_0 : INV
    port map (
      I => u8_state_FSM_FFd3_647,
      O => u8_mux0000
    );
  u2_vidon_and000073 : MUXF5
    port map (
      I0 => N71,
      I1 => N72,
      S => u2_vcs(8),
      O => u2_vidon_and000073_339
    );
  u2_vidon_and000073_F : LUT4
    generic map(
      INIT => X"FFFE"
    )
    port map (
      I0 => u2_vidon_and000014,
      I1 => u2_vcs(5),
      I2 => u2_vcs(9),
      I3 => u2_vidon_and00001_333,
      O => N71
    );
  u2_vidon_and000073_G : LUT4
    generic map(
      INIT => X"F7FF"
    )
    port map (
      I0 => u2_vcs(2),
      I1 => u2_vcs(3),
      I2 => u2_vidon_and000042,
      I3 => u2_vcs(0),
      O => N72
    );
  u7_y_9_1 : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => u5_done_out_573,
      I1 => u5_addr_count(9),
      I2 => u3_addr_count(9),
      O => u7_y_9_Q
    );
  u7_y_9_f5 : MUXF5
    port map (
      I0 => u8_addrp_9_Q,
      I1 => u7_y_9_Q,
      S => u8_donep_637,
      O => A_9_OBUF_43
    );
  u7_y_8_1 : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => u5_done_out_573,
      I1 => u5_addr_count(8),
      I2 => u3_addr_count(8),
      O => u7_y_8_Q
    );
  u7_y_8_f5 : MUXF5
    port map (
      I0 => u8_addrp_8_Q,
      I1 => u7_y_8_Q,
      S => u8_donep_637,
      O => A_8_OBUF_42
    );
  u7_y_7_1 : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => u5_done_out_573,
      I1 => u5_addr_count(7),
      I2 => u3_addr_count(7),
      O => u7_y_7_Q
    );
  u7_y_7_f5 : MUXF5
    port map (
      I0 => u8_addrp_7_Q,
      I1 => u7_y_7_Q,
      S => u8_donep_637,
      O => A_7_OBUF_41
    );
  u7_y_6_1 : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => u5_done_out_573,
      I1 => u5_addr_count(6),
      I2 => u3_addr_count(6),
      O => u7_y_6_Q
    );
  u7_y_6_f5 : MUXF5
    port map (
      I0 => u8_addrp_6_Q,
      I1 => u7_y_6_Q,
      S => u8_donep_637,
      O => A_6_OBUF_40
    );
  u7_y_5_1 : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => u5_done_out_573,
      I1 => u5_addr_count(5),
      I2 => u3_addr_count(5),
      O => u7_y_5_Q
    );
  u7_y_5_f5 : MUXF5
    port map (
      I0 => u8_addrp_5_Q,
      I1 => u7_y_5_Q,
      S => u8_donep_637,
      O => A_5_OBUF_39
    );
  u7_y_4_1 : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => u5_done_out_573,
      I1 => u5_addr_count(4),
      I2 => u3_addr_count(4),
      O => u7_y_4_Q
    );
  u7_y_4_f5 : MUXF5
    port map (
      I0 => u8_addrp_4_Q,
      I1 => u7_y_4_Q,
      S => u8_donep_637,
      O => A_4_OBUF_38
    );
  u7_y_17_1 : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => u5_done_out_573,
      I1 => u5_addr_count(17),
      I2 => u3_addr_count(17),
      O => u7_y_17_Q
    );
  u7_y_17_f5 : MUXF5
    port map (
      I0 => u8_addrp_17_Q,
      I1 => u7_y_17_Q,
      S => u8_donep_637,
      O => A_17_OBUF_31
    );
  u7_y_16_1 : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => u5_done_out_573,
      I1 => u5_addr_count(16),
      I2 => u3_addr_count(16),
      O => u7_y_16_Q
    );
  u7_y_16_f5 : MUXF5
    port map (
      I0 => u8_addrp_16_Q,
      I1 => u7_y_16_Q,
      S => u8_donep_637,
      O => A_16_OBUF_30
    );
  u7_y_15_1 : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => u5_done_out_573,
      I1 => u5_addr_count(15),
      I2 => u3_addr_count(15),
      O => u7_y_15_Q
    );
  u7_y_15_f5 : MUXF5
    port map (
      I0 => u8_addrp_15_Q,
      I1 => u7_y_15_Q,
      S => u8_donep_637,
      O => A_15_OBUF_29
    );
  u7_y_14_1 : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => u5_done_out_573,
      I1 => u5_addr_count(14),
      I2 => u3_addr_count(14),
      O => u7_y_14_Q
    );
  u7_y_14_f5 : MUXF5
    port map (
      I0 => u8_addrp_14_Q,
      I1 => u7_y_14_Q,
      S => u8_donep_637,
      O => A_14_OBUF_28
    );
  u7_y_13_1 : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => u5_done_out_573,
      I1 => u5_addr_count(13),
      I2 => u3_addr_count(13),
      O => u7_y_13_Q
    );
  u7_y_13_f5 : MUXF5
    port map (
      I0 => u8_addrp_13_Q,
      I1 => u7_y_13_Q,
      S => u8_donep_637,
      O => A_13_OBUF_27
    );
  u7_y_12_1 : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => u5_done_out_573,
      I1 => u5_addr_count(12),
      I2 => u3_addr_count(12),
      O => u7_y_12_Q
    );
  u7_y_12_f5 : MUXF5
    port map (
      I0 => u8_addrp_12_Q,
      I1 => u7_y_12_Q,
      S => u8_donep_637,
      O => A_12_OBUF_26
    );
  u7_y_11_1 : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => u5_done_out_573,
      I1 => u5_addr_count(11),
      I2 => u3_addr_count(11),
      O => u7_y_11_Q
    );
  u7_y_11_f5 : MUXF5
    port map (
      I0 => u8_addrp_11_Q,
      I1 => u7_y_11_Q,
      S => u8_donep_637,
      O => A_11_OBUF_25
    );
  u11_y1 : LUT4
    generic map(
      INIT => X"EAAA"
    )
    port map (
      I0 => u5_done_out_573,
      I1 => u1_q_01,
      I2 => u1_q_18,
      I3 => mclk_IBUF1,
      O => u11_y
    );
  u11_y_f5 : MUXF5
    port map (
      I0 => u8_wep_654,
      I1 => u11_y,
      S => u8_donep_637,
      O => WE_L_OBUF_126
    );
  u2_vidon_and0000141 : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => u2_vcs(3),
      I1 => u2_vcs(0),
      I2 => u2_vcs(2),
      I3 => u2_vcs(1),
      O => u2_vidon_and0000141_336
    );
  u2_vidon_and000014_f5 : MUXF5
    port map (
      I0 => A_22_OBUF_35,
      I1 => u2_vidon_and0000141_336,
      S => u2_vcs(4),
      O => u2_vidon_and000014
    );
  u2_vidon_and0000421 : LUT4
    generic map(
      INIT => X"7FFF"
    )
    port map (
      I0 => u2_vcs(5),
      I1 => u2_vcs(1),
      I2 => u2_vcs(4),
      I3 => u2_vcs(6),
      O => u2_vidon_and0000421_338
    );
  u2_vidon_and000042_f5 : MUXF5
    port map (
      I0 => FlashCE_L_OBUF_71,
      I1 => u2_vidon_and0000421_338,
      S => u2_vcs(7),
      O => u2_vidon_and000042
    );
  u8_donep_mux000010 : LUT4_L
    generic map(
      INIT => X"FFFE"
    )
    port map (
      I0 => u8_state_FSM_FFd3_647,
      I1 => u8_state_FSM_FFd4_648,
      I2 => u8_state_FSM_FFd5_649,
      I3 => u8_state_FSM_FFd6_650,
      LO => u8_donep_mux000010_639
    );
  u2_hcs_cmp_eq00002 : LUT3_D
    generic map(
      INIT => X"80"
    )
    port map (
      I0 => u2_hcs(0),
      I1 => u2_hcs(1),
      I2 => u2_hcs(9),
      LO => N73,
      O => u2_hcs_cmp_eq00002_321
    );
  u2_hcs_cmp_eq000010 : LUT4_D
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => u2_hcs(2),
      I1 => u2_hcs(3),
      I2 => u2_hcs(4),
      I3 => u2_hcs(8),
      LO => N74,
      O => u2_hcs_cmp_eq000010_320
    );
  u2_hcs_cmp_eq000011 : LUT3_D
    generic map(
      INIT => X"01"
    )
    port map (
      I0 => u2_hcs(6),
      I1 => u2_hcs(5),
      I2 => u2_hcs(7),
      LO => N75,
      O => u2_N3
    );
  u5_state_FSM_FFd1_In17 : LUT4_L
    generic map(
      INIT => X"AA80"
    )
    port map (
      I0 => u5_addr_count(14),
      I1 => u5_addr_count(11),
      I2 => u5_addr_count(12),
      I3 => u5_addr_count(13),
      LO => u5_state_FSM_FFd1_In17_577
    );
  u5_addr_count_mux0000_0_256 : LUT4_D
    generic map(
      INIT => X"D500"
    )
    port map (
      I0 => u5_addr_count(17),
      I1 => u5_addr_count_mux0000_0_215_551,
      I2 => u5_addr_count_mux0000_0_219_552,
      I3 => u5_addr_count_mux0000_0_252_553,
      LO => N76,
      O => u5_N2
    );
  u2_vcs_cmp_eq0000 : LUT4_D
    generic map(
      INIT => X"0010"
    )
    port map (
      I0 => u2_vcs(0),
      I1 => u2_vcs(1),
      I2 => u2_N2,
      I3 => N65,
      LO => N77,
      O => u2_vcs_cmp_eq0000_332
    );
  u5_state_FSM_FFd1_In121 : LUT4_D
    generic map(
      INIT => X"FEFA"
    )
    port map (
      I0 => u5_addr_count(18),
      I1 => u5_addr_count(17),
      I2 => u5_addr_count(19),
      I3 => N69,
      LO => N78,
      O => u5_N11
    );

end Structure;

