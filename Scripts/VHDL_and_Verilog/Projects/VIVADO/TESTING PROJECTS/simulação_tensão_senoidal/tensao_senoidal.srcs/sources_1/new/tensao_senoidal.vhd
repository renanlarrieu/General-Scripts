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
    signal flag : real :=0.0;
    signal X : real; 
    constant R :real := 2.0;
    signal Vp :real := 10.0;
    signal Ip : real;
    
    signal tensao,corrente : real;
    

--signal log_result,log2_result,log10_result,log_result2,sine,cosine,tangent : real := 0.0;



begin
    process (clk)
    begin
    
    report "Hello World";
    clk <= '1';
    
        if clk ='1' then          
            Ip <= Vp*0.5; 
            X<=(2.0*MATH_PI*f*t)+1.0;
            corrente <= tensao*0.5;
            tensao <= Vp*SIN(X);
            
                



            
            

        end if;
    end process;   

end Behavioral;
