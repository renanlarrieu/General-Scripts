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


entity teste_function is
port(
			r_1, i_1 :   in   integer  range 0 to 255;
			v_1      :  out   integer  range 0 to 255);
			
end teste_function;


architecture hardware of teste_function is

function calculo_de_tensao (r  :  integer; i  :  integer) return integer is

variable v   :  integer;

--variable v : real;
begin

		v := r * i;
		
return v;

end calculo_de_tensao;

begin

  v_1 <= calculo_de_tensao(r_1, i_1);
  
end hardware;
