
library IEEE;
use IEEE.std_logic_1164.all;
 
entity testbench is
-- empty
end testbench; 

architecture tb of testbench is


SIGNAL clk: STD_LOGIC := '0';
CONSTANT clk_period : time := 1000ps;
signal finished: STD_logic := '0';



component xGradient is

	port(
		clk : in std_logic;
		x11, x12, x13, x21, x22, x23, x31, x32, x33 : in integer;
		gradientInX : out integer);

end component;

	signal A, B, C, D, E, F, G, H, I : integer;
	signal output : integer;
  


begin

	TESTCOMP : xGradient port map (clk, A, B, C, D, E, F, G, H, I, output);
	
	clk <= not clk after clk_period/2 when finished /= '1' else '0';
	
	process
		variable test : integer range 0 to 255;
	
	begin
		-- How can we set the lines for each input using an integer value?
		A <= 1;
		B <= 1;
		C <= 1;
		D <= 1;
		E <= 1;
		F <= 1;
		G <= 1;
		H <= 1;
		I <= 1;
	
		wait for clk_period;
		wait for clk_period;
	
		assert(output = 0) report "Trivial Case Not Working" severity error;
	
		test := 33;
		
		-- How can we set the lines for each input using an integer value?
		A <= 15;
		B <= 15;--
		C <= 15;
		D <= 15;
		E <= 15;--
		F <= 15;
		G <= 31;
		H <= 15;--
		I <= 15;

	
		wait for clk_period;
		wait for clk_period;
		assert(output = 16) report "Random Case Not Working" severity error;
	
	
		-- NOTE: Add in more test cases later...
	
	
	
		assert false report "Tests Complete" severity note;
	
	
		finished <= '1';
		wait;

	end process;

end tb;
