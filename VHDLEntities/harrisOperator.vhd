library IEEE;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use std.textio.all;

entity harrisOperator is
	
	-- Takes as input a matrix of 9 values and outputs the gradient in the X-Direction based on the Sobel operator
	-- NOTE: Can be optimized further
	port(
		clk : in std_logic;
		gIxSq, gIySq, gIxIy : in integer;
		harris : out integer );

end harrisOperator;


architecture implementation of harrisOperator is
	
	signal harrisMem: integer;
	signal alpha: integer := 25; -- Between 25 and 17 (such that 1/alpha is between 0.04 and 0.06)
	
	begin
	
	
	harrisMem <= gIxSq*gIySq - (gIxIy*gIxIy) - ((gIxSq-gIySq)*(gIxSq-gIySq))/alpha;
	
	
	HarrisOperator : process(clk)
	
	begin
		-- On rising edge
		if rising_edge(clk) then

			harris <= harrisMem;
			
		end if;
		
	end process HarrisOperator;
	
	
	
	


end implementation;