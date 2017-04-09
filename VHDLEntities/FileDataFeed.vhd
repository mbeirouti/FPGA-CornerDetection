library IEEE;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library STD;

use std.textio.all;

entity FileDataFeed is

	port(
		CLOCK: in std_logic;
		sendPatch: in std_logic;
	
		feedReady: out std_logic := '0';
		imgWidth,imgHeight : out std_logic_vector(31 downto 0) := (others => 'Z');
		pixelRow1,pixelRow2,pixelRow3: out std_logic_vector(23 downto 0) := (others => 'Z')
	);

end entity;

architecture FileDataFeed_Impl of FileDataFeed is

	--File declarations
	file inFile: text;
	file outFile: text;
	
	--Internal memory
	--Fit for a 800x600 image
	type memory is array (0 to 800*600) of std_logic_vector(7 downto 0);
	signal imageBuffer: memory;

begin

	FEED_BEHAVIOUR: process(CLOCK)

		variable inLine: line;
		variable outLine: line;
		variable inByte: character;
		variable outByte: character;
		variable currentByte: integer := 0;
		
		variable imageWidth,imageHeight : std_logic_vector(31 downto 0):= (others => 'Z');
		variable iWidth,iHeight,totalSize: integer := 0;

		
		variable currentState, nextState : integer range 0 to 3 := 0;

	begin

		--State transition
		currentState := nextState;

		--State behaviour
		case currentState is
		
			--State 0:
			--Buffer initialization
			--Source file is read and organized into the internal memory
			--	so it's ready to be fed to the system.
			
			when 0 =>
			
				--Open input file
				file_open(inFile, "processedImageData.bin", read_mode);

				--File is written as a hex blob, no newlines.
				readline(inFile,inLine);

				--Read the first 4 bytes (word) of the file, image height.
				for i in 0 to 3 loop
				
					read(inLine,inByte);
					imageWidth(7+i*8 downto 0+i*8) := std_logic_vector(to_unsigned(character'pos(inByte),8));		
				
				end loop;

				--Read second 4 bytes(word) of the file, image width.
				
				for i in 0 to 3 loop
				
					read(inLine,inByte);
					imageHeight(7+i*8 downto 0+i*8) := std_logic_vector(to_unsigned(character'pos(inByte),8));
				
				end loop;
				
				iWidth := to_integer(unsigned(imageWidth));
				iHeight := to_integer(unsigned(imageHeight));
				totalSize := iWidth * iHeight;

				--Calculated data segment size.
				report "Calculated size: "& integer'image(totalSize) & " bytes of image data.";
				
				for idx in 0 to inLine'length-1 loop
				
					read(inLine, inByte);
					imageBuffer(currentByte) <= std_logic_vector(to_unsigned(character'pos(inByte),8));
					currentByte := currentByte + 1;
				
				end loop;
				
				imageBuffer(currentByte) <= std_logic_vector(to_unsigned(0,8));
				currentByte := currentByte + 1;

				while not endfile(inFile) loop
					
					readline(inFile,inLine);
					
					report "newline";
					
					for idx in 0 to inLine'length-1 loop
					
						read(inLine,inByte);
				
						imageBuffer(currentByte) <= std_logic_vector(to_unsigned(character'pos(inByte),8));
						currentByte := currentByte + 1;
				
					end loop;
					
					imageBuffer(currentByte) <= std_logic_vector(to_unsigned(0,8));
					currentByte := currentByte + 1;

				end loop;
				
				imgWidth <= imageWidth;
				imgHeight <= imageHeight;
				feedReady <= '1';
				
				nextState := 1;
				
			when 1 =>
				
				nextState := 2;
				
			when 2 =>
				
				nextState := 3;
			
			when others =>
				
				
			end case;

	end process;

end architecture;