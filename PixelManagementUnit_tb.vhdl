library IEEE;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity PixelManagementUnit_tb is
end entity;

architecture PixelManagementUnit_tst of PixelManagementUnit_tb is

signal clock, unitBusy: std_logic;
signal p1,p2,p3,p4,p5,p6,p7,p8,p9: std_logic_vector(7 downto 0);
signal rowA,rowB,rowC: std_logic_vector(23 downto 0);

constant clk_period: time := 1 ns;

component PixelManagementUnit

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
	
end component;

begin

	PMU : PixelManagementUnit port map(
		clock,
		rowA,rowB,rowC,
		unitBusy,
		p1,p2,p3,p4,p5,p6,p7,p8,p9
	);

	process

	begin

		clock <= '0';
		wait for 0.5 * clk_period;
		clock <= '1';
		wait for 0.5 * clk_period;

	end process;

	process 

	begin

		for i in 500 to 1000 loop

			rowA <= std_logic_vector(to_unsigned(i,24));
			rowB <= std_logic_vector(to_unsigned(i*2,24));
			rowC <= std_logic_vector(to_unsigned(i*4,24));
			
			wait for 1 * clk_period;
			
			

		end loop;

	end process;

end architecture;