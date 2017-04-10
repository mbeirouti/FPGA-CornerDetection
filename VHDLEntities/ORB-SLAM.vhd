library IEEE;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ORBSLAM is
	
	port(
		input : in std_logic;
		output : out std_logic);
		
end entity;

architecture implementation of ORBSLAM is

begin

	output <= input;

end implementation;