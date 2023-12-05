library ieee;
use ieee.std_logic_1164.all;
use work.EE232.all;

entity MODULO_6_SYNC is
	port( CLK : in std_logic;
		RSTN : in std_logic;
		UP_DN : in std_logic;
		LDN : in std_logic;
		E : in std_logic;
		D : in std_logic_vector(3 downto 0);
		Q : inout std_logic_vector(3 downto 0));
end MODULO_6_SYNC;

architecture STRUCTURE of MODULO_6_SYNC is 

signal S, S1, S2, S3, S5, S7, C, QN, R : std_logic_vector(3 downto 0);
signal RSTN1 : std_logic;
signal S4, S6 : std_logic_vector(2 downto 0);
signal X : std_logic_vector(5 downto 0);

begin

R(3) <= '0';
R(0) <= '0';
	
	U0 : MUX_2X1 port map(I0 => '1', I1 => '0', S0 => UP_DN, O0 => R(2));
	U1 : MUX_2X1 port map(I0 => '1', I1 => '0', S0 => UP_DN, O0 => R(1));
	U2 : AND_2 port map(Q(2), Q(1), X(0));
	U3 : OR_2 port map(Q(3), X(0), X(1));
	NOT_BANK :
		for i in 0 to 3 generate 
			U4 : NOT_1 port map(Q(i), S5(i));
		end generate;
	U5 : AND_2 port map(S5(3), Q(2), X(2));
	U6 : AND_2 port map(S5(1), Q(0), X(3));
	U7 : AND_2 port map(X(2), X(3), X(4)); --
	U8 : AND_2 port map(S5(3), S5(0), S6(0));
	U9 : AND_2 port map(S5(2), S5(1), S6(1));
	U10 : AND_2 port map(S6(1), S6(0), S7(0)); --
	U11 : MUX_2X1 port map(I0 => S7(0), I1 => X(4), S0 => UP_DN, O0 =>S7(2));
	U12 : OR_2 port map(S7(2), X(1), S7(3));
	U13 : NOT_1 port map(S7(3), X(5));
	R1 : AND_2 port map(X(5), RSTN, RSTN1);
	
	
	
	
	U14 : XOR_2 port map(E, Q(0),S2(0));
	U15 : MUX_2X1 port map(I0 => D(0), I1 => S2(0), S0 => LDN, O0 => S1(0));
	U16 : MUX_2X1 port map(I0 => R(0), I1 => S1(0), S0 => RSTN1, O0 => S(0));
	U17 : D_FF port map(D => S(0), CLK => CLK, CLRN => '1', PREN => '1',Q => Q(0), QN => QN(0));
	U18 : MUX_2X1 port map(I1 => Q(0), I0 => QN(0), S0 => UP_DN, O0 => S3(0));
	U19 : AND_2 port map(S3(0), E, C(0));
	XOR_BANK :
		for i in 0 to 2 generate 
			U20 : XOR_2 port map(C(i), Q(i+1), S2(i+1));
		end generate;
	MUX_BANK1 :
		for i in 1 to 3 generate 
			U21 : MUX_2X1 port map(I0 => D(i), I1 => S2(i), S0 => LDN, O0 => S1(i));
		end generate;
	MUX_BANK2 :
		for i in 1 to 3 generate 
			U22 : MUX_2X1 port map(I0 => R(i), I1 => S1(i), S0 => RSTN1, O0 => S(i));
		end generate;
	DFF_BANK :
		for i in 1 to 3 generate 
			U23 : D_FF port map(D => S(i), CLK => CLK, CLRN => '1', PREN => '1',Q => Q(i), QN => QN(i));
		end generate;
	MUX_BANK3 :
		for i in 1 to 3 generate 
			U24 : MUX_2X1 port map(I1 => Q(i), I0 => QN(i), S0 => UP_DN, O0 => S3(i));
		end generate;
	AND_BANK :
		for i in 0 to 2 generate 
			U25 : AND_2 port map(S3(i+1), C(i), C(i+1));
		end generate;
	
end STRUCTURE;

