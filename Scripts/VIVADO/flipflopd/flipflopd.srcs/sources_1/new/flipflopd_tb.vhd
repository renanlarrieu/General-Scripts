
library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity flipflopd_tb is
end;

architecture bench of flipflopd_tb is

  component flipflopd
  	PORT( 
  		D,CLOCK: in std_logic;
  		Q: out std_logic);
  end component;

  signal D,CLOCK: std_logic;
  signal Q: std_logic;

  constant clock_period: time := 100 ns;
  signal stop_the_clock: boolean;

begin

  uut: flipflopd port map ( D     => D,
                            CLOCK => CLOCK,
                            Q     => Q );

  stimulus: process
  begin
  
    -- Put initialisation code here
    D <= '1';
    wait for clock_period;
    D <= '0';

    -- Put test bench stimulus code here

    stop_the_clock <= true;
    wait;
  end process;

  clocking: process
  begin
    while not stop_the_clock loop
      CLOCK <= '0', '1' after clock_period / 2;
      wait for clock_period;
    end loop;
    wait;
  end process;

end;