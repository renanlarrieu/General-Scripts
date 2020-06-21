----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 18.05.2020 23:13:33
-- Design Name: 
-- Module Name: tensao_senoidal - Behavioral
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
library work;
use work.FloatPt.all;




entity tensao_senoidal is
end tensao_senoidal;

architecture Behavioral of tensao_senoidal is

signal clk : bit;
signal a : integer := 10;
signal b : integer := 2;
signal c : integer;


begin

    process --(clk)
    begin
       -- if clk ='1' then
            c<=a/b;
            wait;
      --  end if;     
    


    end process;


end Behavioral;
