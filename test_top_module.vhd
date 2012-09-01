
--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:39:11 08/07/2009
-- Design Name:   top_module
-- Module Name:   C:/bugra/deneme/test_top_module.vhd
-- Project Name:  Project
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: top_module
--
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends 
-- that these types always be used for the top-level I/O of a design in order 
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;
USE ieee.numeric_std.ALL;
library work;
use work.ALL;


ENTITY test_top_module_vhd IS
END test_top_module_vhd;

ARCHITECTURE behavior OF test_top_module_vhd IS 

	-- Component Declaration for the Unit Under Test (UUT)
	COMPONENT top_module
	PORT(
		--COMMON COMPONENTS
		Clk : IN std_logic;
		Reset : IN std_logic;
		--RX COMPONENTS
		RX : IN std_logic; 
		RX_Frame_Error : OUT std_logic;
		RX_Parity_Error : OUT std_logic;
		--TX COMPONENTS
		TX : OUT std_logic;
		TX_Buffer_Empty : OUT std_logic
		--TX_Data : IN std_logic_vector(0 to 7);
		--TX_Buffer_Full : OUT std_logic;
		--Write_TX_FIFO : IN std_logic;
		--toggleout: out std_logic;
		);
	END COMPONENT;


	SIGNAL Clk :  std_logic := '0';
	SIGNAL Reset :  std_logic := '1';
	SIGNAL Write_TX_FIFO :  std_logic := '0';
	SIGNAL Read_RX_FIFO :  std_logic := '1';
	SIGNAL TX_Data :  std_logic_vector(0 to 7) :=x"33";
	signal RX: std_logic;
	SIGNAL TX_Buffer_Full :  std_logic;
	SIGNAL TX_Buffer_Empty :  std_logic;
	SIGNAL RX_Frame_Error :  std_logic;
	SIGNAL RX_Parity_Error :  std_logic;


BEGIN

	-- Instantiate the Unit Under Test (UUT)
	uut: top_module PORT MAP(
	
		--COMMON COMPONENTS
		Clk => Clk,
		Reset => '1',
	
		--TX COMPONENTS
		TX => OPEN,
		TX_Buffer_Empty => open,
		--TX_Data => TX_Data,
		--Write_TX_FIFO => Write_TX_FIFO,
		--TX_Buffer_Full => TX_Buffer_Full,
		
		--RX COMPONENTS
		RX => RX,
		
		RX_Frame_Error => RX_Frame_Error,
--		toggleout=>toggleout,
		RX_Parity_Error => RX_Parity_Error
	);
	
	Topmodule0fTX: entity work.tx_top_module PORT MAP(
		--COMMON COMPONENTS 
		Clk=>Clk,
		Reset=>Reset,
		--TX COMPONENT of TX_TOP_MODULE
		Reset_TX_FIFO =>Reset,
		Write_TX_FIFO => Write_TX_FIFO,
		TX_Data => TX_Data,
		TX_Buffer_Full => TX_Buffer_Full,
		TX_Buffer_Empty => TX_Buffer_Empty,
		TX=>RX
	);
		
	Clk<= not Clk after 100 ns;
	
	tb : PROCESS
	BEGIN

		-- Wait 100 ns for global reset to finish
		wait for 1000 ns;
		Reset<='0';
		
		
		wait for 200 ns;
		Write_TX_FIFO <= '1';
		TX_Data<=x"33";
		wait for 200 ns;
		Write_TX_FIFO <= '0';
		wait for 3 ms;
		
		wait for 200 ns;
		Write_TX_FIFO <= '1';
		TX_Data<=x"31";
		wait for 200 ns;
		Write_TX_FIFO <= '0';
		wait for 3 ms;
		
		
		wait for 200 ns;
		Write_TX_FIFO <= '1';
		TX_Data<=x"31";
		wait for 200 ns;
		Write_TX_FIFO <= '0';
		wait for 3 ms;
		
		
		wait for 200 ns;
		Write_TX_FIFO <= '1';
		TX_Data<=x"36";
		wait for 200 ns;
		Write_TX_FIFO <= '0';
		wait for 3 ms;
		
		
		
		wait for 200 ns;
		Write_TX_FIFO <= '1';
		TX_Data<=x"38";
		wait for 200 ns;
		Write_TX_FIFO <= '0';
		wait for 3 ms;
		
		wait for 200 ns;
		Write_TX_FIFO <= '1';
		TX_Data<=x"37";
		wait for 200 ns;
		Write_TX_FIFO <= '0';
		wait for 3 ms;
		
		wait for 200 ns;
		Write_TX_FIFO <= '1';
		TX_Data<=x"32";
		wait for 200 ns;
		Write_TX_FIFO <= '0';
		wait for 3 ms;
		
		wait for 200 ns;
		Write_TX_FIFO <= '1';
		TX_Data<=x"34";
		wait for 200 ns;
		Write_TX_FIFO <= '0';
		wait for 3 ms;
		
		wait for 200 ns;
		Write_TX_FIFO <= '1';
		TX_Data<=x"38";
		wait for 200 ns;
		Write_TX_FIFO <= '0';
		wait for 3 ms;
		
		wait for 200 ns;
		Write_TX_FIFO <= '1';
		TX_Data<=x"37";
		wait for 200 ns;
		Write_TX_FIFO <= '0';
		wait for 3 ms;
		
		
		wait for 200 ns;
		Write_TX_FIFO <= '1';
		TX_Data<=x"35";
		wait for 200 ns;
		Write_TX_FIFO <= '0';
		wait for 3 ms;
		
		wait for 200 ns;
		Write_TX_FIFO <= '1';
		TX_Data<=x"39";
		wait for 200 ns;
		Write_TX_FIFO <= '0';
		wait for 3 ms;
		
		
		wait for 200 ns;
		Write_TX_FIFO <= '1';
		TX_Data<=x"36";
		wait for 200 ns;
		Write_TX_FIFO <= '0';
		wait for 3 ms;
		
		wait for 200 ns;
		Write_TX_FIFO <= '1';
		TX_Data<=x"44";
		wait for 200 ns;
		Write_TX_FIFO <= '0';
		wait for 3 ms;
	
		wait for 200 ns;
		Write_TX_FIFO <= '1';
		TX_Data<=x"31";
		wait for 200 ns;
		Write_TX_FIFO <= '0';
		wait for 3 ms;
		
		
		wait for 200 ns;
		Write_TX_FIFO <= '1';
		TX_Data<=x"36";
		wait for 200 ns;
		Write_TX_FIFO <= '0';
		wait for 3 ms;
		
		
		
		wait for 200 ns;
		Write_TX_FIFO <= '1';
		TX_Data<=x"38";
		wait for 200 ns;
		Write_TX_FIFO <= '0';
		wait for 3 ms;
		
		wait for 200 ns;
		Write_TX_FIFO <= '1';
		TX_Data<=x"37";
		wait for 200 ns;
		Write_TX_FIFO <= '0';
		wait for 3 ms;
		
		wait for 200 ns;
		Write_TX_FIFO <= '1';
		TX_Data<=x"32";
		wait for 200 ns;
		Write_TX_FIFO <= '0';
		wait for 3 ms;
		
		wait for 200 ns;
		Write_TX_FIFO <= '1';
		TX_Data<=x"34";
		wait for 200 ns;
		Write_TX_FIFO <= '0';
		wait for 3 ms;
		
		wait for 200 ns;
		Write_TX_FIFO <= '1';
		TX_Data<=x"38";
		wait for 200 ns;
		Write_TX_FIFO <= '0';
		wait for 3 ms;
		
		wait for 200 ns;
		Write_TX_FIFO <= '1';
		TX_Data<=x"37";
		wait for 200 ns;
		Write_TX_FIFO <= '0';
		wait for 3 ms;
		
		
		wait for 200 ns;
		Write_TX_FIFO <= '1';
		TX_Data<=x"35";
		wait for 200 ns;
		Write_TX_FIFO <= '0';
		wait for 3 ms;
		
		wait for 200 ns;
		Write_TX_FIFO <= '1';
		TX_Data<=x"39";
		wait for 200 ns;
		Write_TX_FIFO <= '0';
		wait for 3 ms;
		
		
		wait for 200 ns;
		Write_TX_FIFO <= '1';
		TX_Data<=x"36";
		wait for 200 ns;
		Write_TX_FIFO <= '0';
		wait for 3 ms;
		
		wait for 200 ns;
		Write_TX_FIFO <= '1';
		TX_Data<=x"44";
		wait for 200 ns;
		Write_TX_FIFO <= '0';
		wait for 3 ms;
		
		wait for 200 ns;
		Write_TX_FIFO <= '1';
		TX_Data<=x"36";
		wait for 200 ns;
		Write_TX_FIFO <= '0';
		wait for 3 ms;
		
		wait for 200 ns;
		Write_TX_FIFO <= '1';
		TX_Data<=x"44";
		wait for 200 ns;
		Write_TX_FIFO <= '0';
		wait for 3 ms;
		
			wait for 200 ns;
		Write_TX_FIFO <= '1';
		TX_Data<=x"36";
		wait for 200 ns;
		Write_TX_FIFO <= '0';
		wait for 3 ms;
		
		wait for 200 ns;
		Write_TX_FIFO <= '1';
		TX_Data<=x"44";
		wait for 200 ns;
		Write_TX_FIFO <= '0';
		wait for 3 ms;
		
			wait for 200 ns;
		Write_TX_FIFO <= '1';
		TX_Data<=x"36";
		wait for 200 ns;
		Write_TX_FIFO <= '0';
		wait for 3 ms;
		
		wait for 200 ns;
		Write_TX_FIFO <= '1';
		TX_Data<=x"44";
		wait for 200 ns;
		Write_TX_FIFO <= '0';
		wait for 3 ms;
		
--		wait for 1 us;
--		Write_TX_FIFO <= '1';
--		wait for 200 ns;
--		Write_TX_FIFO <= '0';
		-- Place stimulus here

		wait; -- will wait forever
	END PROCESS;

END;
