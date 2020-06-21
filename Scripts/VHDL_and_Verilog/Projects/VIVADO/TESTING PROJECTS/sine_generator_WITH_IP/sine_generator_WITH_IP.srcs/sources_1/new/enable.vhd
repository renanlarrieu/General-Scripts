library ieee;
use ieee.std_logic_1164.all;
 
entity enable is
  port (
    enable    : out  std_logic

    );
end enable;
 
architecture rtl of enable is
signal enable_signal : std_logic;
begin
enable_signal <= '1';
enable <= enable_signal;
end rtl;