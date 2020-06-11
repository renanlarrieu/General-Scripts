-- AUTOMATICALLY GENERATED FILE - DO NOT EDIT
library ieee;
use ieee.std_logic_1164.all;

entity LNSSub_CTF_Pos_9_7 is
	port(
		Addr : in std_logic_vector(8 downto 0);
		Val : out std_logic_vector(9 downto 0)
	);
end entity;

architecture arch of LNSSub_CTF_Pos_9_7 is
begin
	with Addr select
		Val <= 
	"1001000011" when "100000000",
	"1000111111" when "100000001",
	"1000111100" when "100000010",
	"1000111000" when "100000011",
	"1000110101" when "100000100",
	"1000110010" when "100000101",
	"1000101110" when "100000110",
	"1000101011" when "100000111",
	"1000100111" when "100001000",
	"1000100100" when "100001001",
	"1000100000" when "100001010",
	"1000011101" when "100001011",
	"1000011001" when "100001100",
	"1000010101" when "100001101",
	"1000010010" when "100001110",
	"1000001110" when "100001111",
	"1000001011" when "100010000",
	"1000000111" when "100010001",
	"1000000011" when "100010010",
	"----------" when others;
end arch;
