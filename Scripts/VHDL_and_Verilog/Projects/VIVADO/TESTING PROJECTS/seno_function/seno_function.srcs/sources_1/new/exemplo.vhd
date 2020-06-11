--
-- Curso de FPGA WR Kits Channel
--
--
-- Aula 31: Utilizaçao de Funçoes em VHDL (Sub Programas)
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

entity exemplo is
port(
            x_1 : in real; 
            seno_1 : in real;
            a_1, b_1 :   in   integer  range 0 to 15;
            s_1      :  out   integer  range 0 to 15);
            
end exemplo;


architecture hardware of exemplo is

function  SIN (X : real ) return real;
--	function soma (a  :  integer; b  :  integer) return integer is
constant  MATH_PI :  real := 3.14159_26535_89793_23846;
variable seno : real;
--	variable s   :  integer;
begin
        seno := SIN(X)
    --	s := a + b;
        
return seno;
end SIN;

begin
  seno_1 <= SIN(x_1);
 -- s_1 <= soma(a_1, b_1);
  
end hardware;


























