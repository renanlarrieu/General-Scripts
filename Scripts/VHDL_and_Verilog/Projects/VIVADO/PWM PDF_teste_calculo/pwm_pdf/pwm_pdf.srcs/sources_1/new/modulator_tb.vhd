library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use work.modulator_pkg.all;
entity modulator_tb is
generic(
-- Parameter that specifies major characteristics of the board that will be used
-- to implement the modulator design
-- Possible choices: """lx9""", """zedboard""", """ml605""", """kc705""", """microzed""", ""socius"

-- Adjust the modulator_pkg.vhd file to add more
board_name_g : string := """zedboard""";
-- User defined settings for the pwm design
design_setting_g : design_setting_t_rec := design_setting_c
);
end entity;
architecture tb of modulator_tb is
signal clk_in_s : std_logic := '1'; -- input clock signal
signal sw0_s : std_logic := '1'; -- signal made for selecting frequency
signal pwm_s : std_logic := '0'; -- pulse width modulated signal
-- period of input clock signal
constant clock_period_c : time := 1000000000.0 / get_board_info_f(board_name_g).fclk * 1ns;
-- constant created to short the duration of the simulation process 10 times
constant design_setting1_c : design_setting_t_rec := (255, 10.0, 35.0, 8, 12);
-- c1_c = fclk/(2^depth*2^width) - c1_c = c1_c = 95.3674, fclk = 100 MHz
constant c1_c : real :=
get_board_info_f(board_name_g).fclk/(real((2**design_setting1_c.depth)*(2**design_setting1_c.width)));
-- div_factor_freqhigh_c = (c1_c/f_high)*2^width - threshold value of frequency a = 110592
constant div_factor_freqhigh_c : integer :=
integer(c1_c/design_setting1_c.f_high)*(2**design_setting1_c.width);
-- div_factor_freqlow_c = (c1_c/f_low)*2^width - threshold value of frequency b = 389120
constant div_factor_freqlow_c : integer :=
integer(c1_c/design_setting1_c.f_low)*(2**design_setting1_c.width);
begin
pwmmodulator : entity work.modulator -- modulator module instance
generic map(
design_setting_g => design_setting1_c
)
port map(
clk_in => clk_in_s,
sw0 => sw0_s,
div_factor_freqhigh => conv_std_logic_vector(div_factor_freqhigh_c, 32),
div_factor_freqlow => conv_std_logic_vector(div_factor_freqlow_c, 32),
pwm_out => pwm_s
);
clk_in_s <= not (clk_in_s) after clock_period_c/2; -- generates input clock signal
sw0_s <= '1', '0' after 25 us;
end;