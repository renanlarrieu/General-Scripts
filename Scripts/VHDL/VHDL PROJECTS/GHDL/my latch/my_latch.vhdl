-- Projeto flipflop SR = Set and Reset
-- autor: Renan Larrieu 30/04/2020 4:25

library IEEE;
use IEEE.std_logic_1164.all;

entity my_latch is port
( -- std_logic = define uma entrada/saída como digital;
    S  : in std_logic; --entrada do set ;
	 R  : in std_logic; -- entrada do reset;
	 Q  : inout std_logic; -- saída Q (usada para realimentação);
	 Qn : out std_logic -- saída /Q (inverso de 'Q', também usada para realimentação);
	
);
end my_latch;

--declarando a arquitetura da descrição 

architecture hardware of my_latch is 

signal notQ: std_logic; --cria o sinal notQ (/Q) que é uma variável auxiliar e o define como digital (std_logic), assim como os outros;

begin -- é a partir do comando begin que o fluxo de informação paralela tem seu início, isto é, o processamento simultâneo das informações;
-- Por se tratar de um FPGA, não importa a ordem de atribuição das variáveis;

Q <= R NOR notQ; 
notQ <= S NOR Q;
Qn <= notQ; 

end hardware;
