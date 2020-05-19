-- AUTOMATICALLY GENERATED FILE - DO NOT EDIT
library ieee;
use ieee.std_logic_1164.all;

entity LNSSub_CTF_Pos_10_7 is
	port(
		Addr : in std_logic_vector(8 downto 0);
		Val : out std_logic_vector(10 downto 0)
	);
end entity;

architecture arch of LNSSub_CTF_Pos_10_7 is
begin
	with Addr select
		Val <= 
	"10001000001" when "100000000",
	"10000111011" when "100000001",
	"10000110101" when "100000010",
	"10000101110" when "100000011",
	"10000101000" when "100000100",
	"10000100010" when "100000101",
	"10000011011" when "100000110",
	"10000010101" when "100000111",
	"10000001110" when "100001000",
	"10000001000" when "100001001",
	"10000000001" when "100001010",
	"-----------" when others;
end arch;
