----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 13.05.2020 02:29:44
-- Design Name: 
-- Module Name: procedure_example - Behavioral
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

--
-- Curso de FPGA WR Kits Channel
--
--
-- Aula 32: Utilizaçao de Procedimentos em VHDL (Sub Programas)
--
--
-- Kit FPGA EE02-SOQ
--
-- Adquira em http://www.professoremersonmartins.com.br/site/products/KIT-FPGA-%252d-EE02-%252d-SOQ.html
--
--
-- Autor: Eng. Wagner Rambo     Data: Janeiro de 2016
--
-- www.wrkits.com.br | facebook.com/wrkits | youtube.com/user/canalwrkits
--

entity procedimento is
port(
        a_i, b_i, c_i    :   in  integer range 0 to 15;
        som_con, sub_con :  out  integer range 0 to 15);
end procedimento;

architecture hardware of procedimento is

procedure soma_sub ( 
                            constant a     :   in  integer range 0 to 15;
                            variable b     :   in  integer range 0 to 15;
                            signal   c     :   in  integer range 0 to 15;
                            variable som   :  out  integer range 0 to 15;
                            signal   sub   :  out  integer range 0 to 15
                         ) is
begin
  som := a + b;
  sub <= a - c;
  
end soma_sub;

begin

   processo01 : process(a_i, b_i, c_i)
    
    variable b_v, som_v : integer range 0 to 15;
    
    begin
     b_v := b_i;
     
     soma_sub(a_i, b_v, c_i, som_v, sub_con);
     
     som_con <= som_v;
     
    end process;
    
end hardware;
	
	
								
								
								
								
								
								
								
								
								