-- AUTOMATICALLY GENERATED FILE - DO NOT EDIT
library ieee;
use ieee.std_logic_1164.all;

entity LNSSub_CTF_F1_6_5 is
	port(
		Addr : in std_logic_vector(9 downto 5);
		Val : out std_logic_vector(9 downto 0)
	);
end entity;

architecture arch of LNSSub_CTF_F1_6_5 is
begin
	with Addr select
		Val <= 
	"1110101111" when "11110",
	"0000000000" when "11101",
	"0000111000" when "11100",
	"0001100101" when "11011",
	"0010001110" when "11010",
	"0010110100" when "11001",
	"0011010111" when "11000",
	"0011111010" when "10111",
	"0100011100" when "10110",
	"0100111101" when "10101",
	"0101011110" when "10100",
	"0101111111" when "10011",
	"0110011111" when "10010",
	"----------" when others;
end arch;



library ieee;
use ieee.std_logic_1164.all;

entity LNSSUB_CTF_F2_6_5 is
	port(
		Addr : in std_logic_vector(4 downto 0);
		Val : out std_logic_vector(9 downto 0)
	);
end entity;

architecture arch of LNSSUB_CTF_F2_6_5 is
begin
	with Addr select
		Val <= 
	"1110001111" when "00000",
	"1110001100" when "00001",
	"1110001010" when "00010",
	"1110000111" when "00011",
	"1110000100" when "00100",
	"1110000001" when "00101",
	"1101111110" when "00110",
	"1101111011" when "00111",
	"1101111000" when "01000",
	"1101110100" when "01001",
	"1101110001" when "01010",
	"1101101101" when "01011",
	"1101101001" when "01100",
	"1101100101" when "01101",
	"1101100000" when "01110",
	"1101011011" when "01111",
	"1101010110" when "10000",
	"1101010001" when "10001",
	"1101001011" when "10010",
	"1101000101" when "10011",
	"1100111110" when "10100",
	"1100110110" when "10101",
	"1100101110" when "10110",
	"1100100101" when "10111",
	"1100011010" when "11000",
	"1100001110" when "11001",
	"1100000001" when "11010",
	"1011110000" when "11011",
	"1011011100" when "11100",
	"1011000010" when "11101",
	"1010011101" when "11110",
	"1001011110" when "11111",
	"----------" when others;
end arch;
