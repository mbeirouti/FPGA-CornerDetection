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
		yIn, xIn, xyIn: in integer := 0;
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
	
		for i in 0 to 10 loop
			xIn <= i;
			yIn <= i*50;
			xyIn <= i *100;
			
			wait for 1 * clk_period;
		
			assert xOut = xIn and yIn = yOut and xyIn = xyOut report "Failed to propagate.";
		
			wait for 1 * clk_period;
			
		end loop;
		
		wait;
	
	end process;

	

end architecture;