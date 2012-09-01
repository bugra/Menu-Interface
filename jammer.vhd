------------------------------------------------------------------------------
-- user_logic.vhd - entity/architecture pair
------------------------------------------------------------------------------
--
-- ***************************************************************************
-- ** Copyright (c) 1995-2006 Xilinx, Inc.  All rights reserved.            **
-- **                                                                       **
-- ** Xilinx, Inc.                                                          **
-- ** XILINX IS PROVIDING THIS DESIGN, CODE, OR INFORMATION "AS IS"         **
-- ** AS A COURTESY TO YOU, SOLELY FOR USE IN DEVELOPING PROGRAMS AND       **
-- ** SOLUTIONS FOR XILINX DEVICES.  BY PROVIDING THIS DESIGN, CODE,        **
-- ** OR INFORMATION AS ONE POSSIBLE IMPLEMENTATION OF THIS FEATURE,        **
-- ** APPLICATION OR STANDARD, XILINX IS MAKING NO REPRESENTATION           **
-- ** THAT THIS IMPLEMENTATION IS FREE FROM ANY CLAIMS OF INFRINGEMENT,     **
-- ** AND YOU ARE RESPONSIBLE FOR OBTAINING ANY RIGHTS YOU MAY REQUIRE      **
-- ** FOR YOUR IMPLEMENTATION.  XILINX EXPRESSLY DISCLAIMS ANY              **
-- ** WARRANTY WHATSOEVER WITH RESPECT TO THE ADEQUACY OF THE               **
-- ** IMPLEMENTATION, INCLUDING BUT NOT LIMITED TO ANY WARRANTIES OR        **
-- ** REPRESENTATIONS THAT THIS IMPLEMENTATION IS FREE FROM CLAIMS OF       **
-- ** INFRINGEMENT, IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS       **
-- ** FOR A PARTICULAR PURPOSE.                                             **
-- **                                                                       **
-- ***************************************************************************
--
------------------------------------------------------------------------------
-- Filename:          jammer.vhd
-- Version:           1.00.a
-- Description:       User logic.
-- Date:              Tue Dec 23 14:35:20 2008 (by Create and Import Peripheral Wizard)
-- VHDL Standard:     VHDL'93
------------------------------------------------------------------------------
-- Naming Conventions:
--   active low signals:                    "*_n"
--   clock signals:                         "clk", "clk_div#", "clk_#x"
--   reset signals:                         "rst", "rst_n"
--   generics:                              "C_*"
--   user defined types:                    "*_TYPE"
--   state machine next state:              "*_ns"
--   state machine current state:           "*_cs"
--   combinatorial signals:                 "*_com"
--   pipelined or register delay signals:   "*_d#"
--   counter signals:                       "*cnt*"
--   clock enable signals:                  "*_ce"
--   internal version of output port:       "*_i"
--   device pins:                           "*_pin"
--   ports:                                 "- Names begin with Uppercase"
--   processes:                             "*_PROCESS"
--   component instantiations:              "<ENTITY_>I_<#|FUNC>"
------------------------------------------------------------------------------

-- DO NOT EDIT BELOW THIS LINE --------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use IEEE.NUMERIC_STD.ALL;

--library proc_common_v2_00_a;
--use proc_common_v2_00_a.proc_common_pkg.all;
-- DO NOT EDIT ABOVE THIS LINE --------------------

--USER libraries added here
   
------------------------------------------------------------------------------
-- Entity section
------------------------------------------------------------------------------
-- Definition of Generics:
--   C_DWIDTH                     -- User logic data bus width
--   C_NUM_CE                     -- User logic chip enable bus width
--
-- Definition of Ports:
--   Bus2IP_Clk                   -- Bus to IP clock
--   Bus2IP_Reset                 -- Bus to IP reset
--   Bus2IP_Data                  -- Bus to IP data bus for user logic
--   Bus2IP_BE                    -- Bus to IP byte enables for user logic
--   Bus2IP_RdCE                  -- Bus to IP read chip enable for user logic
--   Bus2IP_WrCE                  -- Bus to IP write chip enable for user logic
--   IP2Bus_Data                  -- IP to Bus data bus for user logic
--   IP2Bus_Ack                   -- IP to Bus acknowledgement
--   IP2Bus_Retry                 -- IP to Bus retry response
--   IP2Bus_Error                 -- IP to Bus error response
--   IP2Bus_ToutSup               -- IP to Bus timeout suppress
------------------------------------------------------------------------------

entity jammer is
  generic
  (
    -- ADD USER GENERICS BELOW THIS LINE ---------------
    -- USER generics added here
    -- ADD USER GENERICS ABOVE THIS LINE ---------------
	 
    -- DO NOT EDIT BELOW THIS LINE ---------------------
    -- Bus protocol parameters, do not add to or delete
    C_DWIDTH                       : integer              := 32;
    C_NUM_CE                       : integer              := 8
    -- DO NOT EDIT ABOVE THIS LINE ---------------------
  );
  port
  (
    -- ADD USER PORTS BELOW THIS LINE ------------------
    -- USER ports added here
	 dout     			:out std_logic_vector(3 downto 0);
	 dout_bar 			:out std_logic_vector(3 downto 0);
	 control_signals  :out std_logic_vector(3 downto 0);
	 clk80 				:in std_logic
    -- ADD USER PORTS ABOVE THIS LINE ------------------
	
    -- DO NOT EDIT BELOW THIS LINE ---------------------
    -- Bus protocol ports, do not add to or delete
--    Bus2IP_Clk                     : in  std_logic;
--    Bus2IP_Reset                   : in  std_logic;
--    Bus2IP_Data                    : in  std_logic_vector(0 to C_DWIDTH-1);
--    Bus2IP_BE                      : in  std_logic_vector(0 to C_DWIDTH/8-1);
--    Bus2IP_RdCE                    : in  std_logic_vector(0 to C_NUM_CE-1);
--    Bus2IP_WrCE                    : in  std_logic_vector(0 to C_NUM_CE-1);
--    IP2Bus_Data                    : out std_logic_vector(0 to C_DWIDTH-1);
--    IP2Bus_Ack                     : out std_logic;
--    IP2Bus_Retry                   : out std_logic;
--    IP2Bus_Error                   : out std_logic;
--    IP2Bus_ToutSup                 : out std_logic;

    -- DO NOT EDIT ABOVE THIS LINE ---------------------
  );
end entity jammer;

------------------------------------------------------------------------------
-- Architecture section
------------------------------------------------------------------------------

architecture IMP of jammer is

  --USER signal declarations added here, as needed for user logic

  ------------------------------------------
  -- Signals for user logic slave model s/w accessible register example
  ------------------------------------------
  
  component dds
	port (
	DATA: IN std_logic_VECTOR(26 downto 0);
	WE: IN std_logic;
	A: IN std_logic_VECTOR(4 downto 0);
	CLK: IN std_logic;
	ACLR: IN std_logic;
	SINE: OUT std_logic_VECTOR(3 downto 0));
	end component;
  
  signal slv_reg0                       : std_logic_vector(0 to C_DWIDTH-1);
  signal slv_reg1                       : std_logic_vector(0 to C_DWIDTH-1);
  signal slv_reg2                       : std_logic_vector(0 to C_DWIDTH-1);
  signal slv_reg3                       : std_logic_vector(0 to C_DWIDTH-1);
  signal slv_reg4                       : std_logic_vector(0 to C_DWIDTH-1);
  signal slv_reg5                       : std_logic_vector(0 to C_DWIDTH-1);
  signal slv_reg6                       : std_logic_vector(0 to C_DWIDTH-1);
  signal slv_reg7                       : std_logic_vector(0 to C_DWIDTH-1);
  signal slv_reg_write_select           : std_logic_vector(0 to 7);
  signal slv_reg_read_select            : std_logic_vector(0 to 7);
  signal slv_ip2bus_data                : std_logic_vector(0 to C_DWIDTH-1);
  signal slv_read_ack                   : std_logic;
  signal slv_write_ack                  : std_logic;


  signal frekans1,frekans2,frekans3,frekans4:std_logic_vector(18 downto 0);
  signal frekans_L1,frekans_L2,frekans_L3,frekans_L4:std_logic_vector(18 downto 0);
  signal frekans_H1,frekans_H2,frekans_H3,frekans_H4:std_logic_vector(18 downto 0);
  signal frekans_M11,frekans_M21,frekans_M31,frekans_M41:std_logic_vector(18 downto 0);--orta küçük frekanslar
  signal frekans_M12,frekans_M22,frekans_M32,frekans_M42:std_logic_vector(18 downto 0);--orta büyük frekanslar
  signal frekans1_27,frekans2_27,frekans3_27,frekans4_27 : std_logic_vector(26 downto 0);
  
  signal sine1,sine2,sine3,sine4:std_logic_vector(3 downto 0);
  signal sentezor_yazma:std_logic;
  signal hard_signals:std_logic_vector(3 downto 0);
  signal step_size11,step_size21,step_size31,step_size41:std_logic_vector(7 downto 0);--ilk step size
  signal step_size12,step_size22,step_size32,step_size42:std_logic_vector(7 downto 0);--ikinci step size
  signal step_size13,step_size23,step_size33,step_size43:std_logic_vector(7 downto 0);--üçüncü step size
  signal step_size_yaz:std_logic;
  signal cum_noise:STD_LOGIC_VECTOR(4 downto 0);
  signal random_sweep_mode:std_logic;
  signal prbs31:std_logic_vector(30 downto 0);
  signal sweep_start:std_logic_vector(3 downto 0);
  signal prbs_update:std_logic;
  signal jammer_calisma_modu:std_logic_vector(1 downto 0);
  signal freq_div_counter:std_logic_vector(15 downto 0);
  
  signal delay: std_logic_vector(9 downto 0);
  type arr1 is array(0 to 3) of std_logic_vector(9 downto 0);
  signal delay_cnt_arr : arr1;
  signal delay_cnt_arr2 : arr1;
  signal supress_dout : std_logic_vector (3 downto 0);
  signal supress_dout_bar : std_logic_vector (3 downto 0);
  signal shifted_noise1,shifted_noise2,shifted_noise3,shifted_noise4 : std_logic_vector (7 downto 0);
  
  signal clk					:std_logic;
  signal reset					:std_logic;
  signal En_16x_Baud			:std_logic;
  signal RX						:std_logic;
  signal Read_RX_FIFO		:std_logic;
  signal Reset_RX_FIFO		:std_logic;
  signal RX_Data 				:std_logic_vector(7 downto 0);
  signal RX_BUFFER_FULL 	:std_logic;
  signal RX_Frame_Error		:std_logic;
  signal RX_Overrun_Error	:std_logic;
  signal RX_Parity_Error	:std_logic;
  signal RX_Data_Present	:std_logic;
  signal p_RX_Data_Present	:std_logic;
  signal T_Buffer_Full		:std_logic :='0';
  signal T_Data				:std_logic_vector(7 downto 0);
  signal Write_TX_FIFO		:std_logic;
  signal NewData				:std_logic;
  
  signal TX						:std_logic;
  signal TX_Data				:std_logic_vector(7 downto 0):= (others=>'0');
  signal TX_Buffer_Full		:std_logic;
  signal TX_Buffer_Empty	:std_logic;
  
  
  signal Din							:std_logic_vector(0 to 7);
  signal D_out							:std_logic_vector(0 to 7);
  signal WrEn							:std_logic;
  signal RdEn							:std_logic;
  signal RAM_RdAddr					:std_logic_vector(12 downto 0);
	
	
  signal ResetCounter				:std_logic_vector(0 to 3):= "0000";
  signal new_reset					:std_logic;
  signal Menu_Addres					:std_logic_vector (7 downto 0) := (others=>'0');
  signal Start_Address				:std_logic_vector (4 downto 0) := (others=>'0');
  
  type byte_array  is array (0 to 23) of std_logic_vector(3 downto 0);
  type byte_array2 is array (0 to 5)  of std_logic_vector(3 downto 0);
  type byte_array3 is array (0 to 1)  of std_logic_vector(3 downto 0);
	
  signal SFrekansKaydet				:std_logic:='0';
  signal SFrekansAdresi				:std_logic_vector (5 downto 0) := (others=>'0');
  signal SFrekans						:byte_array; 	
  signal S_StepSize					:byte_array2;
  signal SStepKaydet					:std_logic;
  signal SStepAdresi					:std_logic_vector (3 downto 0) := (others=>'0'); 
  
  signal Rast_Step					:std_logic_vector (1 downto 0) := (others=>'0');
  signal R_StepSize					:byte_array3; 
  signal StepKaydet					:std_logic;
  signal StepAdresi					:std_logic_vector (1 downto 0) := (others=>'0'); 
  signal FrekansAdresi				:std_logic_vector (4 downto 0) := (others=>'0');
  signal FrekansKaydet				:std_logic:='0';
  signal RastFrekans					:byte_array;

  signal PRBSFreKaydet				:std_logic:='0';
  signal BantKaydet					:std_logic:='0';
  signal MerkezFrekans				:byte_array2;
  signal PRBSFrekansAdresi			:std_logic_vector (4 downto 0):= (others=>'0');
  signal BantAdresi					:std_logic_vector (2 downto 0):= (others=>'0');
  signal FrekansBandi				:byte_array2;
  
  signal BantSecimi					:std_logic_vector (1 downto 0):= (others=>'0');
  signal MainBantKaydet				:std_logic:='0';
	
begin

	Receiver : entity work.OPB_UARTLITE_RX PORT MAP(
		--COMMON COMPONENTS
		Clk=>Clk80,
		Reset=> new_reset,
		En_16x_Baud=> EN_16x_Baud,
		--Receiver Components
		RX=>RX,
		Read_RX_FIFO=>Read_RX_FIFO,
		Reset_RX_FIFO=>new_reset,
		RX_Data=>RX_Data,
		RX_Data_Present=>RX_Data_Present,
		--Other Signals
		RX_BUFFER_FULL=>RX_BUFFER_FULL,
		RX_Frame_Error=>RX_Frame_Error,
		RX_Overrun_Error=>open,
		RX_Parity_Error=>RX_Parity_Error
	);
	
	Transmitter: entity work.OPB_UARTLITE_TX PORT MAP(
		Clk=>Clk80,
		Reset=> new_reset,
		En_16x_Baud=> EN_16x_Baud,
		TX => TX,
		Write_TX_FIFO => Write_TX_FIFO,
		Reset_TX_FIFO => new_reset,
		TX_Data => TX_Data,
		TX_Buffer_Full => TX_Buffer_Full,
		TX_Buffer_Empty => TX_Buffer_Empty
	); 
	
	Diagram: entity work.Diagram1 PORT MAP(
		--COMMON COMPONENTS
		CLK=>Clk80,
		RESET=>new_reset,
		--TX COMPONENT OF DIAGRAM1 
		T_Buffer_Full=>'0',
		T_Data=>open,
		T_Write=>open,
		--RX COMPONENT OF DIAGRAM1
		Data_Present=>NewData,
		Data=>RX_Data,
		Data_Read=>Read_RX_FIFO,
		--Write 
		Buffer_Write=>WrEn,
		Buffer_Data=>Din,
		--Read
		Buffer_Read=>RdEn,
		Read_Data=>D_out,
		--Start
		Start_Address=>Start_Address,
		Menu_Addres=>Menu_Addres,
		Rast_Step=>Rast_Step,
		SFrekansKaydet=>SFrekansKaydet,
		SStepKaydet=>SStepKaydet,
		FrekansKaydet=>FrekansKaydet,
		StepKaydet=>StepKaydet,
		PRBSFreKaydet=>PRBSFreKaydet,
		BantKaydet=>BantKaydet,
		MainBantKaydet=>MainBantKaydet
	);
	
	RAM_RdAddr <= Start_Address & Menu_Addres;
	
	Ram: entity work.ram_512x8 PORT MAP(
		--COMMON COMPONENTS
		clk=>clk80,
		reset=>new_reset,
		--WRITE COMPONENTS
		Din=>Din,
		WrEn=>WrEn,  
		--READ COMPONENTS
		RdEn=>RdEn,
		Dout=>D_out,
		RdAddr=>RAM_RdAddr
	);
	--New Data Present
	--In order to prevent writing double
	Process(clk80)  
	begin 
		if(rising_edge(clk80)) then
			p_RX_Data_Present <= RX_Data_Present;
			NewData <= '0';
			if p_RX_Data_Present = '0' and RX_Data_Present = '1' then
				NewData <= '1';
			end if;
		end if;
	end process;

	--new Reset in order to reset Diagram Components
	Process(clk80)  
	begin 
		if Reset = '0' then
			new_reset<='1';
			ResetCounter <= (others => '0');
			  
		elsif(rising_edge(clk80)) then
			if(Resetcounter=15) then
				new_reset<='0';
			else
				new_reset<='1';
				ResetCounter<=ResetCounter+1;
			end if;
		end if;
	end process;
	
	--BANTSECIMI
	process(clk)
	variable Rx_Variable				:std_logic_vector(7 downto 0);
	begin
		if (rising_edge(clk)) then
			if MainBantKaydet = '1' then
					Rx_Variable  := RX_Data-48;
				if (Rx_Variable=1) then
					BantSecimi<="00";
				elsif (Rx_Variable=2) then
					BantSecimi<="01";
				elsif (Rx_Variable=3) then
					BantSecimi<="10";
				else
					BantSecimi<="11";
				end if;
			end if;
		end if;    
	end process;
	
	--STANDARD MOD
	--FREQUENCY VALUES
	process(clk80)
		variable Rx_Variable				: std_logic_vector( 7 downto 0);
		variable number_Frekans			: std_logic_vector( 4 downto 0);
	begin
		if (rising_edge(clk80)) then
			if SFrekansKaydet = '1' then
			jammer_calisma_modu<="00";
			random_sweep_mode<='0';
				SFrekansAdresi <= SFrekansAdresi + 1;
				if (SFrekansAdresi < 24) then
					if	(RX_Data>57) then
							Rx_Variable  := RX_Data-55;
						else
							Rx_Variable  := RX_Data-48;
					end if;
					SFrekans( conv_integer(SFrekansAdresi(4 downto 0))) <= Rx_Variable(3 downto 0);
				end if;
			end if;
		end if;    
	end process;
	
	process(clk80)
	begin
		if (rising_edge(clk80)) then
			if(BantSecimi="00" and SFrekansKaydet='1') then
				frekans_L1<=  conv_std_logic_vector(conv_integer( SFrekans(4)(2 downto 0) & SFrekans(3) & SFrekans(2)& SFrekans(1)& SFrekans(0)),19);
				frekans_M11<= conv_std_logic_vector(conv_integer( SFrekans(10)(2 downto 0)& SFrekans(9) & SFrekans(8)& SFrekans(7)& SFrekans(6)),19);
				frekans_M12<= conv_std_logic_vector(conv_integer( SFrekans(16)(2 downto 0)& SFrekans(15) & SFrekans(14)& SFrekans(13)& SFrekans(12)),19);
				frekans_H1<=  conv_std_logic_vector(conv_integer( SFrekans(22)(2 downto 0)& SFrekans(21) & SFrekans(20)& SFrekans(19)& SFrekans(18)),19);
				
				step_size11<=conv_std_logic_vector(conv_integer( S_StepSize(1)& S_StepSize(0)),8);
				step_size12<=conv_std_logic_vector(conv_integer( S_StepSize(3)& S_StepSize(2)),8);
				step_size13<=conv_std_logic_vector(conv_integer( S_StepSize(5)& S_StepSize(4)),8);
				
			elsif(BantSecimi="01" and SFrekansKaydet='1') then	
				frekans_L2<=  conv_std_logic_vector(conv_integer( SFrekans(4)(2 downto 0) & SFrekans(3) & SFrekans(2)& SFrekans(1)& SFrekans(0)),19);
				frekans_M21<= conv_std_logic_vector(conv_integer( SFrekans(10)(2 downto 0)& SFrekans(9) & SFrekans(8)& SFrekans(7)& SFrekans(6)),19);
				frekans_M22<= conv_std_logic_vector(conv_integer( SFrekans(16)(2 downto 0)& SFrekans(15) & SFrekans(14)& SFrekans(13)& SFrekans(12)),19);
				frekans_H2<=  conv_std_logic_vector(conv_integer( SFrekans(22)(2 downto 0)& SFrekans(21) & SFrekans(20)& SFrekans(19)& SFrekans(18)),19);
				
				step_size21<=conv_std_logic_vector(conv_integer( S_StepSize(1)& S_StepSize(0)),8);
				step_size22<=conv_std_logic_vector(conv_integer( S_StepSize(3)& S_StepSize(2)),8);
				step_size23<=conv_std_logic_vector(conv_integer( S_StepSize(5)& S_StepSize(4)),8);
				
			elsif(BantSecimi="10" and SFrekansKaydet='1') then	
				frekans_L3<=  conv_std_logic_vector(conv_integer( SFrekans(4)(2 downto 0) & SFrekans(3) & SFrekans(2)& SFrekans(1)& SFrekans(0)),19);
				frekans_M31<= conv_std_logic_vector(conv_integer( SFrekans(10)(2 downto 0)& SFrekans(9) & SFrekans(8)& SFrekans(7)& SFrekans(6)),19);
				frekans_M32<= conv_std_logic_vector(conv_integer( SFrekans(16)(2 downto 0)& SFrekans(15) & SFrekans(14)& SFrekans(13)& SFrekans(12)),19);
				frekans_H3<=  conv_std_logic_vector(conv_integer( SFrekans(22)(2 downto 0)& SFrekans(21) & SFrekans(20)& SFrekans(19)& SFrekans(18)),19);
				
				step_size31<=conv_std_logic_vector(conv_integer( S_StepSize(1)& S_StepSize(0)),8);
				step_size32<=conv_std_logic_vector(conv_integer( S_StepSize(3)& S_StepSize(2)),8);
				step_size33<=conv_std_logic_vector(conv_integer( S_StepSize(5)& S_StepSize(4)),8);
			
			elsif(BantSecimi="11" and SFrekansKaydet='1') then	
				frekans_L4<=  conv_std_logic_vector(conv_integer( SFrekans(4)(2 downto 0) & SFrekans(3) & SFrekans(2)& SFrekans(1)& SFrekans(0)),19);
				frekans_M41<= conv_std_logic_vector(conv_integer( SFrekans(10)(2 downto 0)& SFrekans(9) & SFrekans(8)& SFrekans(7)& SFrekans(6)),19);
				frekans_M42<= conv_std_logic_vector(conv_integer( SFrekans(16)(2 downto 0)& SFrekans(15) & SFrekans(14)& SFrekans(13)& SFrekans(12)),19);
				frekans_H4<=  conv_std_logic_vector(conv_integer( SFrekans(22)(2 downto 0)& SFrekans(21) & SFrekans(20)& SFrekans(19)& SFrekans(18)),19);
				
				step_size41<=conv_std_logic_vector(conv_integer( S_StepSize(1)& S_StepSize(0)),8);
				step_size42<=conv_std_logic_vector(conv_integer( S_StepSize(3)& S_StepSize(2)),8);
				step_size43<=conv_std_logic_vector(conv_integer( S_StepSize(5)& S_StepSize(4)),8);
			
			elsif(BantSecimi="00" and FrekansKaydet = '1') then
				frekans_L1<=  conv_std_logic_vector(conv_integer( RastFrekans(4)(2 downto 0) & RastFrekans(3) & RastFrekans(2)& RastFrekans(1)& RastFrekans(0)),19);
				frekans_M11<= conv_std_logic_vector(conv_integer( RastFrekans(10)(2 downto 0)& RastFrekans(9) & RastFrekans(8)& RastFrekans(7)& RastFrekans(6)),19);
				frekans_M12<= conv_std_logic_vector(conv_integer( RastFrekans(16)(2 downto 0)& RastFrekans(15) & RastFrekans(14)& RastFrekans(13)& RastFrekans(12)),19);
				frekans_H1<=  conv_std_logic_vector(conv_integer( RastFrekans(22)(2 downto 0)& RastFrekans(21) & RastFrekans(20)& RastFrekans(19)& RastFrekans(18)),19);
				
			elsif(BantSecimi="01" and FrekansKaydet = '1') then
				frekans_L2<=  conv_std_logic_vector(conv_integer( RastFrekans(4)(2 downto 0) & RastFrekans(3) & RastFrekans(2)& RastFrekans(1)& RastFrekans(0)),19);
				frekans_M21<= conv_std_logic_vector(conv_integer( RastFrekans(10)(2 downto 0)& RastFrekans(9) & RastFrekans(8)& RastFrekans(7)& RastFrekans(6)),19);
				frekans_M22<= conv_std_logic_vector(conv_integer( RastFrekans(16)(2 downto 0)& RastFrekans(15) & RastFrekans(14)& RastFrekans(13)& RastFrekans(12)),19);
				frekans_H2<=  conv_std_logic_vector(conv_integer( RastFrekans(22)(2 downto 0)& RastFrekans(21) & RastFrekans(20)& RastFrekans(19)& RastFrekans(18)),19);
				
			elsif(BantSecimi="10" and FrekansKaydet = '1') then
				frekans_L3<=  conv_std_logic_vector(conv_integer( RastFrekans(4)(2 downto 0) & RastFrekans(3) & RastFrekans(2)& RastFrekans(1)& RastFrekans(0)),19);
				frekans_M31<= conv_std_logic_vector(conv_integer( RastFrekans(10)(2 downto 0)& RastFrekans(9) & RastFrekans(8)& RastFrekans(7)& RastFrekans(6)),19);
				frekans_M32<= conv_std_logic_vector(conv_integer( RastFrekans(16)(2 downto 0)& RastFrekans(15) & RastFrekans(14)& RastFrekans(13)& RastFrekans(12)),19);
				frekans_H3<=  conv_std_logic_vector(conv_integer( RastFrekans(22)(2 downto 0)& RastFrekans(21) & RastFrekans(20)& RastFrekans(19)& RastFrekans(18)),19);
				
			elsif(BantSecimi="11" and FrekansKaydet = '1') then
				frekans_L4<=  conv_std_logic_vector(conv_integer( RastFrekans(4)(2 downto 0) & RastFrekans(3) & RastFrekans(2)& RastFrekans(1)& RastFrekans(0)),19);
				frekans_M41<= conv_std_logic_vector(conv_integer( RastFrekans(10)(2 downto 0)& RastFrekans(9) & RastFrekans(8)& RastFrekans(7)& RastFrekans(6)),19);
				frekans_M42<= conv_std_logic_vector(conv_integer( RastFrekans(16)(2 downto 0)& RastFrekans(15) & RastFrekans(14)& RastFrekans(13)& RastFrekans(12)),19);
				frekans_H4<=  conv_std_logic_vector(conv_integer( RastFrekans(22)(2 downto 0)& RastFrekans(21) & RastFrekans(20)& RastFrekans(19)& RastFrekans(18)),19);
			elsif  (BantSecimi="00" and PRBSFreKaydet = '1') then
				frekans_L1<=  conv_std_logic_vector(conv_integer( MerkezFrekans(4)(2 downto 0)& MerkezFrekans(3) & MerkezFrekans(2)& MerkezFrekans(1)& MerkezFrekans(0)),19);
				frekans_M11<= conv_std_logic_vector(conv_integer( MerkezFrekans(4)(2 downto 0)& MerkezFrekans(3) & MerkezFrekans(2)& MerkezFrekans(1)& MerkezFrekans(0)),19);
				frekans_M12<= conv_std_logic_vector(conv_integer( MerkezFrekans(4)(2 downto 0)& MerkezFrekans(3) & MerkezFrekans(2)& MerkezFrekans(1)& MerkezFrekans(0)),19);
				frekans_H1<=  conv_std_logic_vector(conv_integer( MerkezFrekans(4)(2 downto 0)& MerkezFrekans(3) & MerkezFrekans(2)& MerkezFrekans(1)& MerkezFrekans(0)),19);
				
				freq_div_counter<=FrekansBandi(3)&FrekansBandi(2)&FrekansBandi(1)&FrekansBandi(0);
			elsif  (BantSecimi="01" and PRBSFreKaydet = '1') then
				frekans_L2<=  conv_std_logic_vector(conv_integer( MerkezFrekans(4)(2 downto 0)& MerkezFrekans(3) & MerkezFrekans(2)& MerkezFrekans(1)& MerkezFrekans(0)),19);
				frekans_M21<= conv_std_logic_vector(conv_integer( MerkezFrekans(4)(2 downto 0)& MerkezFrekans(3) & MerkezFrekans(2)& MerkezFrekans(1)& MerkezFrekans(0)),19);
				frekans_M22<= conv_std_logic_vector(conv_integer( MerkezFrekans(4)(2 downto 0)& MerkezFrekans(3) & MerkezFrekans(2)& MerkezFrekans(1)& MerkezFrekans(0)),19);
				frekans_H2<=  conv_std_logic_vector(conv_integer( MerkezFrekans(4)(2 downto 0)& MerkezFrekans(3) & MerkezFrekans(2)& MerkezFrekans(1)& MerkezFrekans(0)),19);
				
				freq_div_counter<=FrekansBandi(3)&FrekansBandi(2)&FrekansBandi(1)&FrekansBandi(0);
			elsif  (BantSecimi="10" and PRBSFreKaydet = '1') then
				frekans_L3<=  conv_std_logic_vector(conv_integer( MerkezFrekans(4)(2 downto 0)& MerkezFrekans(3) & MerkezFrekans(2)& MerkezFrekans(1)& MerkezFrekans(0)),19);
				frekans_M31<= conv_std_logic_vector(conv_integer( MerkezFrekans(4)(2 downto 0)& MerkezFrekans(3) & MerkezFrekans(2)& MerkezFrekans(1)& MerkezFrekans(0)),19);
				frekans_M32<= conv_std_logic_vector(conv_integer( MerkezFrekans(4)(2 downto 0)& MerkezFrekans(3) & MerkezFrekans(2)& MerkezFrekans(1)& MerkezFrekans(0)),19);
				frekans_H3<=  conv_std_logic_vector(conv_integer( MerkezFrekans(4)(2 downto 0)& MerkezFrekans(3) & MerkezFrekans(2)& MerkezFrekans(1)& MerkezFrekans(0)),19);
				
				freq_div_counter<=FrekansBandi(3)&FrekansBandi(2)&FrekansBandi(1)&FrekansBandi(0);
			elsif  (BantSecimi="11" and PRBSFreKaydet = '1') then
				frekans_L4<=  conv_std_logic_vector(conv_integer( MerkezFrekans(4)(2 downto 0)& MerkezFrekans(3) & MerkezFrekans(2)& MerkezFrekans(1)& MerkezFrekans(0)),19);
				frekans_M41<= conv_std_logic_vector(conv_integer( MerkezFrekans(4)(2 downto 0)& MerkezFrekans(3) & MerkezFrekans(2)& MerkezFrekans(1)& MerkezFrekans(0)),19);
				frekans_M42<= conv_std_logic_vector(conv_integer( MerkezFrekans(4)(2 downto 0)& MerkezFrekans(3) & MerkezFrekans(2)& MerkezFrekans(1)& MerkezFrekans(0)),19);
				frekans_H4<=  conv_std_logic_vector(conv_integer( MerkezFrekans(4)(2 downto 0)& MerkezFrekans(3) & MerkezFrekans(2)& MerkezFrekans(1)& MerkezFrekans(0)),19);
				
				freq_div_counter<=FrekansBandi(3)&FrekansBandi(2)&FrekansBandi(1)&FrekansBandi(0);
			end if;	
		end if;
	end process;
	--STEPSIZE VALUE
	Process(clk80)
		variable Rx_Variable2			: std_logic_vector( 7 downto 0);
	begin   
		if(rising_edge(clk80)) then
			if (SStepKaydet='1') then
				SStepAdresi<= SStepAdresi +1;
				if(SStepAdresi<6) then
					if	(RX_Data>57) then
							Rx_Variable2 := RX_Data-55;
						else
							Rx_Variable2 := RX_Data-48;
					end if;
					S_StepSize(conv_integer(SStepAdresi(2 downto 0)))<=Rx_Variable2(3 downto 0);					
				end if;
			end if;
		end if;
	end Process;
	
	--RASTGELE MOD
	
	--FREQUENCY VALUE 
	process(clk80)
		variable Rx_Variable				: std_logic_vector( 7 downto 0);
	begin
		if (rising_edge(clk80)) then
			if FrekansKaydet = '1' then
			jammer_calisma_modu<="01";
			random_sweep_mode<='1';
				FrekansAdresi <= FrekansAdresi + 1;
				if (FrekansAdresi < 24) then
					if	(RX_Data>57) then
							Rx_Variable := RX_Data-55;
						else
							Rx_Variable := RX_Data-48;
					end if;
					RastFrekans( conv_integer(FrekansAdresi(4 downto 0)) ) <= Rx_Variable(3 downto 0);	
				end if;
			end if;
		end if;    
	end process;
	
	--STEPSIZE VALUE
	Process(clk80)
		variable Rx_Variable2			: std_logic_vector( 7 downto 0);
	begin   
		if(rising_edge(clk80)) then
			if (StepKaydet='1') then
				StepAdresi<= StepAdresi +1;
				if(StepAdresi<2) then
					if	(RX_Data>57) then
							Rx_Variable2 := RX_Data-55;
						else
							Rx_Variable2 := RX_Data-48;
					end if;
					R_StepSize(conv_integer(StepAdresi(1 downto 0)))<=Rx_Variable2(3 downto 0);
				end if;
			end if;
		end if;
	end Process;
	
	--PRBS MOD
	--MERKEZ FREKANS
   process(clk)
		variable Rx_Variable				: std_logic_vector( 7 downto 0);
	begin
		if (rising_edge(clk80)) then
			jammer_calisma_modu<="01";
			if PRBSFreKaydet = '1' then
				PRBSFrekansAdresi <= PRBSFrekansAdresi + 1;
				if (PRBSFrekansAdresi < 6) then
					if	(RX_Data>57) then
						Rx_Variable := RX_Data-55;
					else
						Rx_Variable := RX_Data-48;
					end if;
					MerkezFrekans( conv_integer(PRBSFrekansAdresi(2 downto 0)) ) <= Rx_Variable(3 downto 0);	
				end if;
			end if;
		end if;    
	end process;
	
	--FREKANSBANDI
	Process(clk80)
		variable Rx_Variable2				: std_logic_vector( 7 downto 0);
	begin     
		if(rising_edge(clk80)) then   
			if (BantKaydet='1') then
				BantAdresi<= BantAdresi +1;
				if(BantAdresi < 6) then  
				if	(RX_Data>57) then
						Rx_Variable2:= RX_Data-55;
					else
						Rx_Variable2:= RX_Data-48;
					end if;
					FrekansBandi( conv_integer(BantAdresi(2 downto 0)) )<= Rx_Variable2(3 downto 0);
				end if;
			end if;
		end if;
	end Process;
   --USER logic implementation added here
   
   delay 					<= slv_reg1(0 to 9);
	--random_sweep_mode    <= slv_reg3(31);
	--jammer_calisma_modu  <= slv_reg3(29 to 30);
	--freq_div_counter		<= slv_reg4(16 to 31);
	--00: frequency sweep, dds frequencies are updated at each clock cycle
	--01: prbs modulation, dds frequencies are constant at the center frequency for each channel
	--10: not defined
	--11: not defined
	
	frekans1_27 <="00000000" &  std_logic_vector(frekans1);
	frekans2_27 <="00000000" &  std_logic_vector(frekans1);
	frekans3_27 <="00000000" &  std_logic_vector(frekans1);
	frekans4_27 <="00000000" &  std_logic_vector(frekans1);
	
	
  chn1 : dds
		port map (
			DATA => frekans1_27,
			WE => '1',
			A => "00000",
			CLK => clk80,
			ACLR => bus2ip_reset,
			SINE => SINE1);

  chn2 : dds
		port map (
			DATA => frekans2_27,
			WE => '1',
			A => "00000",
			CLK => clk80,
			ACLR => bus2ip_reset,
			SINE => SINE2);

  chn3 : dds
		port map (
			DATA => frekans3_27,
			WE => '1',
			A => "00000",
			CLK => clk80,
			ACLR => bus2ip_reset,
			SINE => SINE3);

  chn4 : dds
		port map (
			DATA => frekans4_27,
			WE => '1',
			A => "00000",
			CLK => clk80,
			ACLR => bus2ip_reset,
			SINE => SINE4);

process(clk80,bus2ip_reset)
variable cnt:std_logic_vector(3 downto 0);
variable toggle:std_logic;
variable tmp_dds_hard:std_logic;
variable cum_noise_1:std_logic_vector(4 downto 0);
begin
	if bus2ip_reset='1' then
		frekans1<=(others=>'0');
		cnt:=(others=>'0');
		toggle:='0';
	elsif rising_edge(clk80) then
		if jammer_calisma_modu="00" then--frequency sweep mode
			if cnt="0000" then
				if toggle='0' then
					if UNSIGNED(frekans1) < UNSIGNED(frekans_M11) then
						if random_sweep_mode='0' then
							frekans1 <=STD_LOGIC_VECTOR(UNSIGNED(frekans1)+UNSIGNED(step_size11));
						else
							frekans1 <=STD_LOGIC_VECTOR(UNSIGNED(frekans1)+UNSIGNED(cum_noise_1(4 downto 0)));
						end if;
					elsif frekans_M11 <= frekans1 and frekans1 < frekans_M12 then
						if random_sweep_mode='0' then
							frekans1 <=frekans1+step_size12;
						else
							frekans1 <=STD_LOGIC_VECTOR(UNSIGNED(frekans1)+UNSIGNED(shifted_noise1(7 downto 0)));
						end if;
					elsif frekans_M12 <= frekans1 and frekans1 < frekans_H1 then
						if random_sweep_mode='0' then
							frekans1 <=frekans1+step_size13;
						else
							frekans1 <=STD_LOGIC_VECTOR(UNSIGNED(frekans1)+UNSIGNED(cum_noise_1(4 downto 0)));
						end if;
					else
						toggle:='1';
						sweep_start(0)<='1';
						if cum_noise=CONV_STD_LOGIC_VECTOR(0,cum_noise'length) then
							cum_noise_1:=CONV_STD_LOGIC_VECTOR(1,cum_noise_1'length);
						else
							cum_noise_1:=cum_noise;
						end if;
						if step_size12(1 downto 0)=CONV_STD_LOGIC_VECTOR(0,2) then
							shifted_noise1 <= "000" & cum_noise_1;
						elsif step_size12(1 downto 0)=CONV_STD_LOGIC_VECTOR(1,2) then
							shifted_noise1 <= "00" & cum_noise_1 & '0';
						elsif step_size12(1 downto 0)=CONV_STD_LOGIC_VECTOR(2,2) then
							shifted_noise1 <= '0' & cum_noise_1 & "00";
						else
							shifted_noise1 <= cum_noise_1 & "000";
						end if;
					end if;
				else
					if frekans1 > frekans_M12 then
						if random_sweep_mode='0' then
							frekans1 <=frekans1-step_size13;
						else
							frekans1 <=STD_LOGIC_VECTOR(UNSIGNED(frekans1) -UNSIGNED(cum_noise_1(4 downto 0)));
						end if;
					elsif frekans1 > frekans_M11 and frekans_M12 >= frekans1 then
						if random_sweep_mode='0' then
							frekans1 <=STD_LOGIC_VECTOR(UNSIGNED(frekans1)-UNSIGNED(step_size12));
						else
							frekans1 <=STD_LOGIC_VECTOR(UNSIGNED(frekans1) -UNSIGNED(shifted_noise1(7 downto 0)));
						end if;
					elsif frekans_M11 >= frekans1 and frekans1 > frekans_L1 then
						if random_sweep_mode='0' then
							frekans1 <=STD_LOGIC_VECTOR(UNSIGNED(frekans1)-UNSIGNED(step_size11));
						else
							frekans1 <=STD_LOGIC_VECTOR(UNSIGNED(frekans1) -UNSIGNED(cum_noise_1(4 downto 0)));
						end if;
					else
						toggle:='0';	
						sweep_start(0)<='0';
						if cum_noise=CONV_STD_LOGIC_VECTOR(0,cum_noise'length) then
							cum_noise_1:=CONV_STD_LOGIC_VECTOR(1,cum_noise_1'length);
						else
							cum_noise_1:=cum_noise;
						end if;
						if step_size12(1 downto 0)=CONV_STD_LOGIC_VECTOR(0,2) then
							shifted_noise1 <= "000" & cum_noise_1;
						elsif step_size12(1 downto 0)=CONV_STD_LOGIC_VECTOR(1,2) then
							shifted_noise1 <= "00" & cum_noise_1 & '0';
						elsif step_size12(1 downto 0)=CONV_STD_LOGIC_VECTOR(2,2) then
							shifted_noise1 <= '0' & cum_noise_1 & "00";
						else
							shifted_noise1 <= cum_noise_1 & "000";
						end if;
					end if;
				end if;
			end if;
			cnt:=cnt+1;
			if signed(sine1)>0 then
				hard_signals(0)<='1';
			else
				hard_signals(0)<='0';
			end if;
		else
			frekans1<=frekans_L1;
			if signed(sine1)>0 then
				tmp_dds_hard:='1';
			else
				tmp_dds_hard:='0';
			end if;
			hard_signals(0)<= tmp_dds_hard xor prbs31(30);			
		end if;
	end if;	
end process;	


process(clk80,bus2ip_reset)
variable cnt:std_logic_vector(3 downto 0);
variable toggle:std_logic;
variable tmp_dds_hard:std_logic;
variable cum_noise_2:std_logic_vector(4 downto 0);
begin
	if bus2ip_reset='1' then
		frekans2<=(CONV_STD_LOGIC_VECTOR(0,27));
		cnt:=(others=>'0');
		toggle:='0';
	elsif rising_edge(clk80) then
		if jammer_calisma_modu="00" then--frequency sweep mode
			if cnt="0000" then
				if toggle='0' then
					if frekans2 < frekans_M21 then
						if random_sweep_mode='0' then
							frekans2 <=STD_LOGIC_VECTOR(UNSIGNED(frekans2)+UNSIGNED(step_size21));
						else
							frekans2 <=STD_LOGIC_VECTOR(UNSIGNED(frekans2)+UNSIGNED(cum_noise_2(4 downto 0)));
						end if;
					elsif frekans_M21 <= frekans2 and frekans2 < frekans_M22 then
						if random_sweep_mode='0' then
							frekans2 <=STD_LOGIC_VECTOR(UNSIGNED(frekans2)+UNSIGNED(step_size22));
						else
							frekans2 <=STD_LOGIC_VECTOR(UNSIGNED(frekans2)+UNSIGNED(shifted_noise2(7 downto 0)));
						end if;
					elsif frekans_M22 <= frekans2 and frekans2 < frekans_H2 then
						if random_sweep_mode='0' then
							frekans2 <=STD_LOGIC_VECTOR(UNSIGNED(frekans2)+UNSIGNED(step_size23));
						else
							frekans2 <=STD_LOGIC_VECTOR(UNSIGNED(frekans2)+UNSIGNED(cum_noise_2(4 downto 0)));
						end if;
					else
						toggle:='1';
						sweep_start(1)<='1';
						if cum_noise=CONV_STD_LOGIC_VECTOR(0,cum_noise'length) then
							cum_noise_2:=CONV_STD_LOGIC_VECTOR(1,cum_noise_2'length);
						else
							cum_noise_2:=cum_noise;
						end if;
						if step_size22(1 downto 0)=CONV_STD_LOGIC_VECTOR(0,2) then
							shifted_noise2 <= "000" & cum_noise_2;
						elsif step_size22(1 downto 0)=CONV_STD_LOGIC_VECTOR(1,2) then
							shifted_noise2 <= "00" & cum_noise_2 & '0';
						elsif step_size22(1 downto 0)=CONV_STD_LOGIC_VECTOR(2,2) then
							shifted_noise2 <= '0' & cum_noise_2 & "00";
						else
							shifted_noise2 <= cum_noise_2 & "000";
						end if;
					end if;
				else
					if frekans2 > frekans_M22 then
						if random_sweep_mode='0' then
							frekans2 <=STD_LOGIC_VECTOR(UNSIGNED(frekans2)-UNSIGNED(step_size23));
						else
							frekans2 <=STD_LOGIC_VECTOR(UNSIGNED(frekans2) -UNSIGNED(cum_noise_2(4 downto 0)));
						end if;
					elsif frekans2 > frekans_M21 and frekans_M22 >= frekans2 then
						if random_sweep_mode='0' then
							frekans2 <=STD_LOGIC_VECTOR(UNSIGNED(frekans2)-UNSIGNED(step_size22));
						else
							frekans2 <=STD_LOGIC_VECTOR(UNSIGNED(frekans2) -UNSIGNED(shifted_noise2(7 downto 0)));
						end if;
					elsif frekans_M21 >= frekans2 and frekans2 > frekans_L2 then
						if random_sweep_mode='0' then
							frekans2 <=STD_LOGIC_VECTOR(UNSIGNED(frekans2)-UNSIGNED(step_size21));
						else
							frekans2 <=STD_LOGIC_VECTOR(UNSIGNED(frekans2) -UNSIGNED(cum_noise_2(4 downto 0)));
						end if;
					else
						toggle:='0';	
						sweep_start(1)<='0';
						if cum_noise=CONV_STD_LOGIC_VECTOR(0,cum_noise'length) then
							cum_noise_2:=CONV_STD_LOGIC_VECTOR(1,cum_noise_2'length);
						else
							cum_noise_2:=cum_noise;
						end if;
						if step_size22(1 downto 0)=CONV_STD_LOGIC_VECTOR(0,2) then
							shifted_noise2 <= "000" & cum_noise_2;
						elsif step_size22(1 downto 0)=CONV_STD_LOGIC_VECTOR(1,2) then
							shifted_noise2 <= "00" & cum_noise_2 & '0';
						elsif step_size22(1 downto 0)=CONV_STD_LOGIC_VECTOR(2,2) then
							shifted_noise2 <= '0' & cum_noise_2 & "00";
						else
							shifted_noise2 <= cum_noise_2 & "000";
						end if;
					end if;
				end if;
			end if;
			cnt:=cnt+1;
			if signed(sine2)>0 then
				hard_signals(1)<='1';
			else
				hard_signals(1)<='0';
			end if;
		else
			frekans2<=frekans_L2;
			if signed(sine2)>0 then
				tmp_dds_hard:='1';
			else
				tmp_dds_hard:='0';
			end if;
			hard_signals(1)<= tmp_dds_hard xor prbs31(30);			
		end if;
	end if;	
end process;	

 
process(clk80,bus2ip_reset)
variable cnt:std_logic_vector(3 downto 0);
variable toggle:std_logic;
variable tmp_dds_hard:std_logic;
variable cum_noise_3:std_logic_vector(4 downto 0);
begin
	if bus2ip_reset='1' then
		frekans3<=(CONV_STD_LOGIC_VECTOR(0,27));
		cnt:=(others=>'0');
		toggle:='0';
	elsif rising_edge(clk80) then
		if jammer_calisma_modu="00" then--frequency sweep mode
			if cnt="0000" then
				if toggle='0' then
					if frekans3 < frekans_M31 then
						if random_sweep_mode='0' then
							frekans3 <=STD_LOGIC_VECTOR(UNSIGNED(frekans3)+UNSIGNED(step_size31));
						else
							frekans3 <=STD_LOGIC_VECTOR(UNSIGNED(frekans3)+UNSIGNED(cum_noise_3(4 downto 0)));
						end if;
					elsif frekans_M31 <= frekans3 and frekans3 < frekans_M32 then
						if random_sweep_mode='0' then
							frekans3 <=STD_LOGIC_VECTOR(UNSIGNED(frekans3)+UNSIGNED(step_size32));
						else
							frekans3 <=STD_LOGIC_VECTOR(UNSIGNED(frekans3)+UNSIGNED(shifted_noise3(7 downto 0)));
						end if;
					elsif frekans_M32 <= frekans3 and frekans3 < frekans_H3 then
						if random_sweep_mode='0' then
							frekans3 <=STD_LOGIC_VECTOR(UNSIGNED(frekans3)+UNSIGNED(step_size33));
						else
							frekans3 <=STD_LOGIC_VECTOR(UNSIGNED(frekans3)+UNSIGNED(cum_noise_3(4 downto 0)));
						end if;
					else
						toggle:='1';
						sweep_start(2)<='1';
						if cum_noise=CONV_STD_LOGIC_VECTOR(0,cum_noise'length) then
							cum_noise_3:=CONV_STD_LOGIC_VECTOR(1,cum_noise_3'length);
						else
							cum_noise_3:=cum_noise;
						end if;
						if step_size32(1 downto 0)=CONV_STD_LOGIC_VECTOR(0,2) then
							shifted_noise3 <= "000" & cum_noise_3;
						elsif step_size32(1 downto 0)=CONV_STD_LOGIC_VECTOR(1,2) then
							shifted_noise3 <= "00" & cum_noise_3 & '0';
						elsif step_size32(1 downto 0)=CONV_STD_LOGIC_VECTOR(2,2) then
							shifted_noise3 <= '0' & cum_noise_3 & "00";
						else
							shifted_noise3 <= cum_noise_3 & "000";
						end if;
					end if;
				else
					if frekans3 > frekans_M32 then
						if random_sweep_mode='0' then
							frekans3 <=STD_LOGIC_VECTOR(UNSIGNED(frekans3)-UNSIGNED(step_size33));
						else
							frekans3 <=STD_LOGIC_VECTOR(UNSIGNED(frekans3) -UNSIGNED(cum_noise_3(4 downto 0)));
						end if;
					elsif frekans3 > frekans_M31 and frekans_M32 >= frekans3 then
						if random_sweep_mode='0' then
							frekans3 <=STD_LOGIC_VECTOR(UNSIGNED(frekans3)-UNSIGNED(step_size32));
						else
							frekans3 <=STD_LOGIC_VECTOR(UNSIGNED(frekans3) -UNSIGNED(shifted_noise3(7 downto 0)));
						end if;
					elsif frekans_M31 >= frekans3 and frekans3 > frekans_L3 then
						if random_sweep_mode='0' then
							frekans3 <=STD_LOGIC_VECTOR(UNSIGNED(frekans3)-UNSIGNED(step_size31));
						else
							frekans3 <=STD_LOGIC_VECTOR(UNSIGNED(frekans3) -UNSIGNED(cum_noise_3(4 downto 0)));
						end if;
					else
						toggle:='0';	
						sweep_start(2)<='0';
						if cum_noise=CONV_STD_LOGIC_VECTOR(0,cum_noise'length) then
							cum_noise_3:=CONV_STD_LOGIC_VECTOR(1,cum_noise_3'length);
						else
							cum_noise_3:=cum_noise;
						end if;
						if step_size32(1 downto 0)=CONV_STD_LOGIC_VECTOR(0,2) then
							shifted_noise3 <= "000" & cum_noise_3;
						elsif step_size32(1 downto 0)=CONV_STD_LOGIC_VECTOR(1,2) then
							shifted_noise3 <= "00" & cum_noise_3 & '0';
						elsif step_size32(1 downto 0)=CONV_STD_LOGIC_VECTOR(2,2) then
							shifted_noise3 <= '0' & cum_noise_3 & "00";
						else
							shifted_noise3 <= cum_noise_3 & "000";
						end if;
					end if;
				end if;
			end if;
			cnt:=cnt+1;
			if signed(sine3)>0 then
				hard_signals(2)<='1';
			else
				hard_signals(2)<='0';
			end if;
		else
			frekans3<=frekans_L3;
			if signed(sine3)>0 then
				tmp_dds_hard:='1';
			else
				tmp_dds_hard:='0';
			end if;
			hard_signals(2)<= tmp_dds_hard xor prbs31(30);			
		end if;
	end if;	
end process;	




process(clk80,bus2ip_reset)
variable cnt:std_logic_vector(3 downto 0);
variable toggle:std_logic;
variable tmp_dds_hard:std_logic;
variable cum_noise_4:std_logic_vector(4 downto 0);
begin
	if bus2ip_reset='1' then
		frekans4<=(CONV_STD_LOGIC_VECTOR(0,27));
		cnt:=(others=>'0');
		toggle:='0';
	elsif rising_edge(clk80) then
		if jammer_calisma_modu="00" then--frequency sweep mode
			if cnt="0000" then
				if toggle='0' then
					if frekans4 < frekans_M41 then
						if random_sweep_mode='0' then
							frekans4 <=STD_LOGIC_VECTOR(UNSIGNED(frekans4)+UNSIGNED(step_size41));
						else
							frekans4 <=STD_LOGIC_VECTOR(UNSIGNED(frekans4)+UNSIGNED(cum_noise_4(4 downto 0)));
						end if;
					elsif frekans_M41 <= frekans4 and frekans4 < frekans_M42 then
						if random_sweep_mode='0' then
							frekans4 <=STD_LOGIC_VECTOR(UNSIGNED(frekans4)+UNSIGNED(step_size42));
						else
							frekans4 <=STD_LOGIC_VECTOR(UNSIGNED(frekans4)+UNSIGNED(shifted_noise4(7 downto 0)));
						end if;
					elsif frekans_M42 <= frekans4 and frekans4 < frekans_H4 then
						if random_sweep_mode='0' then
							frekans4 <=STD_LOGIC_VECTOR(UNSIGNED(frekans4)+UNSIGNED(step_size43));
						else
							frekans4 <=STD_LOGIC_VECTOR(UNSIGNED(frekans4)+UNSIGNED(cum_noise_4(4 downto 0)));
						end if;
					else
						toggle:='1';
						sweep_start(3)<='1';
						if cum_noise=CONV_STD_LOGIC_VECTOR(0,cum_noise'length) then
							cum_noise_4:=CONV_STD_LOGIC_VECTOR(1,cum_noise_4'length);
						else
							cum_noise_4:=cum_noise;
						end if;
						if step_size42(1 downto 0)=CONV_STD_LOGIC_VECTOR(0,2) then
							shifted_noise4 <= "000" & cum_noise_4;
						elsif step_size42(1 downto 0)=CONV_STD_LOGIC_VECTOR(1,2) then
							shifted_noise4 <= "00" & cum_noise_4 & '0';
						elsif step_size42(1 downto 0)=CONV_STD_LOGIC_VECTOR(2,2) then
							shifted_noise4 <= '0' & cum_noise_4 & "00";
						else
							shifted_noise4 <= cum_noise_4 & "000";
						end if;
					end if;
				else
					if frekans4 > frekans_M42 then
						if random_sweep_mode='0' then
							frekans4 <=STD_LOGIC_VECTOR(UNSIGNED(frekans4)-UNSIGNED(step_size43));
						else
							frekans4 <=STD_LOGIC_VECTOR(UNSIGNED(frekans4) -UNSIGNED(cum_noise_4(4 downto 0)));
						end if;
					elsif frekans4 > frekans_M41 and frekans_M42 >= frekans4 then
						if random_sweep_mode='0' then
							frekans4 <=STD_LOGIC_VECTOR(UNSIGNED(frekans4)-UNSIGNED(step_size42));
						else
							frekans4 <=STD_LOGIC_VECTOR(UNSIGNED(frekans4) -UNSIGNED(shifted_noise4(7 downto 0)));
						end if;
					elsif frekans_M41 >= frekans4 and frekans4 > frekans_L4 then
						if random_sweep_mode='0' then
							frekans4 <=STD_LOGIC_VECTOR(UNSIGNED(frekans4)-UNSIGNED(step_size41));
						else
							frekans4 <=STD_LOGIC_VECTOR(UNSIGNED(frekans4) -UNSIGNED(cum_noise_4(4 downto 0)));
						end if;
					else
						toggle:='0';	
						sweep_start(3)<='0';
						if cum_noise=CONV_STD_LOGIC_VECTOR(0,cum_noise'length) then
							cum_noise_4:=CONV_STD_LOGIC_VECTOR(1,cum_noise_4'length);
						else
							cum_noise_4:=cum_noise;
						end if;
						if step_size42(1 downto 0)=CONV_STD_LOGIC_VECTOR(0,2) then
							shifted_noise4 <= "000" & cum_noise_4;
						elsif step_size42(1 downto 0)=CONV_STD_LOGIC_VECTOR(1,2) then
							shifted_noise4 <= "00" & cum_noise_4 & '0';
						elsif step_size42(1 downto 0)=CONV_STD_LOGIC_VECTOR(2,2) then
							shifted_noise4 <= '0' & cum_noise_4 & "00";
						else
							shifted_noise4 <= cum_noise_4 & "000";
						end if;
					end if;
				end if;
			end if;
			cnt:=cnt+1;
			if signed(sine4)>0 then
				hard_signals(3)<='1';
			else
				hard_signals(3)<='0';
			end if;
		else
			frekans4<=frekans_L4;
			if signed(sine4)>0 then
				tmp_dds_hard:='1';
			else
				tmp_dds_hard:='0';
			end if;
			hard_signals(3)<= tmp_dds_hard xor prbs31(30);			
		end if;
	end if;	
end process;

process(bus2ip_reset,clk80)
begin
	if bus2ip_reset='1' then
		supress_dout <= "1111";
		supress_dout_bar <= "1111";
		delay_cnt_arr(0) <= (others=> '0');
		delay_cnt_arr(1) <= (others=> '0');
		delay_cnt_arr(2) <= (others=> '0');
		delay_cnt_arr(3) <= (others=> '0');
		delay_cnt_arr2(0) <= (others=> '0');
		delay_cnt_arr2(1) <= (others=> '0');
		delay_cnt_arr2(2) <= (others=> '0');
		delay_cnt_arr2(3) <= (others=> '0');
	elsif rising_edge(clk80) then
		for k in 0 to 3 loop
			if hard_signals(k) = '1' and supress_dout(k) = '1' then
				if delay_cnt_arr(k) = delay then
					supress_dout(k) <= '0';
					delay_cnt_arr(k) <= (others => '0');
					dout(k) <= '1';
					dout_bar(k) <= '0';
					supress_dout_bar(k) <= '1';
				else
					delay_cnt_arr(k) <= delay_cnt_arr(k) + '1' ;
					dout(k) <= '0';
					dout_bar(k) <= '0';
				end if;
			end if;
			
			if hard_signals(k) = '0' and supress_dout_bar(k) = '1' then
				if delay_cnt_arr2(k) = delay then
					supress_dout_bar(k) <= '0';
					delay_cnt_arr2(k) <= (others => '0');
					dout_bar(k) <= '1';
					supress_dout(k) <= '1';
					dout(k) <= '0';
				else
					delay_cnt_arr2(k) <= delay_cnt_arr2(k) + '1' ;
					dout_bar(k) <= '0';
					dout(k) <= '0';
				end if;
			end if;			
		end loop;
	end if;
end process;

control_signals<=sweep_start; 
 
--process(bus2ip_reset,bus2ip_clk)
--begin
--	if bus2ip_reset='1' then
--	
--	elsif rising_edge(bus2ip_clk) then
--		if sentezor_yazma='1' then
--			if slv_reg0(0 to 3)="0000" then
--				frekans_L1<=unsigned(slv_reg0(13 to 31));	
--			elsif slv_reg0(0 to 3)="0001" then 	
--				frekans_H1<=unsigned(slv_reg0(13 to 31));
--			elsif slv_reg0(0 to 3)="0010" then 	
--				frekans_L2<=unsigned(slv_reg0(13 to 31));	
--			elsif slv_reg0(0 to 3)="0011" then 	
--				frekans_H2<=unsigned(slv_reg0(13 to 31));	
--			elsif slv_reg0(0 to 3)="0100" then 	
--				frekans_L3<=unsigned(slv_reg0(13 to 31));	
--			elsif slv_reg0(0 to 3)="0101" then 	
--				frekans_H3<=unsigned(slv_reg0(13 to 31));	
--			elsif slv_reg0(0 to 3)="0110" then 	
--				frekans_L4<=unsigned(slv_reg0(13 to 31));	
--			elsif slv_reg0(0 to 3)="0111" then 	
--				frekans_H4<=unsigned(slv_reg0(13 to 31));
--			elsif slv_reg0(0 to 3)="1000" then 	
--				frekans_M11<=unsigned(slv_reg0(13 to 31));
--			elsif slv_reg0(0 to 3)="1001" then 	
--				frekans_M12<=unsigned(slv_reg0(13 to 31));	
--			elsif slv_reg0(0 to 3)="1010" then 	
--				frekans_M21<=unsigned(slv_reg0(13 to 31));	
--			elsif slv_reg0(0 to 3)="1011" then 	
--				frekans_M22<=unsigned(slv_reg0(13 to 31));	
--			elsif slv_reg0(0 to 3)="1100" then 	
--				frekans_M31<=unsigned(slv_reg0(13 to 31));	
--			elsif slv_reg0(0 to 3)="1101" then 	
--				frekans_M32<=unsigned(slv_reg0(13 to 31));	
--			elsif slv_reg0(0 to 3)="1110" then 	
--				frekans_M41<=unsigned(slv_reg0(13 to 31));
--			elsif slv_reg0(0 to 3)="1111" then 	
--				frekans_M42<=unsigned(slv_reg0(13 to 31));
--			end if;
--		end if;
--	end if;
--end process;
--
--process(bus2ip_clk,bus2ip_reset)
--begin
--	if bus2ip_reset='1' then
--		step_size11<=x"01";
--		step_size21<=x"01";
--		step_size31<=x"01";
--		step_size41<=x"01";
--		step_size12<=x"01";
--		step_size22<=x"01";
--		step_size32<=x"01";
--		step_size42<=x"01";
--		step_size13<=x"01";
--		step_size23<=x"01";
--		step_size33<=x"01";
--		step_size43<=x"01";		
--	elsif rising_edge(bus2ip_clk) then
--		if slv_reg2(0 to 3)="0000" then
--			step_size11<=unsigned(slv_reg2(24 to 31));
--		elsif slv_reg2(0 to 3)="0001" then
--			step_size12<=unsigned(slv_reg2(24 to 31));
--		elsif slv_reg2(0 to 3)="0010" then
--			step_size13<=unsigned(slv_reg2(24 to 31));
--		elsif slv_reg2(0 to 3)="0011" then
--			step_size21<=unsigned(slv_reg2(24 to 31));
--		elsif slv_reg2(0 to 3)="0100" then
--			step_size22<=unsigned(slv_reg2(24 to 31));
--		elsif slv_reg2(0 to 3)="0101" then
--			step_size23<=unsigned(slv_reg2(24 to 31));
--		elsif slv_reg2(0 to 3)="0110" then
--			step_size31<=unsigned(slv_reg2(24 to 31));
--		elsif slv_reg2(0 to 3)="0111" then
--			step_size32<=unsigned(slv_reg2(24 to 31));
--		elsif slv_reg2(0 to 3)="1000" then
--			step_size33<=unsigned(slv_reg2(24 to 31));
--		elsif slv_reg2(0 to 3)="1001" then
--			step_size41<=unsigned(slv_reg2(24 to 31));
--		elsif slv_reg2(0 to 3)="1010" then
--			step_size42<=unsigned(slv_reg2(24 to 31));
--		elsif slv_reg2(0 to 3)="1011" then
--			step_size43<=unsigned(slv_reg2(24 to 31));
--		end if;			
--	end if;
--end process;


prc_prbs31:process(clk80,bus2ip_reset)
variable tmp_freq_div_counter:std_logic_vector(15 downto 0);
begin
	if bus2ip_reset='1' then
		prbs31<=conv_std_logic_vector(31,31);
		cum_noise<=(others=>'0');
		prbs_update<='0';
		tmp_freq_div_counter:=(others=>'0');
	elsif rising_edge(clk80) then
		if jammer_calisma_modu="00" then
			prbs_update<='1';
		else
			if tmp_freq_div_counter < freq_div_counter then
				tmp_freq_div_counter := tmp_freq_div_counter + 1;
				prbs_update<='0';				
			else
				tmp_freq_div_counter := (others=>'0');
				prbs_update<='1';
			end if;
		end if;
		if prbs_update='1' then
			for i in 1 to 30 loop
				prbs31(i)<=prbs31(i-1);			
			end loop;
			prbs31(0)<=prbs31(27) xor prbs31(30);
			if prbs31(0)='1' then
				cum_noise<=cum_noise+1;
			else
				cum_noise<=cum_noise-1;
			end if;								
		end if;												
	end if;
end process;



  ------------------------------------------
  -- Example code to read/write user logic slave model s/w accessible registers
  -- 
  -- Note:
  -- The example code presented here is to show you one way of reading/writing
  -- software accessible registers implemented in the user logic slave model.
  -- Each bit of the Bus2IP_WrCE/Bus2IP_RdCE signals is configured to correspond
  -- to one software accessible register by the top level template. For example,
  -- if you have four 32 bit software accessible registers in the user logic, you
  -- are basically operating on the following memory mapped registers:
  -- 
  --    Bus2IP_WrCE or   Memory Mapped
  --       Bus2IP_RdCE   Register
  --            "1000"   C_BASEADDR + 0x0
  --            "0100"   C_BASEADDR + 0x4
  --            "0010"   C_BASEADDR + 0x8
  --            "0001"   C_BASEADDR + 0xC
  -- 
  ------------------------------------------
  slv_reg_write_select <= Bus2IP_WrCE(0 to 7);
  slv_reg_read_select  <= Bus2IP_RdCE(0 to 7);
  slv_write_ack        <= Bus2IP_WrCE(0) or Bus2IP_WrCE(1) or Bus2IP_WrCE(2) or Bus2IP_WrCE(3) or Bus2IP_WrCE(4) or Bus2IP_WrCE(5) or Bus2IP_WrCE(6) or Bus2IP_WrCE(7);
  slv_read_ack         <= Bus2IP_RdCE(0) or Bus2IP_RdCE(1) or Bus2IP_RdCE(2) or Bus2IP_RdCE(3) or Bus2IP_RdCE(4) or Bus2IP_RdCE(5) or Bus2IP_RdCE(6) or Bus2IP_RdCE(7);

  -- implement slave model register(s)
  SLAVE_REG_WRITE_PROC : process( Bus2IP_Clk ) is
  begin

    if Bus2IP_Clk'event and Bus2IP_Clk = '1' then
      if Bus2IP_Reset = '1' then
        slv_reg0 <= (others => '0');
        slv_reg1 <= (others => '0');
        slv_reg2 <= (others => '0');
        slv_reg3 <= (others => '0');
        slv_reg4 <= (others => '0');
        slv_reg5 <= (others => '0');
        slv_reg6 <= (others => '0');
        slv_reg7 <= (others => '0');
		  sentezor_yazma<='0';
      else
		  if 	sentezor_yazma='1' then
				sentezor_yazma<='0';
		  end if;
		  if step_size_yaz='1' then
			  step_size_yaz<='0';
		  end if;
        case slv_reg_write_select is
          when "10000000" =>
				sentezor_yazma<='1';
            for byte_index in 0 to (C_DWIDTH/8)-1 loop
              if ( Bus2IP_BE(byte_index) = '1' ) then
                slv_reg0(byte_index*8 to byte_index*8+7) <= Bus2IP_Data(byte_index*8 to byte_index*8+7);
              end if;
            end loop;
          when "01000000" =>
            for byte_index in 0 to (C_DWIDTH/8)-1 loop
              if ( Bus2IP_BE(byte_index) = '1' ) then
                slv_reg1(byte_index*8 to byte_index*8+7) <= Bus2IP_Data(byte_index*8 to byte_index*8+7);
              end if;
            end loop;
          when "00100000" =>
				step_size_yaz <='1';
            for byte_index in 0 to (C_DWIDTH/8)-1 loop
              if ( Bus2IP_BE(byte_index) = '1' ) then
                slv_reg2(byte_index*8 to byte_index*8+7) <= Bus2IP_Data(byte_index*8 to byte_index*8+7);
              end if;
            end loop;
          when "00010000" =>
            for byte_index in 0 to (C_DWIDTH/8)-1 loop
              if ( Bus2IP_BE(byte_index) = '1' ) then
                slv_reg3(byte_index*8 to byte_index*8+7) <= Bus2IP_Data(byte_index*8 to byte_index*8+7);
              end if;
            end loop;
          when "00001000" =>
            for byte_index in 0 to (C_DWIDTH/8)-1 loop
              if ( Bus2IP_BE(byte_index) = '1' ) then
                slv_reg4(byte_index*8 to byte_index*8+7) <= Bus2IP_Data(byte_index*8 to byte_index*8+7);
              end if;
            end loop;
          when "00000100" =>
            for byte_index in 0 to (C_DWIDTH/8)-1 loop
              if ( Bus2IP_BE(byte_index) = '1' ) then
                slv_reg5(byte_index*8 to byte_index*8+7) <= Bus2IP_Data(byte_index*8 to byte_index*8+7);
              end if;
            end loop;
          when "00000010" =>
            for byte_index in 0 to (C_DWIDTH/8)-1 loop
              if ( Bus2IP_BE(byte_index) = '1' ) then
                slv_reg6(byte_index*8 to byte_index*8+7) <= Bus2IP_Data(byte_index*8 to byte_index*8+7);
              end if;
            end loop;
          when "00000001" =>
            for byte_index in 0 to (C_DWIDTH/8)-1 loop
              if ( Bus2IP_BE(byte_index) = '1' ) then
                slv_reg7(byte_index*8 to byte_index*8+7) <= Bus2IP_Data(byte_index*8 to byte_index*8+7);
              end if;
            end loop;
          when others => null;
        end case;
      end if;
    end if;

  end process SLAVE_REG_WRITE_PROC;

  -- implement slave model register read mux
  SLAVE_REG_READ_PROC : process( slv_reg_read_select, slv_reg0, slv_reg1, slv_reg2, slv_reg3, slv_reg4, slv_reg5, slv_reg6, slv_reg7 ) is
  begin

    case slv_reg_read_select is
      when "10000000" => slv_ip2bus_data <= slv_reg0;
      when "01000000" => slv_ip2bus_data <= slv_reg1;
      when "00100000" => slv_ip2bus_data <= slv_reg2;
      when "00010000" => slv_ip2bus_data <= slv_reg3;
      when "00001000" => slv_ip2bus_data <= slv_reg4;
      when "00000100" => slv_ip2bus_data <= slv_reg5;
      when "00000010" => slv_ip2bus_data <= slv_reg6;
      when "00000001" => slv_ip2bus_data <= slv_reg7;
      when others => slv_ip2bus_data <= (others => '0');
    end case;

  end process SLAVE_REG_READ_PROC;

  ------------------------------------------
  -- Example code to drive IP to Bus signals
  ------------------------------------------
  IP2Bus_Data        <= slv_ip2bus_data;

  IP2Bus_Ack         <= slv_write_ack or slv_read_ack;
  IP2Bus_Error       <= '0';
  IP2Bus_Retry       <= '0';
  IP2Bus_ToutSup     <= '0';

end IMP;
