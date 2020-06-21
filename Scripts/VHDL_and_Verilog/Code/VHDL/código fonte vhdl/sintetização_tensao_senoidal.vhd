----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 14.05.2020 21:41:35
-- Design Name: 
-- Module Name: tensao_senoidal - Behavioral
-- Project Name: tensao e corrente senoidal de um circuito puramente resistivo
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
use IEEE.numeric_std.all;
use IEEE.MATH_REAL.ALL;

entity tensao_senoidal is
end tensao_senoidal;

architecture Behavioral of tensao_senoidal is

--signals declared with the REAL data type.
--MATH_PI is a constant defined in the math_real package.
--signal X : real := -MATH_PI/3.0; --A real variable X, initialized to pi/3(60 degreee).
--signal phi : real := 0.0;
    signal clk : bit;
    signal t : real := 1.0;
    signal f : real := 60.0;
    signal X : real;
    
    constant dois :real := 2.0;
    constant seis :real := 6.0;
    constant centoevinte :real := 120.0;
    constant cincomilequarenta :real := 5040.0;
    
    constant R :real := 2.0;
    signal Vp :real := 10.0;
    signal Ip : real;
	signal seno : real;
	
	signal centoeoitenta :real := 180.0;
	
    
    signal tensao,corrente : real := 0.0;
    

--signal log_result,log2_result,log10_result,log_result2,sine,cosine,tangent : real := 0.0;



begin

    process (clk)
    begin
        if clk ='1' then
            X <= (MATH_PI*dois*MATH_PI*f*t)/(centoeoitenta);-- argumento do seno
           -- seno <= X - ((X**3)/(seis));
	     	seno <= (X-(((X**3)/(seis))+((X**5)/(centoevinte))-((X**7)/(cincomilequarenta))));
            Ip <= Vp/R;         
            tensao <= Vp*seno;
            corrente <= Ip*seno;
            
 
        else 
            X <= X;
            corrente <= corrente;
            tensao <= tensao;
        end if;
    --wait;
    end process;   

end Behavioral;
