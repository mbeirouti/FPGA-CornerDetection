library IEEE;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity squares is
	

	port(
		clk : in std_logic;
		xGrad : in integer;
		yGrad : in integer;
		xGradSq : out integer;
		yGradSq: out integer;
		xyGrad : out integer	
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