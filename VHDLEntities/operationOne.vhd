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
-- CREATED		"Mon Apr 10 01:52:05 2017"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY operationOne IS 
	PORT
	(
		clk :  IN  STD_LOGIC;
		A :  IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
		B :  IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
		C :  IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
		D :  IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
		E :  IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
		F :  IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
		G :  IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
		H :  IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
		I :  IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
		IxIy :  OUT  STD_LOGIC_VECTOR(7 DOWNTO 0);
		Ixs :  OUT  STD_LOGIC_VECTOR(7 DOWNTO 0);
		Iys :  OUT  STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END operationOne;

ARCHITECTURE bdf_type OF operationOne IS 

COMPONENT squares
	PORT(clk : IN STD_LOGIC;
		 xGrad : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 yGrad : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 xGradSq : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
		 xyGrad : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
		 yGradSq : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END COMPONENT;

COMPONENT xgradient
	PORT(clk : IN STD_LOGIC;
		 x11 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 x12 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 x13 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 x21 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 x22 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 x23 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 x31 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 x32 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 x33 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 gradientInX : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END COMPONENT;

COMPONENT ygradient
	PORT(clk : IN STD_LOGIC;
		 x11 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 x12 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 x13 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 x21 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 x22 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 x23 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 x31 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 x32 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 x33 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 gradientInY : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END COMPONENT;

SIGNAL	SYNTHESIZED_WIRE_0 :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_1 :  STD_LOGIC_VECTOR(7 DOWNTO 0);


BEGIN 



b2v_squaresModule : squares
PORT MAP(clk => clk,
		 xGrad => SYNTHESIZED_WIRE_0,
		 yGrad => SYNTHESIZED_WIRE_1,
		 xGradSq => Ixs,
		 xyGrad => IxIy,
		 yGradSq => Iys);


b2v_xGradModule : xgradient
PORT MAP(clk => clk,
		 x11 => A,
		 x12 => B,
		 x13 => C,
		 x21 => D,
		 x22 => E,
		 x23 => F,
		 x31 => G,
		 x32 => H,
		 x33 => I,
		 gradientInX => SYNTHESIZED_WIRE_0);


b2v_yGradModule : ygradient
PORT MAP(clk => clk,
		 x11 => A,
		 x12 => B,
		 x13 => C,
		 x21 => D,
		 x22 => E,
		 x23 => F,
		 x31 => G,
		 x32 => H,
		 x33 => I,
		 gradientInY => SYNTHESIZED_WIRE_1);


END bdf_type;