library IEEE;

use ieee.std_logic_1164.all;

entity PixelManagementUnit is

	port(
		rowA,rowB,rowC: in std_logic_vector(23 downto 0);
		unitBusy: out std_logic;
		p1,p2,p3,p4,p5,p6,p7,p8,p9: out std_logic_vector(7 downto 0)
	);

end entity;

architecture PixelManagementUnit_Impl of PixelManagementUnit is

begin

end architecture;