library IEEE;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity squares is
	

	port(
		clk : in std_logic;
		xGrad : in std_logic_vector(7 downto 0);
		yGrad : in std_logic_vector(7 downto 0);
		xGradSq : out std_logic_vector(7 downto 0);
		yGradSq: out std_logic_vector(7 downto 0);
		xyGrad : out std_logic_vector(7 downto 0)	
	);

end squares;


architecture implementation of squares is
	
	begin
	
	SquareOperator : process(clk)
	
		variable xGradSqMem, yGradSqMem, xyGradSqMem: integer;
	
		begin
		
			if rising_edge(clk) then
				xGradSqMem := to_integer(unsigned(xGrad)) * to_integer(unsigned(xGrad));
				yGradSqMem := to_integer(unsigned(yGrad)) * to_integer(unsigned(yGrad));
				xyGradSqMem := to_integer(unsigned(xGrad)) * to_integer(unsigned(yGrad));
				
			
			
				-- These if statements can be put into separate processes
				if (xGradSqMem > 255) then
					xGradSq <= std_logic_vector(to_unsigned(255,8));
				elsif (xGradSqMem < 0) then
					xGradSq <= std_logic_vector(to_unsigned(0,8));
				else 
					xGradSq <= std_logic_vector(to_unsigned(xGradSqMem,8));
				end if;
				
				if (yGradSqMem > 255) then
					yGradSq <= std_logic_vector(to_unsigned(255,8));
				elsif (yGradSqMem < 0) then
					yGradSq <= std_logic_vector(to_unsigned(0,8));
				else 
					yGradSq <= std_logic_vector(to_unsigned(yGradSqMem,8));
				end if;
				
				if (xyGradSqMem > 255) then
					xyGrad <= std_logic_vector(to_unsigned(255,8));
				elsif (xyGradSqMem < 0) then
					xyGrad <= std_logic_vector(to_unsigned(0,8));
				else 
					xyGrad <= std_logic_vector(to_unsigned(xyGradSqMem,8));
				end if;
	
			end if;
			
			
	end process SquareOperator;


end implementation;