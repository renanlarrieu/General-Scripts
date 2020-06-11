library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use work.modulator_pkg.all;

entity sine_top_tb is
-- Use lower values for div_factor_freqhigh_g and div_factor_freqlow_g generics to speed up simulation
-- time
generic(
cntampl_value_g : integer := 255; -- threshold value for counter,
-- it's value should be equal to (2^depth)-1
depth_g : integer range 1 to 99 := 8; -- the number of samples in one period of the signal
width_g : integer range 1 to 99 := 12; -- the number of bits used to represent amplitude value
div_factor_freqhigh_g : integer := 55; -- threshold value for high frequency
div_factor_freqlow_g : integer := 195 -- threshold value for low frequency
);
end entity;
architecture tb of sine_top_tb is
signal clk_in_s : std_logic := '0'; -- input clock signal
signal sw0_s : std_logic := '0'; -- signal used for selecting frequency
signal sine_out_s : std_logic_vector(width_g-1 downto 0) := (others=>'0');
-- current amplitude value of the sine signal
begin
-- sine_top module instance
dut : entity work.sine_top

generic map(
cntampl_value_g => cntampl_value_g,
depth_g => depth_g,
width_g => width_g
)
port map(
clk_in => clk_in_s,
sw0 => sw0_s,
div_factor_freqhigh => conv_std_logic_vector(div_factor_freqhigh_g, 32),
div_factor_freqlow => conv_std_logic_vector(div_factor_freqlow_g, 32),
sine_out => sine_out_s
);
clk_in_s <= not (clk_in_s) after per_c/2; -- 50 MHz input clock signal
sw0_s <= '0', '1' after 1 ms;
end;