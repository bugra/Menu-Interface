----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:18:28 08/10/2009 
-- Design Name: 
-- Module Name:    top_module_2 - Behavioral 
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
--library UNISIM;
--use UNISIM.VComponents.all;

entity top_module_2 is
	PORT(
		Clk:in std_logic;
		Reset: in std_logic;
		
		Reset_TX_FIFO: in std_logic;
		TX: out std_logic;
		TX_Buffer_Empty: out std_logic;
		TX_Data: in std_logic_vector(0 to 7);
		--Write_TX_FIFO: in std_logic;
		--TX_Buffer_Full: out std_logic;
		
		RX: in std_logic;
		Read_RX_FIFO: in std_logic;
		Reset_RX_FIFO :in std_logic;
		RX_Frame_Error: out std_logic;
		RX_Parity_Error:out std_logic
		--RX_BUFFER_FULL	: out std_logic;
		);
end top_module_2;

architecture Behavioral of top_module_2 is
		
		signal EN_16x_Baud				: std_logic;
		--RX COMPONENTS
	signal RX_Data						: std_logic_vector(0 to 7);
	signal RX_Data_Present			: std_logic;
	signal Buffer_Data				: std_logic_vector(0 to 7);
	signal Buffer_Write				: std_logic;
	signal RX_BUFFER_FULL			: std_logic;
	signal Data_Read					: std_logic;
	
	--TX COMPONENTs
	signal Write_TX_FIFO				:std_logic;
	--signal TX_Data						:std_logic_vector(0 to 7);
	signal TX_Buffer_Full 			:std_logic;
	

	begin
	Baud_Rate_Adjust: entity work.Baud_Rate PORT MAP(
		Clk => clk,
		EN_16x_Baud => EN_16x_Baud
	);
	
	Transmitter :entity work.OPB_UARTLITE_TX PORT MAP(
		Clk=>Clk,
		Reset=>Reset,
		En_16x_Baud=> EN_16x_Baud,
		TX => TX,
		Write_TX_FIFO => Write_TX_FIFO,
		Reset_TX_FIFO => Reset_TX_FIFO,
		TX_Data => TX_Data,
		TX_Buffer_Full => TX_Buffer_Full,
		TX_Buffer_Empty => TX_Buffer_Empty
	);
		
	Receiver :entity work.OPB_UARTLITE_RX PORT MAP(
		Clk=>Clk,
		Reset=>Reset,
		En_16x_Baud=> EN_16x_Baud,
		RX=>RX,
		Read_RX_FIFO=>Read_RX_FIFO,
		Reset_RX_FIFO=>Reset_RX_FIFO,
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
		RESET=>Reset,
		--TX COMPONENT OF DIAGRAM1 
		T_Buffer_Full=>TX_BUFFER_FULL,
		--TX_Data=>TX_Data,
		T_Write=>Write_TX_FIFO,
		--RX COMPONENT OF DIAGRAM1
		Data_Present=>RX_Data_Present,
		Data=>RX_Data,
		Buffer_Data=>Buffer_Data,
		Buffer_Write=>Buffer_Write
		--Data_Read=>Read_RX_FIFO
	);

end Behavioral;

