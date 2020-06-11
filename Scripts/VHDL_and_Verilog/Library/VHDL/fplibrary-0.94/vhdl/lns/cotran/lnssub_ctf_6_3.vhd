-- AUTOMATICALLY GENERATED FILE - DO NOT EDIT
library ieee;
use ieee.std_logic_1164.all;

entity LNSSub_CTF_F1_6_3 is
	port(
		Addr : in std_logic_vector(9 downto 3);
		Val : out std_logic_vector(9 downto 0)
	);
end entity;

architecture arch of LNSSub_CTF_F1_6_3 is
begin
	with Addr select
		Val <= 
	"1101100110" when "1111101",
	"1110010000" when "1111100",
	"1110101111" when "1111011",
	"1111000111" when "1111010",
	"1111011101" when "1111001",
	"1111101111" when "1111000",
	"0000000000" when "1110111",
	"0000001111" when "1110110",
	"0000011110" when "1110101",
	"0000101011" when "1110100",
	"0000111000" when "1110011",
	"0001000100" when "1110010",
	"0001001111" when "1110001",
	"0001011011" when "1110000",
	"0001100101" when "1101111",
	"0001110000" when "1101110",
	"0001111010" when "1101101",
	"0010000100" when "1101100",
	"0010001110" when "1101011",
	"0010011000" when "1101010",
	"0010100001" when "1101001",
	"0010101010" when "1101000",
	"0010110100" when "1100111",
	"0010111101" when "1100110",
	"0011000110" when "1100101",
	"0011001111" when "1100100",
	"0011010111" when "1100011",
	"0011100000" when "1100010",
	"0011101001" when "1100001",
	"0011110001" when "1100000",
	"0011111010" when "1011111",
	"0100000011" when "1011110",
	"0100001011" when "1011101",
	"0100010011" when "1011100",
	"0100011100" when "1011011",
	"0100100100" when "1011010",
	"0100101101" when "1011001",
	"0100110101" when "1011000",
	"0100111101" when "1010111",
	"0101000101" when "1010110",
	"0101001110" when "1010101",
	"0101010110" when "1010100",
	"0101011110" when "1010011",
	"0101100110" when "1010010",
	"0101101110" when "1010001",
	"0101110110" when "1010000",
	"0101111111" when "1001111",
	"0110000111" when "1001110",
	"0110001111" when "1001101",
	"0110010111" when "1001100",
	"0110011111" when "1001011",
	"----------" when others;
end arch;



library ieee;
use ieee.std_logic_1164.all;

entity LNSSUB_CTF_F2_6_3 is
	port(
		Addr : in std_logic_vector(2 downto 0);
		Val : out std_logic_vector(9 downto 0)
	);
end entity;

architecture arch of LNSSUB_CTF_F2_6_3 is
begin
	with Addr select
		Val <= 
	"1100011010" when "000",
	"1100001110" when "001",
	"1100000001" when "010",
	"1011110000" when "011",
	"1011011100" when "100",
	"1011000010" when "101",
	"1010011101" when "110",
	"1001011110" when "111",
	"----------" when others;
end arch;
