-- Copyright (C) 2016  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel MegaCore Function License Agreement, or other 
-- applicable license agreement, including, without limitation, 
-- that your use is for the sole purpose of programming logic 
-- devices manufactured by Intel and sold by Intel or its 
-- authorized distributors.  Please refer to the applicable 
-- agreement for further details.

-- PROGRAM		"Quartus Prime"
-- VERSION		"Version 16.1.0 Build 196 10/24/2016 SJ Lite Edition"
-- CREATED		"Mon Apr 10 03:49:38 2017"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY firsHalf IS 
	PORT
	(
		memModOneEnable :  IN  STD_LOGIC;
		memModTwoEnable :  IN  STD_LOGIC;
		clockFirstHalf :  IN  STD_LOGIC;
		uselessLine :  IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
		dcA :  OUT  STD_LOGIC_VECTOR(7 DOWNTO 0);
		dcB :  OUT  STD_LOGIC_VECTOR(7 DOWNTO 0);
		dcC :  OUT  STD_LOGIC_VECTOR(7 DOWNTO 0);
		dcD :  OUT  STD_LOGIC_VECTOR(7 DOWNTO 0);
		dcE :  OUT  STD_LOGIC_VECTOR(7 DOWNTO 0);
		dcF :  OUT  STD_LOGIC_VECTOR(7 DOWNTO 0);
		dcG :  OUT  STD_LOGIC_VECTOR(7 DOWNTO 0);
		dcH :  OUT  STD_LOGIC_VECTOR(7 DOWNTO 0);
		dcI :  OUT  STD_LOGIC_VECTOR(7 DOWNTO 0);
		dcJ :  OUT  STD_LOGIC_VECTOR(7 DOWNTO 0);
		dcK :  OUT  STD_LOGIC_VECTOR(7 DOWNTO 0);
		dcL :  OUT  STD_LOGIC_VECTOR(7 DOWNTO 0);
		dcM :  OUT  STD_LOGIC_VECTOR(7 DOWNTO 0);
		dcN :  OUT  STD_LOGIC_VECTOR(7 DOWNTO 0);
		dcO :  OUT  STD_LOGIC_VECTOR(7 DOWNTO 0);
		dcP :  OUT  STD_LOGIC_VECTOR(7 DOWNTO 0);
		dcQ :  OUT  STD_LOGIC_VECTOR(7 DOWNTO 0);
		dcR :  OUT  STD_LOGIC_VECTOR(7 DOWNTO 0);
		dcS :  OUT  STD_LOGIC_VECTOR(7 DOWNTO 0);
		dcT :  OUT  STD_LOGIC_VECTOR(7 DOWNTO 0);
		dcU :  OUT  STD_LOGIC_VECTOR(7 DOWNTO 0);
		dcV :  OUT  STD_LOGIC_VECTOR(7 DOWNTO 0);
		dcW :  OUT  STD_LOGIC_VECTOR(7 DOWNTO 0);
		dcX :  OUT  STD_LOGIC_VECTOR(7 DOWNTO 0);
		dcY :  OUT  STD_LOGIC_VECTOR(7 DOWNTO 0);
		dcZ :  OUT  STD_LOGIC_VECTOR(7 DOWNTO 0);
		dcza :  OUT  STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END firsHalf;

ARCHITECTURE bdf_type OF firsHalf IS 

COMPONENT memoryblock
GENERIC (fip : BOOLEAN
			);
	PORT(CLOCK : IN STD_LOGIC;
		 RW : IN STD_LOGIC;
		 pixelIn : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 p1 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
		 p2 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
		 p3 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
		 p4 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
		 p5 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
		 p6 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
		 p7 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
		 p8 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
		 p9 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END COMPONENT;

COMPONENT operationone
	PORT(clk : IN STD_LOGIC;
		 A : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 B : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 C : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 D : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 E : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 F : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 G : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 H : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 I : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 IxIy : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
		 Ixs : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
		 Iys : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END COMPONENT;

SIGNAL	SYNTHESIZED_WIRE_0 :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_1 :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_2 :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_3 :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_4 :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_5 :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_6 :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_7 :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_8 :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_9 :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_10 :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_11 :  STD_LOGIC_VECTOR(7 DOWNTO 0);


BEGIN 



b2v_fileInput : memoryblock
GENERIC MAP(fip => true
			)
PORT MAP(CLOCK => clockFirstHalf,
		 RW => memModOneEnable,
		 pixelIn => uselessLine,
		 p1 => SYNTHESIZED_WIRE_3,
		 p2 => SYNTHESIZED_WIRE_4,
		 p3 => SYNTHESIZED_WIRE_5,
		 p4 => SYNTHESIZED_WIRE_6,
		 p5 => SYNTHESIZED_WIRE_7,
		 p6 => SYNTHESIZED_WIRE_8,
		 p7 => SYNTHESIZED_WIRE_9,
		 p8 => SYNTHESIZED_WIRE_10,
		 p9 => SYNTHESIZED_WIRE_11);


b2v_IxIyMem : memoryblock
GENERIC MAP(fip => false
			)
PORT MAP(CLOCK => clockFirstHalf,
		 RW => memModTwoEnable,
		 pixelIn => SYNTHESIZED_WIRE_0,
		 p1 => dcA,
		 p2 => dcB,
		 p3 => dcC,
		 p4 => dcD,
		 p5 => dcE,
		 p6 => dcF,
		 p7 => dcG,
		 p8 => dcH,
		 p9 => dcI);


b2v_IxsMem : memoryblock
GENERIC MAP(fip => false
			)
PORT MAP(CLOCK => clockFirstHalf,
		 RW => memModTwoEnable,
		 pixelIn => SYNTHESIZED_WIRE_1,
		 p1 => dcJ,
		 p2 => dcK,
		 p3 => dcL,
		 p4 => dcM,
		 p5 => dcN,
		 p6 => dcO,
		 p7 => dcP,
		 p8 => dcQ,
		 p9 => dcR);


b2v_IysMem : memoryblock
GENERIC MAP(fip => false
			)
PORT MAP(CLOCK => clockFirstHalf,
		 RW => memModTwoEnable,
		 pixelIn => SYNTHESIZED_WIRE_2,
		 p1 => dcS,
		 p2 => dcT,
		 p3 => dcU,
		 p4 => dcV,
		 p5 => dcW,
		 p6 => dcX,
		 p7 => dcY,
		 p8 => dcZ,
		 p9 => dcza);


b2v_opOne : operationone
PORT MAP(clk => clockFirstHalf,
		 A => SYNTHESIZED_WIRE_3,
		 B => SYNTHESIZED_WIRE_4,
		 C => SYNTHESIZED_WIRE_5,
		 D => SYNTHESIZED_WIRE_6,
		 E => SYNTHESIZED_WIRE_7,
		 F => SYNTHESIZED_WIRE_8,
		 G => SYNTHESIZED_WIRE_9,
		 H => SYNTHESIZED_WIRE_10,
		 I => SYNTHESIZED_WIRE_11,
		 IxIy => SYNTHESIZED_WIRE_0,
		 Ixs => SYNTHESIZED_WIRE_1,
		 Iys => SYNTHESIZED_WIRE_2);


END bdf_type;