-- AUTOMATICALLY GENERATED FILE - DO NOT EDIT
library ieee;
use ieee.std_logic_1164.all;

entity LNSSub_CTF_Pos_6_4 is
	port(
		Addr : in std_logic_vector(5 downto 0);
		Val : out std_logic_vector(6 downto 0)
	);
end entity;

architecture arch of LNSSub_CTF_Pos_6_4 is
begin
	with Addr select
		Val <= 
	"1001000" when "100000",
	"1000101" when "100001",
	"1000001" when "100010",
	"-------" when others;
end arch;
