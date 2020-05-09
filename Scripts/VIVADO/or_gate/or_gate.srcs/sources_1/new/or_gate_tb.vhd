library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity or_gate_tb is
end;

architecture bench of or_gate_tb is

  component or_gate
      Port ( clk : in STD_LOGIC;
             a : in STD_LOGIC;
             b : in STD_LOGIC;
             c : out STD_LOGIC);
  end component;

  signal clk: STD_LOGIC;
  signal a: STD_LOGIC;
  signal b: STD_LOGIC;
  signal c: STD_LOGIC;

  constant clock_period: time := 10 ns;
  signal stop_the_clock: boolean;

begin

  uut: or_gate port map ( clk => clk,
                          a   => a,
                          b   => b,
                          c   => c );

  stimulus: process
  begin
  
    -- Put initialisation code here

    b <='0';
    a <='0';
    wait for 20ns;
    b <='1';
    a <='0';
    wait for 20ns;
    b <='1';
    a <='1';
    wait for 20ns;
    b <='0';
    a <='1';
    wait for 20ns;
    
    
    -- Put test bench stimulus code here

    stop_the_clock <= true;
    wait;
  end process;

  clocking: process
  begin
    while not stop_the_clock loop
      clk <= '0', '1' after clock_period / 2;
      wait for clock_period;
    end loop;
    wait;
  end process;

end;