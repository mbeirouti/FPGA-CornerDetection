library IEEE;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use std.textio.all;

entity xGradient is

	port(
		clk : in std_logic;
		x11, x12, x13, x21, x22, x23, x31, x32, x33 : in std_logic_vector(7 downto 0);
		gradientInX : out std_logic_vector(7 downto 0));

end xGradient;


architecture implementation of xGradient is
	
	
	
	begin
	
	
	
	SimpleGradient : process(clk)
	
		variable x11 : unsigned(7 downto 0);
		variable x13 : unsigned(7 downto 0);
	
	begin
	
	gradientInX <= std_logic_vector();
	
	
	end process SimpleGradient;
	
	
	
	
	
	SobelOperator : process(clk)
	begin
	
	
		
	
	
	
	end process SobelOperator;
	
	
	
	


end implementation;