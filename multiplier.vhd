LIBRARY IEEE;
use IEEE.std_logic_1164.all;
use work.EE232.all;

entity multiplier IS

	port (A, B : in std_logic_vector(3 downto 0);
		P : out std_logic_vector(7 downto 0));
		
end multiplier;

ARCHITECTURE STRUCTURE OF multiplier IS

SIGNAL S0, S1, S2, S3 : STD_logic_VECTOR(3 DOWNTO 0);
SIGNAL SOUT1, SOUT2, SOUT3 : STD_logic_VECTOR(4 DOWNTO 0);
--SIGNAL shift_sig : std_logic_vector(4 DOWNTO 0);
BEGIN

	AND_BANK:
	
	for i in 0 to 3 generate
		U0 : AND_2 PORT MAP (A(i), B(0), S0(i));
		U1 : AND_2 PORT MAP (A(i), B(1), S1(i));
		U2 : AND_2 PORT MAP (A(i), B(2), S2(i));
		U3 : AND_2 PORT MAP (A(i), B(3), S3(i));
	END GENERATE;

--	shift_sig <= S0(3 downto 0) & '0';
	U4 : FOUR_BIT_ADDER PORT MAP ('0' & S0(3 DOWNTO 1), S1(3 DOWNTO 0), '0', SOUT1(4 DOWNTO 0));
	U5 : FOUR_BIT_ADDER PORT MAP (SOUT1(4 DOWNTO 1), S2(3 DOWNTO 0), '0', SOUT2(4 DOWNTO 0));
	U6 : FOUR_BIT_ADDER PORT MAP (SOUT2(4 DOWNTO 1), S3(3 DOWNTO 0), '0', SOUT3(4 DOWNTO 0));

	P <= SOUT3(4 DOWNTO 0) & SOUT2(0) & SOUT1(0) & S0(0);
END STRUCTURE;
