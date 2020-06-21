-- AUTOMATICALLY GENERATED FILE - DO NOT EDIT
library ieee;
use ieee.std_logic_1164.all;

entity LNSSub_CTF_F1_6_4 is
	port(
		Addr : in std_logic_vector(9 downto 4);
		Val : out std_logic_vector(9 downto 0)
	);
end entity;

architecture arch of LNSSub_CTF_F1_6_4 is
begin
	with Addr select
		Val <= 
	"1101100110" when "111110",
	"1110101111" when "111101",
	"1111011101" when "111100",
	"0000000000" when "111011",
	"0000011110" when "111010",
	"0000111000" when "111001",
	"0001001111" when "111000",
	"0001100101" when "110111",
	"0001111010" when "110110",
	"0010001110" when "110101",
	"0010100001" when "110100",
	"0010110100" when "110011",
	"0011000110" when "110010",
	"0011010111" when "110001",
	"0011101001" when "110000",
	"0011111010" when "101111",
	"0100001011" when "101110",
	"0100011100" when "101101",
	"0100101101" when "101100",
	"0100111101" when "101011",
	"0101001110" when "101010",
	"0101011110" when "101001",
	"0101101110" when "101000",
	"0101111111" when "100111",
	"0110001111" when "100110",
	"0110011111" when "100101",
	"----------" when others;
end arch;



library ieee;
use ieee.std_logic_1164.all;

entity LNSSUB_CTF_F2_6_4 is
	port(
		Addr : in std_logic_vector(3 downto 0);
		Val : out std_logic_vector(9 downto 0)
	);
end entity;

architecture arch of LNSSUB_CTF_F2_6_4 is
begin
	with Addr select
		Val <= 
	"1101010110" when "0000",
	"1101010001" when "0001",
	"1101001011" when "0010",
	"1101000101" when "0011",
	"1100111110" when "0100",
	"1100110110" when "0101",
	"1100101110" when "0110",
	"1100100101" when "0111",
	"1100011010" when "1000",
	"1100001110" when "1001",
	"1100000001" when "1010",
	"1011110000" when "1011",
	"1011011100" when "1100",
	"1011000010" when "1101",
	"1010011101" when "1110",
	"1001011110" when "1111",
	"----------" when others;
end arch;
