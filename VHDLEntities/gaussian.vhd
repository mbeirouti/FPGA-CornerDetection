library IEEE;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use std.textio.all;

entity gaussian is
	
	-- Takes as input a matrix of 9 values and outputs the gradient in the X-Direction based on the Sobel operator
	-- NOTE: Can be optimized further
	port(
		clk : in std_logic;
		x11, x12, x13, x21, x22, x23, x31, x32, x33 : in integer range 0 to 255;
		gaussian : out integer range 0 to 255);

end gaussian;


architecture implementation of gaussian is
	
	signal gaussianMem: integer;
	
	begin
	
	
	gaussianMem <= (x11 + 2*x12 + x13 + 2*x21 + 4*x22 + 2*x23 + x31 + 2*x32 + x33)/16;
	
	
	GaussianOperator : process(clk)
	
	begin
		-- On rising edge
		if rising_edge(clk) then
			if (gaussianMem > 255) then
				gaussian <= 255;
			elsif (gaussianMem < 0) then
				gaussian <= 0;
			else 
				gaussian <= gaussianMem;
			end if;
		
		end if;
		
	end process GaussianOperator;
	
	
	
	


end implementation;