library IEEE;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library STD;

use std.textio.all;

entity FileDataFeed_tb is
end entity;

architecture FileDataFeed_tst of FileDataFeed_tb is

	constant CLK_PERIOD: time := 1 ns;

	signal CLOCK: std_logic := '0';
	signal sendPatch: std_logic := '0';
	signal feedReady: std_logic := '0';
	signal imgWidth,imgHeight: std_logic_vector(31 downto 0) := (others => '0');
	signal pixelRow1,pixelRow2,pixelRow3: std_logic_vector(23 downto 0) := (others => '0');
	signal pixelIn: std_logic_vector(7 downto 0);
	
	component FileDataFeed
	
		generic(
			from_file: boolean := false
		);
	
		port(
			CLOCK: in std_logic;
			sendPatch: in std_logic;
			pixelIn: in std_logic_vector(7 downto 0);
			
			feedReady: out std_logic;
			pixelRow1,pixelRow2,pixelRow3: out std_logic_vector(23 downto 0) := (others => 'Z')
		);
		
	end component;

begin

	FDF: FileDataFeed port map(CLOCK, sendPatch,pixelIn,feedReady, pixelRow1, pixelRow2, pixelRow3);

	CLK: process
	
	begin
	
		CLOCK <= '0';
		wait for 0.5 * CLK_PERIOD;
		CLOCK <= '1';
		wait for 0.5 * CLK_PERIOD;
	
	end process;
	
	TST: process
	
	begin
	
		for i in 0 to 479999 loop
		
			pixelIn <= std_logic_vector(to_unsigned(255,8));
			sendPatch <= '1';
			
			wait for 1 * CLK_PERIOD;
			
			sendPatch <= '0';
			
			wait for 1 * CLK_PERIOD;
		
		end loop;
	
		wait;
		
	end process;
	
	
end architecture;