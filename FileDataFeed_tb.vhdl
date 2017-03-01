library IEEE;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library STD;

use std.textio.all;

entity FileDataFeed_tb is
end entity;

architecture FileDataFeed of FileDataFeed_tb is

--File declarations
file inFile: text;

--Input height and width
signal imgHeight: std_logic_vector(31 downto 0) := (others => '0');
signal imgWidth: std_logic_vector(31 downto 0) := (others => '0');

begin

readIO: process

variable inLine: line;
variable inByte: character;
variable currentByte: integer := 8;

begin

--Open input file
file_open(inFile, "input_data.dat", read_mode);

--File is written as a hex blob, no newlines.
readline(inFile,inLine);

--Read the first 4 bytes of the file, image height.
read(inLine,inByte);
imgHeight(7 downto 0) <= std_logic_vector(to_unsigned(character'pos(inByte),8));

read(inLine,inByte);
imgHeight(15 downto 8) <= std_logic_vector(to_unsigned(character'pos(inByte),8));

read(inLine,inByte);
imgHeight(23 downto 16) <= std_logic_vector(to_unsigned(character'pos(inByte),8));

read(inLine,inByte);
imgHeight(31 downto 24) <= std_logic_vector(to_unsigned(character'pos(inByte),8));

--Read second 4 bytes of the file, image width.
read(inLine,inByte);
imgWidth(7 downto 0) <= std_logic_vector(to_unsigned(character'pos(inByte),8));

read(inLine,inByte);
imgWidth(15 downto 8) <= std_logic_vector(to_unsigned(character'pos(inByte),8));

read(inLine,inByte);
imgWidth(23 downto 16) <= std_logic_vector(to_unsigned(character'pos(inByte),8));

read(inLine,inByte);
imgWidth(31 downto 24) <= std_logic_vector(to_unsigned(character'pos(inByte),8));

--Allowing for the previous two reads to settle.
wait for 1 ns;

--Calculated data segment size.
report "Calculated size: "& integer'image(to_integer(unsigned(imgHeight)) * to_integer(unsigned(imgWidth))) & " bytes of image data.";

--Reading over the available bytes.
while (currentByte < to_integer(unsigned(imgHeight)) * to_integer(unsigned(imgWidth))) loop

--Processing to component goes here.
read(inLine,inByte);
report character'image(inByte);
wait for 1 ns;
currentByte := currentByte + 1;

end loop;

--Close file
file_close(inFile);

wait;

end process readIO;

end architecture;