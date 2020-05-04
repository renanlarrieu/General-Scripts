library ieee;
use ieee.std_logic_1164.all;
--ha_tb = half adder testbench
-- um testbench de um arquivo vhdl é um arquivo criado para simular o arquivo original, descrito em vhdl. Dessa forma, o arquivo testbench  recebe alguns parâmetros a mais para simular o hardware que já foi criado 
entity multiplexador_2_entradas_tb is
--entidade vazia pois este é um testbench
end multiplexador_2_entradas_tb;

architecture test of multiplexador_2_entradas_tb  is -- cria a arquitetura de hardware, que por sinal, deve ser igual a do arquivo ha.vhdl
    component multiplexador_2_entradas --Ao invés de definirmos somente as portas como feito anteriomente no código original, nós devemos definir as portas de um componente do hardware criado
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
	
	signal A,B,S,X,nandA,nandB,nandS,nandfinal : std_ulogic; --define que os sinais que serão testados também são lógicos, 0 ou 1;
begin --inicia o processo de mapeamento (identificação das portas com os fios)
    mux: multiplexador_2_entradas port map (A=>A, B=>B,S=>S, X=>X,nandA=>nandA, nandB=>nandB,nandS => nandS, nandfinal=>nandfinal); --mapeia os sinais existente nos componentes e liga cada uma das entradas/saidas com os fios a,b,o,c

    process begin --Início do processo de simulação
	    
		--Aqui define-se cada estado por determinado tempo dentro da simulação;
	    
		A<='X'; --define a porta 'a' como uma porta com estado inicial indefinido, isto é, nem 0 nem 1
		B<='X'; -- faz a mesma definição acima
		S<='X';
		--X<='X';
		--nandA<='X';
		--nandS<='X';
		--nandB<='X';
		--nandfinal<='X';
		wait for 1 ns; --define o período de indefinição
		
	    A <= '1';
		B <= '0';
		S <= '0';
		wait for 1 ns;
		
		A <= '0';
		B <= '1';
		S <= '1';
		wait for 1 ns;
		
		
		
		assert false report "Fim do teste"; -- Define um 'report' para sinalizar que o teste acabou
		wait;
		

    end process;	
	

end test;
