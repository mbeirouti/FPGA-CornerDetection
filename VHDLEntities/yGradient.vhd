library IEEE;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity yGradient is
	
	-- Takes as input a matrix of 9 values and outputs the gradient in the X-Direction based on the Sobel operator
	-- NOTE: Can be optimized further
	port(
		clk : in std_logic;
		x11, x12, x13, x21, x22, x23, x31, x32, x33 : in integer range 0 to 255;
		gradientInY : out integer range 0 to 255
	);

end yGradient;


architecture implementation of yGradient is
	
	signal gradientMem: integer;
	
	begin

	
	gradientMem <= x11 + 2*x12 + x13 - x31 - 2*x32 - x33;    
   
	SobelOperator : process(clk)
	
	begin
	 
		if rising_edge(clk) then
			if (gradientMem > 255) then
				gradientInY <= 255;
			elsif (gradientMem < 0) then
				gradientInY <= 0;
			else 
				gradientInY <= gradientMem;
			end if;
		end if;
		
    end process SobelOperator;
    
    
end implementation;