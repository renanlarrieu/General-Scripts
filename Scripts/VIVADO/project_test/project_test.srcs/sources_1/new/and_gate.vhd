----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07.05.2020 22:42:01
-- Design Name: 
-- Module Name: and_gate - Behavioral
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

entity and_gate is
    Port ( d : in STD_LOGIC_VECTOR (0 downto 0);
           e : in STD_LOGIC_VECTOR (0 downto 0);
           f : out STD_LOGIC_VECTOR (0 downto 0));
end and_gate;

architecture Behavioral of and_gate is

begin
f <= d and e;

end Behavioral;
