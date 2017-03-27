library IEEE;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use std.textio.all;

entity squares is
	

	port(
		clk : in std_logic;
		xGrad : in unsigned(7 downto 0);
		yGrad : in unsigned(7 downto 0);
		xGradSq : out unsigned(15 downto 0);
		yGradSq: out unsigned(15 downto 0);
		xyGrad : out unsigned(15 downto 0));

end squares;


architecture implementation of squares is
	
	
	
	begin


	SquareOperator : process(clk)
	
		begin
		
			if(clk'EVENT and clk = '1') then
	
				xGradSq <= xGrad * xGrad;
				yGradSq <= yGrad * yGrad;
				xyGrad <= xGrad * yGrad;
	
			end if;
			
			
	end process SquareOperator;


end implementation;