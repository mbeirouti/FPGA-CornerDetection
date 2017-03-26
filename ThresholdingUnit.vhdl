library IEEE;

use ieee.std_logic_1164.all;

entity ThresholdingUnit is
	
	port(
		thresh: in integer;
		confidence: in integer;
		
		decision: out std_logic
	);

end entity;