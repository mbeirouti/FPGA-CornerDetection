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
-- CREATED		"Mon Apr 10 03:02:01 2017"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY firstHalf IS 
	PORT
	(
		clockOne :  IN  STD_LOGIC;
		enable :  IN  STD_LOGIC
	);
END firstHalf;

ARCHITECTURE bdf_type OF firstHalf IS 

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



b2v_memBlockIn : memoryblock
GENERIC MAP(fip => true
			)
PORT MAP(CLOCK => clockOne,
		 RW => enable,
		 p1 => SYNTHESIZED_WIRE_3,
		 p2 => SYNTHESIZED_WIRE_4,
		 p3 => SYNTHESIZED_WIRE_5,
		 p4 => SYNTHESIZED_WIRE_6,
		 p5 => SYNTHESIZED_WIRE_7,
		 p6 => SYNTHESIZED_WIRE_8,
		 p7 => SYNTHESIZED_WIRE_9,
		 p8 => SYNTHESIZED_WIRE_10,
		 p9 => SYNTHESIZED_WIRE_11);


b2v_memBlockOut1 : memoryblock
GENERIC MAP(fip => true
			)
PORT MAP(CLOCK => clockOne,
		 pixelIn => SYNTHESIZED_WIRE_0);


b2v_memBlockOut2 : memoryblock
GENERIC MAP(fip => true
			)
PORT MAP(CLOCK => clockOne,
		 pixelIn => SYNTHESIZED_WIRE_1);


b2v_memBlockOut3 : memoryblock
GENERIC MAP(fip => true
			)
PORT MAP(CLOCK => clockOne,
		 pixelIn => SYNTHESIZED_WIRE_2);


b2v_opOneFirstHalfTest : operationone
PORT MAP(clk => clockOne,
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