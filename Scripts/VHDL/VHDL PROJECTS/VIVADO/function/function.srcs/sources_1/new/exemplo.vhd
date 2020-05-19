----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 13.05.2020 02:02:45
-- Design Name: 
-- Module Name: exemplo - Behavioral
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


entity function_example is
port(
            a_1, b_1 :   in   integer  range 0 to 255;
            s_1      :  out   integer  range 0 to 255);
            
end function_example;


architecture hardware of function_example is

function soma (a  :  integer; b  :  integer) return integer is
variable s   :  integer;
begin

        s := a + b;
        
return s;
end soma;

begin

  s_1 <= soma(a_1, b_1);
  
end hardware;


























