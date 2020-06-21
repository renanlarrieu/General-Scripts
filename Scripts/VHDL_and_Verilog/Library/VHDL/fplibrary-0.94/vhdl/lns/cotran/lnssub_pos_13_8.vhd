-- AUTOMATICALLY GENERATED FILE - DO NOT EDIT
library ieee;
use ieee.std_logic_1164.all;

entity LNSSub_CTF_Pos_13_8 is
	port(
		Addr : in std_logic_vector(9 downto 0);
		Val : out std_logic_vector(13 downto 0)
	);
end entity;

architecture arch of LNSSub_CTF_Pos_13_8 is
begin
	with Addr select
		Val <= 
	"10000010000001" when "1000000000",
	"10000001101001" when "1000000001",
	"10000001010001" when "1000000010",
	"10000000111010" when "1000000011",
	"10000000100010" when "1000000100",
	"10000000001010" when "1000000101",
	"--------------" when others;
end arch;
