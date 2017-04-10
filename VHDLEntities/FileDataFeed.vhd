library IEEE;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library STD;

use std.textio.all;

entity FileDataFeed is
	
	generic(
		from_file: boolean := true
	);


	port(
		CLOCK: in std_logic;
		sendPatch: in std_logic;
		pixelIn: in std_logic_vector(7 downto 0);
	
		feedReady: out std_logic := '0';
		pixelRow1,pixelRow2,pixelRow3: out std_logic_vector(23 downto 0) := (others => 'Z')
	);

end entity;

architecture FileDataFeed_Impl of FileDataFeed is

	--File declarations
	type char_file_t is file of character;
	file inFile: char_file_t;
	file outFile: char_file_t;
	
	constant imageWidth: integer := 800;
	constant imageHeight: integer := 600;
	
	--Internal memory
	--Fit for a 800x600 image
	type memory is array (0 to imageHeight+1, 0 to imageWidth+1) of std_logic_vector(7 downto 0);
	signal imageBuffer: memory := (others => (others => (others => '0')));

begin

	FEED_BEHAVIOUR: process(CLOCK)

		variable inLine: line;
		variable outLine: line;
		variable inByte: character;
		variable outByte: character;
		variable currentByte: integer := 0;
		
		variable totalSize: integer := 0;
		
		variable locX,locY: integer := 1;
		
		variable currentState, nextState : integer range 0 to 6 := 0;

	begin

		--State transition
		currentState := nextState;

		--State behaviour
		case currentState is
		
			when 0 =>
				if from_file then
					nextState := 1;
				else
					nextState := 2;
				end if;
			
			when 1 =>
			
				--Open input file
				file_open(inFile, "processedImageData.bin", read_mode);

				--File is written as a hex blob, no newlines.

				totalSize := imageWidth * imageHeight;

				--Calculated data segment size.
				report "Calculated size: "& integer'image(totalSize) & " bytes of image data.";

				while not endfile(inFile) loop
					
					read(inFile,inByte);
						
					imageBuffer(locX,locY) <= std_logic_vector(to_unsigned(character'pos(inByte),8));
					currentByte := currentByte + 1;
							
					if locX < imageHeight then
						locX := locX + 1;
					else
						locX := 1;
						locY := locY + 1;
					end if;

				end loop;
				
				--Signaling that the feed is ready.
				feedReady <= '1';
				locX := 0;
				locY := 0;
				
				nextState := 3;

			when 2 =>
					
					imageBuffer(locX,locY) <= pixelIn;
					
					if locX = imageHeight and locY = imageWidth then
						locX := 0;
						locY := 0;
						
						nextState := 5;
					end if;
					
					if locX < imageHeight then
						locX := locX + 1;
					else
						locX := 1;
						locY := locY + 1;
					end if;
					
					report integer'image(locY);
			
			when 3 =>
			
				if sendPatch = '1' then
				
					pixelRow1 <= imageBuffer(locX,locY) & imageBuffer(locX+1,locY) & imageBuffer(locX+2,locY);
					
					pixelRow2 <= imageBuffer(locX,locY+1) & imageBuffer(locX+1,locY+1) & imageBuffer(locX+2,locY+1);
					
					pixelRow3 <= imageBuffer(locX,locY+2) & imageBuffer(locX+1,locY+2) & imageBuffer(locX+2,locY+2);
				
					nextState := 4;
				
				end if;
				
			when 4 =>
			
				if sendPatch = '1' then
				
					if (locX + 1) < imageWidth-1 then
						locX := locX + 1;
						
					else
					
						report "Row done.";
						
						nextState := 3;
					
						locX := 0;
						
						if locY < imageHeight-1 then
							locY := locY + 1;
						else
							feedReady <= '0';
							nextState := 5;
						end if;
						
					end if;
				
				end if;
			
			when 5 =>
				
				file_open(outFile, "M1_dump.bin", write_mode);
				
				for i in 1 to imageWidth loop
					for j in 1 to imageHeight loop
				
						write(outFile,character'val(to_integer(unsigned(imageBuffer(j,i)))));
				
					end loop;
				end loop;
				
				nextState := 6;
				
			when 6 =>
			
				report "NOP.";
				
			end case;

	end process;

end architecture;