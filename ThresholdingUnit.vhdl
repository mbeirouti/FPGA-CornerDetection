library IEEE;

use ieee.std_logic_1164.all;

entity ThresholdingUnit is
	
	port(
		thresh: in integer;
		confidence: in integer;
		decision: out std_logic
	);

end entity;

architecture ThresholdingUnit_Impl of ThresholdingUnit is

begin
	
	decision <= '1' when confidence >= thresh else
				'0';

end architecture;