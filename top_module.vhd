----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:45:32 08/05/2009 
-- Design Name: 
-- Module Name:    top_module - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created 
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
library work;
use work.ALL;
    
---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--LIBRARY UNISIM;
--USE UNISIM.VCOMPONENTS.ALL;
     
entity top_module IS
	Port(                       
		Clk: in std_logic;  
		Reset:in std_logic;
		TX: out std_logic;
		TX_Buffer_Empty: out std_logic;
		RX: in std_logic;
		
		RX_Frame_Error: out std_logic;
		RX_Parity_Error:out std_logic;
		RX_test: out std_logic;
		TX_test: out std_logic;
		--RX_BUFFER_FULL	: out std_logic;
		Data_Present_Test: out std_logic;
		Data_Read_Test: out std_logic;
		Reset_Test:out std_logic;
		RX_BUFFER_FULL_Test:out std_logic
	);
end top_module;
  
architecture Behavioral of top_module IS
	
	signal EN_16x_Baud				: std_logic;
	--RX COMPONENTS
	signal RX_Data						: std_logic_vector(0 to 7);
	signal RX_Data_Present			: std_logic;
	signal p_RX_Data_Present		: std_logic;
	signal NewData						: std_logic;
	signal Buffer_Data				: std_logic_vector(0 to 7);
	signal Buffer_Write				: std_logic;
	signal RX_BUFFER_FULL			: std_logic;
	signal Data_Read					: std_logic;
	--TX COMPONENTs
	signal Write_TX_FIFO				:std_logic := '0';
	signal TX_Data						:std_logic_vector(0 to 7) := x"00";
	signal TX_Buffer_Full 			:std_logic;
	signal toggle						:std_logic := '0';
	signal tx_control 				:std_logic;
	--DIAGRAM COMPONENTS
	signal Start						:std_logic;
	signal Read_RX_FIFO				:std_logic;
	signal Buffer_Read				:std_logic;
	signal Read_Data					:std_logic_vector(0 to 7);
	--RAM COMPONENTS
	signal Din							:std_logic_vector(0 to 7);
	signal Dout							:std_logic_vector(0 to 7);
	signal WrEn							:std_logic;
	signal RdEn							:std_logic;
	signal RAM_RdAddr					:std_logic_vector(12 downto 0);
	
	signal ResetCounter				:std_logic_vector(0 to 3):= "0000";
	signal new_reset					:std_logic;
	signal Menu_Addres				:std_logic_vector (7 downto 0) := (others=>'0');
	signal Start_Address				:std_logic_vector (4 downto 0) := (others=>'0');
	
	type byte_array  is array (0 to 23) of std_logic_vector(3 downto 0);
	type byte_array2 is array (0 to 5)  of std_logic_vector(3 downto 0);
	type byte_array3 is array (0 to 1)  of std_logic_vector(3 downto 0);
	
	signal Rast_Step					:std_logic_vector (1 downto 0) := (others=>'0');
	signal R_StepSize					:byte_array3 ; 

	--STANDARD MOD
	
	signal SFrekansKaydet			:std_logic:='0';
	signal SFrekansAdresi			:std_logic_vector (5 downto 0) := (others=>'0');
	
	signal SFrekans					:byte_array; 
	--signal SMedium1Frekans 		:byte_array2; 
	--signal SMedium2Frekans		:byte_array2;
	--signal SLowFrekans				:byte_array2;
	
	
	signal S_StepSize					:byte_array2;
	
	signal SStepKaydet				:std_logic;
	signal SStepAdresi				:std_logic_vector (3 downto 0) := (others=>'0'); 
	--RASTGELE MOD
	signal StepKaydet					:std_logic;
	signal StepAdresi					:std_logic_vector (1 downto 0) := (others=>'0'); 
	signal FrekansAdresi				:std_logic_vector (4 downto 0) := (others=>'0');
	signal FrekansKaydet				:std_logic:='0';
	
	   
	signal RastFrekans				:byte_array; 
	--signal RastMedium1Frekans 		:byte_array2; 
	--signal RastMedium2Frekans		:byte_array2;
	--signal RastLowFrekans			:byte_array2;
	
	--PRBS MOD
	
	signal PRBSFreKaydet				:std_logic:='0';
	signal BantKaydet					:std_logic:='0';
	  
	signal MerkezFrekans				:byte_array2;
	signal PRBSFrekansAdresi		:std_logic_vector (4 downto 0):= (others=>'0');
	
	signal BantAdresi					:std_logic_vector (2 downto 0):= (others=>'0');
	signal FrekansBandi				:byte_array2;
	
	signal BantSecimi					:std_logic_vector (1 downto 0):= (others=>'0');
	signal MainBantKaydet			:std_logic:='0';
	
begin
	Baud_Rate_Adjust: entity work.Baud_Rate PORT MAP(
		Clk => clk,
		EN_16x_Baud => EN_16x_Baud
	);
	
	Transmitter: entity work.OPB_UARTLITE_TX PORT MAP(
		Clk=>Clk,
		Reset=> new_reset,
		En_16x_Baud=> EN_16x_Baud,
		TX => tx_control,
		Write_TX_FIFO => Write_TX_FIFO,
		Reset_TX_FIFO => new_reset,
		TX_Data => TX_Data,
		TX_Buffer_Full => TX_Buffer_Full,
		TX_Buffer_Empty => TX_Buffer_Empty
	);     
		             
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
		BantKaydet=>BantKaydet,
		MainBantKaydet=>MainBantKaydet
	);
	
	RAM_RdAddr <= Start_Address & Menu_Addres;
	
	Ram: entity work.ram_512x8 PORT MAP(
		--COMMON COMPONENTS
		clk=>clk,
		reset=>new_reset,
		--WRITE COMPONENTS
		Din=>Din,
		WrEn=>WrEn,
		--READ COMPONENTS
		RdEn=>RdEn,
		Dout=>Dout,
		RdAddr=>RAM_RdAddr
	);
	Process(clk)  
	begin 
		if(rising_edge(clk)) then
			p_RX_Data_Present <= RX_Data_Present;
			NewData <= '0';
			if p_RX_Data_Present = '0' and RX_Data_Present = '1' then
				NewData <= '1';
			end if;
		end if;
	end process;
	
	Process(clk)  
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
	  
	--BANT SECIMI         
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
	process(clk)
		variable Rx_Variable				: std_logic_vector( 7 downto 0);
		variable number_Frekans			: std_logic_vector( 4 downto 0);
	begin
		if (rising_edge(clk)) then
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
	
	--STEPSIZE VALUES
	Process(clk)
		variable Rx_Variable2			: std_logic_vector( 7 downto 0);
	begin   
		if(rising_edge(clk)) then
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
	 
	--STEPSIZE VALUE
	Process(clk)
		variable Rx_Variable2			: std_logic_vector( 7 downto 0);
	begin   
		if(rising_edge(clk)) then
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
     
	--FREQUENCY VALUE 
	process(clk)
		variable Rx_Variable				: std_logic_vector( 7 downto 0);
	begin
		if (rising_edge(clk)) then
			if FrekansKaydet = '1' then
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
	
	--PRBS MOD
	--MERKEZ FREKANS
   process(clk)
		variable Rx_Variable				: std_logic_vector( 7 downto 0);
	begin
		if (rising_edge(clk)) then
			
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
	Process(clk)
		variable Rx_Variable2				: std_logic_vector( 7 downto 0);
	begin     
		if(rising_edge(clk)) then   
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
  
	RX_test<=RX;
	TX_test<=tx_control;
	TX<=tx_control;
	Data_Present_Test<=RX_Data_Present;
	Reset_Test<=Reset;
	Data_Read_Test<=Read_RX_FIFO;
	RX_BUFFER_FULL_Test<=RX_BUFFER_FULL;
end Behavioral;

