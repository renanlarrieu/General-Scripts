-- AUTOMATICALLY GENERATED FILE - DO NOT EDIT
library ieee;
use ieee.std_logic_1164.all;

entity LNSSub_CTF_Pos_6_5 is
	port(
		Addr : in std_logic_vector(6 downto 0);
		Val : out std_logic_vector(6 downto 0)
	);
end entity;

architecture arch of LNSSub_CTF_Pos_6_5 is
begin
	with Addr select
		Val <= 
	"1010001" when "1000000",
	"1001111" when "1000001",
	"1001101" when "1000010",
	"1001011" when "1000011",
	"1001001" when "1000100",
	"1000111" when "1000101",
	"1000101" when "1000110",
	"1000011" when "1000111",
	"1000001" when "1001000",
	"-------" when others;
end arch;
