----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07.05.2020 23:13:04
-- Design Name: 
-- Module Name: or_gate - Behavioral
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

entity or_gate is

    Port ( clk : in STD_LOGIC;
           a : in STD_LOGIC;
           b : in STD_LOGIC;
           c : out STD_LOGIC);
end or_gate;

architecture Behavioral of or_gate is

begin
    process(clk)
    begin
        if (rising_edge(clk)) then
            c <= a or b;
        end if; 


    end process;
end Behavioral;
