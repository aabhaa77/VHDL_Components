library IEEE;
use IEEE.std_logic_1164.all;
use work.EE232.all;

entity HALF_ADDER is

	port( A, B : in std_logic;
			S, C : out std_logic);
end HALF_ADDER;

architecture STRUCTURE of HALF_ADDER is

begin
U0 : XOR_2 port map (A, B, S);
U1 : AND_2 port map(A, B, C);

	
end STRUCTURE;