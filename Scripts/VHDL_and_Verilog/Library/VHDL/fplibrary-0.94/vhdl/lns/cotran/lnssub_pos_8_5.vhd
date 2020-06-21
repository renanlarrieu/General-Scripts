-- AUTOMATICALLY GENERATED FILE - DO NOT EDIT
library ieee;
use ieee.std_logic_1164.all;

entity LNSSub_CTF_Pos_8_5 is
	port(
		Addr : in std_logic_vector(6 downto 0);
		Val : out std_logic_vector(8 downto 0)
	);
end entity;

architecture arch of LNSSub_CTF_Pos_8_5 is
begin
	with Addr select
		Val <= 
	"100010000" when "1000000",
	"100001010" when "1000001",
	"100000100" when "1000010",
	"---------" when others;
end arch;
