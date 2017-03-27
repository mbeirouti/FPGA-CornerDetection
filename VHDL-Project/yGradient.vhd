library IEEE;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity yGradient is
	
	-- Takes as input a matrix of 9 values and outputs the gradient in the Y-Direction based on the Sobel operator
	-- NOTE: Can be optimized further
	port(
		clk : in std_logic;
		x11, x12, x13, x21, x22, x23, x31, x32, x33 : in integer;
		gradientInY : out integer
	);

end yGradient;


architecture implementation of yGradient is
	
	signal gradientMem: integer;
	
	begin
	
	SobelOperator : process(clk)
	
	
	
	begin
		
		-- Calculate gradient using Sobel operator
		gradientMem <= x11 + 2*x12 + x13 - x31 - 2*x32 - x33;
		
		-- NEED TO DEAL WITH OVERFLOW
		
		-- On rising edge
		if rising_edge(clk) then
			
			gradientInY <= gradientMem;
			
		end if;
	
	end process SobelOperator;
	
end implementation;