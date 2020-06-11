-- AUTOMATICALLY GENERATED FILE - DO NOT EDIT
library ieee;
use ieee.std_logic_1164.all;

entity LNSSub_CTF_Pos_7_5 is
	port(
		Addr : in std_logic_vector(6 downto 0);
		Val : out std_logic_vector(7 downto 0)
	);
end entity;

architecture arch of LNSSub_CTF_Pos_7_5 is
begin
	with Addr select
		Val <= 
	"10010001" when "1000000",
	"10001101" when "1000001",
	"10001010" when "1000010",
	"10000110" when "1000011",
	"10000011" when "1000100",
	"--------" when others;
end arch;
