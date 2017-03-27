library IEEE;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use std.textio.all;
 
entity squaresTB is
-- empty
end squaresTB; 

architecture implementation of squaresTB is


SIGNAL clk: STD_LOGIC := '0';
CONSTANT clk_period : time := 15625ps; -- roughly 64 MHz
signal finished: STD_logic := '0';


component squares is
	

	port(
		clk : in std_logic;
		xGrad : in unsigned(7 downto 0);
		yGrad : in unsigned(7 downto 0);
		xGradSq : out unsigned(15 downto 0);
		yGradSq: out unsigned(15 downto 0);
		xyGrad : out unsigned(15 downto 0));

end component;

signal xGradient, yGradient : unsigned (7 downto 0);
signal xGradientSq, yGradientSq, xyGradient : unsigned (15 downto 0);

begin
    
  
  clk <= not clk after clk_period/2 when finished /= '1' else '0';
  
  SQUARE : squares port map (clk, xGradient, yGradient, xGradientSq, yGradientSq, xyGradient);
  
  
  process
  
  begin
  
  -- TEST CASES:
  	xGradient <= "00000000";
    yGradient <= "00000000";
    wait for clk_period;
    
    xGradient <= "00000010";
    yGradient <= "00000010";
    wait for clk_period;
    
    xGradient <= "00000101";
    yGradient <= "00000101";
    wait for clk_period;
    
    xGradient <= "00100101";
    yGradient <= "00100101";
    wait for clk_period;
    
    xGradient <= "01100101";
    yGradient <= "00010101";
    wait for clk_period;
    
    xGradient <= "01000101";
    yGradient <= "01000101";
    wait for clk_period;
    
    xGradient <= "11111111";
    yGradient <= "11111111";
    wait for clk_period;

    finished <= '1';
    wait;
    
  end process;
    
  
end implementation;
