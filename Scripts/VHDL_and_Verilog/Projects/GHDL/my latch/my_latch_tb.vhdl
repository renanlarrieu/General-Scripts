library IEEE;
use IEEE.std_logic_1164.all;

entity my_latch_tb is
  
end my_latch_tb;

architecture test of my_latch_tb is

    component my_latch
	
			port
			(
			
				S  : in std_logic; --entrada do set ;
				R  : in std_logic; -- entrada do reset;
				Q  : inout std_logic; -- saída Q (usada para realimentação);
				Qn : out std_logic -- saída /Q (inverso de 'Q', também usada para realimentação);

			);
		
	end component;

    signal S,R,Q,Qn : std_ulogic;
begin
    latch: my_latch port map (S=>S,R=>R,Q=>Q,Qn=>Qn);

    process begin
    
		S<='X';
		R<='X';	
		--Q<='X';	
		--Qn<='X';
		wait for 10 ns;
		
		S <= '0'; 
		R <= '0'; 
		wait for 10 ns; 
		
		S <= '0';
		R <= '1';
		wait for 10 ns;
		
		S <= '1';
		R <= '0';
		wait for 10 ns;
		
		S <= '1';
		R <= '1';
		wait for 10 ns;
		
		assert false report "Fim do teste"; -- Define um 'report' para sinalizar que o teste acabou
		wait;
	end process;

end test;	
