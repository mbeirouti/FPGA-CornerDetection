library IEEE;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use std.textio.all;

entity gaussian is
	
	-- Takes as input a matrix of 9 values and outputs the gradient in the X-Direction based on the Sobel operator
	-- NOTE: Can be optimized further
	port(
		clk : in std_logic;
		x11, x12, x13, x21, x22, x23, x31, x32, x33 : in integer;
		gaussian : out integer);

end gaussian;


architecture implementation of gaussian is
	
	
	
	begin

	
	GaussianOperator : process(clk)
	
	
	begin
		
		-- On rising edge
		if(clk'EVENT and clk = '1') then
			
			gaussian <= (x11 + 2*x12 + x13 + 2*x21 + 4*x22 + 2*x23 + x31 + 2*x32 + x33)*(1/16);
		
		end if;
	
	end process GaussianOperator;
	
	
	
	


end implementation;