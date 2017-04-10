library IEEE;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity squares is
	

	port(
		clk : in std_logic;
		xGrad : in integer range 0 to 255;
		yGrad : in integer range 0 to 255;
		xGradSq : out integer range 0 to 255;
		yGradSq: out integer range 0 to 255;
		xyGrad : out integer range 0 to 255	
	);

end squares;


architecture implementation of squares is
	
	signal xGradSqMem : integer;
	signal yGradSqMem : integer;
	signal xyGradSqMem : integer;
	
	
	
	begin
	
	xGradSqMem <= xGrad * xGrad;
	yGradSqMem <= yGrad * yGrad;
	xyGradSqMem <= xGrad * yGrad;
	
	SquareOperator : process(clk)
	
		begin
		
			if rising_edge(clk) then
			
				-- These if statements can be put into separate processes
				if (xGradSqMem > 255) then
					xGradSq <= 255;
				elsif (xGradSqMem < 0) then
					xGradSq <= 0;
				else 
					xGradSq <= xGradSqMem;
				end if;
				
				if (yGradSqMem > 255) then
					yGradSq <= 255;
				elsif (yGradSqMem < 0) then
					yGradSq <= 0;
				else 
					yGradSq <= yGradSqMem;
				end if;
				
				if (xyGradSqMem > 255) then
					xyGrad <= 255;
				elsif (xyGradSqMem < 0) then
					xyGrad <= 0;
				else 
					xyGrad <= xyGradSqMem;
				end if;
	
			end if;
			
			
	end process SquareOperator;


end implementation;