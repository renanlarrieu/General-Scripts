-- File: ConcatDemo_TB_V_VHDL.vhd
-- Generated by MyHDL 0.10
-- Date: Wed Aug 29 14:28:04 2018


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use std.textio.all;

use work.pck_myhdl_010.all;

entity ConcatDemo_TB_V_VHDL is
end entity ConcatDemo_TB_V_VHDL;


architecture MyHDL of ConcatDemo_TB_V_VHDL is


signal Res: unsigned(6 downto 0) := 7X"00";
signal ResS: signed (6 downto 0) := 7X"00";
signal ConcatDemo0_0_RefVal: unsigned(5 downto 0);

begin


ConcatDemo0_0_RefVal <= to_unsigned(25, 6);


CONCATDEMO_TB_V_VHDL_PRINT_DATA: process (ResS, Res) is
    variable L: line;
begin
    write(L, to_hstring(Res));
    write(L, string'(" "));
    write(L, to_hstring(unsigned(ResS)));
    writeline(output, L);
end process CONCATDEMO_TB_V_VHDL_PRINT_DATA;


Res <= unsigned'('1' & ConcatDemo0_0_RefVal);
ResS <= signed(unsigned'('1' & ConcatDemo0_0_RefVal));

CONCATDEMO_TB_V_VHDL_STIMULES: process is
begin
    for i in 0 to 2-1 loop
        wait for 1 * 1 ns;
    end loop;
    assert False report "End of Simulation" severity Failure;
    wait;
end process CONCATDEMO_TB_V_VHDL_STIMULES;

end architecture MyHDL;
