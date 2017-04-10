library IEEE;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity yGradient is
	
	-- Takes as input a matrix of 9 values and outputs the gradient in the X-Direction based on the Sobel operator
	-- NOTE: Can be optimized further
	port(
		clk : in std_logic;
		x11, x12, x13, x21, x22, x23, x31, x32, x33 : in std_logic_vector(7 downto 0);
		gradientInY : out std_logic_vector(7 downto 0)
	);

end yGradient;


architecture implementation of yGradient is
	
	
	begin

	 
   
	SobelOperator : process(clk)
	
		variable gradientMem: integer;
	
	begin
	 
		if rising_edge(clk) then
		
			gradientMem := to_integer(unsigned(x11) + 2*unsigned(x12) + unsigned(x13) - unsigned(x31) - 2*unsigned(x32) - unsigned(x33));   
			
			if (gradientMem > 255) then
				gradientInY <= std_logic_vector(to_unsigned(255,8));
			elsif (gradientMem < 0) then
				gradientInY <= std_logic_vector(to_unsigned(0,8));
			else 
				gradientInY <= std_logic_vector(to_unsigned(gradientMem,8));
			end if;
		end if;
		
    end process SobelOperator;
    
    
end implementation;