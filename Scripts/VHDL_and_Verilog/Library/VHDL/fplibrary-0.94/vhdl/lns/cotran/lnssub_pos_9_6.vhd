-- AUTOMATICALLY GENERATED FILE - DO NOT EDIT
library ieee;
use ieee.std_logic_1164.all;

entity LNSSub_CTF_Pos_9_6 is
	port(
		Addr : in std_logic_vector(7 downto 0);
		Val : out std_logic_vector(9 downto 0)
	);
end entity;

architecture arch of LNSSub_CTF_Pos_9_6 is
begin
	with Addr select
		Val <= 
	"1000100001" when "10000000",
	"1000011010" when "10000001",
	"1000010100" when "10000010",
	"1000001110" when "10000011",
	"1000000111" when "10000100",
	"1000000001" when "10000101",
	"----------" when others;
end arch;
