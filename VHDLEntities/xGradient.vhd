library IEEE;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;



entity xGradient is
	
	-- Takes as input a matrix of 9 values and outputs the gradient in the X-Direction based on the Sobel operator
	-- NOTE: Can be optimized further
	port(
		clk : in std_logic;
		x11, x12, x13, x21, x22, x23, x31, x32, x33 : in integer range 0 to 255;
		gradientInX : out integer range 0 to 255
	);

end xGradient;


architecture implementation of xGradient is
	
	signal gradientMem: integer;
	
	begin
	
	
	gradientMem <= x11 + 2*x21 + x31 - x13 - 2*x23 - x33;
	
	SobelOperator : process(clk)
	
	begin
	 
		if rising_edge(clk) then
			if (gradientMem > 255) then
				gradientInX <= 255;
			elsif (gradientMem < 0) then
				gradientInX <= 0;
			else 
				gradientInX <= gradientMem;
			end if;
		end if;
		
    end process SobelOperator;
    
    
end implementation;