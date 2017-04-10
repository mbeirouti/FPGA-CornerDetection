
library IEEE;
use IEEE.std_logic_1164.all;
 
entity xGradtestbench is
-- empty
end xGradtestbench; 

architecture tb of xGradtestbench is


SIGNAL clk: STD_LOGIC := '0';
CONSTANT clk_period : time := 10ns;
signal finished: STD_logic := '0';



-- RIPPLE CARRY ADDER
component xGradient is

	port(
		clk : in std_logic;
		x11, x12, x13, x21, x22, x23, x31, x32, x33 : in integer range 0 to 255;
		gradientInX : out integer range 0 to 255
	);

end component;


  signal A, B, C, D, E, F, G, H, I : integer range 0 to 255;
  signal output : integer range 0 to 255;
  




begin
	
	TESTCOMP : xGradient port map (clk, A, D, G, B, E, H, C, F, I, output);
	-- Signal mappings are such that A, B, C are first column and G, H, I are third column in the kernel

  clk <= not clk after clk_period/2 when finished /= '1' else '0';
  
  process
  
  begin
  	wait for clk_period;
   	
    
    A <= 10;
    B <= 10;
    C <= 10;
 	D <= 0;
    E <= 0;
    F <= 0;
    G <= 0;
    H <= 0;
    I <= 0;
    wait for clk_period;
    
    A <= 20;
    B <= 20;
    C <= 20;
 	D <= 0;
    E <= 0;
    F <= 0;
    G <= 2;
    H <= 2;
    I <= 2;
    wait for clk_period;    
	
    A <= 11;
    B <= 7;
    C <= 13;
 	D <= 0;
    E <= 0;
    F <= 0;
    G <= 8;
    H <= 2;
    I <= 3;
    wait for clk_period;
    
    A <= 1;
    B <= 3;
    C <= 73;
 	D <= 0;
    E <= 0;
    F <= 0;
    G <= 2;
    H <= 1;
    I <= 55;
    wait for clk_period;
    
    
    A <= 101;
    B <= 121;
    C <= 61;
 	D <= 188;
    E <= 29;
    F <= 202;
    G <= 106;
    H <= 3;
    I <= 198;
    wait for clk_period;
    
    A <= 16;
    B <= 230;
    C <= 210;
 	D <= 180;
    E <= 53;
    F <= 83;
    G <= 241;
    H <= 151;
    I <= 181;
    wait for clk_period;
    
    A <= 41;
    B <= 97;
    C <= 94;
 	D <= 243;
    E <= 83;
    F <= 143;
    G <= 173;
    H <= 61;
    I <= 209;
    wait for clk_period;

	A <= 201;
    B <= 195;
    C <= 132;
 	D <= 188;
    E <= 110;
    F <= 102;
    G <= 141;
    H <= 132;
    I <= 107;
    wait for clk_period;
    
	A <= 91;
    B <= 251;
    C <= 191;
 	D <= 186;
    E <= 137;
    F <= 204;
    G <= 29;
    H <= 153;
    I <= 84;
    wait for clk_period;

	A <= 236;
    B <= 5;
    C <= 158;
 	D <= 95;
    E <= 80;
    F <= 180;
    G <= 92;
    H <= 188;
    I <= 84;
    wait for clk_period;

	A <= 9;
    B <= 156;
    C <= 99;
 	D <= 231;
    E <= 10;
    F <= 29;
    G <= 251;
    H <= 31;
    I <= 160;
    wait for clk_period;
    
    A <= 183;
    B <= 237;
    C <= 148;
 	D <= 127;
    E <= 0;
    F <= 75;
    G <= 224;
    H <= 154;
    I <= 83;
    wait for clk_period;

    assert false report "Tests Complete" severity note;
    
    finished <= '1';
   
    
    wait;
    
  end process;
    
  
end tb;
