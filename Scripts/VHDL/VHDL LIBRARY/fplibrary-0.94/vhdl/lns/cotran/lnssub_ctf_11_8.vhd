-- AUTOMATICALLY GENERATED FILE - DO NOT EDIT
library ieee;
use ieee.std_logic_1164.all;

entity LNSSub_CTF_F1_11_8 is
	port(
		Addr : in std_logic_vector(14 downto 8);
		Val : out std_logic_vector(15 downto 0)
	);
end entity;

architecture arch of LNSSub_CTF_F1_11_8 is
begin
	with Addr select
		Val <= 
	"1110010001000110" when "1111110",
	"1110110011001001" when "1111101",
	"1111000111111011" when "1111100",
	"1111010111010100" when "1111011",
	"1111100011101111" when "1111010",
	"1111101110010100" when "1111001",
	"1111110111101000" when "1111000",
	"0000000000000000" when "1110111",
	"0000000111101100" when "1110110",
	"0000001110110100" when "1110101",
	"0000010101100001" when "1110100",
	"0000011011110111" when "1110011",
	"0000100001111010" when "1110010",
	"0000100111101110" when "1110001",
	"0000101101010011" when "1110000",
	"0000110010101110" when "1101111",
	"0000110111111111" when "1101110",
	"0000111101000111" when "1101101",
	"0001000010000111" when "1101100",
	"0001000111000001" when "1101011",
	"0001001011110101" when "1101010",
	"0001010000100101" when "1101001",
	"0001010101001111" when "1101000",
	"0001011001110101" when "1100111",
	"0001011110011000" when "1100110",
	"0001100010111000" when "1100101",
	"0001100111010101" when "1100100",
	"0001101011101111" when "1100011",
	"0001110000000110" when "1100010",
	"0001110100011100" when "1100001",
	"0001111000101111" when "1100000",
	"0001111101000001" when "1011111",
	"0010000001010010" when "1011110",
	"0010000101100000" when "1011101",
	"0010001001101110" when "1011100",
	"0010001101111010" when "1011011",
	"0010010010000110" when "1011010",
	"0010010110010000" when "1011001",
	"0010011010011010" when "1011000",
	"0010011110100010" when "1010111",
	"0010100010101010" when "1010110",
	"0010100110110001" when "1010101",
	"0010101010111000" when "1010100",
	"0010101110111110" when "1010011",
	"0010110011000100" when "1010010",
	"0010110111001001" when "1010001",
	"0010111011001101" when "1010000",
	"0010111111010001" when "1001111",
	"0011000011010101" when "1001110",
	"0011000111011001" when "1001101",
	"0011001011011100" when "1001100",
	"0011001111011111" when "1001011",
	"0011010011100010" when "1001010",
	"0011010111100100" when "1001001",
	"0011011011100111" when "1001000",
	"0011011111101001" when "1000111",
	"0011100011101011" when "1000110",
	"0011100111101101" when "1000101",
	"0011101011101110" when "1000100",
	"0011101111110000" when "1000011",
	"0011110011110001" when "1000010",
	"0011110111110010" when "1000001",
	"0011111011110011" when "1000000",
	"0011111111110100" when "0111111",
	"0100000011110101" when "0111110",
	"0100000111110110" when "0111101",
	"0100001011110111" when "0111100",
	"0100001111111000" when "0111011",
	"0100010011111001" when "0111010",
	"0100010111111001" when "0111001",
	"0100011011111010" when "0111000",
	"0100011111111010" when "0110111",
	"0100100011111011" when "0110110",
	"0100100111111011" when "0110101",
	"0100101011111100" when "0110100",
	"0100101111111100" when "0110011",
	"0100110011111100" when "0110010",
	"0100110111111101" when "0110001",
	"0100111011111101" when "0110000",
	"0100111111111101" when "0101111",
	"0101000011111101" when "0101110",
	"0101000111111110" when "0101101",
	"0101001011111110" when "0101100",
	"0101001111111110" when "0101011",
	"0101010011111110" when "0101010",
	"0101010111111110" when "0101001",
	"0101011011111110" when "0101000",
	"0101011111111111" when "0100111",
	"0101100011111111" when "0100110",
	"0101100111111111" when "0100101",
	"0101101011111111" when "0100100",
	"0101101111111111" when "0100011",
	"----------------" when others;
end arch;



library ieee;
use ieee.std_logic_1164.all;

entity LNSSUB_CTF_F2_11_8 is
	port(
		Addr : in std_logic_vector(7 downto 0);
		Val : out std_logic_vector(15 downto 0)
	);
end entity;

architecture arch of LNSSUB_CTF_F2_11_8 is
begin
	with Addr select
		Val <= 
	"1110001101000110" when "00000000",
	"1110001100111011" when "00000001",
	"1110001100110000" when "00000010",
	"1110001100100101" when "00000011",
	"1110001100011001" when "00000100",
	"1110001100001110" when "00000101",
	"1110001100000011" when "00000110",
	"1110001011111000" when "00000111",
	"1110001011101100" when "00001000",
	"1110001011100001" when "00001001",
	"1110001011010101" when "00001010",
	"1110001011001010" when "00001011",
	"1110001010111110" when "00001100",
	"1110001010110010" when "00001101",
	"1110001010100111" when "00001110",
	"1110001010011011" when "00001111",
	"1110001010001111" when "00010000",
	"1110001010000011" when "00010001",
	"1110001001110111" when "00010010",
	"1110001001101100" when "00010011",
	"1110001001100000" when "00010100",
	"1110001001010011" when "00010101",
	"1110001001000111" when "00010110",
	"1110001000111011" when "00010111",
	"1110001000101111" when "00011000",
	"1110001000100011" when "00011001",
	"1110001000010110" when "00011010",
	"1110001000001010" when "00011011",
	"1110000111111110" when "00011100",
	"1110000111110001" when "00011101",
	"1110000111100101" when "00011110",
	"1110000111011000" when "00011111",
	"1110000111001011" when "00100000",
	"1110000110111111" when "00100001",
	"1110000110110010" when "00100010",
	"1110000110100101" when "00100011",
	"1110000110011000" when "00100100",
	"1110000110001011" when "00100101",
	"1110000101111110" when "00100110",
	"1110000101110001" when "00100111",
	"1110000101100100" when "00101000",
	"1110000101010111" when "00101001",
	"1110000101001001" when "00101010",
	"1110000100111100" when "00101011",
	"1110000100101111" when "00101100",
	"1110000100100001" when "00101101",
	"1110000100010011" when "00101110",
	"1110000100000110" when "00101111",
	"1110000011111000" when "00110000",
	"1110000011101010" when "00110001",
	"1110000011011101" when "00110010",
	"1110000011001111" when "00110011",
	"1110000011000001" when "00110100",
	"1110000010110011" when "00110101",
	"1110000010100101" when "00110110",
	"1110000010010111" when "00110111",
	"1110000010001000" when "00111000",
	"1110000001111010" when "00111001",
	"1110000001101100" when "00111010",
	"1110000001011101" when "00111011",
	"1110000001001111" when "00111100",
	"1110000001000000" when "00111101",
	"1110000000110001" when "00111110",
	"1110000000100010" when "00111111",
	"1110000000010100" when "01000000",
	"1110000000000101" when "01000001",
	"1101111111110110" when "01000010",
	"1101111111100111" when "01000011",
	"1101111111010111" when "01000100",
	"1101111111001000" when "01000101",
	"1101111110111001" when "01000110",
	"1101111110101001" when "01000111",
	"1101111110011010" when "01001000",
	"1101111110001010" when "01001001",
	"1101111101111011" when "01001010",
	"1101111101101011" when "01001011",
	"1101111101011011" when "01001100",
	"1101111101001011" when "01001101",
	"1101111100111011" when "01001110",
	"1101111100101011" when "01001111",
	"1101111100011010" when "01010000",
	"1101111100001010" when "01010001",
	"1101111011111010" when "01010010",
	"1101111011101001" when "01010011",
	"1101111011011000" when "01010100",
	"1101111011001000" when "01010101",
	"1101111010110111" when "01010110",
	"1101111010100110" when "01010111",
	"1101111010010101" when "01011000",
	"1101111010000100" when "01011001",
	"1101111001110011" when "01011010",
	"1101111001100001" when "01011011",
	"1101111001010000" when "01011100",
	"1101111000111110" when "01011101",
	"1101111000101100" when "01011110",
	"1101111000011011" when "01011111",
	"1101111000001001" when "01100000",
	"1101110111110111" when "01100001",
	"1101110111100101" when "01100010",
	"1101110111010010" when "01100011",
	"1101110111000000" when "01100100",
	"1101110110101101" when "01100101",
	"1101110110011011" when "01100110",
	"1101110110001000" when "01100111",
	"1101110101110101" when "01101000",
	"1101110101100010" when "01101001",
	"1101110101001111" when "01101010",
	"1101110100111100" when "01101011",
	"1101110100101000" when "01101100",
	"1101110100010101" when "01101101",
	"1101110100000001" when "01101110",
	"1101110011101101" when "01101111",
	"1101110011011001" when "01110000",
	"1101110011000101" when "01110001",
	"1101110010110001" when "01110010",
	"1101110010011101" when "01110011",
	"1101110010001000" when "01110100",
	"1101110001110011" when "01110101",
	"1101110001011111" when "01110110",
	"1101110001001010" when "01110111",
	"1101110000110100" when "01111000",
	"1101110000011111" when "01111001",
	"1101110000001010" when "01111010",
	"1101101111110100" when "01111011",
	"1101101111011110" when "01111100",
	"1101101111001000" when "01111101",
	"1101101110110010" when "01111110",
	"1101101110011100" when "01111111",
	"1101101110000101" when "10000000",
	"1101101101101111" when "10000001",
	"1101101101011000" when "10000010",
	"1101101101000001" when "10000011",
	"1101101100101001" when "10000100",
	"1101101100010010" when "10000101",
	"1101101011111010" when "10000110",
	"1101101011100011" when "10000111",
	"1101101011001011" when "10001000",
	"1101101010110010" when "10001001",
	"1101101010011010" when "10001010",
	"1101101010000001" when "10001011",
	"1101101001101000" when "10001100",
	"1101101001001111" when "10001101",
	"1101101000110110" when "10001110",
	"1101101000011100" when "10001111",
	"1101101000000011" when "10010000",
	"1101100111101001" when "10010001",
	"1101100111001110" when "10010010",
	"1101100110110100" when "10010011",
	"1101100110011001" when "10010100",
	"1101100101111110" when "10010101",
	"1101100101100011" when "10010110",
	"1101100101001000" when "10010111",
	"1101100100101100" when "10011000",
	"1101100100010000" when "10011001",
	"1101100011110011" when "10011010",
	"1101100011010111" when "10011011",
	"1101100010111010" when "10011100",
	"1101100010011101" when "10011101",
	"1101100001111111" when "10011110",
	"1101100001100001" when "10011111",
	"1101100001000011" when "10100000",
	"1101100000100101" when "10100001",
	"1101100000000110" when "10100010",
	"1101011111100111" when "10100011",
	"1101011111000111" when "10100100",
	"1101011110101000" when "10100101",
	"1101011110001000" when "10100110",
	"1101011101100111" when "10100111",
	"1101011101000110" when "10101000",
	"1101011100100101" when "10101001",
	"1101011100000011" when "10101010",
	"1101011011100001" when "10101011",
	"1101011010111111" when "10101100",
	"1101011010011100" when "10101101",
	"1101011001111000" when "10101110",
	"1101011001010101" when "10101111",
	"1101011000110000" when "10110000",
	"1101011000001100" when "10110001",
	"1101010111100111" when "10110010",
	"1101010111000001" when "10110011",
	"1101010110011011" when "10110100",
	"1101010101110100" when "10110101",
	"1101010101001101" when "10110110",
	"1101010100100101" when "10110111",
	"1101010011111101" when "10111000",
	"1101010011010100" when "10111001",
	"1101010010101011" when "10111010",
	"1101010010000001" when "10111011",
	"1101010001010110" when "10111100",
	"1101010000101011" when "10111101",
	"1101001111111111" when "10111110",
	"1101001111010010" when "10111111",
	"1101001110100101" when "11000000",
	"1101001101110111" when "11000001",
	"1101001101001000" when "11000010",
	"1101001100011001" when "11000011",
	"1101001011101000" when "11000100",
	"1101001010110111" when "11000101",
	"1101001010000101" when "11000110",
	"1101001001010010" when "11000111",
	"1101001000011111" when "11001000",
	"1101000111101010" when "11001001",
	"1101000110110100" when "11001010",
	"1101000101111101" when "11001011",
	"1101000101000110" when "11001100",
	"1101000100001101" when "11001101",
	"1101000011010011" when "11001110",
	"1101000010011000" when "11001111",
	"1101000001011011" when "11010000",
	"1101000000011101" when "11010001",
	"1100111111011110" when "11010010",
	"1100111110011110" when "11010011",
	"1100111101011100" when "11010100",
	"1100111100011001" when "11010101",
	"1100111011010100" when "11010110",
	"1100111010001101" when "11010111",
	"1100111001000100" when "11011000",
	"1100110111111010" when "11011001",
	"1100110110101110" when "11011010",
	"1100110101100000" when "11011011",
	"1100110100001111" when "11011100",
	"1100110010111100" when "11011101",
	"1100110001100111" when "11011110",
	"1100110000010000" when "11011111",
	"1100101110110101" when "11100000",
	"1100101101011000" when "11100001",
	"1100101011110111" when "11100010",
	"1100101010010100" when "11100011",
	"1100101000101101" when "11100100",
	"1100100111000010" when "11100101",
	"1100100101010011" when "11100110",
	"1100100011011111" when "11100111",
	"1100100001100111" when "11101000",
	"1100011111101010" when "11101001",
	"1100011101100111" when "11101010",
	"1100011011011110" when "11101011",
	"1100011001001110" when "11101100",
	"1100010110110111" when "11101101",
	"1100010100011000" when "11101110",
	"1100010001110000" when "11101111",
	"1100001110111101" when "11110000",
	"1100001011111111" when "11110001",
	"1100001000110100" when "11110010",
	"1100000101011001" when "11110011",
	"1100000001101101" when "11110100",
	"1011111101101101" when "11110101",
	"1011111001010011" when "11110110",
	"1011110100011101" when "11110111",
	"1011101111000001" when "11111000",
	"1011101000110111" when "11111001",
	"1011100001110000" when "11111010",
	"1011011001010110" when "11111011",
	"1011001111000011" when "11111100",
	"1011000001110010" when "11111101",
	"1010101111000100" when "11111110",
	"1010001111000101" when "11111111",
	"----------------" when others;
end arch;
