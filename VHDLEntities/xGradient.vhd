library IEEE;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;



entity xGradient is
	
	-- Takes as input a matrix of 9 values and outputs the gradient in the X-Direction based on the Sobel operator
	-- NOTE: Can be optimized further
	port(
		clk : in std_logic;
		x11, x12, x13, x21, x22, x23, x31, x32, x33 : in std_logic_vector(7 downto 0);
		gradientInX : out std_logic_vector(7 downto 0)
	);

end xGradient;


architecture implementation of xGradient is
	
	begin
	
	SobelOperator : process(clk)
	
	variable gradientMem: integer;
	
	begin
	 
		if rising_edge(clk) then
		
		gradientMem := to_integer(unsigned(x11) + 2*unsigned(x21) + unsigned(x31) - unsigned(x13) - 2*unsigned(x23) - unsigned(x33));
		
			if (gradientMem > 255) then
				gradientInX <= std_logic_vector(to_unsigned(255,8));
			elsif (gradientMem < 0) then
				gradientInX <= std_logic_vector(to_unsigned(0,8));
			else 
				gradientInX <= std_logic_vector(to_unsigned(gradientMem,8));
			end if;
		end if;
		
    end process SobelOperator;
    
    
end implementation;