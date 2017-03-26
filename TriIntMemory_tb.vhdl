library IEEE;

use ieee.std_logic_1164.all;

entity TriIntMemory_tb is
end entity;

architecture TriIntMemory_tst of TriIntMemory_tb is

signal clock: std_logic;
signal yIn,xIn,xyIn,yOut,xOut,xyOut: integer;

constant clk_period: time := 1 ns;

component TriIntMemory

	port (
		clock: in std_logic;
		yIn, xIn, xyIn: in integer;
		yOut,xOut,xyOut: out integer
	);
	
end component;

begin

	TIM: TriIntMemory port map(
		clock,
		yIn,xIn,xyIn,
		yOut,xOut,xyOut
	);

	process
	
	begin
	
		clock <= '0';
		wait for 0.5 * clk_period;
		clock <= '1';
		wait for 0.5 * clk_period;
	
	end process;
	
	process
	
	begin
	
		wait for 0.5 * clk_period;
	
		xIn <= 5;
		yIn <= 10;
		xyIn <= 31;
		
		wait for 1 * clk_period;
		
		assert xOut = xIn and yIn = yOut and xyIn = xyOut report "Failed to propagate.";
		
		wait for 1 * clk_period;
		
		wait;
	
	end process;

	

end architecture;