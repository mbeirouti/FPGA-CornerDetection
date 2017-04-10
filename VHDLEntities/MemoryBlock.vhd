library IEEE;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity MemoryBlock is
	
	generic(
		fip: boolean := true
	);
	
	port(
		CLOCK: in std_logic;
		pixelIn: in std_logic_vector(7 downto 0);
		RW: in std_logic;
		
		p1,p2,p3,p4,p5,p6,p7,p8,p9: out std_logic_vector(7 downto 0)
	);
		
end entity;

architecture implementation of MemoryBlock is

	signal R1,R2,R3: std_logic_vector(23 downto 0);
	signal feedReady: std_logic;

	component FileDataFeed
	
		generic(
			from_file: boolean := fip
		);


		port(
			CLOCK: in std_logic;
			sendPatch: in std_logic;
			pixelIn: in std_logic_vector(7 downto 0);
		
			feedReady: out std_logic := '0';
			pixelRow1,pixelRow2,pixelRow3: out std_logic_vector(23 downto 0) := (others => 'Z')
		);
	
	end component;
	
	component PixelManagementUnit
	
		port(
			-- Input
			-- Row-wise input
			rowA,rowB,rowC: in std_logic_vector(23 downto 0);
			
			-- Output
			-- Pixel-by-pixel output.
			p1,p2,p3,p4,p5,p6,p7,p8,p9: out std_logic_vector(7 downto 0)
		);
	
	end component;

begin

	FDF: FileDataFeed port map(CLOCK,RW,pixelIn,feedReady,R1,R2,R3);
	PMU: PixelManagementUnit port map(R1,R2,R3,p1,p2,p3,p4,p5,p6,p7,p8,p9);
	
end implementation;