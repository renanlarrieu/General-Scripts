library IEEE;
use IEEE.std_logic_1164.all;

entity flipflop_sinc is port
(	    --entradas
		S: in std_ulogic;
		R: in std_ulogic;
		CLK: in std_ulogic;
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
end flipflop_sinc;

architecture hardware of flipflop_sinc is

begin

--processamento de primeiro grau

nandRCLK <= R NAND CLK;

nandSCLK <= S NAND CLK;

-- processamento de segundo grau

nandRCLKQ <= nandRCLK NAND nandSCLKQbarra;

nandSCLKQbarra <= nandSCLK NAND nandRCLKQ;

-- saídas

Q <= nandSCLKQbarra;

Qbarra <= nandRCLKQ;


end hardware;