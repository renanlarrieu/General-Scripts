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
				a_1, b_1 :   in   integer  range 0 to 15;
				s_1      :  out   integer  range 0 to 15);
				
	end exemplo;
	
	
	architecture hardware of exemplo is
	
	function soma (a  :  integer; b  :  integer) return integer is
	variable s   :  integer;
	begin
	
			s := a + b;
			
	return s;
	end soma;
	
	begin
	
	  s_1 <= soma(a_1, b_1);
	  
	end hardware;


























