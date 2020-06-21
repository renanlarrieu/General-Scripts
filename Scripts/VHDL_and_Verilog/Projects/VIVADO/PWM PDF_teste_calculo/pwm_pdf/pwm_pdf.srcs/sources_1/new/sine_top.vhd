library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use work.modulator_pkg.all;
entity sine_top is
generic(
cntampl_value_g : integer := 255; -- threshold value for counter,
-- it's value should be equal to (2^depth)-1
depth_g : integer range 1 to 99 := 8; -- the number of samples in one period of the signal
width_g : integer range 1 to 99 := 12 -- the number of bits used to represent amplitude
-- value
);
port(
clk_in : in std_logic; -- input clock signal
sw0 : in std_logic; -- signal used for selecting frequency
div_factor_freqhigh : in std_logic_vector(31 downto 0); -- threshold value for high frequency
div_factor_freqlow : in std_logic_vector(31 downto 0); -- threshold value for low frequency
sine_out : out std_logic_vector(width_g-1 downto 0) -- current amplitude value of the
-- sine signal
);
end entity;
architecture rtl of sine_top is
signal ampl_cnt_s : std_logic_vector(depth_g-1 downto 0) := (others=>'0'); -- amplitude counter
signal freq_trig_s : std_logic := '0';
begin
-- frequency trigger module instance
freq_ce : entity work.frequency_trigger(rtl)
port map(
clk_in => clk_in, -- input clock signal
sw0 => sw0, -- signal used for selecting frequency
div_factor_freqhigh => div_factor_freqhigh, -- input clock division factor when sw0 = '1'
div_factor_freqlow => div_factor_freqlow, -- input clock division factor when sw0 = '0'
freq_trig => freq_trig_s -- output signal which frequency depends of the sw0 state
);
-- counter module instance
counterampl : entity work.counter(rtl)
generic map(
cnt_value_g => cntampl_value_g, -- threshold value for counter
depth_g => depth_g -- the number of samples in one period of the signal
)
port map(
clk_in => clk_in, -- input clock signal
cnt_en => freq_trig_s, -- counter enable
cnt_out => ampl_cnt_s -- current counter value
);
-- digital sine module instance
sine : entity work.sine(rtl)
generic map(
depth_g => depth_g, -- the number of samples in one period of the signal
width_g => width_g -- the number of bits used to represent amplitude value
)
port map(
clk_in => clk_in, -- input clock signal
ampl_cnt => ampl_cnt_s, -- address value for the sine waveform ROM
sine_out => sine_out -- current amplitude value of the sine signal
);

end;