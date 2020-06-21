-- AUTOMATICALLY GENERATED FILE - DO NOT EDIT
library ieee;
use ieee.std_logic_1164.all;

entity LNSSub_CTF_Pos_11_8 is
	port(
		Addr : in std_logic_vector(9 downto 0);
		Val : out std_logic_vector(11 downto 0)
	);
end entity;

architecture arch of LNSSub_CTF_Pos_11_8 is
begin
	with Addr select
		Val <= 
	"100010000011" when "1000000000",
	"100001111100" when "1000000001",
	"100001110110" when "1000000010",
	"100001110000" when "1000000011",
	"100001101010" when "1000000100",
	"100001100011" when "1000000101",
	"100001011101" when "1000000110",
	"100001010110" when "1000000111",
	"100001010000" when "1000001000",
	"100001001010" when "1000001001",
	"100001000011" when "1000001010",
	"100000111101" when "1000001011",
	"100000110111" when "1000001100",
	"100000110000" when "1000001101",
	"100000101010" when "1000001110",
	"100000100011" when "1000001111",
	"100000011101" when "1000010000",
	"100000010110" when "1000010001",
	"100000010000" when "1000010010",
	"100000001001" when "1000010011",
	"100000000011" when "1000010100",
	"------------" when others;
end arch;
