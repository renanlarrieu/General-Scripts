library ieee;
use ieee.std_logic_1164.all;

entity flipflop_sinc_tb is port
(

);

architecture test of flipflop_sinc_tb is 
    component flipflop_sinc_tb
			(
			S: in std_ulogic;
			R: in std_ulogic;
			CLK: in std_ulogic
			-- processamento de primeiro grau
			nandRCLK: inout std_ulogic;
			nandSCLK: inout std_ulogic;
			-- processamento de segundo grau
			nandRCLKQ: inout std_ulogic;
			nandSCLKQbarra : inout std_ulogic;
			-- saídas
			Q : out std_ulogic;
			Qbarra :out std_ulogic
			
			);
	end component;
	signal S,R,CLK,nandRCLK,nandSCLK,nandRCLKQ,nandSCLKQbarra,Q,Qbarra : std_ulogic;
	
begin

	ffsinc : flipflop_sinc port map (S=>S,R=>R,CLK=>CLK,nandRCLK=>nandRCLK,nandSCLK=>nandSCLK,nandRCLKQ=>nandRCLKQ,nandSCLKQbarra=>nandSCLKQbarra,Q=>Q,Qbarra=>Qbarra);
	
	
	process begin
	
		R<='X';
		S<='X';
		--CLK<='X';
		wait for 1 ns;
		
		CLK<='1';
		wait for 0.5 ns;
		R<='1';
		--S<='0';
		wait for 1 ns;
		CLK<='0';
		wait for 0.5 ns;
		
		CLK<='1';
		wait for 0.5 ns;
		--R<='0';
		S<='1';
		wait for 1 ns;
		CLK<='1';
		wait for 0.5 ns;
		
		CLK<='0';
		wait for 0.5 ns;
		R<='0';
		--S<='0';
		wait for 1 ns;
		CLK<='1';
		wait for 0.5 ns;
		
		CLK<='0';
		wait for 0.5 ns;
		--R<='0';
		S<='0';
		wait for 1 ns;
		CLK<='1';
		wait for 0.5 ns;
		
		
		assert false report "Fim do teste";
		wait;
	
	
	end process
	
end test;
	
	

	
	
	
	
	