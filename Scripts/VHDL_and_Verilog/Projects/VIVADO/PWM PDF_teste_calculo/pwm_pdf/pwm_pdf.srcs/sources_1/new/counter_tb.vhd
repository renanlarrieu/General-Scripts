library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use work.modulator_pkg.all;
entity counter_tb is
-- Use lower values for generics to speed up simulation time
generic(
cnt_value_g : integer := 4; -- threshold value for counter
depth_g : integer := 3 -- the number of samples in one period of the signal
);
end entity;
architecture tb of counter_tb is
signal clk_in_s : std_logic := '1'; -- input clock signal
signal cnt_en_s : std_logic := '0'; -- counter enable
signal cnt_out_s : std_logic_vector (depth_g - 1 downto 0) := (others => '0'); -- current counter value
begin
counter : entity work.counter(rtl) -- counter instance
generic map(
cnt_value_g => cnt_value_g,
depth_g => depth_g
)
port map (
clk_in => clk_in_s,
cnt_en => cnt_en_s,
cnt_out => cnt_out_s
);
clk_in_s <= not (clk_in_s) after per_c/2; -- generates 50 MHz input clock signal
cnt_en_s <= '1' after 100 ns, '0' after 120 ns, '1' after 160 ns, '0' after 180 ns, '1' after 220 ns,
'0' after 240 ns, '1' after 320 ns, '0' after 340 ns, '1' after 420 ns, '0' after 440 ns;
end;