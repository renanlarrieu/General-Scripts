library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity PRNG is
	generic (
		w : natural := 8		-- <= 32
	);
	port (
		clk : in std_logic;
		reset : in std_logic;
		val : out std_logic_vector(w - 1 downto 0)
	);
end entity;

architecture arch of PRNG is

	signal s0, s1, s2 : unsigned(31 downto 0);
	signal val32 : unsigned(31 downto 0);
begin
	process(clk, reset)
		variable b0, b1, b2 : unsigned(31 downto 0);
	begin
		if reset = '0' then
			s0 <= X"BAADF00D";
			s1 <= X"DEADBEEF";
			s2 <= X"CAFEBABE";
		elsif rising_edge(clk) then
			b0 := (shift_left(s0, 13) xor s0) srl 19;
			s0 <= ((s0 srl 1) sll 13) xor b0;
			b1 := ((s1 sll 2) xor s1) srl 25;
			s1 <= ((s1 srl 3) sll 7) xor b1;
			b2 := ((s2 sll 3) xor s2) srl 11;
			s2 <= ((s2 srl 4) sll 21) xor b2;
		end if;
	end process;

	--val <= (w-1 downto 0 => '0');
	val32 <= (s0 xor s1 xor s2);
	val <= std_logic_vector(val32(w-1 downto 0));
	
end architecture;
