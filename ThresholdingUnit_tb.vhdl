library IEEE;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ThresholdingUnit_tb is
end entity;

architecture ThresholdingUnit_tst of ThresholdingUnit_tb is

signal thresh, confidence: integer;
signal decision: std_logic;

component ThresholdingUnit

	port(
		-- Input
		-- Threshold value
		thresh: in integer;
		-- Confidence score
		confidence: in integer;
		
		-- Output
		-- Decision taken
		decision: out std_logic
	);

end component;

begin

	TU : ThresholdingUnit port map(
		thresh,
		confidence,
		decision
	);

	process

	begin

		thresh <= 140;

		confidence <= 0;
		
		wait for 1 ns;

		assert decision = '0' report "Failed to reject low value.";

		wait for 1 ns;

		confidence <= 140;
		
		wait for 1 ns;

		assert decision = '1' report "Failed to accept equal value.";

		wait for 1 ns;

		confidence <= 255;

		assert decision = '1' report "Failed to accept high value.";

		wait;
		
	end process;

end architecture;