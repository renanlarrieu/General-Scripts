-- AUTOMATICALLY GENERATED FILE - DO NOT EDIT
library ieee;
use ieee.std_logic_1164.all;

entity LNSSub_CTF_F1_9_7 is
	port(
		Addr : in std_logic_vector(12 downto 7);
		Val : out std_logic_vector(13 downto 0)
	);
end entity;

architecture arch of LNSSub_CTF_F1_9_7 is
begin
	with Addr select
		Val <= 
	"11101100110010" when "111110",
	"11110101110101" when "111101",
	"11111011100101" when "111100",
	"00000000000000" when "111011",
	"00000011101101" when "111010",
	"00000110111110" when "111001",
	"00001001111011" when "111000",
	"00001100101100" when "110111",
	"00001111010010" when "110110",
	"00010001110000" when "110101",
	"00010100001001" when "110100",
	"00010110011101" when "110011",
	"00011000101110" when "110010",
	"00011010111100" when "110001",
	"00011101000111" when "110000",
	"00011111010000" when "101111",
	"00100001011000" when "101110",
	"00100011011111" when "101101",
	"00100101100100" when "101100",
	"00100111101001" when "101011",
	"00101001101100" when "101010",
	"00101011101111" when "101001",
	"00101101110010" when "101000",
	"00101111110100" when "100111",
	"00110001110110" when "100110",
	"00110011111000" when "100101",
	"00110101111001" when "100100",
	"00110111111010" when "100011",
	"00111001111011" when "100010",
	"00111011111100" when "100001",
	"00111101111101" when "100000",
	"00111111111101" when "011111",
	"01000001111110" when "011110",
	"01000011111110" when "011101",
	"01000101111110" when "011100",
	"01000111111111" when "011011",
	"01001001111111" when "011010",
	"01001011111111" when "011001",
	"--------------" when others;
end arch;



library ieee;
use ieee.std_logic_1164.all;

entity LNSSUB_CTF_F2_9_7 is
	port(
		Addr : in std_logic_vector(6 downto 0);
		Val : out std_logic_vector(13 downto 0)
	);
end entity;

architecture arch of LNSSUB_CTF_F2_9_7 is
begin
	with Addr select
		Val <= 
	"11101010110010" when "0000000",
	"11101010101101" when "0000001",
	"11101010101000" when "0000010",
	"11101010100010" when "0000011",
	"11101010011101" when "0000100",
	"11101010010111" when "0000101",
	"11101010010010" when "0000110",
	"11101010001100" when "0000111",
	"11101010000110" when "0001000",
	"11101010000001" when "0001001",
	"11101001111011" when "0001010",
	"11101001110101" when "0001011",
	"11101001101111" when "0001100",
	"11101001101001" when "0001101",
	"11101001100011" when "0001110",
	"11101001011101" when "0001111",
	"11101001010111" when "0010000",
	"11101001010001" when "0010001",
	"11101001001011" when "0010010",
	"11101001000101" when "0010011",
	"11101000111110" when "0010100",
	"11101000111000" when "0010101",
	"11101000110010" when "0010110",
	"11101000101011" when "0010111",
	"11101000100101" when "0011000",
	"11101000011110" when "0011001",
	"11101000010111" when "0011010",
	"11101000010000" when "0011011",
	"11101000001001" when "0011100",
	"11101000000011" when "0011101",
	"11100111111100" when "0011110",
	"11100111110100" when "0011111",
	"11100111101101" when "0100000",
	"11100111100110" when "0100001",
	"11100111011111" when "0100010",
	"11100111010111" when "0100011",
	"11100111010000" when "0100100",
	"11100111001000" when "0100101",
	"11100111000001" when "0100110",
	"11100110111001" when "0100111",
	"11100110110001" when "0101000",
	"11100110101001" when "0101001",
	"11100110100001" when "0101010",
	"11100110011001" when "0101011",
	"11100110010001" when "0101100",
	"11100110001000" when "0101101",
	"11100110000000" when "0101110",
	"11100101110111" when "0101111",
	"11100101101110" when "0110000",
	"11100101100110" when "0110001",
	"11100101011101" when "0110010",
	"11100101010100" when "0110011",
	"11100101001011" when "0110100",
	"11100101000001" when "0110101",
	"11100100111000" when "0110110",
	"11100100101110" when "0110111",
	"11100100100101" when "0111000",
	"11100100011011" when "0111001",
	"11100100010001" when "0111010",
	"11100100000111" when "0111011",
	"11100011111100" when "0111100",
	"11100011110010" when "0111101",
	"11100011100111" when "0111110",
	"11100011011100" when "0111111",
	"11100011010010" when "1000000",
	"11100011000110" when "1000001",
	"11100010111011" when "1000010",
	"11100010110000" when "1000011",
	"11100010100100" when "1000100",
	"11100010011000" when "1000101",
	"11100010001100" when "1000110",
	"11100001111111" when "1000111",
	"11100001110011" when "1001000",
	"11100001100110" when "1001001",
	"11100001011001" when "1001010",
	"11100001001100" when "1001011",
	"11100000111110" when "1001100",
	"11100000110000" when "1001101",
	"11100000100010" when "1001110",
	"11100000010100" when "1001111",
	"11100000000101" when "1010000",
	"11011111110110" when "1010001",
	"11011111100110" when "1010010",
	"11011111010111" when "1010011",
	"11011111000111" when "1010100",
	"11011110110110" when "1010101",
	"11011110100101" when "1010110",
	"11011110010100" when "1010111",
	"11011110000010" when "1011000",
	"11011101110000" when "1011001",
	"11011101011101" when "1011010",
	"11011101001010" when "1011011",
	"11011100110110" when "1011100",
	"11011100100010" when "1011101",
	"11011100001101" when "1011110",
	"11011011111000" when "1011111",
	"11011011100001" when "1100000",
	"11011011001010" when "1100001",
	"11011010110011" when "1100010",
	"11011010011010" when "1100011",
	"11011010000001" when "1100100",
	"11011001100110" when "1100101",
	"11011001001011" when "1100110",
	"11011000101110" when "1100111",
	"11011000010001" when "1101000",
	"11010111110010" when "1101001",
	"11010111010010" when "1101010",
	"11010110110000" when "1101011",
	"11010110001100" when "1101100",
	"11010101100111" when "1101101",
	"11010100111111" when "1101110",
	"11010100010110" when "1101111",
	"11010011101001" when "1110000",
	"11010010111010" when "1110001",
	"11010010001000" when "1110010",
	"11010001010001" when "1110011",
	"11010000010111" when "1110100",
	"11001111010111" when "1110101",
	"11001110010001" when "1110110",
	"11001101000100" when "1110111",
	"11001011101101" when "1111000",
	"11001010001011" when "1111001",
	"11001000011010" when "1111010",
	"11000110010100" when "1111011",
	"11000011101111" when "1111100",
	"11000000011011" when "1111101",
	"10111011110000" when "1111110",
	"10110011110001" when "1111111",
	"--------------" when others;
end arch;
