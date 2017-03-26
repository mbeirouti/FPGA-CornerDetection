library IEEE;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use std.textio.all;

entity xGradient is
	
	-- Takes as input a matrix of 9 values and outputs the gradient in the X-Direction based on the Sobel operator
	-- NOTE: Can be optimized further
	port(
		clk : in std_logic;
		x11, x12, x13, x21, x22, x23, x31, x32, x33 : in std_logic_vector(7 downto 0);
		gradientInX : out std_logic_vector(7 downto 0));

end xGradient;


architecture implementation of xGradient is
	
	
	
	begin

	
--	SobelOperator : process(clk)
--	
--		-- Intermediate variable used to ensure the operation returns a result between 0 and 255
--		variable intermediate : integer range -1021 to 1021;
--	
--	begin
--		
--		-- On rising edge
--		if(clk'EVENT and clk = '1') then
--			
--			-- Calculate gradient using Sobel operator
--			-- NOTE: Not sure if this is the most efficient way to do integer subtraction but needed to get it done
--			intermediate := to_integer(signed(x11))+2*to_integer(signed(x21))+to_integer(signed(x31)) - to_integer(signed(x13))-2*to_integer(signed(x23))-to_integer(signed(x33));
--			
--			-- If result is out of bounds put it in bounds
----			if (intermediate > 255) then
----				intermediate := 255;
----			elsif (intermediate < 0) then
----				intermediate := 0;
----			end if;
--			
--			-- Output value
--			gradientInX <= std_logic_vector(to_signed(intermediate, 8));
--		
--		end if;
--	
--	end process SobelOperator;
	
	
	gradientInX <= x11;
	


end implementation;