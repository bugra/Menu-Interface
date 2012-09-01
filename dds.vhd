--------------------------------------------------------------------------------
--     This file is owned and controlled by Xilinx and must be used           --
--     solely for design, simulation, implementation and creation of          --
--     design files limited to Xilinx devices or technologies. Use            --
--     with non-Xilinx devices or technologies is expressly prohibited        --
--     and immediately terminates your license.                               --
--                                                                            --
--     XILINX IS PROVIDING THIS DESIGN, CODE, OR INFORMATION "AS IS"          --
--     SOLELY FOR USE IN DEVELOPING PROGRAMS AND SOLUTIONS FOR                --
--     XILINX DEVICES.  BY PROVIDING THIS DESIGN, CODE, OR INFORMATION        --
--     AS ONE POSSIBLE IMPLEMENTATION OF THIS FEATURE, APPLICATION            --
--     OR STANDARD, XILINX IS MAKING NO REPRESENTATION THAT THIS              --
--     IMPLEMENTATION IS FREE FROM ANY CLAIMS OF INFRINGEMENT,                --
--     AND YOU ARE RESPONSIBLE FOR OBTAINING ANY RIGHTS YOU MAY REQUIRE       --
--     FOR YOUR IMPLEMENTATION.  XILINX EXPRESSLY DISCLAIMS ANY               --
--     WARRANTY WHATSOEVER WITH RESPECT TO THE ADEQUACY OF THE                --
--     IMPLEMENTATION, INCLUDING BUT NOT LIMITED TO ANY WARRANTIES OR         --
--     REPRESENTATIONS THAT THIS IMPLEMENTATION IS FREE FROM CLAIMS OF        --
--     INFRINGEMENT, IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS        --
--     FOR A PARTICULAR PURPOSE.                                              --
--                                                                            --
--     Xilinx products are not intended for use in life support               --
--     appliances, devices, or systems. Use in such applications are          --
--     expressly prohibited.                                                  --
--                                                                            --
--     (c) Copyright 1995-2006 Xilinx, Inc.                                   --
--     All rights reserved.                                                   --
--------------------------------------------------------------------------------

-- synopsys translate_off
LIBRARY std, ieee;
USE std.standard.ALL;
USE ieee.std_logic_1164.ALL;

LIBRARY unisim;
USE unisim.vcomponents.ALL;


LIBRARY XilinxCoreLib;
USE XilinxCoreLib.c_reg_fd_v7_0_comp.ALL;
USE XilinxCoreLib.c_gate_bit_v7_0_comp.ALL;
USE XilinxCoreLib.c_dist_mem_v7_0_comp.ALL;
USE XilinxCoreLib.c_shift_fd_v7_0_comp.ALL;
USE XilinxCoreLib.c_addsub_v7_0_comp.ALL;

ENTITY dds IS
   PORT (
      DATA : IN STD_LOGIC_VECTOR(26 DOWNTO 0);
      WE : IN STD_LOGIC;
      A : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
      CLK : IN STD_LOGIC;
      ACLR : IN STD_LOGIC;
      SINE : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)   
);
END dds;

ARCHITECTURE xilinx OF dds IS 

-- Signals for connecting to instantiations
   SIGNAL BU2_I : STD_LOGIC_VECTOR(5 DOWNTO 0);
   SIGNAL BU2_T : STD_LOGIC;
   SIGNAL BU2_EN : STD_LOGIC;
   SIGNAL BU2_Q : STD_LOGIC;
   SIGNAL BU2_CLK : STD_LOGIC;
   SIGNAL BU2_CE : STD_LOGIC;
   SIGNAL BU2_ACLR : STD_LOGIC;
   SIGNAL BU2_ASET : STD_LOGIC;
   SIGNAL BU2_AINIT : STD_LOGIC;
   SIGNAL BU2_SCLR : STD_LOGIC;
   SIGNAL BU2_SSET : STD_LOGIC;
   SIGNAL BU2_SINIT : STD_LOGIC;
   SIGNAL BU2_O : STD_LOGIC;
   SIGNAL BU10_I : STD_LOGIC_VECTOR(5 DOWNTO 0);
   SIGNAL BU10_T : STD_LOGIC;
   SIGNAL BU10_EN : STD_LOGIC;
   SIGNAL BU10_Q : STD_LOGIC;
   SIGNAL BU10_CLK : STD_LOGIC;
   SIGNAL BU10_CE : STD_LOGIC;
   SIGNAL BU10_ACLR : STD_LOGIC;
   SIGNAL BU10_ASET : STD_LOGIC;
   SIGNAL BU10_AINIT : STD_LOGIC;
   SIGNAL BU10_SCLR : STD_LOGIC;
   SIGNAL BU10_SSET : STD_LOGIC;
   SIGNAL BU10_SINIT : STD_LOGIC;
   SIGNAL BU10_O : STD_LOGIC;
   SIGNAL BU20_D : STD_LOGIC_VECTOR(26 DOWNTO 0);
   SIGNAL BU20_Q : STD_LOGIC_VECTOR(26 DOWNTO 0);
   SIGNAL BU20_CLK : STD_LOGIC;
   SIGNAL BU20_CE : STD_LOGIC;
   SIGNAL BU76_A : STD_LOGIC_VECTOR(26 DOWNTO 0);
   SIGNAL BU76_B : STD_LOGIC_VECTOR(26 DOWNTO 0);
   SIGNAL BU76_Q : STD_LOGIC_VECTOR(26 DOWNTO 0);
   SIGNAL BU76_CLK : STD_LOGIC;
   SIGNAL BU76_ACLR : STD_LOGIC;
   SIGNAL BU238_CLK : STD_LOGIC;
   SIGNAL BU238_SDOUT : STD_LOGIC;
   SIGNAL BU238_ACLR : STD_LOGIC;
   SIGNAL BU245_D : STD_LOGIC_VECTOR(26 DOWNTO 0);
   SIGNAL BU245_Q : STD_LOGIC_VECTOR(26 DOWNTO 0);
   SIGNAL BU245_CLK : STD_LOGIC;
   SIGNAL BU245_CE : STD_LOGIC;
   SIGNAL BU301_A : STD_LOGIC_VECTOR(26 DOWNTO 0);
   SIGNAL BU301_B : STD_LOGIC_VECTOR(26 DOWNTO 0);
   SIGNAL BU301_Q : STD_LOGIC_VECTOR(26 DOWNTO 0);
   SIGNAL BU301_CLK : STD_LOGIC;
   SIGNAL BU485_D : STD_LOGIC_VECTOR(3 DOWNTO 0);
   SIGNAL BU485_Q : STD_LOGIC_VECTOR(3 DOWNTO 0);
   SIGNAL BU485_CLK : STD_LOGIC;
   SIGNAL BU466_A : STD_LOGIC_VECTOR(3 DOWNTO 0);
   SIGNAL BU466_CLK : STD_LOGIC;
   SIGNAL BU466_QSPO_CE : STD_LOGIC;
   SIGNAL BU466_QSPO : STD_LOGIC_VECTOR(3 DOWNTO 0);
   SIGNAL BU466_QSPO_RST : STD_LOGIC;
   SIGNAL BU496_CLK : STD_LOGIC;
   SIGNAL BU496_SDIN : STD_LOGIC;
   SIGNAL BU496_SDOUT : STD_LOGIC;
   SIGNAL BU496_ACLR : STD_LOGIC;
   SIGNAL n0 : STD_LOGIC := '0';
   SIGNAL n1 : STD_LOGIC := '1';
   SIGNAL n2 : STD_LOGIC;
   SIGNAL n19 : STD_LOGIC;
   SIGNAL n20 : STD_LOGIC;
   SIGNAL n21 : STD_LOGIC;
   SIGNAL n22 : STD_LOGIC;
   SIGNAL n23 : STD_LOGIC;
   SIGNAL n24 : STD_LOGIC;
   SIGNAL n25 : STD_LOGIC;
   SIGNAL n36 : STD_LOGIC;
   SIGNAL n37 : STD_LOGIC;
   SIGNAL n38 : STD_LOGIC;
   SIGNAL n39 : STD_LOGIC;
   SIGNAL n40 : STD_LOGIC;
   SIGNAL n41 : STD_LOGIC;
   SIGNAL n42 : STD_LOGIC;
   SIGNAL n43 : STD_LOGIC;
   SIGNAL n44 : STD_LOGIC;
   SIGNAL n45 : STD_LOGIC;
   SIGNAL n46 : STD_LOGIC;
   SIGNAL n47 : STD_LOGIC;
   SIGNAL n48 : STD_LOGIC;
   SIGNAL n49 : STD_LOGIC;
   SIGNAL n50 : STD_LOGIC;
   SIGNAL n51 : STD_LOGIC;
   SIGNAL n52 : STD_LOGIC;
   SIGNAL n53 : STD_LOGIC;
   SIGNAL n54 : STD_LOGIC;
   SIGNAL n55 : STD_LOGIC;
   SIGNAL n56 : STD_LOGIC;
   SIGNAL n57 : STD_LOGIC;
   SIGNAL n58 : STD_LOGIC;
   SIGNAL n59 : STD_LOGIC;
   SIGNAL n60 : STD_LOGIC;
   SIGNAL n61 : STD_LOGIC;
   SIGNAL n62 : STD_LOGIC;
   SIGNAL n86 : STD_LOGIC;
   SIGNAL n87 : STD_LOGIC;
   SIGNAL n88 : STD_LOGIC;
   SIGNAL n89 : STD_LOGIC;
   SIGNAL n94 : STD_LOGIC;
   SIGNAL n95 : STD_LOGIC;
   SIGNAL n96 : STD_LOGIC;
   SIGNAL n97 : STD_LOGIC;
   SIGNAL n98 : STD_LOGIC;
   SIGNAL n99 : STD_LOGIC;
   SIGNAL n100 : STD_LOGIC;
   SIGNAL n101 : STD_LOGIC;
   SIGNAL n102 : STD_LOGIC;
   SIGNAL n103 : STD_LOGIC;
   SIGNAL n104 : STD_LOGIC;
   SIGNAL n105 : STD_LOGIC;
   SIGNAL n106 : STD_LOGIC;
   SIGNAL n107 : STD_LOGIC;
   SIGNAL n108 : STD_LOGIC;
   SIGNAL n109 : STD_LOGIC;
   SIGNAL n110 : STD_LOGIC;
   SIGNAL n111 : STD_LOGIC;
   SIGNAL n112 : STD_LOGIC;
   SIGNAL n113 : STD_LOGIC;
   SIGNAL n114 : STD_LOGIC;
   SIGNAL n115 : STD_LOGIC;
   SIGNAL n116 : STD_LOGIC;
   SIGNAL n117 : STD_LOGIC;
   SIGNAL n118 : STD_LOGIC;
   SIGNAL n119 : STD_LOGIC;
   SIGNAL n120 : STD_LOGIC;
   SIGNAL n121 : STD_LOGIC;
   SIGNAL n128 : STD_LOGIC;
   SIGNAL n129 : STD_LOGIC;
   SIGNAL n130 : STD_LOGIC;
   SIGNAL n131 : STD_LOGIC;
   SIGNAL n132 : STD_LOGIC;
   SIGNAL n133 : STD_LOGIC;
   SIGNAL n209 : STD_LOGIC;
   SIGNAL n210 : STD_LOGIC;
   SIGNAL n211 : STD_LOGIC;
   SIGNAL n212 : STD_LOGIC;
   SIGNAL n213 : STD_LOGIC;
   SIGNAL n214 : STD_LOGIC;
   SIGNAL n215 : STD_LOGIC;
   SIGNAL n216 : STD_LOGIC;
   SIGNAL n217 : STD_LOGIC;
   SIGNAL n218 : STD_LOGIC;
   SIGNAL n219 : STD_LOGIC;
   SIGNAL n220 : STD_LOGIC;
   SIGNAL n221 : STD_LOGIC;
   SIGNAL n222 : STD_LOGIC;
   SIGNAL n223 : STD_LOGIC;
   SIGNAL n224 : STD_LOGIC;
   SIGNAL n225 : STD_LOGIC;
   SIGNAL n226 : STD_LOGIC;
   SIGNAL n227 : STD_LOGIC;
   SIGNAL n228 : STD_LOGIC;
   SIGNAL n229 : STD_LOGIC;
   SIGNAL n230 : STD_LOGIC;
   SIGNAL n231 : STD_LOGIC;
   SIGNAL n232 : STD_LOGIC;
   SIGNAL n233 : STD_LOGIC;
   SIGNAL n234 : STD_LOGIC;
   SIGNAL n235 : STD_LOGIC;
   SIGNAL n847 : STD_LOGIC;
   SIGNAL n848 : STD_LOGIC;
   SIGNAL n849 : STD_LOGIC;
   SIGNAL n850 : STD_LOGIC;
   SIGNAL n851 : STD_LOGIC;
   SIGNAL n852 : STD_LOGIC;
   SIGNAL n853 : STD_LOGIC;
   SIGNAL n854 : STD_LOGIC;
   SIGNAL n855 : STD_LOGIC;
   SIGNAL n856 : STD_LOGIC;
   SIGNAL n857 : STD_LOGIC;
   SIGNAL n858 : STD_LOGIC;
   SIGNAL n859 : STD_LOGIC;
   SIGNAL n860 : STD_LOGIC;
   SIGNAL n861 : STD_LOGIC;
   SIGNAL n862 : STD_LOGIC;
   SIGNAL n863 : STD_LOGIC;
   SIGNAL n864 : STD_LOGIC;
   SIGNAL n865 : STD_LOGIC;
   SIGNAL n866 : STD_LOGIC;
   SIGNAL n867 : STD_LOGIC;
   SIGNAL n868 : STD_LOGIC;
   SIGNAL n869 : STD_LOGIC;
   SIGNAL n870 : STD_LOGIC;
   SIGNAL n871 : STD_LOGIC;
   SIGNAL n872 : STD_LOGIC;
   SIGNAL n873 : STD_LOGIC;
   SIGNAL n1477 : STD_LOGIC;
   SIGNAL n1478 : STD_LOGIC;
   SIGNAL n1479 : STD_LOGIC;
   SIGNAL n1480 : STD_LOGIC;
   SIGNAL n1481 : STD_LOGIC;

BEGIN

   n95 <= DATA(0);
   n96 <= DATA(1);
   n97 <= DATA(2);
   n98 <= DATA(3);
   n99 <= DATA(4);
   n100 <= DATA(5);
   n101 <= DATA(6);
   n102 <= DATA(7);
   n103 <= DATA(8);
   n104 <= DATA(9);
   n105 <= DATA(10);
   n106 <= DATA(11);
   n107 <= DATA(12);
   n108 <= DATA(13);
   n109 <= DATA(14);
   n110 <= DATA(15);
   n111 <= DATA(16);
   n112 <= DATA(17);
   n113 <= DATA(18);
   n114 <= DATA(19);
   n115 <= DATA(20);
   n116 <= DATA(21);
   n117 <= DATA(22);
   n118 <= DATA(23);
   n119 <= DATA(24);
   n120 <= DATA(25);
   n121 <= DATA(26);
   n25 <= WE;
   n20 <= A(0);
   n21 <= A(1);
   n22 <= A(2);
   n23 <= A(3);
   n24 <= A(4);
   n128 <= CLK;
   n129 <= ACLR;
   SINE(0) <= n130;
   SINE(1) <= n131;
   SINE(2) <= n132;
   SINE(3) <= n133;

   BU2_I(0) <= n20;
   BU2_I(1) <= n21;
   BU2_I(2) <= n22;
   BU2_I(3) <= n23;
   BU2_I(4) <= n24;
   BU2_I(5) <= n25;
   BU2_T <= '0';
   BU2_EN <= '0';
   BU2_CLK <= '0';
   BU2_CE <= '0';
   BU2_ACLR <= '0';
   BU2_ASET <= '0';
   BU2_AINIT <= '0';
   BU2_SCLR <= '0';
   BU2_SSET <= '0';
   BU2_SINIT <= '0';
   n2 <= BU2_O;
   BU2 : C_GATE_BIT_V7_0
      GENERIC MAP (
         c_has_aset => 0,
         c_gate_type => 0,
         c_sync_priority => 1,
         c_has_sclr => 0,
         c_enable_rlocs => 0,
         c_ainit_val => "0",
         c_pipe_stages => 0,
         c_has_ce => 0,
         c_has_aclr => 0,
         c_sync_enable => 0,
         c_has_ainit => 0,
         c_sinit_val => "0",
         c_has_sset => 0,
         c_has_sinit => 0,
         c_has_q => 1,
         c_has_o => 1,
         c_inputs => 6,
         c_input_inv_mask => "011111"
      )
      PORT MAP (
         I => BU2_I,
         T => BU2_T,
         EN => BU2_EN,
         Q => BU2_Q,
         CLK => BU2_CLK,
         CE => BU2_CE,
         ACLR => BU2_ACLR,
         ASET => BU2_ASET,
         AINIT => BU2_AINIT,
         SCLR => BU2_SCLR,
         SSET => BU2_SSET,
         SINIT => BU2_SINIT,
         O => BU2_O
      );

   BU10_I(0) <= n20;
   BU10_I(1) <= n21;
   BU10_I(2) <= n22;
   BU10_I(3) <= n23;
   BU10_I(4) <= n24;
   BU10_I(5) <= n25;
   BU10_T <= '0';
   BU10_EN <= '0';
   BU10_CLK <= '0';
   BU10_CE <= '0';
   BU10_ACLR <= '0';
   BU10_ASET <= '0';
   BU10_AINIT <= '0';
   BU10_SCLR <= '0';
   BU10_SSET <= '0';
   BU10_SINIT <= '0';
   n19 <= BU10_O;
   BU10 : C_GATE_BIT_V7_0
      GENERIC MAP (
         c_has_aset => 0,
         c_gate_type => 0,
         c_sync_priority => 1,
         c_has_sclr => 0,
         c_enable_rlocs => 0,
         c_ainit_val => "0",
         c_pipe_stages => 0,
         c_has_ce => 0,
         c_has_aclr => 0,
         c_sync_enable => 0,
         c_has_ainit => 0,
         c_sinit_val => "0",
         c_has_sset => 0,
         c_has_sinit => 0,
         c_has_q => 1,
         c_has_o => 1,
         c_inputs => 6,
         c_input_inv_mask => "001111"
      )
      PORT MAP (
         I => BU10_I,
         T => BU10_T,
         EN => BU10_EN,
         Q => BU10_Q,
         CLK => BU10_CLK,
         CE => BU10_CE,
         ACLR => BU10_ACLR,
         ASET => BU10_ASET,
         AINIT => BU10_AINIT,
         SCLR => BU10_SCLR,
         SSET => BU10_SSET,
         SINIT => BU10_SINIT,
         O => BU10_O
      );

   BU20_D(0) <= n95;
   BU20_D(1) <= n96;
   BU20_D(2) <= n97;
   BU20_D(3) <= n98;
   BU20_D(4) <= n99;
   BU20_D(5) <= n100;
   BU20_D(6) <= n101;
   BU20_D(7) <= n102;
   BU20_D(8) <= n103;
   BU20_D(9) <= n104;
   BU20_D(10) <= n105;
   BU20_D(11) <= n106;
   BU20_D(12) <= n107;
   BU20_D(13) <= n108;
   BU20_D(14) <= n109;
   BU20_D(15) <= n110;
   BU20_D(16) <= n111;
   BU20_D(17) <= n112;
   BU20_D(18) <= n113;
   BU20_D(19) <= n114;
   BU20_D(20) <= n115;
   BU20_D(21) <= n116;
   BU20_D(22) <= n117;
   BU20_D(23) <= n118;
   BU20_D(24) <= n119;
   BU20_D(25) <= n120;
   BU20_D(26) <= n121;
   n209 <= BU20_Q(0);
   n210 <= BU20_Q(1);
   n211 <= BU20_Q(2);
   n212 <= BU20_Q(3);
   n213 <= BU20_Q(4);
   n214 <= BU20_Q(5);
   n215 <= BU20_Q(6);
   n216 <= BU20_Q(7);
   n217 <= BU20_Q(8);
   n218 <= BU20_Q(9);
   n219 <= BU20_Q(10);
   n220 <= BU20_Q(11);
   n221 <= BU20_Q(12);
   n222 <= BU20_Q(13);
   n223 <= BU20_Q(14);
   n224 <= BU20_Q(15);
   n225 <= BU20_Q(16);
   n226 <= BU20_Q(17);
   n227 <= BU20_Q(18);
   n228 <= BU20_Q(19);
   n229 <= BU20_Q(20);
   n230 <= BU20_Q(21);
   n231 <= BU20_Q(22);
   n232 <= BU20_Q(23);
   n233 <= BU20_Q(24);
   n234 <= BU20_Q(25);
   n235 <= BU20_Q(26);
   BU20_CLK <= n128;
   BU20_CE <= n2;
   BU20 : C_REG_FD_V7_0
      GENERIC MAP (
         c_width => 27,
         c_has_ce => 1,
         c_sinit_val => "000000000000000000000000000",
         c_has_sinit => 0,
         c_ainit_val => "000000000000000000000000000",
         c_has_aset => 0,
         c_sync_enable => 0,
         c_enable_rlocs => 0,
         c_has_aclr => 0,
         c_has_sset => 0,
         c_sync_priority => 0,
         c_has_ainit => 0,
         c_has_sclr => 0
      )
      PORT MAP (
         D => BU20_D,
         Q => BU20_Q,
         CLK => BU20_CLK,
         CE => BU20_CE
      );

   BU76_A(0) <= n36;
   BU76_A(1) <= n37;
   BU76_A(2) <= n38;
   BU76_A(3) <= n39;
   BU76_A(4) <= n40;
   BU76_A(5) <= n41;
   BU76_A(6) <= n42;
   BU76_A(7) <= n43;
   BU76_A(8) <= n44;
   BU76_A(9) <= n45;
   BU76_A(10) <= n46;
   BU76_A(11) <= n47;
   BU76_A(12) <= n48;
   BU76_A(13) <= n49;
   BU76_A(14) <= n50;
   BU76_A(15) <= n51;
   BU76_A(16) <= n52;
   BU76_A(17) <= n53;
   BU76_A(18) <= n54;
   BU76_A(19) <= n55;
   BU76_A(20) <= n56;
   BU76_A(21) <= n57;
   BU76_A(22) <= n58;
   BU76_A(23) <= n59;
   BU76_A(24) <= n60;
   BU76_A(25) <= n61;
   BU76_A(26) <= n62;
   BU76_B(0) <= n209;
   BU76_B(1) <= n210;
   BU76_B(2) <= n211;
   BU76_B(3) <= n212;
   BU76_B(4) <= n213;
   BU76_B(5) <= n214;
   BU76_B(6) <= n215;
   BU76_B(7) <= n216;
   BU76_B(8) <= n217;
   BU76_B(9) <= n218;
   BU76_B(10) <= n219;
   BU76_B(11) <= n220;
   BU76_B(12) <= n221;
   BU76_B(13) <= n222;
   BU76_B(14) <= n223;
   BU76_B(15) <= n224;
   BU76_B(16) <= n225;
   BU76_B(17) <= n226;
   BU76_B(18) <= n227;
   BU76_B(19) <= n228;
   BU76_B(20) <= n229;
   BU76_B(21) <= n230;
   BU76_B(22) <= n231;
   BU76_B(23) <= n232;
   BU76_B(24) <= n233;
   BU76_B(25) <= n234;
   BU76_B(26) <= n235;
   n36 <= BU76_Q(0);
   n37 <= BU76_Q(1);
   n38 <= BU76_Q(2);
   n39 <= BU76_Q(3);
   n40 <= BU76_Q(4);
   n41 <= BU76_Q(5);
   n42 <= BU76_Q(6);
   n43 <= BU76_Q(7);
   n44 <= BU76_Q(8);
   n45 <= BU76_Q(9);
   n46 <= BU76_Q(10);
   n47 <= BU76_Q(11);
   n48 <= BU76_Q(12);
   n49 <= BU76_Q(13);
   n50 <= BU76_Q(14);
   n51 <= BU76_Q(15);
   n52 <= BU76_Q(16);
   n53 <= BU76_Q(17);
   n54 <= BU76_Q(18);
   n55 <= BU76_Q(19);
   n56 <= BU76_Q(20);
   n57 <= BU76_Q(21);
   n58 <= BU76_Q(22);
   n59 <= BU76_Q(23);
   n60 <= BU76_Q(24);
   n61 <= BU76_Q(25);
   n62 <= BU76_Q(26);
   BU76_CLK <= n128;
   BU76_ACLR <= n129;
   BU76 : C_ADDSUB_V7_0
      GENERIC MAP (
         c_has_bypass_with_cin => 0,
         c_a_type => 1,
         c_has_sclr => 0,
         c_has_aset => 0,
         c_has_b_out => 0,
         c_sync_priority => 0,
         c_has_s => 1,
         c_has_q => 1,
         c_bypass_enable => 1,
         c_b_constant => 0,
         c_has_ovfl => 0,
         c_high_bit => 26,
         c_latency => 1,
         c_sinit_val => "000000000000000000000000000",
         c_has_bypass => 0,
         c_pipe_stages => 0,
         c_has_sset => 0,
         c_has_ainit => 0,
         c_has_a_signed => 0,
         c_has_q_c_out => 0,
         c_b_type => 1,
         c_has_add => 0,
         c_has_sinit => 0,
         c_has_b_in => 0,
         c_has_b_signed => 0,
         c_bypass_low => 0,
         c_enable_rlocs => 0,
         c_b_value => "000000000000000000000000000",
         c_add_mode => 0,
         c_has_aclr => 1,
         c_out_width => 27,
         c_low_bit => 0,
         c_ainit_val => "000000000000000000000000000",
         c_has_q_ovfl => 0,
         c_has_q_b_out => 0,
         c_has_c_out => 0,
         c_b_width => 27,
         c_a_width => 27,
         c_sync_enable => 0,
         c_has_ce => 0,
         c_has_c_in => 0
      )
      PORT MAP (
         A => BU76_A,
         B => BU76_B,
         Q => BU76_Q,
         CLK => BU76_CLK,
         ACLR => BU76_ACLR
      );

   BU238_CLK <= n128;
   n94 <= BU238_SDOUT;
   BU238_ACLR <= n129;
   BU238 : C_SHIFT_FD_V7_0
      GENERIC MAP (
         c_has_aset => 0,
         c_has_d => 0,
         c_sync_priority => 1,
         c_has_sclr => 0,
         c_fill_data => 1,
         c_width => 1,
         c_enable_rlocs => 0,
         c_ainit_val => "0",
         c_has_ce => 0,
         c_has_aclr => 1,
         c_sync_enable => 0,
         c_has_ainit => 0,
         c_has_sdout => 1,
         c_sinit_val => "0",
         c_has_sset => 0,
         c_has_sinit => 0,
         c_has_q => 0,
         c_shift_type => 1,
         c_has_sdin => 0,
         c_has_lsb_2_msb => 0
      )
      PORT MAP (
         CLK => BU238_CLK,
         SDOUT => BU238_SDOUT,
         ACLR => BU238_ACLR
      );

   BU245_D(0) <= n95;
   BU245_D(1) <= n96;
   BU245_D(2) <= n97;
   BU245_D(3) <= n98;
   BU245_D(4) <= n99;
   BU245_D(5) <= n100;
   BU245_D(6) <= n101;
   BU245_D(7) <= n102;
   BU245_D(8) <= n103;
   BU245_D(9) <= n104;
   BU245_D(10) <= n105;
   BU245_D(11) <= n106;
   BU245_D(12) <= n107;
   BU245_D(13) <= n108;
   BU245_D(14) <= n109;
   BU245_D(15) <= n110;
   BU245_D(16) <= n111;
   BU245_D(17) <= n112;
   BU245_D(18) <= n113;
   BU245_D(19) <= n114;
   BU245_D(20) <= n115;
   BU245_D(21) <= n116;
   BU245_D(22) <= n117;
   BU245_D(23) <= n118;
   BU245_D(24) <= n119;
   BU245_D(25) <= n120;
   BU245_D(26) <= n121;
   n847 <= BU245_Q(0);
   n848 <= BU245_Q(1);
   n849 <= BU245_Q(2);
   n850 <= BU245_Q(3);
   n851 <= BU245_Q(4);
   n852 <= BU245_Q(5);
   n853 <= BU245_Q(6);
   n854 <= BU245_Q(7);
   n855 <= BU245_Q(8);
   n856 <= BU245_Q(9);
   n857 <= BU245_Q(10);
   n858 <= BU245_Q(11);
   n859 <= BU245_Q(12);
   n860 <= BU245_Q(13);
   n861 <= BU245_Q(14);
   n862 <= BU245_Q(15);
   n863 <= BU245_Q(16);
   n864 <= BU245_Q(17);
   n865 <= BU245_Q(18);
   n866 <= BU245_Q(19);
   n867 <= BU245_Q(20);
   n868 <= BU245_Q(21);
   n869 <= BU245_Q(22);
   n870 <= BU245_Q(23);
   n871 <= BU245_Q(24);
   n872 <= BU245_Q(25);
   n873 <= BU245_Q(26);
   BU245_CLK <= n128;
   BU245_CE <= n19;
   BU245 : C_REG_FD_V7_0
      GENERIC MAP (
         c_width => 27,
         c_has_ce => 1,
         c_sinit_val => "000000000000000000000000000",
         c_has_sinit => 0,
         c_ainit_val => "000000000000000000000000000",
         c_has_aset => 0,
         c_sync_enable => 0,
         c_enable_rlocs => 0,
         c_has_aclr => 0,
         c_has_sset => 0,
         c_sync_priority => 0,
         c_has_ainit => 0,
         c_has_sclr => 0
      )
      PORT MAP (
         D => BU245_D,
         Q => BU245_Q,
         CLK => BU245_CLK,
         CE => BU245_CE
      );

   BU301_A(0) <= n36;
   BU301_A(1) <= n37;
   BU301_A(2) <= n38;
   BU301_A(3) <= n39;
   BU301_A(4) <= n40;
   BU301_A(5) <= n41;
   BU301_A(6) <= n42;
   BU301_A(7) <= n43;
   BU301_A(8) <= n44;
   BU301_A(9) <= n45;
   BU301_A(10) <= n46;
   BU301_A(11) <= n47;
   BU301_A(12) <= n48;
   BU301_A(13) <= n49;
   BU301_A(14) <= n50;
   BU301_A(15) <= n51;
   BU301_A(16) <= n52;
   BU301_A(17) <= n53;
   BU301_A(18) <= n54;
   BU301_A(19) <= n55;
   BU301_A(20) <= n56;
   BU301_A(21) <= n57;
   BU301_A(22) <= n58;
   BU301_A(23) <= n59;
   BU301_A(24) <= n60;
   BU301_A(25) <= n61;
   BU301_A(26) <= n62;
   BU301_B(0) <= n847;
   BU301_B(1) <= n848;
   BU301_B(2) <= n849;
   BU301_B(3) <= n850;
   BU301_B(4) <= n851;
   BU301_B(5) <= n852;
   BU301_B(6) <= n853;
   BU301_B(7) <= n854;
   BU301_B(8) <= n855;
   BU301_B(9) <= n856;
   BU301_B(10) <= n857;
   BU301_B(11) <= n858;
   BU301_B(12) <= n859;
   BU301_B(13) <= n860;
   BU301_B(14) <= n861;
   BU301_B(15) <= n862;
   BU301_B(16) <= n863;
   BU301_B(17) <= n864;
   BU301_B(18) <= n865;
   BU301_B(19) <= n866;
   BU301_B(20) <= n867;
   BU301_B(21) <= n868;
   BU301_B(22) <= n869;
   BU301_B(23) <= n870;
   BU301_B(24) <= n871;
   BU301_B(25) <= n872;
   BU301_B(26) <= n873;
   n86 <= BU301_Q(23);
   n87 <= BU301_Q(24);
   n88 <= BU301_Q(25);
   n89 <= BU301_Q(26);
   BU301_CLK <= n128;
   BU301 : C_ADDSUB_V7_0
      GENERIC MAP (
         c_has_bypass_with_cin => 0,
         c_a_type => 1,
         c_has_sclr => 0,
         c_has_aset => 0,
         c_has_b_out => 0,
         c_sync_priority => 0,
         c_has_s => 1,
         c_has_q => 1,
         c_bypass_enable => 1,
         c_b_constant => 0,
         c_has_ovfl => 0,
         c_high_bit => 26,
         c_latency => 1,
         c_sinit_val => "000000000000000000000000000",
         c_has_bypass => 0,
         c_pipe_stages => 0,
         c_has_sset => 0,
         c_has_ainit => 0,
         c_has_a_signed => 0,
         c_has_q_c_out => 0,
         c_b_type => 1,
         c_has_add => 0,
         c_has_sinit => 0,
         c_has_b_in => 0,
         c_has_b_signed => 0,
         c_bypass_low => 0,
         c_enable_rlocs => 0,
         c_b_value => "000000000000000000000000000",
         c_add_mode => 0,
         c_has_aclr => 0,
         c_out_width => 27,
         c_low_bit => 0,
         c_ainit_val => "000000000000000000000000000",
         c_has_q_ovfl => 0,
         c_has_q_b_out => 0,
         c_has_c_out => 0,
         c_b_width => 27,
         c_a_width => 27,
         c_sync_enable => 0,
         c_has_ce => 0,
         c_has_c_in => 0
      )
      PORT MAP (
         A => BU301_A,
         B => BU301_B,
         Q => BU301_Q,
         CLK => BU301_CLK
      );

   BU485_D(0) <= n86;
   BU485_D(1) <= n87;
   BU485_D(2) <= n88;
   BU485_D(3) <= n89;
   n1478 <= BU485_Q(0);
   n1479 <= BU485_Q(1);
   n1480 <= BU485_Q(2);
   n1481 <= BU485_Q(3);
   BU485_CLK <= n128;
   BU485 : C_REG_FD_V7_0
      GENERIC MAP (
         c_width => 4,
         c_has_ce => 0,
         c_sinit_val => "0000",
         c_has_sinit => 0,
         c_ainit_val => "0000",
         c_has_aset => 0,
         c_sync_enable => 0,
         c_enable_rlocs => 0,
         c_has_aclr => 0,
         c_has_sset => 0,
         c_sync_priority => 0,
         c_has_ainit => 0,
         c_has_sclr => 0
      )
      PORT MAP (
         D => BU485_D,
         Q => BU485_Q,
         CLK => BU485_CLK
      );

   BU466_A(0) <= n1478;
   BU466_A(1) <= n1479;
   BU466_A(2) <= n1480;
   BU466_A(3) <= n1481;
   BU466_CLK <= n128;
   BU466_QSPO_CE <= n1477;
   n130 <= BU466_QSPO(0);
   n131 <= BU466_QSPO(1);
   n132 <= BU466_QSPO(2);
   n133 <= BU466_QSPO(3);
   BU466_QSPO_RST <= n129;
   BU466 : C_DIST_MEM_V7_0
      GENERIC MAP (
         c_qualify_we => 0,
         c_mem_type => 0,
         c_has_qdpo_rst => 1,
         c_has_qspo => 1,
         c_has_qspo_rst => 1,
         c_has_dpo => 0,
         c_has_qdpo_clk => 0,
         c_has_d => 0,
         c_qce_joined => 1,
         c_width => 4,
         c_reg_a_d_inputs => 0,
         c_latency => 1,
         c_has_we => 0,
         c_has_spo => 0,
         c_depth => 16,
         c_has_i_ce => 0,
         c_default_data => "0",
         c_default_data_radix => 2,
         c_has_dpra => 0,
         c_has_clk => 1,
         c_enable_rlocs => 0,
         c_generate_mif => 0,
         c_addr_width => 4,
         c_has_qspo_ce => 1,
         c_has_qdpo_srst => 0,
         c_mux_type => 0,
         c_has_spra => 0,
         c_has_qdpo => 0,
         c_mem_init_file => "dds_SINCOS_TABLE_TRIG_ROM.mif",
         c_reg_dpra_input => 0,
         c_has_rd_en => 0,
         c_has_qspo_srst => 0,
         c_read_mif => 1,
         c_sync_enable => 0,
         c_has_qdpo_ce => 0
      )
      PORT MAP (
         A => BU466_A,
         CLK => BU466_CLK,
         QSPO_CE => BU466_QSPO_CE,
         QSPO => BU466_QSPO,
         QSPO_RST => BU466_QSPO_RST
      );

   BU496_CLK <= n128;
   BU496_SDIN <= n94;
   n1477 <= BU496_SDOUT;
   BU496_ACLR <= n129;
   BU496 : C_SHIFT_FD_V7_0
      GENERIC MAP (
         c_has_aset => 0,
         c_has_d => 0,
         c_sync_priority => 0,
         c_has_sclr => 0,
         c_fill_data => 5,
         c_width => 1,
         c_enable_rlocs => 0,
         c_ainit_val => "0",
         c_has_ce => 0,
         c_has_aclr => 1,
         c_sync_enable => 0,
         c_has_ainit => 0,
         c_has_sdout => 1,
         c_sinit_val => "0",
         c_has_sset => 0,
         c_has_sinit => 0,
         c_has_q => 0,
         c_shift_type => 1,
         c_has_sdin => 1,
         c_has_lsb_2_msb => 0
      )
      PORT MAP (
         CLK => BU496_CLK,
         SDIN => BU496_SDIN,
         SDOUT => BU496_SDOUT,
         ACLR => BU496_ACLR
      );


END xilinx;


-- synopsys translate_on
