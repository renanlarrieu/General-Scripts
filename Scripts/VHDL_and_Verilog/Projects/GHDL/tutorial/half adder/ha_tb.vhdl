library ieee;
use ieee.std_logic_1164.all;
--ha_tb = half adder testbench
-- um testbench de um arquivo vhdl é um arquivo criado para simular o arquivo original, descrito em vhdl. Dessa forma, o arquivo testbench  recebe alguns parâmetros a mais para simular o hardware que já foi criado 
entity ha_tb is
--entidade vazia pois este é um testbench
end ha_tb;

architecture test of ha_tb is -- cria a arquitetura de hardware, que por sinal, deve ser igual a do arquivo ha.vhdl
    component ha --Ao invés de definirmos somente as portas como feito anteriomente no código original, nós devemos definir as portas de um componente do hardware criado
			port 
			(
				a: in std_ulogic; -- define as portas e as direções de cada uma, bem como acontece no codigo de hardware anteriormente escrito
				b: in std_ulogic;
				o: out std_ulogic;
				c: out std_ulogic
			
			);
	end component;
	
	signal a,b,o,c : std_ulogic; --define que os sinais que serão testados também são lógicos, 0 ou 1;
begin --inicia o processo de mapeamento (identificação das portas com os fios)
    half_adder: ha port map (a=>a, b=>b,o=>o, c=>c); --mapeia os sinais existente nos componentes e liga cada uma das entradas/saidas com os fios a,b,o,c

    process begin --Início do processo de simulação
	    
		--Aqui define-se cada estado por determinado tempo dentro da simulação;
	    
		a<='X'; --define a porta 'a' como uma porta com estado inicial indefinido, isto é, nem 0 nem 1
		b<='X'; -- faz a mesma definição acima
		wait for 1 ns; --define o período de indefinição
		
	    a <= '0'; -- define o sinal logico da porta 'a' como low
		b <= '0'; -- define o sinal lógico da porta 'b' como high
		wait for 1 ns; -- define o período do estado lógico das portas descritas
		
		a <= '0';
		b <= '1';
		wait for 1 ns;
		
		a <= '1';
		b <= '0';
		wait for 1 ns;
		
		a <= '1';
		b <= '1';
		wait for 1 ns;
		
		
		assert false report "Fim do teste"; -- Define um 'report' para sinalizar que o teste acabou
		wait;
		

    end process;	
	

end test;
