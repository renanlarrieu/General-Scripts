-- AUTOMATICALLY GENERATED FILE - DO NOT EDIT
library ieee;
use ieee.std_logic_1164.all;

entity LNSSub_CTF_Pos_10_6 is
	port(
		Addr : in std_logic_vector(7 downto 0);
		Val : out std_logic_vector(10 downto 0)
	);
end entity;

architecture arch of LNSSub_CTF_Pos_10_6 is
begin
	with Addr select
		Val <= 
	"10000100000" when "10000000",
	"10000010100" when "10000001",
	"10000001000" when "10000010",
	"-----------" when others;
end arch;
