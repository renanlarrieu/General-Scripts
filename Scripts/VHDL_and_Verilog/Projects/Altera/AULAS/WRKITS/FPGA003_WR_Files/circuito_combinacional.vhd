--
-- Circuito Combinacional em VHDL
--
-- Eng. Wagner Rambo
--
-- Julho de 2015
--

   library IEEE;						            -- Biblioteca IEEE
	use IEEE.std_logic_1164.all;              -- Utiliza o padrão 1164
	
	
	entity circuito_combinacional is port
	(
	    A  :   in  std_logic;
		 B  :   in  std_logic;
		 C  :   in  std_logic;
		 O  :  out  std_logic
		
	);
	end circuito_combinacional;
	
	architecture hardware of circuito_combinacional is
	
	signal OR1   :  std_logic;
	signal OR2   :  std_logic;
	signal OR3   :  std_logic;
	
	begin
	
	O <= (OR1 or OR2 or OR3);
	
	OR1 <= (not A) and (not B);
	OR2 <= (not B) and (not C);
	OR3 <= A and (not C);
	
	end hardware;