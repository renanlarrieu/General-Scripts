-- AUTOMATICALLY GENERATED FILE - DO NOT EDIT
library ieee;
use ieee.std_logic_1164.all;

entity LNSSub_CTF_Pos_7_6 is
	port(
		Addr : in std_logic_vector(7 downto 0);
		Val : out std_logic_vector(7 downto 0)
	);
end entity;

architecture arch of LNSSub_CTF_Pos_7_6 is
begin
	with Addr select
		Val <= 
	"10100011" when "10000000",
	"10100001" when "10000001",
	"10011111" when "10000010",
	"10011101" when "10000011",
	"10011011" when "10000100",
	"10011001" when "10000101",
	"10010111" when "10000110",
	"10010100" when "10000111",
	"10010010" when "10001000",
	"10010000" when "10001001",
	"10001110" when "10001010",
	"10001100" when "10001011",
	"10001010" when "10001100",
	"10001000" when "10001101",
	"10000110" when "10001110",
	"10000011" when "10001111",
	"10000001" when "10010000",
	"--------" when others;
end arch;
