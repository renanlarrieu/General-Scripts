library IEEE;
use IEEE.std_logic_1164.all;

entity flipflop_D is port
(	    --entradas
	 D: in bit;
	 C: in bit;

	 not1: inout bit;
	 n1: inout bit;
	 n2: inout bit;
	 n3 : inout bit;
	 n4: inout bit;
		
		-- saídas
	 Q : out bit;
	 Qbarra :out bit



);
end flipflop_D;

architecture hardware of flipflop_D is

begin

n1 <= D NAND C;
not1 <= D;
n2 <= not1 NAND C;

n3 <= n1 NAND n4;
n4 <= n2 NAND n3;

Q <= n3;
Qbarra <= n4; 

end hardware;