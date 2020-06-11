library ieee;
use ieee.std_logic_1164.all;
--ha_tb = half adder testbench
-- um testbench de um arquivo vhdl � um arquivo criado para simular o arquivo original, descrito em vhdl. Dessa forma, o arquivo testbench  recebe alguns par�metros a mais para simular o hardware que j� foi criado 
entity multiplexador_2_entradas_tb is
--entidade vazia pois este � um testbench
end multiplexador_2_entradas_tb;

architecture test of multiplexador_2_entradas_tb  is -- cria a arquitetura de hardware, que por sinal, deve ser igual a do arquivo ha.vhdl
    component multiplexador_2_entradas --Ao inv�s de definirmos somente as portas como feito anteriomente no c�digo original, n�s devemos definir as portas de um componente do hardware criado
			port 
			(
			 A: in std_ulogic;
			 B: in std_ulogic;
			 S: in std_ulogic;
			 X: out std_ulogic;
			 nandA: inout std_ulogic;
			 nandS: inout std_ulogic;
			 nandB: inout std_ulogic;
			 nandfinal: inout std_ulogic
			
			);
	end component;
	
	signal A,B,S,X,nandA,nandB,nandS,nandfinal : std_ulogic; --define que os sinais que ser�o testados tamb�m s�o l�gicos, 0 ou 1;
begin --inicia o processo de mapeamento (identifica��o das portas com os fios)
    mux: multiplexador_2_entradas port map (A=>A, B=>B,S=>S, X=>X,nandA=>nandA, nandB=>nandB,nandS => nandS, nandfinal=>nandfinal); --mapeia os sinais existente nos componentes e liga cada uma das entradas/saidas com os fios a,b,o,c

    process begin --In�cio do processo de simula��o
	    
		--Aqui define-se cada estado por determinado tempo dentro da simula��o;
	    
		A<='X'; --define a porta 'a' como uma porta com estado inicial indefinido, isto �, nem 0 nem 1
		B<='X'; -- faz a mesma defini��o acima
		S<='X';
		--X<='X';
		--nandA<='X';
		--nandS<='X';
		--nandB<='X';
		--nandfinal<='X';
		wait for 100 ns; --define o per�odo de indefini��o
		
	    A <= '1';
		B <= '0';
		S <= '0';
		wait for 100 ns;
		
		A <= '0';
		B <= '1';
		S <= '1';
		wait for 100 ns;
		
	
		wait;
		

    end process;	
	

end test;
