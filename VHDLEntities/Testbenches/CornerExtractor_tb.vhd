library IEEE;

use ieee.std_logic_1164.all;

entity CornerExtractor_tb is
end entity;

architecture CornerExtractor_tst of CornerExtractor_tb is

	signal CLOCK: std_logic;

	component CornerExtractor
	
		port(
			CLOCK: in std_logic
		);
	
	
	end component;

begin

	CE: CornerExtractor port map(CLOCK);
	
	CLK: process
	
	begin
	
		CLOCK <= '1';
		wait for 0.5 ns;
		CLOCK <= '0';
		wait for 0.5 ns;
	
	end process;
	
	TST: process
	
	begin
		
		wait;
	
	end process;



end architecture;