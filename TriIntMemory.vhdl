library IEEE;

entity TriIntMemory is

	port (
		clock: in std_logic;
		yIn, xIn, xyIn: in integer;
		yOut,xOut,xyOut: out integer
	);
	
end entity;

architecture TriIntMemory_Impl of TriIntMemory is

signal xMem,yMem,xyMem: integer := 0;

begin

	process
	
	begin
	
		if rising_edge(clock) then
		
			yOut <= yMem;
			xOut <= xMem;
			xyOut <= xyMem;
			
			yMem <= yIn;
			xMem <= xIn;
			xyMem <= xyIn;
		
		end if;
	
	end process;

end architecture;