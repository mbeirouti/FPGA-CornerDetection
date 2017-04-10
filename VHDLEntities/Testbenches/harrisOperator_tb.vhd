
library IEEE;
use IEEE.std_logic_1164.all;
 
entity harrisOptestbench is
-- empty
end harrisOptestbench; 

architecture tb of harrisOptestbench is


SIGNAL clk: STD_LOGIC := '0';
CONSTANT clk_period : time := 10ns;
signal finished: STD_logic := '0';




component harrisOperator is
	
	port(
		clk : in std_logic;
		gIxSq, gIySq, gIxIy : in integer range 0 to 255;
		harris : out integer );

end component;


  signal A, B, C : integer ;
  signal output : integer;
  




begin
	
	TESTCOMP : harrisOperator port map (clk, A, B, C, output);
	-- Signal mappings are such that A, B, C are gIxSq, gIySq and gIxIy respectively

  clk <= not clk after clk_period/2 when finished /= '1' else '0';
  
  process
  
  begin
  	wait for clk_period;
   	
    
    A <= 0;
    B <= 0;
    C <= 0;
    wait for clk_period;    
	
    -- not possible
    A <= 65025;
    B <= 65025;
    C <= 65025;
    wait for clk_period;
    
    A <= 255;
    B <= 56;
    C <= 58;
    wait for clk_period;
    
    
    A <= 36;
    B <= 48;
    C <= 231;
    wait for clk_period;
    
    A <= 87;
    B <= 69;
    C <= 217;
    wait for clk_period;
    
    A <= 189;
    B <= 234;
    C <= 174;
    wait for clk_period;

	 A <= 32;
    B <= 147;
    C <= 82;
    wait for clk_period;
    
	 A <= 196;
    B <= 210;
    C <= 52;
    wait for clk_period;

	 A <= 68;
    B <= 154;
    C <= 75;
    wait for clk_period;

	 A <= 145;
    B <= 213;
    C <= 47;
    wait for clk_period;
    
    A <= 135;
    B <= 94;
    C <= 87;
    wait for clk_period;

    assert false report "Tests Complete" severity note;
    
    finished <= '1';
   
    
    wait;
    
  end process;
    
  
end tb;
