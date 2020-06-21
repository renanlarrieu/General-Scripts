library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

-- include user defined modulator_pkg package where are important related
-- declarations that serve a common purpose

use work.modulator_pkg.all;
entity frequency_trigger_tb is

-- use lower values for generics to speed up simulation time
generic(
div_factor_freqhigh_g : integer := 2; -- input clock division factor when sw0 = ’1’ (an example)
div_factor_freqlow_g : integer := 4 -- input clock division factor when sw0 = ’0’ (an example)
);

end entity;
architecture tb of frequency_trigger_tb is
signal clk_in_s : std_logic := '1'; -- input clock signal
signal freq_trig_s : std_logic := '1'; -- signal which frequency depends on the sw0 state
signal sw0_s : std_logic := '0'; -- signal for selecting frequency

begin

-- instantiation of device under test (DUT)
-- no component definition is necessary
-- use keyword entity, work is the library

freq_ce : entity work.frequency_trigger (rtl)
port map(
clk_in => clk_in_s,
sw0 => sw0_s,
div_factor_freqhigh => conv_std_logic_vector(div_factor_freqhigh_g, 32),
div_factor_freqlow => conv_std_logic_vector(div_factor_freqlow_g, 32),
freq_trig => freq_trig_s
);

clk_in_s <= not (clk_in_s) after per_c/2; -- generates 50 MHz input clock signal;
sw0_s <= '1' after 200 ns;

end;