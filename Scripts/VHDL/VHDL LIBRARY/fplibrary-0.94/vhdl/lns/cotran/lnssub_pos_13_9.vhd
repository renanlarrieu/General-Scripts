-- AUTOMATICALLY GENERATED FILE - DO NOT EDIT
library ieee;
use ieee.std_logic_1164.all;

entity LNSSub_CTF_Pos_13_9 is
	port(
		Addr : in std_logic_vector(10 downto 0);
		Val : out std_logic_vector(13 downto 0)
	);
end entity;

architecture arch of LNSSub_CTF_Pos_13_9 is
begin
	with Addr select
		Val <= 
	"10000100000011" when "10000000000",
	"10000011110111" when "10000000001",
	"10000011101011" when "10000000010",
	"10000011011111" when "10000000011",
	"10000011010010" when "10000000100",
	"10000011000110" when "10000000101",
	"10000010111010" when "10000000110",
	"10000010101110" when "10000000111",
	"10000010100010" when "10000001000",
	"10000010010110" when "10000001001",
	"10000010001010" when "10000001010",
	"10000001111110" when "10000001011",
	"10000001110001" when "10000001100",
	"10000001100101" when "10000001101",
	"10000001011001" when "10000001110",
	"10000001001101" when "10000001111",
	"10000001000001" when "10000010000",
	"10000000110100" when "10000010001",
	"10000000101000" when "10000010010",
	"10000000011100" when "10000010011",
	"10000000010000" when "10000010100",
	"10000000000011" when "10000010101",
	"--------------" when others;
end arch;
