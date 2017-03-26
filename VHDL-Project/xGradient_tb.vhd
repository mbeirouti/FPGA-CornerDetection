
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
		x11, x12, x13, x21, x22, x23, x31, x32, x33 : in std_logic_vector(7 downto 0);
		gradientInX : out std_logic_vector(7 downto 0));

end component;

	signal A, B, C, D, E, F, G, H, I : std_logic_vector(7 downto 0);
	signal output : std_logic_vector(7 downto 0);
  


begin

	TESTCOMP : xGradient port map (clk, A, B, C, D, E, F, G, H, I, output);
	
	clk <= not clk after clk_period/2 when finished /= '1' else '0';
	
	process
		variable test : integer range 0 to 255;
	
	begin
		-- How can we set the lines for each input using an integer value?
		A <= "00000001";
		B <= "00000001";
		C <= "00000001";
		D <= "00000001";
		E <= "00000001";
		F <= "00000001";
		G <= "00000001";
		H <= "00000001";
		I <= "00000001";
	
		wait for clk_period;
		wait for clk_period;
	
		assert(output = "00000000") report "Trivial Case Not Working" severity error;
	
		test := 33;
		
		-- How can we set the lines for each input using an integer value?
		A <= "00001111";
		B <= "00001111";--
		C <= "00001111";
		D <= "00011111";
		E <= "00001111";--
		F <= "00001111";
		G <= "00011111";
		H <= "00001111";--
		I <= "00001111";

	
		wait for clk_period;
		wait for clk_period;
		assert(output = "00110000") report "Random Case Not Working" severity error;
	
	
		-- NOTE: Add in more test cases later...
	
	
	
		assert false report "Tests Complete" severity note;
	
	
		finished <= '1';
		wait;

	end process;

end tb;
