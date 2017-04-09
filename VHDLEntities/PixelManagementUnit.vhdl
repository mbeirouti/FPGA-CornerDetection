library IEEE;

use ieee.std_logic_1164.all;

entity PixelManagementUnit is

	port(
		-- Input
		-- Clock signal
		clock: in std_logic;
		-- Row-wise input
		rowA,rowB,rowC: in std_logic_vector(23 downto 0);
		-- Busy signal to stall file-reading
		unitBusy: out std_logic;
		
		-- Output
		-- Pixel-by-pixel output.
		p1,p2,p3,p4,p5,p6,p7,p8,p9: out std_logic_vector(7 downto 0)
	);

end entity;

architecture PixelManagementUnit_Impl of PixelManagementUnit is

-- Internal memory implementation as an array of std_logic_vector elements.
type memory is array (8 downto 0) of std_logic_vector(7 downto 0);
signal internalMemory: memory := (others => (others=>'0'));

begin

	process(clock)

	begin

		if rising_edge(clock) then
		
			-- The output represents a 3x3 pixel memory that is
			-- pixel-addressable.
			--
			-- p1 p2 p3
			-- p4 p5 p6
			-- p7 p8 p9
			
			-- Output assignment from memory
			
			p1 <= internalMemory(0);
			p2 <= internalMemory(1);
			p3 <= internalMemory(2);
			p4 <= internalMemory(3);
			p5 <= internalMemory(4);
			p6 <= internalMemory(5);
			p7 <= internalMemory(6);
			p8 <= internalMemory(7);
			p9 <= internalMemory(8);
			
			-- Splitting input in bytes and storing to memory.
			
			for i in 0 to 2 loop
				internalMemory(i) <= rowA(23-i*8 downto 16-i*8);
				internalMemory(i+3) <= rowB(23-i*8 downto 16-i*8);
				internalMemory(i+6) <= rowC(23-i*8 downto 16-i*8);
			end loop;
			
		end if;

	end process;
	

end architecture;