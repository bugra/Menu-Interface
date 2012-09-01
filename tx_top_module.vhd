----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:03:41 08/11/2009 
-- Design Name: 
-- Module Name:    tx_top_module - Behavioral 
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

entity tx_top_module is
	PORT(
		--COMMON COMPONENTS
		Clk: 			 		in std_logic;
		Reset: 		 		in std_logic;

		--TRANSMITTER COMPONENTS
		Reset_TX_FIFO: 	in std_logic;
		TX_Data: 			in std_logic_vector(0 to 7);
		
		TX_Buffer_Full:	out std_logic;
		TX_Buffer_Empty:	out std_logic;
		Write_TX_FIFO: 	in std_logic;
		TX: 					out std_logic
		);
end tx_top_module;

architecture Behavioral of tx_top_module is
	
	signal En_16x_Baud		: std_logic;
	--signal Write_TX_FIFO		: std_logic;
begin
	--BAUD RATE COMPONENT
	Baud_Rate_Adjust: entity work.Baud_Rate PORT MAP(
		Clk => clk,
		EN_16x_Baud => EN_16x_Baud
	);
	--TRANSMITTER COMPONENT
	Transmitter :entity work.OPB_UARTLITE_TX PORT MAP(
		Clk=>Clk,
		Reset=>Reset,
		En_16x_Baud=> EN_16x_Baud,
		TX => TX,
		Write_TX_FIFO=> Write_TX_FIFO,
		Reset_TX_FIFO => Reset_TX_FIFO,
		TX_Data => TX_Data,
		TX_Buffer_Full => TX_Buffer_Full,
		TX_Buffer_Empty => TX_Buffer_Empty
	);

end Behavioral;

