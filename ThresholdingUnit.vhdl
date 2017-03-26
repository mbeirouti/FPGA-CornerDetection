library IEEE;

use ieee.std_logic_1164.all;

entity ThresholdingUnit is
	
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

end entity;

architecture ThresholdingUnit_Impl of ThresholdingUnit is

begin
	
	-- Since decision-making doesn't require sync., it is implemented as
	-- a combinational circuit.
	
	decision <= '1' when confidence >= thresh else
				'0';

end architecture;