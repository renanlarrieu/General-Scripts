library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
use IEEE.std_logic_signed.all;
use IEEE.std_logic_unsigned.all;

component gerador_senoide is
    port (
			clk :in std_ulogic;
			rst :in std_ulogic;
			ena	:in std_ulogic;
			
			
			SinValue_out   : out signed (30 downto 0);


end component;

Architecture Behavioral of gerador_senoide is
signal Reg_T1 signed (30 downto 0);
signal Reg_T0 signed (30 downto 0);

Begin

Reg=T1 <= SinValue_out;

process (clk,rst) 
begin
	if (rst='0') then
		Reg_T0 <= ((2 ** 29) - 1);
        Reg_T1 <= 478355485;
	end if;
	else begin 
		if ena='1' then
		Reg_T0 <= Reg_T1;
            Reg_T1 <= ($signed((478355485 * Reg_T1) >>> (29 - 1)) - Reg_T0);
		end if;
	end else;
end process;

end behavioral;
			
