library IEEE;
use IEEE.std_logic_1164.all;

entity flipflop_D is port
(	    --entradas
		D: in std_ulogic;
		C: in std_ulogic;

	    not1: inout std_ulogic;
		n1: inout std_ulogic;
		n2: inout std_ulogic;
		n3 : inout std_ulogic;
		n4: inout std_ulogic;
		
		-- saídas
		Q : out std_ulogic;
		Qbarra :out std_ulogic



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