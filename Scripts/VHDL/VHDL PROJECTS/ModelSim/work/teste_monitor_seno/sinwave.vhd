----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11.05.2020 20:28:01
-- Design Name: 
-- Module Name: sinewave - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;  --try to use this library as much as possible.
 
entity sinewave is
port (clk :in  std_logic;
      dataout : out integer range -128 to 127
      );
end sinewave;
 
architecture Behavioral of sinewave is
  signal i : integer range 0 to 30:=0;
  type memory_type is array (0 to 29) of integer range -128 to 127;  
  --ROM for storing the sine values generated by MATLAB.
  signal sine : memory_type :=(0,16,31,45,58,67,74,77,77,74,67,58,45,31,16,0,-16,-31,-45,-58,-67,-74,-77,-77,-74,-67,-58,-45,-31,-16);--duvida***
  
begin
  process(clk)
  variable cnt : integer := 0;
  begin
    --to check the rising edge of the clock signal
    if(rising_edge(clk)) then    
      dataout <= sine(i);
      i <= i+ 1;
      if(i = 29) then
        i <= 0;
      end if;
    end if;
    report "counter value: " & integer'image(cnt);
  end process;
end Behavioral;

