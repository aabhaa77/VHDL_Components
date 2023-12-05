library IEEE;
use IEEE.std_logic_1164.all;
use work.EE232.all;

entity FULL_ADDER is

	port( I0, I1,  I2: in std_logic;
			S, C : out std_logic);
end FULL_ADDER;

architecture STRUCTURE of FULL_ADDER is

signal S0, S1, S2 : std_logic;

begin
U0 : HALF_ADDER port map (I0, I1, S0, S1);
U1 : HALF_ADDER port map(S0, I2, S, S2);
U2 : OR_2 port map (S1, S2, C);

	
end STRUCTURE;