library IEEE;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity squares is
	

	port(
		clk : in std_logic;
		xGrad : in integer range 0 to 255;
		yGrad : in integer range 0 to 255;
		xGradSq : out integer range 0 to 65026;
		yGradSq: out integer range 0 to 65026;
		xyGrad : out integer range 0 to 65026	
	);

end squares;


architecture implementation of squares is
	
	begin


	SquareOperator : process(clk)
	
		begin
		
			if rising_edge(clk) then
	
				xGradSq <= xGrad * xGrad;
				yGradSq <= yGrad * yGrad;
				xyGrad <= xGrad * yGrad;
	
			end if;
			
			
	end process SquareOperator;


end implementation;