library IEEE;

use ieee.std_logic_1164.all;

entity PixelManagementUnit is

	port(
		-- Input
		-- Row-wise input
		rowA,rowB,rowC: in std_logic_vector(23 downto 0);
		
		-- Output
		-- Pixel-by-pixel output.
		p1,p2,p3,p4,p5,p6,p7,p8,p9: out std_logic_vector(7 downto 0)
	);

end entity;

architecture PixelManagementUnit_Impl of PixelManagementUnit is

begin

	p1 <= rowA(23 downto 16);
	p2 <= rowA(15 downto 8);
	p3 <= rowA(7 downto 0);
	p4 <= rowB(23 downto 16);
	p5 <= rowB(15 downto 8);
	p6 <= rowB(7 downto 0);
	p7 <= rowC(23 downto 16);
	p8 <= rowC(15 downto 8);
	p9 <= rowC(7 downto 0);

end architecture;