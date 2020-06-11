----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 20.05.2020 21:31:58
-- Design Name: 
-- Module Name: gerador_senoide - Behavioral
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


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

--entity gerador_senoide is
--  Port ( );
--end gerador_senoide;

--architecture Behavioral of gerador_senoide is

--begin


--end Behavioral;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
use IEEE.std_logic_signed.all;
use IEEE.std_logic_unsigned.all;

Entity gerador_senoide is
    port (
			clk :in std_ulogic;
			rst :in std_ulogic;
			ena	:in std_ulogic;
			
			
			SinValue_out   : out signed (30 downto 0));


end entity;

architecture Behavioral of gerador_senoide is
signal Reg_T1 : signed (30 downto 0);
signal Reg_T0 : signed (30 downto 0);

Begin

Reg_T1 <= SinValue_out;

process (clk,rst) 
begin
	if (rst='0') then
		Reg_T0 <= ((2 ** 29) - 1);
        Reg_T1 <= 478355485;
	end if;
	if begin 
		if ena='1' then
		Reg_T0 <= Reg_T1;
            Reg_T1 <= ($signed((478355485 * Reg_T1) >>> (29 - 1)) - Reg_T0);
		end if;
	end if;
end process;

end Behavioral;
			

