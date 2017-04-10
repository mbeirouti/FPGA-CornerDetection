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
	type char_file_t is file of character;
	file inFile: char_file_t;
	file outFile: char_file_t;
	
	--Internal memory
	--Fit for a 800x600 image
	type memory is array (0 to 800*600-1) of std_logic_vector(7 downto 0);
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
		
		variable patchLocationX,patchLocationY: integer := 0;
		
		variable currentState, nextState : integer range 0 to 4 := 0;

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

				--Read the first 4 bytes (word) of the file, image height.
				for i in 0 to 3 loop
				
					read(inFile,inByte);
					imageWidth(7+i*8 downto 0+i*8) := std_logic_vector(to_unsigned(character'pos(inByte),8));		
				
				end loop;

				--Read second 4 bytes(word) of the file, image width.
				
				for i in 0 to 3 loop
				
					read(inFile,inByte);
					imageHeight(7+i*8 downto 0+i*8) := std_logic_vector(to_unsigned(character'pos(inByte),8));
				
				end loop;
				
				iWidth := to_integer(unsigned(imageWidth));
				iHeight := to_integer(unsigned(imageHeight));
				totalSize := iWidth * iHeight;

				--Calculated data segment size.
				report "Calculated size: "& integer'image(totalSize) & " bytes of image data.";

				while not endfile(inFile) loop
					
					read(inFile,inByte);
				
					imageBuffer(currentByte) <= std_logic_vector(to_unsigned(character'pos(inByte),8));
					currentByte := currentByte + 1;

				end loop;
				
				--Setting output
				imgWidth <= imageWidth;
				imgHeight <= imageHeight;
				
				--Signaling that the feed is ready.
				feedReady <= '1';
				
				nextState := 1;
				
			when 1 =>
			
				if sendPatch = '1' then
				
					pixelRow1 <= imageBuffer(patchLocationX+800*patchLocationY) & imageBuffer(patchLocationX+1+800*patchLocationY) & imageBuffer(patchLocationX+2+800*patchLocationY);
					
					pixelRow2 <= imageBuffer(patchLocationX+800*(patchLocationY+1)) & imageBuffer(patchLocationX+1+800*(patchLocationY+1)) & imageBuffer(patchLocationX+2+800*(patchLocationY+1));
					
					pixelRow3 <= imageBuffer(patchLocationX+800*(patchLocationY+2)) & imageBuffer(patchLocationX+1+800*(patchLocationY+2)) & imageBuffer(patchLocationX+2+800*(patchLocationY+2));
				
					nextState := 2;
				
				end if;
				
			when 2 =>
			
				if sendPatch = '1' then
				
					if (patchLocationX + 1) < 800-2 then
						patchLocationX := patchLocationX + 1;
						
					else
					
						report "Row done.";
					
						patchLocationX := 0;
						
						if patchLocationY < 600-2 then
							patchLocationY := patchLocationY + 1;
						else
							feedReady <= '0';
						end if;
						
					end if;
				
					nextState := 1;
				
				end if;
			
			when 3 =>
				
				file_open(outFile, "M1_dump.bin", write_mode);
				
				for i in 0 to 800*600-1 loop
				
					write(outFile,character'val(to_integer(unsigned(imageBuffer(i)))));
				
				end loop;
				
				nextState := 4;
				
			when 4 =>
			
				report "NOP.";
				
			end case;

	end process;

end architecture;