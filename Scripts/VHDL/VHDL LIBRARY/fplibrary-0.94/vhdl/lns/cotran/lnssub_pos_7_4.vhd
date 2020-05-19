-- AUTOMATICALLY GENERATED FILE - DO NOT EDIT
library ieee;
use ieee.std_logic_1164.all;

entity LNSSub_CTF_Pos_7_4 is
	port(
		Addr : in std_logic_vector(5 downto 0);
		Val : out std_logic_vector(7 downto 0)
	);
end entity;

architecture arch of LNSSub_CTF_Pos_7_4 is
begin
	with Addr select
		Val <= 
	"10001000" when "100000",
	"10000010" when "100001",
	"--------" when others;
end arch;
