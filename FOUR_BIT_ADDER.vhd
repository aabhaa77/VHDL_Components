LIBRARY IEEE;
use IEEE.std_logic_1164.all;
use work.EE232.all;

entity FOUR_BIT_ADDER IS

	port (A : in std_logic_vector(3 downto 0);
		B : in std_logic_vector(3 downto 0);
		CIN : in std_logic;
		SUM : out std_logic_vector(4 downto 0));
		
end FOUR_BIT_ADDER;

architecture STRUCTURE of FOUR_BIT_ADDER is

signal S0, S1, S2 : std_logic;

begin
	FA1 : FULL_ADDER port map (A(0), B(0), CIN, SUM(0), S0);
	FA2 : FULL_ADDER port map (A(1), B(1), S0, SUM(1), S1);
	FA3 : FULL_ADDER port map (A(2), B(2), S1, SUM(2), S2);
	FA4 : FULL_ADDER port map (A(3), B(3), S2, SUM(3), SUM(4));
END STRUCTURE;