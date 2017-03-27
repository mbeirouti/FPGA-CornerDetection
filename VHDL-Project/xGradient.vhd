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
	
		-- Intermediate variable used to ensure the operation returns a result between 0 and 255
		variable intermediate : integer range -1021 to 1021;
		
		
	
	begin
	
		gradientMem <= x11 + 2*x21 + x31 - x13 - 2*x23 - x33;
		
		-- On rising edge
		if rising_edge(clk) then
						
			gradientInX <= gradientMem;
		
		end if;
	
	end process SobelOperator;

end implementation;