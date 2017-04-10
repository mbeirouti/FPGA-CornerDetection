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
-- CREATED		"Mon Apr 10 02:10:11 2017"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY operationTwo IS 
	PORT
	(
		clk :  IN  STD_LOGIC;
		IxIyX11 :  IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
		IxIyX12 :  IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
		IxIyX13 :  IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
		IxIyX21 :  IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
		IxIyX22 :  IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
		IxIyX23 :  IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
		IxIyX31 :  IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
		IxIyX32 :  IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
		IxIyX33 :  IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
		IxsX11 :  IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
		IxsX12 :  IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
		IxsX13 :  IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
		IxsX21 :  IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
		IxsX22 :  IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
		IxsX23 :  IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
		IxsX31 :  IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
		IxsX32 :  IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
		IxsX33 :  IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
		IysX11 :  IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
		IysX12 :  IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
		IysX13 :  IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
		IysX21 :  IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
		IysX22 :  IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
		IysX23 :  IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
		IysX31 :  IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
		IysX32 :  IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
		IysX33 :  IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
		harrisScore :  OUT  STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END operationTwo;

ARCHITECTURE bdf_type OF operationTwo IS 

COMPONENT harrisoperator
	PORT(clk : IN STD_LOGIC;
		 gIxIy : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 gIxSq : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 gIySq : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 harris : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT;

COMPONENT gaussian
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
		 gaussian : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END COMPONENT;

SIGNAL	SYNTHESIZED_WIRE_0 :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_1 :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_2 :  STD_LOGIC_VECTOR(7 DOWNTO 0);


BEGIN 



b2v_harrisModule : harrisoperator
PORT MAP(clk => clk,
		 gIxIy => SYNTHESIZED_WIRE_0,
		 gIxSq => SYNTHESIZED_WIRE_1,
		 gIySq => SYNTHESIZED_WIRE_2,
		 harris => harrisScore);


b2v_IxIyGaussianOperator : gaussian
PORT MAP(clk => clk,
		 x11 => IxIyX11,
		 x12 => IxIyX12,
		 x13 => IxIyX13,
		 x21 => IxIyX21,
		 x22 => IxIyX22,
		 x23 => IxIyX23,
		 x31 => IxIyX31,
		 x32 => IxIyX32,
		 x33 => IxIyX33,
		 gaussian => SYNTHESIZED_WIRE_0);


b2v_IxsGaussianOperator : gaussian
PORT MAP(clk => clk,
		 x11 => IxsX11,
		 x12 => IxsX12,
		 x13 => IxsX13,
		 x21 => IxsX21,
		 x22 => IxsX22,
		 x23 => IxsX23,
		 x31 => IxsX31,
		 x32 => IxsX32,
		 x33 => IxsX33,
		 gaussian => SYNTHESIZED_WIRE_1);


b2v_IysGaussianOperator : gaussian
PORT MAP(clk => clk,
		 x11 => IysX11,
		 x12 => IysX12,
		 x13 => IysX13,
		 x21 => IysX21,
		 x22 => IysX22,
		 x23 => IysX23,
		 x31 => IysX31,
		 x32 => IysX32,
		 x33 => IysX33,
		 gaussian => SYNTHESIZED_WIRE_2);


END bdf_type;