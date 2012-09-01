--  C:\BUGRA\PROJECT\DIAGRAM1.vhd
--  VHDL code created by Xilinx's StateCAD 8.2i
--  Thu Aug 27 16:07:23 2009

--  This VHDL code (for use with Xilinx XST) was generated using: 
--  binary encoded state assignment with structured code format.
--  Minimization is enabled,  implied else is enabled, 
--  and outputs are speed optimized.

LIBRARY ieee;
USE ieee.std_logic_1164.all;

LIBRARY ieee;
USE ieee.std_logic_unsigned.all;

ENTITY SHELL_DIAGRAM1 IS
	PORT (CLK,Buffer_Data0,Buffer_Data1,Buffer_Data2,Buffer_Data3,Buffer_Data4,
		Buffer_Data5,Buffer_Data6,Buffer_Data7,Buffer_Write,Data0,Data1,Data2,Data3,
		Data4,Data5,Data6,Data7,Data_Present,Rast_Step0,Rast_Step1,Read_Data0,
		Read_Data1,Read_Data2,Read_Data3,Read_Data4,Read_Data5,Read_Data6,Read_Data7,
		RESET,T_Buffer_Full: IN std_logic;
		BantKaydet,Buffer_Read,Data_Read,FrekansKaydet,MainBantKaydet,Menu_Addres0,
			Menu_Addres1,Menu_Addres2,Menu_Addres3,Menu_Addres4,Menu_Addres5,Menu_Addres6
			,Menu_Addres7,PRBSFreKaydet,SFrekansKaydet,SStepKaydet,Start_Address0,
			Start_Address1,Start_Address2,Start_Address3,Start_Address4,StepKaydet,
			T_Data0,T_Data1,T_Data2,T_Data3,T_Data4,T_Data5,T_Data6,T_Data7,T_Write : OUT
			 std_logic);
END;

ARCHITECTURE BEHAVIOR OF SHELL_DIAGRAM1 IS
	SIGNAL sreg : std_logic_vector (3 DOWNTO 0);
	SIGNAL next_sreg : std_logic_vector (3 DOWNTO 0);
	CONSTANT BantSecimi : std_logic_vector (3 DOWNTO 0) :="0000";
	CONSTANT FrekansBandi : std_logic_vector (3 DOWNTO 0) :="0001";
	CONSTANT MainMenu : std_logic_vector (3 DOWNTO 0) :="0010";
	CONSTANT PRBS : std_logic_vector (3 DOWNTO 0) :="0011";
	CONSTANT PRBSFrekans : std_logic_vector (3 DOWNTO 0) :="0100";
	CONSTANT RastFrekans : std_logic_vector (3 DOWNTO 0) :="0101";
	CONSTANT RastgeleMain : std_logic_vector (3 DOWNTO 0) :="0110";
	CONSTANT RastStep : std_logic_vector (3 DOWNTO 0) :="0111";
	CONSTANT StandardFrekans : std_logic_vector (3 DOWNTO 0) :="1000";
	CONSTANT StandardMain : std_logic_vector (3 DOWNTO 0) :="1001";
	CONSTANT StandardStep : std_logic_vector (3 DOWNTO 0) :="1010";
	CONSTANT STATE0 : std_logic_vector (3 DOWNTO 0) :="1011";
	CONSTANT STATE2 : std_logic_vector (3 DOWNTO 0) :="1100";

	SIGNAL sreg1 : std_logic_vector (2 DOWNTO 0);
	SIGNAL next_sreg1 : std_logic_vector (2 DOWNTO 0);
	CONSTANT STATE5 : std_logic_vector (2 DOWNTO 0) :="000";
	CONSTANT STATE6 : std_logic_vector (2 DOWNTO 0) :="001";
	CONSTANT STATE7 : std_logic_vector (2 DOWNTO 0) :="010";
	CONSTANT STATE8 : std_logic_vector (2 DOWNTO 0) :="011";
	CONSTANT STATE9 : std_logic_vector (2 DOWNTO 0) :="100";

	SIGNAL next_BantKaydet,next_Buffer_Read,next_Counter0,next_Counter1,
		next_Counter2,next_Counter3,next_Counter4,next_Counter5,next_Counter6,
		next_Counter7,next_Data_Read,next_Finished,next_FrekansKaydet,next_Increment,
		next_MainBantKaydet,next_Other_Counter0,next_Other_Counter1,
		next_Other_Counter2,next_Other_Counter3,next_Other_Counter4,
		next_Other_Counter5,next_Other_Counter6,next_Other_Counter7,
		next_Other_Increment,next_PRBSFreKaydet,next_ResetCount,next_RstCnt2,
		next_SFrekansKaydet,next_SStepKaydet,next_Start,next_Start_Address0,
		next_Start_Address1,next_Start_Address2,next_Start_Address3,
		next_Start_Address4,next_StepKaydet,next_T_Data0,next_T_Data1,next_T_Data2,
		next_T_Data3,next_T_Data4,next_T_Data5,next_T_Data6,next_T_Data7,next_T_Write
		 : std_logic;
	SIGNAL Counter : std_logic_vector (7 DOWNTO 0);
	SIGNAL Menu_Addres : std_logic_vector (7 DOWNTO 0);
	SIGNAL Other_Counter : std_logic_vector (7 DOWNTO 0);
	SIGNAL Start_Address : std_logic_vector (4 DOWNTO 0);
	SIGNAL T_Data : std_logic_vector (7 DOWNTO 0);

	SIGNAL Counter0,Counter1,Counter2,Counter3,Counter4,Counter5,Counter6,
		Counter7,Finished,Increment,Other_Counter0,Other_Counter1,Other_Counter2,
		Other_Counter3,Other_Counter4,Other_Counter5,Other_Counter6,Other_Counter7,
		Other_Increment,ResetCount,RstCnt2,Start: std_logic;
BEGIN
	PROCESS (CLK, RESET)
	BEGIN
		IF (RESET='1') THEN
			Counter7 <= '0';
		ELSIF CLK='1' AND CLK'event THEN
			Counter7 <= next_Counter7;
		END IF;
	END PROCESS;

	PROCESS (CLK, RESET)
	BEGIN
		IF (RESET='1') THEN
			Counter6 <= '0';
		ELSIF CLK='1' AND CLK'event THEN
			Counter6 <= next_Counter6;
		END IF;
	END PROCESS;

	PROCESS (CLK, RESET)
	BEGIN
		IF (RESET='1') THEN
			Counter5 <= '0';
		ELSIF CLK='1' AND CLK'event THEN
			Counter5 <= next_Counter5;
		END IF;
	END PROCESS;

	PROCESS (CLK, RESET)
	BEGIN
		IF (RESET='1') THEN
			Counter4 <= '0';
		ELSIF CLK='1' AND CLK'event THEN
			Counter4 <= next_Counter4;
		END IF;
	END PROCESS;

	PROCESS (CLK, RESET)
	BEGIN
		IF (RESET='1') THEN
			Counter3 <= '0';
		ELSIF CLK='1' AND CLK'event THEN
			Counter3 <= next_Counter3;
		END IF;
	END PROCESS;

	PROCESS (CLK, RESET)
	BEGIN
		IF (RESET='1') THEN
			Counter2 <= '0';
		ELSIF CLK='1' AND CLK'event THEN
			Counter2 <= next_Counter2;
		END IF;
	END PROCESS;

	PROCESS (CLK, RESET)
	BEGIN
		IF (RESET='1') THEN
			Counter1 <= '0';
		ELSIF CLK='1' AND CLK'event THEN
			Counter1 <= next_Counter1;
		END IF;
	END PROCESS;

	PROCESS (CLK, RESET)
	BEGIN
		IF (RESET='1') THEN
			Counter0 <= '0';
		ELSIF CLK='1' AND CLK'event THEN
			Counter0 <= next_Counter0;
		END IF;
	END PROCESS;

	PROCESS (CLK, RESET)
	BEGIN
		IF (RESET='1') THEN
			Other_Counter7 <= '0';
		ELSIF CLK='1' AND CLK'event THEN
			Other_Counter7 <= next_Other_Counter7;
		END IF;
	END PROCESS;

	PROCESS (CLK, RESET)
	BEGIN
		IF (RESET='1') THEN
			Other_Counter6 <= '0';
		ELSIF CLK='1' AND CLK'event THEN
			Other_Counter6 <= next_Other_Counter6;
		END IF;
	END PROCESS;

	PROCESS (CLK, RESET)
	BEGIN
		IF (RESET='1') THEN
			Other_Counter5 <= '0';
		ELSIF CLK='1' AND CLK'event THEN
			Other_Counter5 <= next_Other_Counter5;
		END IF;
	END PROCESS;

	PROCESS (CLK, RESET)
	BEGIN
		IF (RESET='1') THEN
			Other_Counter4 <= '0';
		ELSIF CLK='1' AND CLK'event THEN
			Other_Counter4 <= next_Other_Counter4;
		END IF;
	END PROCESS;

	PROCESS (CLK, RESET)
	BEGIN
		IF (RESET='1') THEN
			Other_Counter3 <= '0';
		ELSIF CLK='1' AND CLK'event THEN
			Other_Counter3 <= next_Other_Counter3;
		END IF;
	END PROCESS;

	PROCESS (CLK, RESET)
	BEGIN
		IF (RESET='1') THEN
			Other_Counter2 <= '0';
		ELSIF CLK='1' AND CLK'event THEN
			Other_Counter2 <= next_Other_Counter2;
		END IF;
	END PROCESS;

	PROCESS (CLK, RESET)
	BEGIN
		IF (RESET='1') THEN
			Other_Counter1 <= '0';
		ELSIF CLK='1' AND CLK'event THEN
			Other_Counter1 <= next_Other_Counter1;
		END IF;
	END PROCESS;

	PROCESS (CLK, RESET)
	BEGIN
		IF (RESET='1') THEN
			Other_Counter0 <= '0';
		ELSIF CLK='1' AND CLK'event THEN
			Other_Counter0 <= next_Other_Counter0;
		END IF;
	END PROCESS;

	PROCESS (CLK, RESET, next_sreg, next_BantKaydet, next_Data_Read, 
		next_FrekansKaydet, next_Increment, next_MainBantKaydet, next_PRBSFreKaydet, 
		next_ResetCount, next_SFrekansKaydet, next_SStepKaydet, next_Start, 
		next_StepKaydet, next_Start_Address4, next_Start_Address3, 
		next_Start_Address2, next_Start_Address1, next_Start_Address0)
	BEGIN
		IF ( RESET='1' ) THEN
			sreg <= STATE2;
			BantKaydet <= '0';
			Data_Read <= '0';
			FrekansKaydet <= '0';
			Increment <= '0';
			MainBantKaydet <= '0';
			PRBSFreKaydet <= '0';
			ResetCount <= '0';
			SFrekansKaydet <= '0';
			SStepKaydet <= '0';
			Start <= '0';
			StepKaydet <= '0';
			Start_Address4 <= '0';
			Start_Address3 <= '0';
			Start_Address2 <= '0';
			Start_Address1 <= '0';
			Start_Address0 <= '0';
		ELSIF CLK='1' AND CLK'event THEN
			sreg <= next_sreg;
			BantKaydet <= next_BantKaydet;
			Data_Read <= next_Data_Read;
			FrekansKaydet <= next_FrekansKaydet;
			Increment <= next_Increment;
			MainBantKaydet <= next_MainBantKaydet;
			PRBSFreKaydet <= next_PRBSFreKaydet;
			ResetCount <= next_ResetCount;
			SFrekansKaydet <= next_SFrekansKaydet;
			SStepKaydet <= next_SStepKaydet;
			Start <= next_Start;
			StepKaydet <= next_StepKaydet;
			Start_Address4 <= next_Start_Address4;
			Start_Address3 <= next_Start_Address3;
			Start_Address2 <= next_Start_Address2;
			Start_Address1 <= next_Start_Address1;
			Start_Address0 <= next_Start_Address0;
		END IF;
	END PROCESS;

	PROCESS (CLK, RESET, next_sreg1, next_Buffer_Read, next_Finished, 
		next_Other_Increment, next_RstCnt2, next_T_Write, next_T_Data7, next_T_Data6,
		 next_T_Data5, next_T_Data4, next_T_Data3, next_T_Data2, next_T_Data1, 
		next_T_Data0)
	BEGIN
		IF ( RESET='1' ) THEN
			sreg1 <= STATE5;
			Buffer_Read <= '0';
			Finished <= '0';
			Other_Increment <= '0';
			T_Write <= '0';
			T_Data7 <= '0';
			T_Data6 <= '0';
			T_Data5 <= '0';
			T_Data4 <= '0';
			T_Data3 <= '0';
			T_Data2 <= '0';
			T_Data1 <= '0';
			T_Data0 <= '0';
			RstCnt2 <= '1';
		ELSIF CLK='1' AND CLK'event THEN
			sreg1 <= next_sreg1;
			Buffer_Read <= next_Buffer_Read;
			Finished <= next_Finished;
			Other_Increment <= next_Other_Increment;
			RstCnt2 <= next_RstCnt2;
			T_Write <= next_T_Write;
			T_Data7 <= next_T_Data7;
			T_Data6 <= next_T_Data6;
			T_Data5 <= next_T_Data5;
			T_Data4 <= next_T_Data4;
			T_Data3 <= next_T_Data3;
			T_Data2 <= next_T_Data2;
			T_Data1 <= next_T_Data1;
			T_Data0 <= next_T_Data0;
		END IF;
	END PROCESS;

	PROCESS (sreg,sreg1,Counter0,Counter1,Counter2,Counter3,Counter4,Counter5,
		Counter6,Counter7,Data0,Data1,Data2,Data3,Data4,Data5,Data6,Data7,
		Data_Present,Other_Counter0,Other_Counter1,Other_Counter2,Other_Counter3,
		Other_Counter4,Other_Counter5,Other_Counter6,Other_Counter7,Read_Data0,
		Read_Data1,Read_Data2,Read_Data3,Read_Data4,Read_Data5,Read_Data6,Read_Data7,
		Start,T_Buffer_Full,Start_Address,T_Data)
	BEGIN
		next_BantKaydet <= '0'; next_Buffer_Read <= '0'; next_Data_Read <= '0'; 
			next_Finished <= '0'; next_FrekansKaydet <= '0'; next_Increment <= '0'; 
			next_MainBantKaydet <= '0'; next_Other_Increment <= '0'; next_PRBSFreKaydet 
			<= '0'; next_ResetCount <= '0'; next_RstCnt2 <= '0'; next_SFrekansKaydet <= 
			'0'; next_SStepKaydet <= '0'; next_Start <= '0'; next_Start_Address0 <= '0'; 
			next_Start_Address1 <= '0'; next_Start_Address2 <= '0'; next_Start_Address3 
			<= '0'; next_Start_Address4 <= '0'; next_StepKaydet <= '0'; next_T_Data0 <= 
			'0'; next_T_Data1 <= '0'; next_T_Data2 <= '0'; next_T_Data3 <= '0'; 
			next_T_Data4 <= '0'; next_T_Data5 <= '0'; next_T_Data6 <= '0'; next_T_Data7 
			<= '0'; next_T_Write <= '0'; 
		Start_Address<=std_logic_vector'("00000"); T_Data<=std_logic_vector'(
			"00000000"); 

		next_sreg<=BantSecimi;
		next_sreg1<=STATE5;

		CASE sreg IS
			WHEN BantSecimi =>
				IF ( Data_Present='1' ) THEN
					next_sreg<=STATE2;
					next_StepKaydet<='0';
					next_Start<='0';
					next_SStepKaydet<='0';
					next_SFrekansKaydet<='0';
					next_ResetCount<='0';
					next_PRBSFreKaydet<='0';
					next_MainBantKaydet<='0';
					next_Increment<='0';
					next_FrekansKaydet<='0';
					next_BantKaydet<='0';
					next_Data_Read<='1';

					Start_Address <= (std_logic_vector'("00000"));
				 ELSE
					next_sreg<=BantSecimi;
					next_StepKaydet<='0';
					next_Start<='0';
					next_SStepKaydet<='0';
					next_SFrekansKaydet<='0';
					next_ResetCount<='0';
					next_PRBSFreKaydet<='0';
					next_Increment<='0';
					next_FrekansKaydet<='0';
					next_Data_Read<='0';
					next_BantKaydet<='0';
					next_MainBantKaydet<='1';

					Start_Address <= (std_logic_vector'("01010"));
				END IF;
			WHEN FrekansBandi =>
				IF ( Counter7='1' AND Data_Present='0' ) OR ( Counter6='1' AND 
					Data_Present='0' ) OR ( Counter5='1' AND Data_Present='0' ) OR ( Counter4='1'
					 AND Data_Present='0' ) OR ( Counter3='1' AND Data_Present='0' ) OR ( 
					Counter2='0' AND Data_Present='0' ) OR ( Counter1='0' AND Data_Present='0' ) 
					OR ( Counter0='1' AND Data_Present='0' ) THEN
					next_sreg<=FrekansBandi;
					next_StepKaydet<='0';
					next_Start<='0';
					next_SStepKaydet<='0';
					next_SFrekansKaydet<='0';
					next_ResetCount<='0';
					next_PRBSFreKaydet<='0';
					next_MainBantKaydet<='0';
					next_Increment<='0';
					next_FrekansKaydet<='0';
					next_Data_Read<='0';
					next_BantKaydet<='0';

					Start_Address <= (std_logic_vector'("01001"));
				END IF;
				IF ( Data_Present='0' AND Counter0='0' AND Counter1='1' AND Counter2='1' 
					AND Counter3='0' AND Counter4='0' AND Counter5='0' AND Counter6='0' AND 
					Counter7='0' ) THEN
					next_sreg<=STATE2;
					next_StepKaydet<='0';
					next_Start<='0';
					next_SStepKaydet<='0';
					next_SFrekansKaydet<='0';
					next_PRBSFreKaydet<='0';
					next_MainBantKaydet<='0';
					next_Increment<='0';
					next_FrekansKaydet<='0';
					next_Data_Read<='0';
					next_BantKaydet<='0';
					next_ResetCount<='1';

					Start_Address <= (std_logic_vector'("00000"));
				END IF;
				IF ( Data_Present='1' ) THEN
					next_sreg<=FrekansBandi;
					next_StepKaydet<='0';
					next_Start<='0';
					next_SStepKaydet<='0';
					next_SFrekansKaydet<='0';
					next_ResetCount<='0';
					next_PRBSFreKaydet<='0';
					next_MainBantKaydet<='0';
					next_FrekansKaydet<='0';
					next_Data_Read<='1';
					next_BantKaydet<='1';
					next_Increment<='1';

					Start_Address <= (std_logic_vector'("01001"));
				END IF;
			WHEN MainMenu =>
				IF ( Data2='0' AND Data0='0' AND Data1='0' ) OR ( Data0='1' AND Data2='1'
					 ) OR ( Data1='1' AND Data2='1' ) OR ( Data3='1' ) OR ( Data4='0' ) OR ( 
					Data5='0' ) OR ( Data6='1' ) OR ( Data7='1' ) OR ( Data_Present='0' ) THEN
					next_sreg<=MainMenu;
					next_StepKaydet<='0';
					next_Start<='0';
					next_SStepKaydet<='0';
					next_SFrekansKaydet<='0';
					next_PRBSFreKaydet<='0';
					next_MainBantKaydet<='0';
					next_Increment<='0';
					next_FrekansKaydet<='0';
					next_Data_Read<='0';
					next_BantKaydet<='0';
					next_ResetCount<='1';

					Start_Address <= (std_logic_vector'("00000"));
				END IF;
				IF ( Data0='0' AND Data1='0' AND Data2='1' AND Data3='0' AND Data4='1' 
					AND Data5='1' AND Data6='0' AND Data7='0' AND Data_Present='1' ) THEN
					next_sreg<=BantSecimi;
					next_StepKaydet<='0';
					next_SStepKaydet<='0';
					next_SFrekansKaydet<='0';
					next_ResetCount<='0';
					next_PRBSFreKaydet<='0';
					next_Increment<='0';
					next_FrekansKaydet<='0';
					next_BantKaydet<='0';
					next_Data_Read<='1';
					next_Start<='1';
					next_MainBantKaydet<='1';

					Start_Address <= (std_logic_vector'("01010"));
				END IF;
				IF ( Data0='1' AND Data1='0' AND Data2='0' AND Data3='0' AND Data4='1' 
					AND Data5='1' AND Data6='0' AND Data7='0' AND Data_Present='1' ) THEN
					next_sreg<=StandardMain;
					next_StepKaydet<='0';
					next_SStepKaydet<='0';
					next_SFrekansKaydet<='0';
					next_ResetCount<='0';
					next_PRBSFreKaydet<='0';
					next_MainBantKaydet<='0';
					next_Increment<='0';
					next_FrekansKaydet<='0';
					next_BantKaydet<='0';
					next_Data_Read<='1';
					next_Start<='1';

					Start_Address <= (std_logic_vector'("00001"));
				END IF;
				IF ( Data0='0' AND Data1='1' AND Data2='0' AND Data3='0' AND Data4='1' 
					AND Data5='1' AND Data6='0' AND Data7='0' AND Data_Present='1' ) THEN
					next_sreg<=RastgeleMain;
					next_StepKaydet<='0';
					next_SStepKaydet<='0';
					next_SFrekansKaydet<='0';
					next_ResetCount<='0';
					next_PRBSFreKaydet<='0';
					next_MainBantKaydet<='0';
					next_Increment<='0';
					next_FrekansKaydet<='0';
					next_BantKaydet<='0';
					next_Data_Read<='1';
					next_Start<='1';

					Start_Address <= (std_logic_vector'("00100"));
				END IF;
				IF ( Data0='1' AND Data1='1' AND Data2='0' AND Data3='0' AND Data4='1' 
					AND Data5='1' AND Data6='0' AND Data7='0' AND Data_Present='1' ) THEN
					next_sreg<=PRBS;
					next_StepKaydet<='0';
					next_SStepKaydet<='0';
					next_SFrekansKaydet<='0';
					next_ResetCount<='0';
					next_PRBSFreKaydet<='0';
					next_MainBantKaydet<='0';
					next_Increment<='0';
					next_FrekansKaydet<='0';
					next_BantKaydet<='0';
					next_Data_Read<='1';
					next_Start<='1';

					Start_Address <= (std_logic_vector'("00111"));
				END IF;
			WHEN PRBS =>
				IF ( Data_Present='0' ) THEN
					next_sreg<=PRBS;
					next_StepKaydet<='0';
					next_Start<='0';
					next_SStepKaydet<='0';
					next_SFrekansKaydet<='0';
					next_ResetCount<='0';
					next_PRBSFreKaydet<='0';
					next_MainBantKaydet<='0';
					next_Increment<='0';
					next_FrekansKaydet<='0';
					next_Data_Read<='0';
					next_BantKaydet<='0';

					Start_Address <= (std_logic_vector'("00111"));
				END IF;
				IF ( Data0='1' AND Data1='0' AND Data2='0' AND Data3='0' AND Data4='1' 
					AND Data5='1' AND Data6='0' AND Data7='0' AND Data_Present='1' ) THEN
					next_sreg<=PRBSFrekans;
					next_StepKaydet<='0';
					next_SStepKaydet<='0';
					next_SFrekansKaydet<='0';
					next_ResetCount<='0';
					next_PRBSFreKaydet<='0';
					next_MainBantKaydet<='0';
					next_Increment<='0';
					next_FrekansKaydet<='0';
					next_BantKaydet<='0';
					next_Data_Read<='1';
					next_Start<='1';

					Start_Address <= (std_logic_vector'("01000"));
				END IF;
				IF ( Data0='0' AND Data1='1' AND Data2='0' AND Data3='0' AND Data4='1' 
					AND Data5='1' AND Data6='0' AND Data7='0' AND Data_Present='1' ) THEN
					next_sreg<=STATE0;
					next_StepKaydet<='0';
					next_SStepKaydet<='0';
					next_SFrekansKaydet<='0';
					next_ResetCount<='0';
					next_PRBSFreKaydet<='0';
					next_MainBantKaydet<='0';
					next_Increment<='0';
					next_FrekansKaydet<='0';
					next_BantKaydet<='0';
					next_Data_Read<='1';
					next_Start<='1';

					Start_Address <= (std_logic_vector'("00000"));
				END IF;
				IF ( Data1='0' AND Data0='0' AND Data_Present='1' ) OR ( Data0='1' AND 
					Data1='1' AND Data_Present='1' ) OR ( Data2='1' AND Data_Present='1' ) OR ( 
					Data3='1' AND Data_Present='1' ) OR ( Data4='0' AND Data_Present='1' ) OR ( 
					Data5='0' AND Data_Present='1' ) OR ( Data6='1' AND Data_Present='1' ) OR ( 
					Data7='1' AND Data_Present='1' ) THEN
					next_sreg<=PRBS;
					next_StepKaydet<='0';
					next_Start<='0';
					next_SStepKaydet<='0';
					next_SFrekansKaydet<='0';
					next_ResetCount<='0';
					next_PRBSFreKaydet<='0';
					next_MainBantKaydet<='0';
					next_Increment<='0';
					next_FrekansKaydet<='0';
					next_BantKaydet<='0';
					next_Data_Read<='1';

					Start_Address <= (std_logic_vector'("00111"));
				END IF;
			WHEN PRBSFrekans =>
				IF ( Counter7='1' AND Data_Present='0' ) OR ( Counter6='1' AND 
					Data_Present='0' ) OR ( Counter5='1' AND Data_Present='0' ) OR ( Counter4='1'
					 AND Data_Present='0' ) OR ( Counter3='1' AND Data_Present='0' ) OR ( 
					Counter2='0' AND Data_Present='0' ) OR ( Counter1='0' AND Data_Present='0' ) 
					OR ( Counter0='1' AND Data_Present='0' ) THEN
					next_sreg<=PRBSFrekans;
					next_StepKaydet<='0';
					next_Start<='0';
					next_SStepKaydet<='0';
					next_SFrekansKaydet<='0';
					next_ResetCount<='0';
					next_PRBSFreKaydet<='0';
					next_MainBantKaydet<='0';
					next_Increment<='0';
					next_FrekansKaydet<='0';
					next_Data_Read<='0';
					next_BantKaydet<='0';

					Start_Address <= (std_logic_vector'("01000"));
				END IF;
				IF ( Data_Present='0' AND Counter0='0' AND Counter1='1' AND Counter2='1' 
					AND Counter3='0' AND Counter4='0' AND Counter5='0' AND Counter6='0' AND 
					Counter7='0' ) THEN
					next_sreg<=STATE0;
					next_StepKaydet<='0';
					next_SStepKaydet<='0';
					next_SFrekansKaydet<='0';
					next_PRBSFreKaydet<='0';
					next_MainBantKaydet<='0';
					next_Increment<='0';
					next_FrekansKaydet<='0';
					next_Data_Read<='0';
					next_BantKaydet<='0';
					next_ResetCount<='1';
					next_Start<='1';

					Start_Address <= (std_logic_vector'("00000"));
				END IF;
				IF ( Data_Present='1' ) THEN
					next_sreg<=PRBSFrekans;
					next_StepKaydet<='0';
					next_Start<='0';
					next_SStepKaydet<='0';
					next_SFrekansKaydet<='0';
					next_ResetCount<='0';
					next_MainBantKaydet<='0';
					next_FrekansKaydet<='0';
					next_BantKaydet<='0';
					next_Increment<='1';
					next_Data_Read<='1';
					next_PRBSFreKaydet<='1';

					Start_Address <= (std_logic_vector'("01000"));
				END IF;
			WHEN RastFrekans =>
				IF ( Data_Present='0' AND Counter0='1' ) OR ( Data_Present='0' AND 
					Counter1='1' ) OR ( Data_Present='0' AND Counter2='1' ) OR ( Data_Present='0'
					 AND Counter3='0' ) OR ( Data_Present='0' AND Counter4='0' ) OR ( 
					Data_Present='0' AND Counter5='1' ) OR ( Data_Present='0' AND Counter6='1' ) 
					OR ( Data_Present='0' AND Counter7='1' ) THEN
					next_sreg<=RastFrekans;
					next_StepKaydet<='0';
					next_Start<='0';
					next_SStepKaydet<='0';
					next_SFrekansKaydet<='0';
					next_ResetCount<='0';
					next_PRBSFreKaydet<='0';
					next_MainBantKaydet<='0';
					next_Increment<='0';
					next_FrekansKaydet<='0';
					next_Data_Read<='0';
					next_BantKaydet<='0';

					Start_Address <= (std_logic_vector'("00101"));
				END IF;
				IF ( Data_Present='1' ) THEN
					next_sreg<=RastFrekans;
					next_StepKaydet<='0';
					next_Start<='0';
					next_SStepKaydet<='0';
					next_SFrekansKaydet<='0';
					next_ResetCount<='0';
					next_PRBSFreKaydet<='0';
					next_MainBantKaydet<='0';
					next_BantKaydet<='0';
					next_Increment<='1';
					next_Data_Read<='1';
					next_FrekansKaydet<='1';

					Start_Address <= (std_logic_vector'("00101"));
				END IF;
				IF ( Data_Present='0' AND Counter0='0' AND Counter1='0' AND Counter2='0' 
					AND Counter3='1' AND Counter4='1' AND Counter5='0' AND Counter6='0' AND 
					Counter7='0' ) THEN
					next_sreg<=RastStep;
					next_StepKaydet<='0';
					next_SStepKaydet<='0';
					next_SFrekansKaydet<='0';
					next_PRBSFreKaydet<='0';
					next_MainBantKaydet<='0';
					next_Increment<='0';
					next_FrekansKaydet<='0';
					next_Data_Read<='0';
					next_BantKaydet<='0';
					next_ResetCount<='1';
					next_Start<='1';

					Start_Address <= (std_logic_vector'("00110"));
				END IF;
			WHEN RastgeleMain =>
				IF ( Data_Present='0' ) THEN
					next_sreg<=RastgeleMain;
					next_StepKaydet<='0';
					next_Start<='0';
					next_SStepKaydet<='0';
					next_SFrekansKaydet<='0';
					next_ResetCount<='0';
					next_PRBSFreKaydet<='0';
					next_MainBantKaydet<='0';
					next_Increment<='0';
					next_FrekansKaydet<='0';
					next_Data_Read<='0';
					next_BantKaydet<='0';

					Start_Address <= (std_logic_vector'("00100"));
				END IF;
				IF ( Data0='0' AND Data1='1' AND Data2='0' AND Data3='0' AND Data4='1' 
					AND Data5='1' AND Data6='0' AND Data7='0' AND Data_Present='1' ) THEN
					next_sreg<=RastStep;
					next_StepKaydet<='0';
					next_SStepKaydet<='0';
					next_SFrekansKaydet<='0';
					next_ResetCount<='0';
					next_PRBSFreKaydet<='0';
					next_MainBantKaydet<='0';
					next_Increment<='0';
					next_FrekansKaydet<='0';
					next_BantKaydet<='0';
					next_Data_Read<='1';
					next_Start<='1';

					Start_Address <= (std_logic_vector'("00110"));
				END IF;
				IF ( Data1='0' AND Data0='0' AND Data_Present='1' ) OR ( Data0='1' AND 
					Data1='1' AND Data_Present='1' ) OR ( Data2='1' AND Data_Present='1' ) OR ( 
					Data3='1' AND Data_Present='1' ) OR ( Data4='0' AND Data_Present='1' ) OR ( 
					Data5='0' AND Data_Present='1' ) OR ( Data6='1' AND Data_Present='1' ) OR ( 
					Data7='1' AND Data_Present='1' ) THEN
					next_sreg<=RastgeleMain;
					next_StepKaydet<='0';
					next_Start<='0';
					next_SStepKaydet<='0';
					next_SFrekansKaydet<='0';
					next_ResetCount<='0';
					next_PRBSFreKaydet<='0';
					next_MainBantKaydet<='0';
					next_Increment<='0';
					next_FrekansKaydet<='0';
					next_BantKaydet<='0';
					next_Data_Read<='1';

					Start_Address <= (std_logic_vector'("00100"));
				END IF;
				IF ( Data0='1' AND Data1='0' AND Data2='0' AND Data3='0' AND Data4='1' 
					AND Data5='1' AND Data6='0' AND Data7='0' AND Data_Present='1' ) THEN
					next_sreg<=RastFrekans;
					next_StepKaydet<='0';
					next_SStepKaydet<='0';
					next_SFrekansKaydet<='0';
					next_ResetCount<='0';
					next_PRBSFreKaydet<='0';
					next_MainBantKaydet<='0';
					next_Increment<='0';
					next_FrekansKaydet<='0';
					next_BantKaydet<='0';
					next_Data_Read<='1';
					next_Start<='1';

					Start_Address <= (std_logic_vector'("00101"));
				END IF;
			WHEN RastStep =>
				IF ( Data_Present='0' AND Counter0='1' ) OR ( Data_Present='0' AND 
					Counter1='0' ) OR ( Data_Present='0' AND Counter2='1' ) OR ( Data_Present='0'
					 AND Counter3='1' ) OR ( Data_Present='0' AND Counter4='1' ) OR ( 
					Data_Present='0' AND Counter5='1' ) OR ( Data_Present='0' AND Counter6='1' ) 
					OR ( Data_Present='0' AND Counter7='1' ) THEN
					next_sreg<=RastStep;
					next_StepKaydet<='0';
					next_Start<='0';
					next_SStepKaydet<='0';
					next_SFrekansKaydet<='0';
					next_ResetCount<='0';
					next_PRBSFreKaydet<='0';
					next_MainBantKaydet<='0';
					next_Increment<='0';
					next_FrekansKaydet<='0';
					next_Data_Read<='0';
					next_BantKaydet<='0';

					Start_Address <= (std_logic_vector'("00110"));
				END IF;
				IF ( Data_Present='1' ) THEN
					next_sreg<=RastStep;
					next_Start<='0';
					next_SStepKaydet<='0';
					next_SFrekansKaydet<='0';
					next_ResetCount<='0';
					next_PRBSFreKaydet<='0';
					next_MainBantKaydet<='0';
					next_FrekansKaydet<='0';
					next_BantKaydet<='0';
					next_Data_Read<='1';
					next_StepKaydet<='1';
					next_Increment<='1';

					Start_Address <= (std_logic_vector'("00110"));
				END IF;
				IF ( Data_Present='0' AND Counter0='0' AND Counter1='1' AND Counter2='0' 
					AND Counter3='0' AND Counter4='0' AND Counter5='0' AND Counter6='0' AND 
					Counter7='0' ) THEN
					next_sreg<=STATE2;
					next_StepKaydet<='0';
					next_Start<='0';
					next_SStepKaydet<='0';
					next_SFrekansKaydet<='0';
					next_PRBSFreKaydet<='0';
					next_MainBantKaydet<='0';
					next_Increment<='0';
					next_FrekansKaydet<='0';
					next_Data_Read<='0';
					next_BantKaydet<='0';
					next_ResetCount<='1';

					Start_Address <= (std_logic_vector'("00000"));
				END IF;
			WHEN StandardFrekans =>
				IF ( Counter7='1' AND Data_Present='0' ) OR ( Counter6='1' AND 
					Data_Present='0' ) OR ( Counter5='1' AND Data_Present='0' ) OR ( Counter4='0'
					 AND Data_Present='0' ) OR ( Counter3='0' AND Data_Present='0' ) OR ( 
					Counter2='1' AND Data_Present='0' ) OR ( Counter1='1' AND Data_Present='0' ) 
					OR ( Counter0='1' AND Data_Present='0' ) THEN
					next_sreg<=StandardFrekans;
					next_StepKaydet<='0';
					next_Start<='0';
					next_SStepKaydet<='0';
					next_SFrekansKaydet<='0';
					next_ResetCount<='0';
					next_PRBSFreKaydet<='0';
					next_MainBantKaydet<='0';
					next_Increment<='0';
					next_FrekansKaydet<='0';
					next_Data_Read<='0';
					next_BantKaydet<='0';

					Start_Address <= (std_logic_vector'("00010"));
				END IF;
				IF ( Data_Present='0' AND Counter0='0' AND Counter1='0' AND Counter2='0' 
					AND Counter3='1' AND Counter4='1' AND Counter5='0' AND Counter6='0' AND 
					Counter7='0' ) THEN
					next_sreg<=StandardStep;
					next_StepKaydet<='0';
					next_SStepKaydet<='0';
					next_SFrekansKaydet<='0';
					next_PRBSFreKaydet<='0';
					next_MainBantKaydet<='0';
					next_Increment<='0';
					next_FrekansKaydet<='0';
					next_Data_Read<='0';
					next_BantKaydet<='0';
					next_ResetCount<='1';
					next_Start<='1';

					Start_Address <= (std_logic_vector'("00011"));
				END IF;
				IF ( Data_Present='1' ) THEN
					next_sreg<=StandardFrekans;
					next_StepKaydet<='0';
					next_Start<='0';
					next_SStepKaydet<='0';
					next_ResetCount<='0';
					next_PRBSFreKaydet<='0';
					next_MainBantKaydet<='0';
					next_FrekansKaydet<='0';
					next_BantKaydet<='0';
					next_Increment<='1';
					next_Data_Read<='1';
					next_SFrekansKaydet<='1';

					Start_Address <= (std_logic_vector'("00010"));
				END IF;
			WHEN StandardMain =>
				IF ( Data_Present='0' ) THEN
					next_sreg<=StandardMain;
					next_StepKaydet<='0';
					next_Start<='0';
					next_SStepKaydet<='0';
					next_SFrekansKaydet<='0';
					next_ResetCount<='0';
					next_PRBSFreKaydet<='0';
					next_MainBantKaydet<='0';
					next_Increment<='0';
					next_FrekansKaydet<='0';
					next_Data_Read<='0';
					next_BantKaydet<='0';

					Start_Address <= (std_logic_vector'("00001"));
				END IF;
				IF ( Data0='1' AND Data1='0' AND Data2='0' AND Data3='0' AND Data4='1' 
					AND Data5='1' AND Data6='0' AND Data7='0' AND Data_Present='1' ) THEN
					next_sreg<=StandardFrekans;
					next_StepKaydet<='0';
					next_SStepKaydet<='0';
					next_SFrekansKaydet<='0';
					next_ResetCount<='0';
					next_PRBSFreKaydet<='0';
					next_MainBantKaydet<='0';
					next_Increment<='0';
					next_FrekansKaydet<='0';
					next_BantKaydet<='0';
					next_Data_Read<='1';
					next_Start<='1';

					Start_Address <= (std_logic_vector'("00010"));
				END IF;
				IF ( Data1='0' AND Data0='0' AND Data_Present='1' ) OR ( Data0='1' AND 
					Data1='1' AND Data_Present='1' ) OR ( Data2='1' AND Data_Present='1' ) OR ( 
					Data3='1' AND Data_Present='1' ) OR ( Data4='0' AND Data_Present='1' ) OR ( 
					Data5='0' AND Data_Present='1' ) OR ( Data6='1' AND Data_Present='1' ) OR ( 
					Data7='1' AND Data_Present='1' ) THEN
					next_sreg<=StandardMain;
					next_StepKaydet<='0';
					next_Start<='0';
					next_SStepKaydet<='0';
					next_SFrekansKaydet<='0';
					next_ResetCount<='0';
					next_PRBSFreKaydet<='0';
					next_MainBantKaydet<='0';
					next_Increment<='0';
					next_FrekansKaydet<='0';
					next_BantKaydet<='0';
					next_Data_Read<='1';

					Start_Address <= (std_logic_vector'("00001"));
				END IF;
				IF ( Data0='0' AND Data1='1' AND Data2='0' AND Data3='0' AND Data4='1' 
					AND Data5='1' AND Data6='0' AND Data7='0' AND Data_Present='1' ) THEN
					next_sreg<=StandardStep;
					next_StepKaydet<='0';
					next_SStepKaydet<='0';
					next_SFrekansKaydet<='0';
					next_ResetCount<='0';
					next_PRBSFreKaydet<='0';
					next_MainBantKaydet<='0';
					next_Increment<='0';
					next_FrekansKaydet<='0';
					next_BantKaydet<='0';
					next_Data_Read<='1';
					next_Start<='1';

					Start_Address <= (std_logic_vector'("00011"));
				END IF;
			WHEN StandardStep =>
				IF ( Counter7='1' AND Data_Present='0' ) OR ( Counter6='1' AND 
					Data_Present='0' ) OR ( Counter5='1' AND Data_Present='0' ) OR ( Counter4='1'
					 AND Data_Present='0' ) OR ( Counter3='1' AND Data_Present='0' ) OR ( 
					Counter2='0' AND Data_Present='0' ) OR ( Counter1='0' AND Data_Present='0' ) 
					OR ( Counter0='1' AND Data_Present='0' ) THEN
					next_sreg<=StandardStep;
					next_StepKaydet<='0';
					next_Start<='0';
					next_SStepKaydet<='0';
					next_SFrekansKaydet<='0';
					next_ResetCount<='0';
					next_PRBSFreKaydet<='0';
					next_MainBantKaydet<='0';
					next_Increment<='0';
					next_FrekansKaydet<='0';
					next_Data_Read<='0';
					next_BantKaydet<='0';

					Start_Address <= (std_logic_vector'("00011"));
				END IF;
				IF ( Data_Present='0' AND Counter0='0' AND Counter1='1' AND Counter2='1' 
					AND Counter3='0' AND Counter4='0' AND Counter5='0' AND Counter6='0' AND 
					Counter7='0' ) THEN
					next_sreg<=STATE2;
					next_StepKaydet<='0';
					next_Start<='0';
					next_SStepKaydet<='0';
					next_SFrekansKaydet<='0';
					next_PRBSFreKaydet<='0';
					next_MainBantKaydet<='0';
					next_Increment<='0';
					next_FrekansKaydet<='0';
					next_Data_Read<='0';
					next_BantKaydet<='0';
					next_ResetCount<='1';

					Start_Address <= (std_logic_vector'("00000"));
				END IF;
				IF ( Data_Present='1' ) THEN
					next_sreg<=StandardStep;
					next_StepKaydet<='0';
					next_Start<='0';
					next_SFrekansKaydet<='0';
					next_ResetCount<='0';
					next_PRBSFreKaydet<='0';
					next_MainBantKaydet<='0';
					next_FrekansKaydet<='0';
					next_BantKaydet<='0';
					next_Data_Read<='1';
					next_SStepKaydet<='1';
					next_Increment<='1';

					Start_Address <= (std_logic_vector'("00011"));
				END IF;
			WHEN STATE0 =>
				next_sreg<=FrekansBandi;
				next_StepKaydet<='0';
				next_Start<='0';
				next_SStepKaydet<='0';
				next_SFrekansKaydet<='0';
				next_ResetCount<='0';
				next_PRBSFreKaydet<='0';
				next_MainBantKaydet<='0';
				next_Increment<='0';
				next_FrekansKaydet<='0';
				next_Data_Read<='0';
				next_BantKaydet<='0';

				Start_Address <= (std_logic_vector'("01001"));
			WHEN STATE2 =>
				next_sreg<=MainMenu;
				next_StepKaydet<='0';
				next_SStepKaydet<='0';
				next_SFrekansKaydet<='0';
				next_PRBSFreKaydet<='0';
				next_MainBantKaydet<='0';
				next_Increment<='0';
				next_FrekansKaydet<='0';
				next_Data_Read<='0';
				next_BantKaydet<='0';
				next_Start<='1';
				next_ResetCount<='1';

				Start_Address <= (std_logic_vector'("00000"));
			WHEN OTHERS =>
		END CASE;

		CASE sreg1 IS
			WHEN STATE5 =>
				IF ( Start='1' ) THEN
					next_sreg1<=STATE7;
					next_T_Write<='0';
					next_RstCnt2<='0';
					next_Other_Increment<='0';
					next_Finished<='0';
					next_Buffer_Read<='0';

					T_Data <= (std_logic_vector'("00000000"));
				 ELSE
					next_sreg1<=STATE5;
					next_T_Write<='0';
					next_Other_Increment<='0';
					next_Finished<='0';
					next_Buffer_Read<='0';
					next_RstCnt2<='1';

					T_Data <= (std_logic_vector'("00000000"));
				END IF;
			WHEN STATE6 =>
				IF ( T_Buffer_Full='0' ) THEN
					next_sreg1<=STATE9;
					next_RstCnt2<='0';
					next_Finished<='0';
					next_Buffer_Read<='0';
					next_Other_Increment<='1';
					next_T_Write<='1';

					T_Data <= (( std_logic_vector'(Read_Data7, Read_Data6, Read_Data5, 
						Read_Data4, Read_Data3, Read_Data2, Read_Data1, Read_Data0)));
				 ELSE
					next_sreg1<=STATE6;
					next_T_Write<='0';
					next_RstCnt2<='0';
					next_Other_Increment<='0';
					next_Finished<='0';
					next_Buffer_Read<='0';

					T_Data <= (std_logic_vector'("00000000"));
				END IF;
			WHEN STATE7 =>
				next_sreg1<=STATE8;
				next_T_Write<='0';
				next_RstCnt2<='0';
				next_Other_Increment<='0';
				next_Finished<='0';
				next_Buffer_Read<='1';

				T_Data <= (std_logic_vector'("00000000"));
			WHEN STATE8 =>
				next_sreg1<=STATE6;
				next_T_Write<='0';
				next_RstCnt2<='0';
				next_Other_Increment<='0';
				next_Finished<='0';
				next_Buffer_Read<='0';

				T_Data <= (std_logic_vector'("00000000"));
			WHEN STATE9 =>
				IF ( Other_Counter0='1' AND Other_Counter1='1' AND Other_Counter2='1' AND
					 Other_Counter3='1' AND Other_Counter4='1' AND Other_Counter5='1' AND 
					Other_Counter6='1' AND Other_Counter7='1' ) THEN
					next_sreg1<=STATE5;
					next_T_Write<='0';
					next_Other_Increment<='0';
					next_Buffer_Read<='0';
					next_Finished<='1';
					next_RstCnt2<='1';

					T_Data <= (std_logic_vector'("00000000"));
				 ELSE
					next_sreg1<=STATE7;
					next_T_Write<='0';
					next_RstCnt2<='0';
					next_Other_Increment<='0';
					next_Finished<='0';
					next_Buffer_Read<='0';

					T_Data <= (std_logic_vector'("00000000"));
				END IF;
			WHEN OTHERS =>
		END CASE;

		next_Start_Address4 <= Start_Address(4);
		next_Start_Address3 <= Start_Address(3);
		next_Start_Address2 <= Start_Address(2);
		next_Start_Address1 <= Start_Address(1);
		next_Start_Address0 <= Start_Address(0);
		next_T_Data7 <= T_Data(7);
		next_T_Data6 <= T_Data(6);
		next_T_Data5 <= T_Data(5);
		next_T_Data4 <= T_Data(4);
		next_T_Data3 <= T_Data(3);
		next_T_Data2 <= T_Data(2);
		next_T_Data1 <= T_Data(1);
		next_T_Data0 <= T_Data(0);
	END PROCESS;

	PROCESS (Counter0,Counter1,Counter2,Counter3,Counter4,Counter5,Counter6,
		Counter7,Increment,ResetCount,Counter)
	BEGIN
		Counter <= ( ( ( (( std_logic_vector'(Counter7, Counter6, Counter5, 
			Counter4, Counter3, Counter2, Counter1, Counter0)) +std_logic_vector'(
			"00000001") ) AND (  std_logic_vector'( Increment, Increment, Increment, 
			Increment, Increment, Increment, Increment, Increment)) ) OR  (( 
			std_logic_vector'(Counter7, Counter6, Counter5, Counter4, Counter3, Counter2,
			 Counter1, Counter0)) AND (  std_logic_vector'( NOT Increment, NOT Increment,
			 NOT Increment, NOT Increment, NOT Increment, NOT Increment, NOT Increment, 
			NOT Increment)) ) ) AND (  std_logic_vector'( NOT ResetCount, NOT ResetCount,
			 NOT ResetCount, NOT ResetCount, NOT ResetCount, NOT ResetCount, NOT 
			ResetCount, NOT ResetCount)));
		next_Counter0 <= Counter(0);
		next_Counter1 <= Counter(1);
		next_Counter2 <= Counter(2);
		next_Counter3 <= Counter(3);
		next_Counter4 <= Counter(4);
		next_Counter5 <= Counter(5);
		next_Counter6 <= Counter(6);
		next_Counter7 <= Counter(7);
	END PROCESS;

	PROCESS (Other_Counter0,Other_Counter1,Other_Counter2,Other_Counter3,
		Other_Counter4,Other_Counter5,Other_Counter6,Other_Counter7,Other_Increment,
		RstCnt2,Other_Counter)
	BEGIN
		Other_Counter <= ( ( ( (( std_logic_vector'(Other_Counter7, Other_Counter6,
			 Other_Counter5, Other_Counter4, Other_Counter3, Other_Counter2, 
			Other_Counter1, Other_Counter0)) +std_logic_vector'("00000001") ) AND (  
			std_logic_vector'( Other_Increment, Other_Increment, Other_Increment, 
			Other_Increment, Other_Increment, Other_Increment, Other_Increment, 
			Other_Increment)) ) OR  (( std_logic_vector'(Other_Counter7, Other_Counter6, 
			Other_Counter5, Other_Counter4, Other_Counter3, Other_Counter2, 
			Other_Counter1, Other_Counter0)) AND (  std_logic_vector'( NOT 
			Other_Increment, NOT Other_Increment, NOT Other_Increment, NOT 
			Other_Increment, NOT Other_Increment, NOT Other_Increment, NOT 
			Other_Increment, NOT Other_Increment)) ) ) AND (  std_logic_vector'( NOT 
			RstCnt2, NOT RstCnt2, NOT RstCnt2, NOT RstCnt2, NOT RstCnt2, NOT RstCnt2, NOT
			 RstCnt2, NOT RstCnt2)));
		next_Other_Counter0 <= Other_Counter(0);
		next_Other_Counter1 <= Other_Counter(1);
		next_Other_Counter2 <= Other_Counter(2);
		next_Other_Counter3 <= Other_Counter(3);
		next_Other_Counter4 <= Other_Counter(4);
		next_Other_Counter5 <= Other_Counter(5);
		next_Other_Counter6 <= Other_Counter(6);
		next_Other_Counter7 <= Other_Counter(7);
	END PROCESS;

	PROCESS (Other_Counter0,Other_Counter1,Other_Counter2,Other_Counter3,
		Other_Counter4,Other_Counter5,Other_Counter6,Other_Counter7,Menu_Addres)
	BEGIN
		Menu_Addres <= (( std_logic_vector'(Other_Counter7, Other_Counter6, 
			Other_Counter5, Other_Counter4, Other_Counter3, Other_Counter2, 
			Other_Counter1, Other_Counter0)));
		Menu_Addres0 <= Menu_Addres(0);
		Menu_Addres1 <= Menu_Addres(1);
		Menu_Addres2 <= Menu_Addres(2);
		Menu_Addres3 <= Menu_Addres(3);
		Menu_Addres4 <= Menu_Addres(4);
		Menu_Addres5 <= Menu_Addres(5);
		Menu_Addres6 <= Menu_Addres(6);
		Menu_Addres7 <= Menu_Addres(7);
	END PROCESS;
END BEHAVIOR;

LIBRARY ieee;
USE ieee.std_logic_1164.all;

LIBRARY ieee;
USE ieee.std_logic_unsigned.all;

ENTITY DIAGRAM1 IS
	PORT (Buffer_Data : IN std_logic_vector (7 DOWNTO 0);
		Data : IN std_logic_vector (7 DOWNTO 0);
		Menu_Addres : OUT std_logic_vector (7 DOWNTO 0);
		Rast_Step : IN std_logic_vector (1 DOWNTO 0);
		Read_Data : IN std_logic_vector (7 DOWNTO 0);
		Start_Address : OUT std_logic_vector (4 DOWNTO 0);
		T_Data : OUT std_logic_vector (7 DOWNTO 0);
		CLK,Buffer_Write,Data_Present,RESET,T_Buffer_Full: IN std_logic;
		BantKaydet,Buffer_Read,Data_Read,FrekansKaydet,MainBantKaydet,PRBSFreKaydet
			,SFrekansKaydet,SStepKaydet,StepKaydet,T_Write : OUT std_logic);
END;

ARCHITECTURE BEHAVIOR OF DIAGRAM1 IS
	COMPONENT SHELL_DIAGRAM1
		PORT (CLK,Buffer_Data0,Buffer_Data1,Buffer_Data2,Buffer_Data3,Buffer_Data4,
			Buffer_Data5,Buffer_Data6,Buffer_Data7,Buffer_Write,Data0,Data1,Data2,Data3,
			Data4,Data5,Data6,Data7,Data_Present,Rast_Step0,Rast_Step1,Read_Data0,
			Read_Data1,Read_Data2,Read_Data3,Read_Data4,Read_Data5,Read_Data6,Read_Data7,
			RESET,T_Buffer_Full: IN std_logic;
			BantKaydet,Buffer_Read,Data_Read,FrekansKaydet,MainBantKaydet,Menu_Addres0
				,Menu_Addres1,Menu_Addres2,Menu_Addres3,Menu_Addres4,Menu_Addres5,
				Menu_Addres6,Menu_Addres7,PRBSFreKaydet,SFrekansKaydet,SStepKaydet,
				Start_Address0,Start_Address1,Start_Address2,Start_Address3,Start_Address4,
				StepKaydet,T_Data0,T_Data1,T_Data2,T_Data3,T_Data4,T_Data5,T_Data6,T_Data7,
				T_Write : OUT std_logic);
	END COMPONENT;
BEGIN
	SHELL1_DIAGRAM1 : SHELL_DIAGRAM1 PORT MAP (CLK=>CLK,Buffer_Data0=>
		Buffer_Data(0),Buffer_Data1=>Buffer_Data(1),Buffer_Data2=>Buffer_Data(2),
		Buffer_Data3=>Buffer_Data(3),Buffer_Data4=>Buffer_Data(4),Buffer_Data5=>
		Buffer_Data(5),Buffer_Data6=>Buffer_Data(6),Buffer_Data7=>Buffer_Data(7),
		Buffer_Write=>Buffer_Write,Data0=>Data(0),Data1=>Data(1),Data2=>Data(2),Data3
		=>Data(3),Data4=>Data(4),Data5=>Data(5),Data6=>Data(6),Data7=>Data(7),
		Data_Present=>Data_Present,Rast_Step0=>Rast_Step(0),Rast_Step1=>Rast_Step(1),
		Read_Data0=>Read_Data(0),Read_Data1=>Read_Data(1),Read_Data2=>Read_Data(2),
		Read_Data3=>Read_Data(3),Read_Data4=>Read_Data(4),Read_Data5=>Read_Data(5),
		Read_Data6=>Read_Data(6),Read_Data7=>Read_Data(7),RESET=>RESET,T_Buffer_Full
		=>T_Buffer_Full,BantKaydet=>BantKaydet,Buffer_Read=>Buffer_Read,Data_Read=>
		Data_Read,FrekansKaydet=>FrekansKaydet,MainBantKaydet=>MainBantKaydet,
		Menu_Addres0=>Menu_Addres(0),Menu_Addres1=>Menu_Addres(1),Menu_Addres2=>
		Menu_Addres(2),Menu_Addres3=>Menu_Addres(3),Menu_Addres4=>Menu_Addres(4),
		Menu_Addres5=>Menu_Addres(5),Menu_Addres6=>Menu_Addres(6),Menu_Addres7=>
		Menu_Addres(7),PRBSFreKaydet=>PRBSFreKaydet,SFrekansKaydet=>SFrekansKaydet,
		SStepKaydet=>SStepKaydet,Start_Address0=>Start_Address(0),Start_Address1=>
		Start_Address(1),Start_Address2=>Start_Address(2),Start_Address3=>
		Start_Address(3),Start_Address4=>Start_Address(4),StepKaydet=>StepKaydet,
		T_Data0=>T_Data(0),T_Data1=>T_Data(1),T_Data2=>T_Data(2),T_Data3=>T_Data(3),
		T_Data4=>T_Data(4),T_Data5=>T_Data(5),T_Data6=>T_Data(6),T_Data7=>T_Data(7),
		T_Write=>T_Write);
END BEHAVIOR;
