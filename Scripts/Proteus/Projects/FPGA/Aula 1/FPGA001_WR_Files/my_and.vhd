--
--  Porta lógica AND descrita em VHDL
--
--  Duas entradas: a e b
--
--  Uma saida: o
--
--  Autor: Wagner Rambo
--  Data: Junho de 2015
--

	library IEEE;						-- Indica utiliza as bibliotecas do Instuto de Engenheiros Elétricos e Eletrônicos
	use IEEE.std_logic_1164.all;	-- Utiliza a biblioteca padrão 1164
	
	
	entity my_and is port			-- Declaraçao da entidade
	(
	  a	:  in  std_logic;				-- entrada digital a
	  b	:  in  std_logic;				-- entrada digital b
	  o	:  out std_logic				-- saída digital o

	);
	end my_and;							-- final da declaraçao da entidade
	
	-- início da arquitetura
	architecture hardware of my_and is
	begin									-- inicia o hardware
	
	o <= a AND b;						-- saida o recebe a operaçao lógica E com b
	
	end hardware;						-- final do hardware