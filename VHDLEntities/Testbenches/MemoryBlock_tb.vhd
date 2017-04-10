library IEEE;

use ieee.std_logic_1164.all;

entity MemoryBlock_tb is
end entity;

architecture MemoryBlock_tst of MemoryBlock_tb is

	signal CLOCK, RW: std_logic;
	signal pixelIn,p1,p2,p3,p4,p5,p6,p7,p8,p9: std_logic_vector(7 downto 0);

	component MemoryBlock
	
		generic(
			fip: boolean := true
		);
	
		port(
			CLOCK: in std_logic;
			pixelIn: in std_logic_vector(7 downto 0);
			RW: in std_logic;
			
			p1,p2,p3,p4,p5,p6,p7,p8,p9: out std_logic_vector(7 downto 0)
		);
	
	end component;

begin

	MB: MemoryBlock port map(CLOCK, pixelIn, RW, p1,p2,p3,p4,p5,p6,p7,p8,p9);
	
	CLK: process
	
	begin
	
		CLOCK <= '1';
		wait for 0.5 ns;
		CLOCK <= '0';
		wait for 0.5 ns;
	
	end process;
	
	TST: process
	
	begin
	
		for i in 0 to 10 loop
		
			RW <= '1';
			
			wait for 1 ns;
			
			RW <= '0';
			
			wait for 1 ns;
		
		end loop;
		
		wait for 5 ns;
		
		RW <= '1';
		
		wait;
	
	end process;



end architecture;