library ieee;
use ieee.std_logic_1164.all;

entity flipflop_D_tb is 

end flipflop_D_tb;

architecture test of flipflop_D_tb  is 
    component flipflop_D
			port 
			(
	        D: in std_ulogic;
		    C: in std_ulogic;

	        not1: inout std_ulogic;
		    n1: inout std_ulogic;
			n2: inout std_ulogic;
			n3 : inout std_ulogic;
			n4: inout std_ulogic;
		

			Q : out std_ulogic;
			Qbarra :out std_ulogic

			
			);
	end component;
	
	signal 	D,C,not1,n1,n2,n3,n4,Q,Qbarra: std_ulogic;

begin 
    ffD: flipflop_D port map (D=>D,C=>C,not1=>not1,n1=>n1,n2=>n2,n3=>n3,n4=>n4,Q=>Q,Qbarra=>Qbarra); 
	
	process begin 
	    

	    
		D<='X';  
		C<='X'; 
		wait for 1 ns; 
		
		D <= '1';
		C <= '0';
		wait for 1 ns;
		
		D <= '0';
		C <= '1';
		wait for 1 ns;
		
		D <= '1';
		C <= '0';
		wait for 1 ns;
		
		D <= '0';
		C <= '1';
		wait for 2 ns;
		
		D <= '0';
		C <= '0';
		wait for 2 ns;
		
		D <= '1';
		C <= '1';
		wait for 1 ns;
		
		D <= '1';
		C <= '0';
		wait for 2 ns;
		
		D <= '1';
		C <= '1';
		wait for 1 ns;
		
		
		
		
		

		
		
		assert false report "Fim do teste"; 
		wait;
		

    end process;	
	

end test;	