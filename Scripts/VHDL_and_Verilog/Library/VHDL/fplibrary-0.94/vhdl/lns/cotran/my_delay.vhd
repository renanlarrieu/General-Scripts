library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity my_delay is
  generic ( w : positive;
            n : integer := 1;
            enable : boolean := true );
  port ( x     : in  std_logic_vector(w-1 downto 0);
         xd    : out std_logic_vector(w-1 downto 0);
         clk   : in  std_logic);
end entity;

architecture arch of my_delay is
  signal buf : std_logic_vector((n+1)*w-1 downto 0) := ((n+1)*w-1 downto 0 => '0');
begin
  reg : if enable = true generate
  buf(w-1 downto 0) <= x;

  delay_pos : if n > 0 generate
    process(clk)
    begin
      if clk'event and clk = '1' then
        buf((n+1)*w-1 downto w) <= buf(n*w-1 downto 0);
      end if;
    end process;
  end generate;
  
  xd <= buf((n+1)*w-1 downto n*w);
  end generate;
  
  no_reg : if enable = false generate
  	xd <= x;
  end generate;
end architecture;
