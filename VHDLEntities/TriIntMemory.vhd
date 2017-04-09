library IEEE;

use ieee.std_logic_1164.all;

entity TriIntMemory is

	port (
		-- Input
		-- Clock signal
		clock: in std_logic;
		-- x,y,xy squares signals
		yIn, xIn, xyIn: in integer;
		
		-- Output
		-- x,y,xy square signals
		yOut,xOut,xyOut: out integer
	);
	
end entity;

architecture TriIntMemory_Impl of TriIntMemory is

-- Intermediate, memory.
signal xMem,yMem,xyMem: integer := 0;

begin

	process(clock)
	
	begin
	
		if rising_edge(clock) then
		
			-- Assigning output.
			yOut <= yMem;
			xOut <= xMem;
			xyOut <= xyMem;
			
			-- Updating memory.
			yMem <= yIn;
			xMem <= xIn;
			xyMem <= xyIn;
		
		end if;
	
	end process;

end architecture;