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
-- Filename:          user_logic.vhd
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

library proc_common_v2_00_a;
use proc_common_v2_00_a.proc_common_pkg.all;
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

entity user_logic is
  generic
  (
    -- ADD USER GENERICS BELOW THIS LINE ---------------
    --USER generics added here
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
    --USER ports added here
	 dout     			:out std_logic_vector(3 downto 0);
	 dout_bar 			:out std_logic_vector(3 downto 0);
	 control_signals  :out std_logic_vector(3 downto 0);
	 clk80 				:in std_logic;
    -- ADD USER PORTS ABOVE THIS LINE ------------------

    -- DO NOT EDIT BELOW THIS LINE ---------------------
    -- Bus protocol ports, do not add to or delete
    Bus2IP_Clk                     : in  std_logic;
    Bus2IP_Reset                   : in  std_logic;
    Bus2IP_Data                    : in  std_logic_vector(0 to C_DWIDTH-1);
    Bus2IP_BE                      : in  std_logic_vector(0 to C_DWIDTH/8-1);
    Bus2IP_RdCE                    : in  std_logic_vector(0 to C_NUM_CE-1);
    Bus2IP_WrCE                    : in  std_logic_vector(0 to C_NUM_CE-1);
    IP2Bus_Data                    : out std_logic_vector(0 to C_DWIDTH-1);
    IP2Bus_Ack                     : out std_logic;
    IP2Bus_Retry                   : out std_logic;
    IP2Bus_Error                   : out std_logic;
    IP2Bus_ToutSup                 : out std_logic
    -- DO NOT EDIT ABOVE THIS LINE ---------------------
  );
end entity user_logic;

------------------------------------------------------------------------------
-- Architecture section
------------------------------------------------------------------------------

architecture IMP of user_logic is

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


  signal frekans1,frekans2,frekans3,frekans4:unsigned(18 downto 0);
  signal frekans_L1,frekans_L2,frekans_L3,frekans_L4:unsigned(18 downto 0);
  signal frekans_H1,frekans_H2,frekans_H3,frekans_H4:unsigned(18 downto 0);
  signal frekans_M11,frekans_M21,frekans_M31,frekans_M41:unsigned(18 downto 0);--orta küçük frekanslar
  signal frekans_M12,frekans_M22,frekans_M32,frekans_M42:unsigned(18 downto 0);--orta büyük frekanslar
  signal frekans1_27,frekans2_27,frekans3_27,frekans4_27 : std_logic_vector(26 downto 0);
  
  signal sine1,sine2,sine3,sine4:std_logic_vector(3 downto 0);
  signal sentezor_yazma:std_logic;
  signal hard_signals:std_logic_vector(3 downto 0);
  signal step_size11,step_size21,step_size31,step_size41:unsigned(7 downto 0);--ilk step size
  signal step_size12,step_size22,step_size32,step_size42:unsigned(7 downto 0);--ikinci step size
  signal step_size13,step_size23,step_size33,step_size43:unsigned(7 downto 0);--üçüncü step size
  signal step_size_yaz:std_logic;
  signal cum_noise:unsigned(4 downto 0);
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
  signal shifted_noise1,shifted_noise2,shifted_noise3,shifted_noise4 : unsigned (7 downto 0);
  
  --Receiver Components
  signal clk					:std_logic;
  signal reset					:std_logic;
  signal En_16x_Baud			:std_logic;
  signal RX						:std_logic;
  signal Read_RX_FIFO   	:std_logic;
  signal Reset_RX_FIFO  	:std_logic;
  signal RX_Data        	:std_logic_vector(7 downto 0);
  signal RX_Data_Present	:std_logic;
  signal RX_BUFFER_FULL		:std_logic;
  signal RX_Frame_Error		:std_logic;
  signal RX_Overrrun_Error :std_logic;
  signal RX_Parity_Error	:std_logic;
  signal p_RX_Data_Present :std_logic;
begin

	Receiver : entity work.OPB_UARTLITE_RX PORT MAP(
		Clk=>Clk,
		Reset=> new_reset,
		En_16x_Baud=> EN_16x_Baud,
		RX=>RX,
		Read_RX_FIFO=>Read_RX_FIFO,
		Reset_RX_FIFO=>new_reset,
		RX_Data=>RX_Data,
		RX_Data_Present=>RX_Data_Present,
		RX_BUFFER_FULL=>RX_BUFFER_FULL,
		RX_Frame_Error=>RX_Frame_Error,
		RX_Overrun_Error=>open,
		RX_Parity_Error=>RX_Parity_Error
	);
	
	Diagram: entity work.Diagram1 PORT MAP(
		--COMMON COMPONENTS
		CLK=>Clk,
		RESET=>new_reset,
		--TX COMPONENT OF DIAGRAM1 
		T_Buffer_Full=>TX_BUFFER_FULL,
		T_Data=>TX_Data,
		T_Write=>Write_TX_FIFO,
		--RX COMPONENT OF DIAGRAM1
		Data_Present=>NewData,
		Data=>RX_Data,
		Data_Read=>Read_RX_FIFO,
		--Write 
		Buffer_Write=>WrEn,
		Buffer_Data=>Din,
		--Read
		Buffer_Read=>RdEn,
		Read_Data=>Dout,
		--Start
		Start_Address=>Start_Address,
		Menu_Addres=>Menu_Addres,
		Rast_Step=>Rast_Step,
		SFrekansKaydet=>SFrekansKaydet,
		SStepKaydet=>SStepKaydet,
		FrekansKaydet=>FrekansKaydet,
		StepKaydet=>StepKaydet,
		PRBSFreKaydet=>PRBSFreKaydet,
		BantKaydet=>BantKaydet
	);
	
	
	
  --USER logic implementation added here
  
   delay 					<= slv_reg1(0 to 9);
	random_sweep_mode    <= slv_reg3(31);
	jammer_calisma_modu  <= slv_reg3(29 to 30);
	freq_div_counter		<= slv_reg4(16 to 31);
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

Process(clk80)
variable ResetCounter:std_logic_vector(3 downto 0);  
	begin 
		if Reset = '0' then
			new_reset<='1';
			ResetCounter <= (others => '0');
			  
		elsif(rising_edge(clk)) then
			if(Resetcounter=15) then
				new_reset<='0';
			else
				new_reset<='1';
				ResetCounter<=ResetCounter+1;
			end if;
		end if;
	end process;

process(clk80)
		variable Rx_Variable				: std_logic_vector( 7 downto 0);
		variable number_Frekans			: std_logic_vector( 4 downto 0);
	begin
		if (rising_edge(clk80)) then
			if SFrekansKaydet = '1' then
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
	
process(clk80,bus2ip_reset)
variable cnt:std_logic_vector(3 downto 0);
variable toggle:std_logic;
variable tmp_dds_hard:std_logic;
variable cum_noise_1:unsigned(4 downto 0);
begin
	
		

	if bus2ip_reset='1' then
		frekans1<=(conv_unsigned(0,27));
		cnt:=(others=>'0');
		toggle:='0';
	elsif rising_edge(clk80) then
		if jammer_calisma_modu="00" then--frequency sweep mode
			if cnt="0000" then
				if toggle='0' then
					if frekans1 < frekans_M11 then
						if random_sweep_mode='0' then
							frekans1 <=frekans1+step_size11;
						else
							frekans1 <=frekans1+cum_noise_1(4 downto 0);
						end if;
					elsif frekans_M11 <= frekans1 and frekans1 < frekans_M12 then
						if random_sweep_mode='0' then
							frekans1 <=frekans1+step_size12;
						else
							frekans1 <=frekans1+shifted_noise1(7 downto 0);
						end if;
					elsif frekans_M12 <= frekans1 and frekans1 < frekans_H1 then
						if random_sweep_mode='0' then
							frekans1 <=frekans1+step_size13;
						else
							frekans1 <=frekans1+cum_noise_1(4 downto 0);
						end if;
					else
						toggle:='1';
						sweep_start(0)<='1';
						if cum_noise=conv_unsigned(0,cum_noise'length) then
							cum_noise_1:=conv_unsigned(1,cum_noise_1'length);
						else
							cum_noise_1:=cum_noise;
						end if;
						if step_size12(1 downto 0)=conv_unsigned(0,2) then
							shifted_noise1 <= "000" & cum_noise_1;
						elsif step_size12(1 downto 0)=conv_unsigned(1,2) then
							shifted_noise1 <= "00" & cum_noise_1 & '0';
						elsif step_size12(1 downto 0)=conv_unsigned(2,2) then
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
							frekans1 <=frekans1 -cum_noise_1(4 downto 0);
						end if;
					elsif frekans1 > frekans_M11 and frekans_M12 >= frekans1 then
						if random_sweep_mode='0' then
							frekans1 <=frekans1-step_size12;
						else
							frekans1 <=frekans1 -shifted_noise1(7 downto 0);
						end if;
					elsif frekans_M11 >= frekans1 and frekans1 > frekans_L1 then
						if random_sweep_mode='0' then
							frekans1 <=frekans1-step_size11;
						else
							frekans1 <=frekans1 -cum_noise_1(4 downto 0);
						end if;
					else
						toggle:='0';	
						sweep_start(0)<='0';
						if cum_noise=conv_unsigned(0,cum_noise'length) then
							cum_noise_1:=conv_unsigned(1,cum_noise_1'length);
						else
							cum_noise_1:=cum_noise;
						end if;
						if step_size12(1 downto 0)=conv_unsigned(0,2) then
							shifted_noise1 <= "000" & cum_noise_1;
						elsif step_size12(1 downto 0)=conv_unsigned(1,2) then
							shifted_noise1 <= "00" & cum_noise_1 & '0';
						elsif step_size12(1 downto 0)=conv_unsigned(2,2) then
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
variable cum_noise_2:unsigned(4 downto 0);
begin
	if bus2ip_reset='1' then
		frekans2<=(conv_unsigned(0,27));
		cnt:=(others=>'0');
		toggle:='0';
	elsif rising_edge(clk80) then
		if jammer_calisma_modu="00" then--frequency sweep mode
			if cnt="0000" then
				if toggle='0' then
					if frekans2 < frekans_M21 then
						if random_sweep_mode='0' then
							frekans2 <=frekans2+step_size21;
						else
							frekans2 <=frekans2+cum_noise_2(4 downto 0);
						end if;
					elsif frekans_M21 <= frekans2 and frekans2 < frekans_M22 then
						if random_sweep_mode='0' then
							frekans2 <=frekans2+step_size22;
						else
							frekans2 <=frekans2+shifted_noise2(7 downto 0);
						end if;
					elsif frekans_M22 <= frekans2 and frekans2 < frekans_H2 then
						if random_sweep_mode='0' then
							frekans2 <=frekans2+step_size23;
						else
							frekans2 <=frekans2+cum_noise_2(4 downto 0);
						end if;
					else
						toggle:='1';
						sweep_start(1)<='1';
						if cum_noise=conv_unsigned(0,cum_noise'length) then
							cum_noise_2:=conv_unsigned(1,cum_noise_2'length);
						else
							cum_noise_2:=cum_noise;
						end if;
						if step_size22(1 downto 0)=conv_unsigned(0,2) then
							shifted_noise2 <= "000" & cum_noise_2;
						elsif step_size22(1 downto 0)=conv_unsigned(1,2) then
							shifted_noise2 <= "00" & cum_noise_2 & '0';
						elsif step_size22(1 downto 0)=conv_unsigned(2,2) then
							shifted_noise2 <= '0' & cum_noise_2 & "00";
						else
							shifted_noise2 <= cum_noise_2 & "000";
						end if;
					end if;
				else
					if frekans2 > frekans_M22 then
						if random_sweep_mode='0' then
							frekans2 <=frekans2-step_size23;
						else
							frekans2 <=frekans2 -cum_noise_2(4 downto 0);
						end if;
					elsif frekans2 > frekans_M21 and frekans_M22 >= frekans2 then
						if random_sweep_mode='0' then
							frekans2 <=frekans2-step_size22;
						else
							frekans2 <=frekans2 -shifted_noise2(7 downto 0);
						end if;
					elsif frekans_M21 >= frekans2 and frekans2 > frekans_L2 then
						if random_sweep_mode='0' then
							frekans2 <=frekans2-step_size21;
						else
							frekans2 <=frekans2 -cum_noise_2(4 downto 0);
						end if;
					else
						toggle:='0';	
						sweep_start(1)<='0';
						if cum_noise=conv_unsigned(0,cum_noise'length) then
							cum_noise_2:=conv_unsigned(1,cum_noise_2'length);
						else
							cum_noise_2:=cum_noise;
						end if;
						if step_size22(1 downto 0)=conv_unsigned(0,2) then
							shifted_noise2 <= "000" & cum_noise_2;
						elsif step_size22(1 downto 0)=conv_unsigned(1,2) then
							shifted_noise2 <= "00" & cum_noise_2 & '0';
						elsif step_size22(1 downto 0)=conv_unsigned(2,2) then
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
variable cum_noise_3:unsigned(4 downto 0);
begin
	if bus2ip_reset='1' then
		frekans3<=(conv_unsigned(0,27));
		cnt:=(others=>'0');
		toggle:='0';
	elsif rising_edge(clk80) then
		if jammer_calisma_modu="00" then--frequency sweep mode
			if cnt="0000" then
				if toggle='0' then
					if frekans3 < frekans_M31 then
						if random_sweep_mode='0' then
							frekans3 <=frekans3+step_size31;
						else
							frekans3 <=frekans3+cum_noise_3(4 downto 0);
						end if;
					elsif frekans_M31 <= frekans3 and frekans3 < frekans_M32 then
						if random_sweep_mode='0' then
							frekans3 <=frekans3+step_size32;
						else
							frekans3 <=frekans3+shifted_noise3(7 downto 0);
						end if;
					elsif frekans_M32 <= frekans3 and frekans3 < frekans_H3 then
						if random_sweep_mode='0' then
							frekans3 <=frekans3+step_size33;
						else
							frekans3 <=frekans3+cum_noise_3(4 downto 0);
						end if;
					else
						toggle:='1';
						sweep_start(2)<='1';
						if cum_noise=conv_unsigned(0,cum_noise'length) then
							cum_noise_3:=conv_unsigned(1,cum_noise_3'length);
						else
							cum_noise_3:=cum_noise;
						end if;
						if step_size32(1 downto 0)=conv_unsigned(0,2) then
							shifted_noise3 <= "000" & cum_noise_3;
						elsif step_size32(1 downto 0)=conv_unsigned(1,2) then
							shifted_noise3 <= "00" & cum_noise_3 & '0';
						elsif step_size32(1 downto 0)=conv_unsigned(2,2) then
							shifted_noise3 <= '0' & cum_noise_3 & "00";
						else
							shifted_noise3 <= cum_noise_3 & "000";
						end if;
					end if;
				else
					if frekans3 > frekans_M32 then
						if random_sweep_mode='0' then
							frekans3 <=frekans3-step_size33;
						else
							frekans3 <=frekans3 -cum_noise_3(4 downto 0);
						end if;
					elsif frekans3 > frekans_M31 and frekans_M32 >= frekans3 then
						if random_sweep_mode='0' then
							frekans3 <=frekans3-step_size32;
						else
							frekans3 <=frekans3 -shifted_noise3(7 downto 0);
						end if;
					elsif frekans_M31 >= frekans3 and frekans3 > frekans_L3 then
						if random_sweep_mode='0' then
							frekans3 <=frekans3-step_size31;
						else
							frekans3 <=frekans3 -cum_noise_3(4 downto 0);
						end if;
					else
						toggle:='0';	
						sweep_start(2)<='0';
						if cum_noise=conv_unsigned(0,cum_noise'length) then
							cum_noise_3:=conv_unsigned(1,cum_noise_3'length);
						else
							cum_noise_3:=cum_noise;
						end if;
						if step_size32(1 downto 0)=conv_unsigned(0,2) then
							shifted_noise3 <= "000" & cum_noise_3;
						elsif step_size32(1 downto 0)=conv_unsigned(1,2) then
							shifted_noise3 <= "00" & cum_noise_3 & '0';
						elsif step_size32(1 downto 0)=conv_unsigned(2,2) then
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
variable cum_noise_4:unsigned(4 downto 0);
begin
	if bus2ip_reset='1' then
		frekans4<=(conv_unsigned(0,27));
		cnt:=(others=>'0');
		toggle:='0';
	elsif rising_edge(clk80) then
		if jammer_calisma_modu="00" then--frequency sweep mode
			if cnt="0000" then
				if toggle='0' then
					if frekans4 < frekans_M41 then
						if random_sweep_mode='0' then
							frekans4 <=frekans4+step_size41;
						else
							frekans4 <=frekans4+cum_noise_4(4 downto 0);
						end if;
					elsif frekans_M41 <= frekans4 and frekans4 < frekans_M42 then
						if random_sweep_mode='0' then
							frekans4 <=frekans4+step_size42;
						else
							frekans4 <=frekans4+shifted_noise4(7 downto 0);
						end if;
					elsif frekans_M42 <= frekans4 and frekans4 < frekans_H4 then
						if random_sweep_mode='0' then
							frekans4 <=frekans4+step_size43;
						else
							frekans4 <=frekans4+cum_noise_4(4 downto 0);
						end if;
					else
						toggle:='1';
						sweep_start(3)<='1';
						if cum_noise=conv_unsigned(0,cum_noise'length) then
							cum_noise_4:=conv_unsigned(1,cum_noise_4'length);
						else
							cum_noise_4:=cum_noise;
						end if;
						if step_size42(1 downto 0)=conv_unsigned(0,2) then
							shifted_noise4 <= "000" & cum_noise_4;
						elsif step_size42(1 downto 0)=conv_unsigned(1,2) then
							shifted_noise4 <= "00" & cum_noise_4 & '0';
						elsif step_size42(1 downto 0)=conv_unsigned(2,2) then
							shifted_noise4 <= '0' & cum_noise_4 & "00";
						else
							shifted_noise4 <= cum_noise_4 & "000";
						end if;
					end if;
				else
					if frekans4 > frekans_M42 then
						if random_sweep_mode='0' then
							frekans4 <=frekans4-step_size43;
						else
							frekans4 <=frekans4 -cum_noise_4(4 downto 0);
						end if;
					elsif frekans4 > frekans_M41 and frekans_M42 >= frekans4 then
						if random_sweep_mode='0' then
							frekans4 <=frekans4-step_size42;
						else
							frekans4 <=frekans4 -shifted_noise4(7 downto 0);
						end if;
					elsif frekans_M41 >= frekans4 and frekans4 > frekans_L4 then
						if random_sweep_mode='0' then
							frekans4 <=frekans4-step_size41;
						else
							frekans4 <=frekans4 -cum_noise_4(4 downto 0);
						end if;
					else
						toggle:='0';	
						sweep_start(3)<='0';
						if cum_noise=conv_unsigned(0,cum_noise'length) then
							cum_noise_4:=conv_unsigned(1,cum_noise_4'length);
						else
							cum_noise_4:=cum_noise;
						end if;
						if step_size42(1 downto 0)=conv_unsigned(0,2) then
							shifted_noise4 <= "000" & cum_noise_4;
						elsif step_size42(1 downto 0)=conv_unsigned(1,2) then
							shifted_noise4 <= "00" & cum_noise_4 & '0';
						elsif step_size42(1 downto 0)=conv_unsigned(2,2) then
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
 
process(bus2ip_reset,bus2ip_clk)
begin
	if bus2ip_reset='1' then
	
	elsif rising_edge(bus2ip_clk) then
		if sentezor_yazma='1' then
			if slv_reg0(0 to 3)="0000" then
				frekans_L1<=unsigned(slv_reg0(13 to 31));	
			elsif slv_reg0(0 to 3)="0001" then 	
				frekans_H1<=unsigned(slv_reg0(13 to 31));
			elsif slv_reg0(0 to 3)="0010" then 	
				frekans_L2<=unsigned(slv_reg0(13 to 31));	
			elsif slv_reg0(0 to 3)="0011" then 	
				frekans_H2<=unsigned(slv_reg0(13 to 31));	
			elsif slv_reg0(0 to 3)="0100" then 	
				frekans_L3<=unsigned(slv_reg0(13 to 31));	
			elsif slv_reg0(0 to 3)="0101" then 	
				frekans_H3<=unsigned(slv_reg0(13 to 31));	
			elsif slv_reg0(0 to 3)="0110" then 	
				frekans_L4<=unsigned(slv_reg0(13 to 31));	
			elsif slv_reg0(0 to 3)="0111" then 	
				frekans_H4<=unsigned(slv_reg0(13 to 31));
			elsif slv_reg0(0 to 3)="1000" then 	
				frekans_M11<=unsigned(slv_reg0(13 to 31));
			elsif slv_reg0(0 to 3)="1001" then 	
				frekans_M12<=unsigned(slv_reg0(13 to 31));	
			elsif slv_reg0(0 to 3)="1010" then 	
				frekans_M21<=unsigned(slv_reg0(13 to 31));	
			elsif slv_reg0(0 to 3)="1011" then 	
				frekans_M22<=unsigned(slv_reg0(13 to 31));	
			elsif slv_reg0(0 to 3)="1100" then 	
				frekans_M31<=unsigned(slv_reg0(13 to 31));	
			elsif slv_reg0(0 to 3)="1101" then 	
				frekans_M32<=unsigned(slv_reg0(13 to 31));	
			elsif slv_reg0(0 to 3)="1110" then 	
				frekans_M41<=unsigned(slv_reg0(13 to 31));
			elsif slv_reg0(0 to 3)="1111" then 	
				frekans_M42<=unsigned(slv_reg0(13 to 31));
			end if;
		end if;
	end if;
end process;

process(bus2ip_clk,bus2ip_reset)
begin
	if bus2ip_reset='1' then
		step_size11<=x"01";
		step_size21<=x"01";
		step_size31<=x"01";
		step_size41<=x"01";
		step_size12<=x"01";
		step_size22<=x"01";
		step_size32<=x"01";
		step_size42<=x"01";
		step_size13<=x"01";
		step_size23<=x"01";
		step_size33<=x"01";
		step_size43<=x"01";		
	elsif rising_edge(bus2ip_clk) then
		if slv_reg2(0 to 3)="0000" then
			step_size11<=unsigned(slv_reg2(24 to 31));
		elsif slv_reg2(0 to 3)="0001" then
			step_size12<=unsigned(slv_reg2(24 to 31));
		elsif slv_reg2(0 to 3)="0010" then
			step_size13<=unsigned(slv_reg2(24 to 31));
		elsif slv_reg2(0 to 3)="0011" then
			step_size21<=unsigned(slv_reg2(24 to 31));
		elsif slv_reg2(0 to 3)="0100" then
			step_size22<=unsigned(slv_reg2(24 to 31));
		elsif slv_reg2(0 to 3)="0101" then
			step_size23<=unsigned(slv_reg2(24 to 31));
		elsif slv_reg2(0 to 3)="0110" then
			step_size31<=unsigned(slv_reg2(24 to 31));
		elsif slv_reg2(0 to 3)="0111" then
			step_size32<=unsigned(slv_reg2(24 to 31));
		elsif slv_reg2(0 to 3)="1000" then
			step_size33<=unsigned(slv_reg2(24 to 31));
		elsif slv_reg2(0 to 3)="1001" then
			step_size41<=unsigned(slv_reg2(24 to 31));
		elsif slv_reg2(0 to 3)="1010" then
			step_size42<=unsigned(slv_reg2(24 to 31));
		elsif slv_reg2(0 to 3)="1011" then
			step_size43<=unsigned(slv_reg2(24 to 31));
		end if;			
	end if;
end process;


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