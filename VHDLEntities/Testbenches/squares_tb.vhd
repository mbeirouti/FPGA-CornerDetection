library IEEE;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
 
entity squaresTB is
-- empty
end squaresTB; 

architecture implementation of squaresTB is


SIGNAL clk: STD_LOGIC := '0';
CONSTANT clk_period : time := 1 ns; -- roughly 64 MHz
signal finished: STD_logic := '0';


component squares is
	

	port(
		clk : in std_logic;
		xGrad : in integer;
		yGrad : in integer;
		xGradSq : out integer;
		yGradSq: out integer;
		xyGrad : out integer
	);

end component;

signal xGradient, yGradient : integer;
signal xGradientSq, yGradientSq, xyGradient : integer;

begin
    
  
  clk <= not clk after clk_period/2 when finished /= '1' else '0';
  
  SQUARE : squares port map (clk, xGradient, yGradient, xGradientSq, yGradientSq, xyGradient);
  
  
  process
  
  begin
  
  -- TEST CASES:
  	xGradient <= 0;
    yGradient <= 0;
    wait for clk_period;
    
    xGradient <= 2;
    yGradient <= 2;
    wait for clk_period;
    
    xGradient <= 5;
    yGradient <= 5;
    wait for clk_period;
    
    xGradient <= 37;
    yGradient <= 37;
    wait for clk_period;
    
    xGradient <= 255;
    yGradient <= 255;
    wait for clk_period;

    finished <= '1';
    wait;
    
  end process;
    
  
end implementation;
