-- AUTOMATICALLY GENERATED FILE - DO NOT EDIT
library ieee;
use ieee.std_logic_1164.all;

entity LNSSub_CTF_Pos_11_7 is
	port(
		Addr : in std_logic_vector(8 downto 0);
		Val : out std_logic_vector(11 downto 0)
	);
end entity;

architecture arch of LNSSub_CTF_Pos_11_7 is
begin
	with Addr select
		Val <= 
	"100001000001" when "100000000",
	"100000110101" when "100000001",
	"100000101001" when "100000010",
	"100000011100" when "100000011",
	"100000010000" when "100000100",
	"100000000100" when "100000101",
	"------------" when others;
end arch;
