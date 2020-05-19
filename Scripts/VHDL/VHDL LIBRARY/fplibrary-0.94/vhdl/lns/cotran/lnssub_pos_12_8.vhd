-- AUTOMATICALLY GENERATED FILE - DO NOT EDIT
library ieee;
use ieee.std_logic_1164.all;

entity LNSSub_CTF_Pos_12_8 is
	port(
		Addr : in std_logic_vector(9 downto 0);
		Val : out std_logic_vector(12 downto 0)
	);
end entity;

architecture arch of LNSSub_CTF_Pos_12_8 is
begin
	with Addr select
		Val <= 
	"1000010000001" when "1000000000",
	"1000001110101" when "1000000001",
	"1000001101001" when "1000000010",
	"1000001011101" when "1000000011",
	"1000001010001" when "1000000100",
	"1000001000101" when "1000000101",
	"1000000111001" when "1000000110",
	"1000000101100" when "1000000111",
	"1000000100000" when "1000001000",
	"1000000010100" when "1000001001",
	"1000000001000" when "1000001010",
	"-------------" when others;
end arch;
