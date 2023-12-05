library IEEE;
use IEEE.std_logic_1164.all;
use work.EE232.all;

entity MUX_2X1 is
	port(I0, I1, S0 : in std_logic;
		O0 : out std_logic); 
end MUX_2X1;

architecture STRUCTURE of MUX_2X1 is

signal S1,S2,S3: std_logic;

begin
	U0 : AND_2 port map (I0,S0,S2);
	U1 : NOT_1 port map (S0,S1);
	U2 : AND_2 port map (I1,S0,S3);
	U3 : OR_2 port map (S2,S3,O0);

end STRUCTURE;
