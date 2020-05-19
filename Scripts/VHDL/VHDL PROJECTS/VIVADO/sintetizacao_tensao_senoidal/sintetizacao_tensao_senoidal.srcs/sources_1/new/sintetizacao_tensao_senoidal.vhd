----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 18.05.2020 23:36:04
-- Design Name: 
-- Module Name: sintetizacao_tensao_senoidal - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity sintetizacao_tensao_senoidal is
--  Port ( );
end sintetizacao_tensao_senoidal;

architecture Behavioral of sintetizacao_tensao_senoidal is

signal a : integer := 10;
signal b: integer := 2;
signal c: integer;

begin
    process
    begin
        c<=a/b;
        wait;
    
    
    end process;


end Behavioral;
