/*******************************************************************************
*     This file is owned and controlled by Xilinx and must be used             *
*     solely for design, simulation, implementation and creation of            *
*     design files limited to Xilinx devices or technologies. Use              *
*     with non-Xilinx devices or technologies is expressly prohibited          *
*     and immediately terminates your license.                                 *
*                                                                              *
*     XILINX IS PROVIDING THIS DESIGN, CODE, OR INFORMATION "AS IS"            *
*     SOLELY FOR USE IN DEVELOPING PROGRAMS AND SOLUTIONS FOR                  *
*     XILINX DEVICES.  BY PROVIDING THIS DESIGN, CODE, OR INFORMATION          *
*     AS ONE POSSIBLE IMPLEMENTATION OF THIS FEATURE, APPLICATION              *
*     OR STANDARD, XILINX IS MAKING NO REPRESENTATION THAT THIS                *
*     IMPLEMENTATION IS FREE FROM ANY CLAIMS OF INFRINGEMENT,                  *
*     AND YOU ARE RESPONSIBLE FOR OBTAINING ANY RIGHTS YOU MAY REQUIRE         *
*     FOR YOUR IMPLEMENTATION.  XILINX EXPRESSLY DISCLAIMS ANY                 *
*     WARRANTY WHATSOEVER WITH RESPECT TO THE ADEQUACY OF THE                  *
*     IMPLEMENTATION, INCLUDING BUT NOT LIMITED TO ANY WARRANTIES OR           *
*     REPRESENTATIONS THAT THIS IMPLEMENTATION IS FREE FROM CLAIMS OF          *
*     INFRINGEMENT, IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS          *
*     FOR A PARTICULAR PURPOSE.                                                *
*                                                                              *
*     Xilinx products are not intended for use in life support                 *
*     appliances, devices, or systems. Use in such applications are            *
*     expressly prohibited.                                                    *
*                                                                              *
*     (c) Copyright 1995-2006 Xilinx, Inc.                                     *
*     All rights reserved.                                                     *
*******************************************************************************/

/* Behavioural components instantiated:
C_REG_FD_V7_0
C_GATE_BIT_V7_0
C_DIST_MEM_V7_0
C_SHIFT_FD_V7_0
C_ADDSUB_V7_0
*/

`timescale 1ns/1ps

module dds(
   DATA,
   WE,
   A,
   CLK,
   ACLR,
   SINE
   ); // synthesis black_box

   input [26 : 0] DATA;
   input WE;
   input [4 : 0] A;
   input CLK;
   input ACLR;
   output [3 : 0] SINE;
//synopsys translate_off
   wire n0 = 1'b0;
   wire n1 = 1'b1;
   wire n2;
   wire n19;
   wire n20;
   wire n21;
   wire n22;
   wire n23;
   wire n24;
   wire n25;
   wire n36;
   wire n37;
   wire n38;
   wire n39;
   wire n40;
   wire n41;
   wire n42;
   wire n43;
   wire n44;
   wire n45;
   wire n46;
   wire n47;
   wire n48;
   wire n49;
   wire n50;
   wire n51;
   wire n52;
   wire n53;
   wire n54;
   wire n55;
   wire n56;
   wire n57;
   wire n58;
   wire n59;
   wire n60;
   wire n61;
   wire n62;
   wire n86;
   wire n87;
   wire n88;
   wire n89;
   wire n94;
   wire n95;
   wire n96;
   wire n97;
   wire n98;
   wire n99;
   wire n100;
   wire n101;
   wire n102;
   wire n103;
   wire n104;
   wire n105;
   wire n106;
   wire n107;
   wire n108;
   wire n109;
   wire n110;
   wire n111;
   wire n112;
   wire n113;
   wire n114;
   wire n115;
   wire n116;
   wire n117;
   wire n118;
   wire n119;
   wire n120;
   wire n121;
   wire n128;
   wire n129;
   wire n130;
   wire n131;
   wire n132;
   wire n133;
   wire n209;
   wire n210;
   wire n211;
   wire n212;
   wire n213;
   wire n214;
   wire n215;
   wire n216;
   wire n217;
   wire n218;
   wire n219;
   wire n220;
   wire n221;
   wire n222;
   wire n223;
   wire n224;
   wire n225;
   wire n226;
   wire n227;
   wire n228;
   wire n229;
   wire n230;
   wire n231;
   wire n232;
   wire n233;
   wire n234;
   wire n235;
   wire n847;
   wire n848;
   wire n849;
   wire n850;
   wire n851;
   wire n852;
   wire n853;
   wire n854;
   wire n855;
   wire n856;
   wire n857;
   wire n858;
   wire n859;
   wire n860;
   wire n861;
   wire n862;
   wire n863;
   wire n864;
   wire n865;
   wire n866;
   wire n867;
   wire n868;
   wire n869;
   wire n870;
   wire n871;
   wire n872;
   wire n873;
   wire n1477;
   wire n1478;
   wire n1479;
   wire n1480;
   wire n1481;
   assign n95 = DATA[0];
   assign n96 = DATA[1];
   assign n97 = DATA[2];
   assign n98 = DATA[3];
   assign n99 = DATA[4];
   assign n100 = DATA[5];
   assign n101 = DATA[6];
   assign n102 = DATA[7];
   assign n103 = DATA[8];
   assign n104 = DATA[9];
   assign n105 = DATA[10];
   assign n106 = DATA[11];
   assign n107 = DATA[12];
   assign n108 = DATA[13];
   assign n109 = DATA[14];
   assign n110 = DATA[15];
   assign n111 = DATA[16];
   assign n112 = DATA[17];
   assign n113 = DATA[18];
   assign n114 = DATA[19];
   assign n115 = DATA[20];
   assign n116 = DATA[21];
   assign n117 = DATA[22];
   assign n118 = DATA[23];
   assign n119 = DATA[24];
   assign n120 = DATA[25];
   assign n121 = DATA[26];
   assign n25 = WE;
   assign n20 = A[0];
   assign n21 = A[1];
   assign n22 = A[2];
   assign n23 = A[3];
   assign n24 = A[4];
   assign n128 = CLK;
   assign n129 = ACLR;
   assign SINE[0] = n130;
   assign SINE[1] = n131;
   assign SINE[2] = n132;
   assign SINE[3] = n133;

      wire [5 : 0] BU2_I;
         assign BU2_I[0] = n20;
         assign BU2_I[1] = n21;
         assign BU2_I[2] = n22;
         assign BU2_I[3] = n23;
         assign BU2_I[4] = n24;
         assign BU2_I[5] = n25;
      wire BU2_T;
         assign BU2_T = 1'b0;
      wire BU2_EN;
         assign BU2_EN = 1'b0;
      wire BU2_Q;
      wire BU2_CLK;
         assign BU2_CLK = 1'b0;
      wire BU2_CE;
         assign BU2_CE = 1'b0;
      wire BU2_ACLR;
         assign BU2_ACLR = 1'b0;
      wire BU2_ASET;
         assign BU2_ASET = 1'b0;
      wire BU2_AINIT;
         assign BU2_AINIT = 1'b0;
      wire BU2_SCLR;
         assign BU2_SCLR = 1'b0;
      wire BU2_SSET;
         assign BU2_SSET = 1'b0;
      wire BU2_SINIT;
         assign BU2_SINIT = 1'b0;
      wire BU2_O;
         assign n2 = BU2_O;
      C_GATE_BIT_V7_0 #(
         "0"    /* c_ainit_val*/,
         0    /* c_enable_rlocs*/,
         0    /* c_gate_type*/,
         0    /* c_has_aclr*/,
         0    /* c_has_ainit*/,
         0    /* c_has_aset*/,
         0    /* c_has_ce*/,
         1    /* c_has_o*/,
         1    /* c_has_q*/,
         0    /* c_has_sclr*/,
         0    /* c_has_sinit*/,
         0    /* c_has_sset*/,
         6    /* c_inputs*/,
         "011111"    /* c_input_inv_mask*/,
         0    /* c_pipe_stages*/,
         "0"    /* c_sinit_val*/,
         0    /* c_sync_enable*/,
         1    /* c_sync_priority*/
      )
      BU2(
         .I(BU2_I),
         .T(BU2_T),
         .EN(BU2_EN),
         .Q(BU2_Q),
         .CLK(BU2_CLK),
         .CE(BU2_CE),
         .ACLR(BU2_ACLR),
         .ASET(BU2_ASET),
         .AINIT(BU2_AINIT),
         .SCLR(BU2_SCLR),
         .SSET(BU2_SSET),
         .SINIT(BU2_SINIT),
         .O(BU2_O)
      );

      wire [5 : 0] BU10_I;
         assign BU10_I[0] = n20;
         assign BU10_I[1] = n21;
         assign BU10_I[2] = n22;
         assign BU10_I[3] = n23;
         assign BU10_I[4] = n24;
         assign BU10_I[5] = n25;
      wire BU10_T;
         assign BU10_T = 1'b0;
      wire BU10_EN;
         assign BU10_EN = 1'b0;
      wire BU10_Q;
      wire BU10_CLK;
         assign BU10_CLK = 1'b0;
      wire BU10_CE;
         assign BU10_CE = 1'b0;
      wire BU10_ACLR;
         assign BU10_ACLR = 1'b0;
      wire BU10_ASET;
         assign BU10_ASET = 1'b0;
      wire BU10_AINIT;
         assign BU10_AINIT = 1'b0;
      wire BU10_SCLR;
         assign BU10_SCLR = 1'b0;
      wire BU10_SSET;
         assign BU10_SSET = 1'b0;
      wire BU10_SINIT;
         assign BU10_SINIT = 1'b0;
      wire BU10_O;
         assign n19 = BU10_O;
      C_GATE_BIT_V7_0 #(
         "0"    /* c_ainit_val*/,
         0    /* c_enable_rlocs*/,
         0    /* c_gate_type*/,
         0    /* c_has_aclr*/,
         0    /* c_has_ainit*/,
         0    /* c_has_aset*/,
         0    /* c_has_ce*/,
         1    /* c_has_o*/,
         1    /* c_has_q*/,
         0    /* c_has_sclr*/,
         0    /* c_has_sinit*/,
         0    /* c_has_sset*/,
         6    /* c_inputs*/,
         "001111"    /* c_input_inv_mask*/,
         0    /* c_pipe_stages*/,
         "0"    /* c_sinit_val*/,
         0    /* c_sync_enable*/,
         1    /* c_sync_priority*/
      )
      BU10(
         .I(BU10_I),
         .T(BU10_T),
         .EN(BU10_EN),
         .Q(BU10_Q),
         .CLK(BU10_CLK),
         .CE(BU10_CE),
         .ACLR(BU10_ACLR),
         .ASET(BU10_ASET),
         .AINIT(BU10_AINIT),
         .SCLR(BU10_SCLR),
         .SSET(BU10_SSET),
         .SINIT(BU10_SINIT),
         .O(BU10_O)
      );

      wire [26 : 0] BU20_D;
         assign BU20_D[0] = n95;
         assign BU20_D[1] = n96;
         assign BU20_D[2] = n97;
         assign BU20_D[3] = n98;
         assign BU20_D[4] = n99;
         assign BU20_D[5] = n100;
         assign BU20_D[6] = n101;
         assign BU20_D[7] = n102;
         assign BU20_D[8] = n103;
         assign BU20_D[9] = n104;
         assign BU20_D[10] = n105;
         assign BU20_D[11] = n106;
         assign BU20_D[12] = n107;
         assign BU20_D[13] = n108;
         assign BU20_D[14] = n109;
         assign BU20_D[15] = n110;
         assign BU20_D[16] = n111;
         assign BU20_D[17] = n112;
         assign BU20_D[18] = n113;
         assign BU20_D[19] = n114;
         assign BU20_D[20] = n115;
         assign BU20_D[21] = n116;
         assign BU20_D[22] = n117;
         assign BU20_D[23] = n118;
         assign BU20_D[24] = n119;
         assign BU20_D[25] = n120;
         assign BU20_D[26] = n121;
      wire [26 : 0] BU20_Q;
         assign n209 = BU20_Q[0];
         assign n210 = BU20_Q[1];
         assign n211 = BU20_Q[2];
         assign n212 = BU20_Q[3];
         assign n213 = BU20_Q[4];
         assign n214 = BU20_Q[5];
         assign n215 = BU20_Q[6];
         assign n216 = BU20_Q[7];
         assign n217 = BU20_Q[8];
         assign n218 = BU20_Q[9];
         assign n219 = BU20_Q[10];
         assign n220 = BU20_Q[11];
         assign n221 = BU20_Q[12];
         assign n222 = BU20_Q[13];
         assign n223 = BU20_Q[14];
         assign n224 = BU20_Q[15];
         assign n225 = BU20_Q[16];
         assign n226 = BU20_Q[17];
         assign n227 = BU20_Q[18];
         assign n228 = BU20_Q[19];
         assign n229 = BU20_Q[20];
         assign n230 = BU20_Q[21];
         assign n231 = BU20_Q[22];
         assign n232 = BU20_Q[23];
         assign n233 = BU20_Q[24];
         assign n234 = BU20_Q[25];
         assign n235 = BU20_Q[26];
      wire BU20_CLK;
         assign BU20_CLK = n128;
      wire BU20_CE;
         assign BU20_CE = n2;
      C_REG_FD_V7_0 #(
         "000000000000000000000000000"    /* c_ainit_val*/,
         0    /* c_enable_rlocs*/,
         0    /* c_has_aclr*/,
         0    /* c_has_ainit*/,
         0    /* c_has_aset*/,
         1    /* c_has_ce*/,
         0    /* c_has_sclr*/,
         0    /* c_has_sinit*/,
         0    /* c_has_sset*/,
         "000000000000000000000000000"    /* c_sinit_val*/,
         0    /* c_sync_enable*/,
         0    /* c_sync_priority*/,
         27    /* c_width*/
      )
      BU20(
         .D(BU20_D),
         .Q(BU20_Q),
         .CLK(BU20_CLK),
         .CE(BU20_CE)
      );

      wire [26 : 0] BU76_A;
         assign BU76_A[0] = n36;
         assign BU76_A[1] = n37;
         assign BU76_A[2] = n38;
         assign BU76_A[3] = n39;
         assign BU76_A[4] = n40;
         assign BU76_A[5] = n41;
         assign BU76_A[6] = n42;
         assign BU76_A[7] = n43;
         assign BU76_A[8] = n44;
         assign BU76_A[9] = n45;
         assign BU76_A[10] = n46;
         assign BU76_A[11] = n47;
         assign BU76_A[12] = n48;
         assign BU76_A[13] = n49;
         assign BU76_A[14] = n50;
         assign BU76_A[15] = n51;
         assign BU76_A[16] = n52;
         assign BU76_A[17] = n53;
         assign BU76_A[18] = n54;
         assign BU76_A[19] = n55;
         assign BU76_A[20] = n56;
         assign BU76_A[21] = n57;
         assign BU76_A[22] = n58;
         assign BU76_A[23] = n59;
         assign BU76_A[24] = n60;
         assign BU76_A[25] = n61;
         assign BU76_A[26] = n62;
      wire [26 : 0] BU76_B;
         assign BU76_B[0] = n209;
         assign BU76_B[1] = n210;
         assign BU76_B[2] = n211;
         assign BU76_B[3] = n212;
         assign BU76_B[4] = n213;
         assign BU76_B[5] = n214;
         assign BU76_B[6] = n215;
         assign BU76_B[7] = n216;
         assign BU76_B[8] = n217;
         assign BU76_B[9] = n218;
         assign BU76_B[10] = n219;
         assign BU76_B[11] = n220;
         assign BU76_B[12] = n221;
         assign BU76_B[13] = n222;
         assign BU76_B[14] = n223;
         assign BU76_B[15] = n224;
         assign BU76_B[16] = n225;
         assign BU76_B[17] = n226;
         assign BU76_B[18] = n227;
         assign BU76_B[19] = n228;
         assign BU76_B[20] = n229;
         assign BU76_B[21] = n230;
         assign BU76_B[22] = n231;
         assign BU76_B[23] = n232;
         assign BU76_B[24] = n233;
         assign BU76_B[25] = n234;
         assign BU76_B[26] = n235;
      wire [26 : 0] BU76_Q;
         assign n36 = BU76_Q[0];
         assign n37 = BU76_Q[1];
         assign n38 = BU76_Q[2];
         assign n39 = BU76_Q[3];
         assign n40 = BU76_Q[4];
         assign n41 = BU76_Q[5];
         assign n42 = BU76_Q[6];
         assign n43 = BU76_Q[7];
         assign n44 = BU76_Q[8];
         assign n45 = BU76_Q[9];
         assign n46 = BU76_Q[10];
         assign n47 = BU76_Q[11];
         assign n48 = BU76_Q[12];
         assign n49 = BU76_Q[13];
         assign n50 = BU76_Q[14];
         assign n51 = BU76_Q[15];
         assign n52 = BU76_Q[16];
         assign n53 = BU76_Q[17];
         assign n54 = BU76_Q[18];
         assign n55 = BU76_Q[19];
         assign n56 = BU76_Q[20];
         assign n57 = BU76_Q[21];
         assign n58 = BU76_Q[22];
         assign n59 = BU76_Q[23];
         assign n60 = BU76_Q[24];
         assign n61 = BU76_Q[25];
         assign n62 = BU76_Q[26];
      wire BU76_CLK;
         assign BU76_CLK = n128;
      wire BU76_ACLR;
         assign BU76_ACLR = n129;
      C_ADDSUB_V7_0 #(
         0    /* c_add_mode*/,
         "000000000000000000000000000"    /* c_ainit_val*/,
         1    /* c_a_type*/,
         27    /* c_a_width*/,
         1    /* c_bypass_enable*/,
         0    /* c_bypass_low*/,
         0    /* c_b_constant*/,
         1    /* c_b_type*/,
         "000000000000000000000000000"    /* c_b_value*/,
         27    /* c_b_width*/,
         0    /* c_enable_rlocs*/,
         1    /* c_has_aclr*/,
         0    /* c_has_add*/,
         0    /* c_has_ainit*/,
         0    /* c_has_aset*/,
         0    /* c_has_a_signed*/,
         0    /* c_has_bypass*/,
         0    /* c_has_bypass_with_cin*/,
         0    /* c_has_b_in*/,
         0    /* c_has_b_out*/,
         0    /* c_has_b_signed*/,
         0    /* c_has_ce*/,
         0    /* c_has_c_in*/,
         0    /* c_has_c_out*/,
         0    /* c_has_ovfl*/,
         1    /* c_has_q*/,
         0    /* c_has_q_b_out*/,
         0    /* c_has_q_c_out*/,
         0    /* c_has_q_ovfl*/,
         1    /* c_has_s*/,
         0    /* c_has_sclr*/,
         0    /* c_has_sinit*/,
         0    /* c_has_sset*/,
         26    /* c_high_bit*/,
         1    /* c_latency*/,
         0    /* c_low_bit*/,
         27    /* c_out_width*/,
         0    /* c_pipe_stages*/,
         "000000000000000000000000000"    /* c_sinit_val*/,
         0    /* c_sync_enable*/,
         0    /* c_sync_priority*/
      )
      BU76(
         .A(BU76_A),
         .B(BU76_B),
         .Q(BU76_Q),
         .CLK(BU76_CLK),
         .ACLR(BU76_ACLR)
      );

      wire BU238_CLK;
         assign BU238_CLK = n128;
      wire BU238_SDOUT;
         assign n94 = BU238_SDOUT;
      wire BU238_ACLR;
         assign BU238_ACLR = n129;
      C_SHIFT_FD_V7_0 #(
         "0"    /* c_ainit_val*/,
         0    /* c_enable_rlocs*/,
         1    /* c_fill_data*/,
         1    /* c_has_aclr*/,
         0    /* c_has_ainit*/,
         0    /* c_has_aset*/,
         0    /* c_has_ce*/,
         0    /* c_has_d*/,
         0    /* c_has_lsb_2_msb*/,
         0    /* c_has_q*/,
         0    /* c_has_sclr*/,
         0    /* c_has_sdin*/,
         1    /* c_has_sdout*/,
         0    /* c_has_sinit*/,
         0    /* c_has_sset*/,
         1    /* c_shift_type*/,
         "0"    /* c_sinit_val*/,
         0    /* c_sync_enable*/,
         1    /* c_sync_priority*/,
         1    /* c_width*/
      )
      BU238(
         .CLK(BU238_CLK),
         .SDOUT(BU238_SDOUT),
         .ACLR(BU238_ACLR)
      );

      wire [26 : 0] BU245_D;
         assign BU245_D[0] = n95;
         assign BU245_D[1] = n96;
         assign BU245_D[2] = n97;
         assign BU245_D[3] = n98;
         assign BU245_D[4] = n99;
         assign BU245_D[5] = n100;
         assign BU245_D[6] = n101;
         assign BU245_D[7] = n102;
         assign BU245_D[8] = n103;
         assign BU245_D[9] = n104;
         assign BU245_D[10] = n105;
         assign BU245_D[11] = n106;
         assign BU245_D[12] = n107;
         assign BU245_D[13] = n108;
         assign BU245_D[14] = n109;
         assign BU245_D[15] = n110;
         assign BU245_D[16] = n111;
         assign BU245_D[17] = n112;
         assign BU245_D[18] = n113;
         assign BU245_D[19] = n114;
         assign BU245_D[20] = n115;
         assign BU245_D[21] = n116;
         assign BU245_D[22] = n117;
         assign BU245_D[23] = n118;
         assign BU245_D[24] = n119;
         assign BU245_D[25] = n120;
         assign BU245_D[26] = n121;
      wire [26 : 0] BU245_Q;
         assign n847 = BU245_Q[0];
         assign n848 = BU245_Q[1];
         assign n849 = BU245_Q[2];
         assign n850 = BU245_Q[3];
         assign n851 = BU245_Q[4];
         assign n852 = BU245_Q[5];
         assign n853 = BU245_Q[6];
         assign n854 = BU245_Q[7];
         assign n855 = BU245_Q[8];
         assign n856 = BU245_Q[9];
         assign n857 = BU245_Q[10];
         assign n858 = BU245_Q[11];
         assign n859 = BU245_Q[12];
         assign n860 = BU245_Q[13];
         assign n861 = BU245_Q[14];
         assign n862 = BU245_Q[15];
         assign n863 = BU245_Q[16];
         assign n864 = BU245_Q[17];
         assign n865 = BU245_Q[18];
         assign n866 = BU245_Q[19];
         assign n867 = BU245_Q[20];
         assign n868 = BU245_Q[21];
         assign n869 = BU245_Q[22];
         assign n870 = BU245_Q[23];
         assign n871 = BU245_Q[24];
         assign n872 = BU245_Q[25];
         assign n873 = BU245_Q[26];
      wire BU245_CLK;
         assign BU245_CLK = n128;
      wire BU245_CE;
         assign BU245_CE = n19;
      C_REG_FD_V7_0 #(
         "000000000000000000000000000"    /* c_ainit_val*/,
         0    /* c_enable_rlocs*/,
         0    /* c_has_aclr*/,
         0    /* c_has_ainit*/,
         0    /* c_has_aset*/,
         1    /* c_has_ce*/,
         0    /* c_has_sclr*/,
         0    /* c_has_sinit*/,
         0    /* c_has_sset*/,
         "000000000000000000000000000"    /* c_sinit_val*/,
         0    /* c_sync_enable*/,
         0    /* c_sync_priority*/,
         27    /* c_width*/
      )
      BU245(
         .D(BU245_D),
         .Q(BU245_Q),
         .CLK(BU245_CLK),
         .CE(BU245_CE)
      );

      wire [26 : 0] BU301_A;
         assign BU301_A[0] = n36;
         assign BU301_A[1] = n37;
         assign BU301_A[2] = n38;
         assign BU301_A[3] = n39;
         assign BU301_A[4] = n40;
         assign BU301_A[5] = n41;
         assign BU301_A[6] = n42;
         assign BU301_A[7] = n43;
         assign BU301_A[8] = n44;
         assign BU301_A[9] = n45;
         assign BU301_A[10] = n46;
         assign BU301_A[11] = n47;
         assign BU301_A[12] = n48;
         assign BU301_A[13] = n49;
         assign BU301_A[14] = n50;
         assign BU301_A[15] = n51;
         assign BU301_A[16] = n52;
         assign BU301_A[17] = n53;
         assign BU301_A[18] = n54;
         assign BU301_A[19] = n55;
         assign BU301_A[20] = n56;
         assign BU301_A[21] = n57;
         assign BU301_A[22] = n58;
         assign BU301_A[23] = n59;
         assign BU301_A[24] = n60;
         assign BU301_A[25] = n61;
         assign BU301_A[26] = n62;
      wire [26 : 0] BU301_B;
         assign BU301_B[0] = n847;
         assign BU301_B[1] = n848;
         assign BU301_B[2] = n849;
         assign BU301_B[3] = n850;
         assign BU301_B[4] = n851;
         assign BU301_B[5] = n852;
         assign BU301_B[6] = n853;
         assign BU301_B[7] = n854;
         assign BU301_B[8] = n855;
         assign BU301_B[9] = n856;
         assign BU301_B[10] = n857;
         assign BU301_B[11] = n858;
         assign BU301_B[12] = n859;
         assign BU301_B[13] = n860;
         assign BU301_B[14] = n861;
         assign BU301_B[15] = n862;
         assign BU301_B[16] = n863;
         assign BU301_B[17] = n864;
         assign BU301_B[18] = n865;
         assign BU301_B[19] = n866;
         assign BU301_B[20] = n867;
         assign BU301_B[21] = n868;
         assign BU301_B[22] = n869;
         assign BU301_B[23] = n870;
         assign BU301_B[24] = n871;
         assign BU301_B[25] = n872;
         assign BU301_B[26] = n873;
      wire [26 : 0] BU301_Q;
         assign n86 = BU301_Q[23];
         assign n87 = BU301_Q[24];
         assign n88 = BU301_Q[25];
         assign n89 = BU301_Q[26];
      wire BU301_CLK;
         assign BU301_CLK = n128;
      C_ADDSUB_V7_0 #(
         0    /* c_add_mode*/,
         "000000000000000000000000000"    /* c_ainit_val*/,
         1    /* c_a_type*/,
         27    /* c_a_width*/,
         1    /* c_bypass_enable*/,
         0    /* c_bypass_low*/,
         0    /* c_b_constant*/,
         1    /* c_b_type*/,
         "000000000000000000000000000"    /* c_b_value*/,
         27    /* c_b_width*/,
         0    /* c_enable_rlocs*/,
         0    /* c_has_aclr*/,
         0    /* c_has_add*/,
         0    /* c_has_ainit*/,
         0    /* c_has_aset*/,
         0    /* c_has_a_signed*/,
         0    /* c_has_bypass*/,
         0    /* c_has_bypass_with_cin*/,
         0    /* c_has_b_in*/,
         0    /* c_has_b_out*/,
         0    /* c_has_b_signed*/,
         0    /* c_has_ce*/,
         0    /* c_has_c_in*/,
         0    /* c_has_c_out*/,
         0    /* c_has_ovfl*/,
         1    /* c_has_q*/,
         0    /* c_has_q_b_out*/,
         0    /* c_has_q_c_out*/,
         0    /* c_has_q_ovfl*/,
         1    /* c_has_s*/,
         0    /* c_has_sclr*/,
         0    /* c_has_sinit*/,
         0    /* c_has_sset*/,
         26    /* c_high_bit*/,
         1    /* c_latency*/,
         0    /* c_low_bit*/,
         27    /* c_out_width*/,
         0    /* c_pipe_stages*/,
         "000000000000000000000000000"    /* c_sinit_val*/,
         0    /* c_sync_enable*/,
         0    /* c_sync_priority*/
      )
      BU301(
         .A(BU301_A),
         .B(BU301_B),
         .Q(BU301_Q),
         .CLK(BU301_CLK)
      );

      wire [3 : 0] BU485_D;
         assign BU485_D[0] = n86;
         assign BU485_D[1] = n87;
         assign BU485_D[2] = n88;
         assign BU485_D[3] = n89;
      wire [3 : 0] BU485_Q;
         assign n1478 = BU485_Q[0];
         assign n1479 = BU485_Q[1];
         assign n1480 = BU485_Q[2];
         assign n1481 = BU485_Q[3];
      wire BU485_CLK;
         assign BU485_CLK = n128;
      C_REG_FD_V7_0 #(
         "0000"    /* c_ainit_val*/,
         0    /* c_enable_rlocs*/,
         0    /* c_has_aclr*/,
         0    /* c_has_ainit*/,
         0    /* c_has_aset*/,
         0    /* c_has_ce*/,
         0    /* c_has_sclr*/,
         0    /* c_has_sinit*/,
         0    /* c_has_sset*/,
         "0000"    /* c_sinit_val*/,
         0    /* c_sync_enable*/,
         0    /* c_sync_priority*/,
         4    /* c_width*/
      )
      BU485(
         .D(BU485_D),
         .Q(BU485_Q),
         .CLK(BU485_CLK)
      );

      wire [3 : 0] BU466_A;
         assign BU466_A[0] = n1478;
         assign BU466_A[1] = n1479;
         assign BU466_A[2] = n1480;
         assign BU466_A[3] = n1481;
      wire BU466_CLK;
         assign BU466_CLK = n128;
      wire BU466_QSPO_CE;
         assign BU466_QSPO_CE = n1477;
      wire [3 : 0] BU466_QSPO;
         assign n130 = BU466_QSPO[0];
         assign n131 = BU466_QSPO[1];
         assign n132 = BU466_QSPO[2];
         assign n133 = BU466_QSPO[3];
      wire BU466_QSPO_RST;
         assign BU466_QSPO_RST = n129;
      C_DIST_MEM_V7_0 #(
         4    /* c_addr_width*/,
         "0"    /* c_default_data*/,
         2    /* c_default_data_radix*/,
         16    /* c_depth*/,
         0    /* c_enable_rlocs*/,
         0    /* c_generate_mif*/,
         1    /* c_has_clk*/,
         0    /* c_has_d*/,
         0    /* c_has_dpo*/,
         0    /* c_has_dpra*/,
         0    /* c_has_i_ce*/,
         0    /* c_has_qdpo*/,
         0    /* c_has_qdpo_ce*/,
         0    /* c_has_qdpo_clk*/,
         1    /* c_has_qdpo_rst*/,
         0    /* c_has_qdpo_srst*/,
         1    /* c_has_qspo*/,
         1    /* c_has_qspo_ce*/,
         1    /* c_has_qspo_rst*/,
         0    /* c_has_qspo_srst*/,
         0    /* c_has_rd_en*/,
         0    /* c_has_spo*/,
         0    /* c_has_spra*/,
         0    /* c_has_we*/,
         1    /* c_latency*/,
         "dds_SINCOS_TABLE_TRIG_ROM.mif"    /* c_mem_init_file*/,
         0    /* c_mem_type*/,
         0    /* c_mux_type*/,
         1    /* c_qce_joined*/,
         0    /* c_qualify_we*/,
         1    /* c_read_mif*/,
         0    /* c_reg_a_d_inputs*/,
         0    /* c_reg_dpra_input*/,
         0    /* c_sync_enable*/,
         4    /* c_width*/
      )
      BU466(
         .A(BU466_A),
         .CLK(BU466_CLK),
         .QSPO_CE(BU466_QSPO_CE),
         .QSPO(BU466_QSPO),
         .QSPO_RST(BU466_QSPO_RST)
      );

      wire BU496_CLK;
         assign BU496_CLK = n128;
      wire BU496_SDIN;
         assign BU496_SDIN = n94;
      wire BU496_SDOUT;
         assign n1477 = BU496_SDOUT;
      wire BU496_ACLR;
         assign BU496_ACLR = n129;
      C_SHIFT_FD_V7_0 #(
         "0"    /* c_ainit_val*/,
         0    /* c_enable_rlocs*/,
         5    /* c_fill_data*/,
         1    /* c_has_aclr*/,
         0    /* c_has_ainit*/,
         0    /* c_has_aset*/,
         0    /* c_has_ce*/,
         0    /* c_has_d*/,
         0    /* c_has_lsb_2_msb*/,
         0    /* c_has_q*/,
         0    /* c_has_sclr*/,
         1    /* c_has_sdin*/,
         1    /* c_has_sdout*/,
         0    /* c_has_sinit*/,
         0    /* c_has_sset*/,
         1    /* c_shift_type*/,
         "0"    /* c_sinit_val*/,
         0    /* c_sync_enable*/,
         0    /* c_sync_priority*/,
         1    /* c_width*/
      )
      BU496(
         .CLK(BU496_CLK),
         .SDIN(BU496_SDIN),
         .SDOUT(BU496_SDOUT),
         .ACLR(BU496_ACLR)
      );

//synopsys translate_on

endmodule
