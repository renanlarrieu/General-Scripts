-- AUTOMATICALLY GENERATED FILE - DO NOT EDIT
library ieee;
use ieee.std_logic_1164.all;

entity LNSSub_CTF_F1_7_5 is
	port(
		Addr : in std_logic_vector(10 downto 5);
		Val : out std_logic_vector(10 downto 0)
	);
end entity;

architecture arch of LNSSub_CTF_F1_7_5 is
begin
	with Addr select
		Val <= 
	"11011001101" when "111110",
	"11101011101" when "111101",
	"11110111001" when "111100",
	"00000000000" when "111011",
	"00000111011" when "111010",
	"00001101111" when "111001",
	"00010011111" when "111000",
	"00011001011" when "110111",
	"00011110100" when "110110",
	"00100011100" when "110101",
	"00101000010" when "110100",
	"00101100111" when "110011",
	"00110001011" when "110010",
	"00110101111" when "110001",
	"00111010010" when "110000",
	"00111110100" when "101111",
	"01000010110" when "101110",
	"01000111000" when "101101",
	"01001011001" when "101100",
	"01001111010" when "101011",
	"01010011011" when "101010",
	"01010111100" when "101001",
	"01011011101" when "101000",
	"01011111101" when "100111",
	"01100011110" when "100110",
	"01100111110" when "100101",
	"01101011110" when "100100",
	"01101111111" when "100011",
	"01110011111" when "100010",
	"01110111111" when "100001",
	"-----------" when others;
end arch;



library ieee;
use ieee.std_logic_1164.all;

entity LNSSUB_CTF_F2_7_5 is
	port(
		Addr : in std_logic_vector(4 downto 0);
		Val : out std_logic_vector(10 downto 0)
	);
end entity;

architecture arch of LNSSUB_CTF_F2_7_5 is
begin
	with Addr select
		Val <= 
	"11010101101" when "00000",
	"11010100111" when "00001",
	"11010100010" when "00010",
	"11010011100" when "00011",
	"11010010110" when "00100",
	"11010010000" when "00101",
	"11010001001" when "00110",
	"11010000010" when "00111",
	"11001111011" when "01000",
	"11001110100" when "01001",
	"11001101100" when "01010",
	"11001100100" when "01011",
	"11001011100" when "01100",
	"11001010011" when "01101",
	"11001001001" when "01110",
	"11000111111" when "01111",
	"11000110100" when "10000",
	"11000101001" when "10001",
	"11000011101" when "10010",
	"11000010000" when "10011",
	"11000000001" when "10100",
	"10111110010" when "10101",
	"10111100001" when "10110",
	"10111001110" when "10111",
	"10110111000" when "11000",
	"10110100000" when "11001",
	"10110000100" when "11010",
	"10101100011" when "11011",
	"10100111010" when "11100",
	"10100000110" when "11101",
	"10010111011" when "11110",
	"10000111100" when "11111",
	"-----------" when others;
end arch;
