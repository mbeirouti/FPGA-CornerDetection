library IEEE;

use ieee.std_logic_1164.all;

entity CornerExtractor is

	port(
		CLOCK: in std_logic
	);
	
end entity;

architecture CornerExtractor_Impl of CornerExtractor is
	
	signal pixelIn1: std_logic_vector(7 downto 0);
	signal RW1,RW2: std_logic := '0';
	
	signal a1,a2,a3,a4,a5,a6,a7,a8,a9,IxIys,Iys,Ixs: std_logic_vector(7 downto 0);
	signal b1,b2,b3,b4,b5,b6,b7,b8,b9,c1,c2,c3,c4,c5,c6,c7,c8,c9: std_logic_vector(7 downto 0);

	component MemoryBlock
	
		generic (
			fip : boolean := true
		);
	
		port(
			CLOCK: in std_logic;
			pixelIn: in std_logic_vector(7 downto 0);
			RW: in std_logic;
			
			p1,p2,p3,p4,p5,p6,p7,p8,p9: out std_logic_vector(7 downto 0)
		);
		
	end component;
	
	component operationOne
	
		PORT
		(
			clk :  IN  STD_LOGIC;
			A :  IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
			B :  IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
			C :  IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
			D :  IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
			E :  IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
			F :  IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
			G :  IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
			H :  IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
			I :  IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
			IxIy :  OUT  STD_LOGIC_VECTOR(7 DOWNTO 0);
			Ixs :  OUT  STD_LOGIC_VECTOR(7 DOWNTO 0);
			Iys :  OUT  STD_LOGIC_VECTOR(7 DOWNTO 0)
		);	
		
	end component;

begin

	MEM1: MemoryBlock generic map(
			fip => true
		)
		port map(
		CLOCK,
		pixelIn1,
		RW1,
		a1,
		a2,
		a3,
		a4,
		a5,
		a6,
		a7,
		a8,
		a9
	);

	
	OP1: operationOne port map(
		CLOCK,
		a1,
		a2,
		a3,
		a4,
		a5,
		a6,
		a7,
		a8,
		a9,
		IxIys,
		Ixs,
		Iys
	);
	
		MEM2: MemoryBlock 			generic map(
			fip => false ) port map(
		CLOCK,
		Ixs,
		RW2,
		b1,
		b2,
		b3,
		b4,
		b5,
		b6,
		b7,
		b8,
		b9
	);

		MEM3: MemoryBlock  generic map(
			fip => false ) port map(
		CLOCK,
		Iys,
		RW2,
		c1,
		c2,
		c3,
		c4,
		c5,
		c6,
		c7,
		c8,
		c9
	);
		MEM4: MemoryBlock generic map(
			fip => false ) port map(
		CLOCK,
		IxIys,
		RW2,
		c1,
		c2,
		c3,
		c4,
		c5,
		c6,
		c7,
		c8,
		c9
	); 
	
	
	
	M1: process(CLOCK)
	
		variable currentState, nextState: integer := 0;
	
	begin
	
		currentState := nextState;
	
		if currentState = 0 then
		
			nextState := 1;
		
		elsif currentState = 1 then
		
			RW1 <= not RW1;
			nextState := 0;
			RW2 <= '1';
			
		end if;
	
	end process;

end architecture;