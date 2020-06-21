----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.05.2020 01:39:20
-- Design Name: 
-- Module Name: somador - Behavioral
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
use IEEE.std_logic_1164.all;
use IEEE.std_logic_textio.all;
use IEEE.std_logic_arith.all;
use IEEE.numeric_bit.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_signed.all;
use IEEE.std_logic_unsigned.all;
use IEEE.math_real.all;
use IEEE.math_complex.all;

library STD;
use STD.textio;

entity somador is
	port(a :in math_real;
	b :in math_real;
	s :out math_real);
	
end somador;

architecture test of somador is

	signal resposta : bit;
begin
	process
    variable a: math_real  := 3;
    begin
        s<=a+b;
            if s > a then
                resposta <= '0';
            elsif s < a then 
                resposta <= '1';
            end if;
            
	end process;
end test;

