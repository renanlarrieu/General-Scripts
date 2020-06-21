-- AUTOMATICALLY GENERATED FILE - DO NOT EDIT
library ieee;
use ieee.std_logic_1164.all;

entity LNSSub_CTF_Pos_8_6 is
	port(
		Addr : in std_logic_vector(7 downto 0);
		Val : out std_logic_vector(8 downto 0)
	);
end entity;

architecture arch of LNSSub_CTF_Pos_8_6 is
begin
	with Addr select
		Val <= 
	"100100001" when "10000000",
	"100011110" when "10000001",
	"100011011" when "10000010",
	"100010111" when "10000011",
	"100010100" when "10000100",
	"100010000" when "10000101",
	"100001100" when "10000110",
	"100001001" when "10000111",
	"100000101" when "10001000",
	"100000010" when "10001001",
	"---------" when others;
end arch;
