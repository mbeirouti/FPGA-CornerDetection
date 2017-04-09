library IEEE;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity xGradient is
	
	-- Takes as input a matrix of 9 values and outputs the gradient in the X-Direction based on the Sobel operator
	-- NOTE: Can be optimized further
	port(
		clk : in std_logic;
		x11, x12, x13, x21, x22, x23, x31, x32, x33 : in integer;
		gradientInX : out integer
	);

end xGradient;


architecture implementation of xGradient is
	
	signal gradientMem: integer;
	
	begin

	SobelOperator : process(clk)

	
	
	begin
		
		-- Calculate gradient using Sobel operator
		gradientMem <= x11 + 2*x21 + x31 - x13 - 2*x23 - x33;
		
		-- NEED TO DEAL WITH OVERFLOW
		
		-- On rising edge
		if rising_edge(clk) then
						
			gradientInX <= gradientMem;
		
		end if;
	
	end process SobelOperator;

end implementation;