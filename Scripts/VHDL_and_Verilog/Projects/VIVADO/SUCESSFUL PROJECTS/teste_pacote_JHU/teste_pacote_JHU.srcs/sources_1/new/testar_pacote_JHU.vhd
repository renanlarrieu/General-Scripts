library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
use IEEE.std_logic_signed.all;
library work;
use work.FloatPt.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
library UNISIM;
use UNISIM.VComponents.all;

entity testar_pacote_JHU is
    port(   
                entrada : in signed;
                saida : out std_logic_vector
                
        
            
                );

end testar_pacote_JHU;

architecture Behavioral of testar_pacote_JHU is
signal v                                                            :         signed;
signal teste                                                    :         std_logic_vector;
begin
v <= entrada;

teste <=SIGNED_TO_FP(v );
saida<=teste;

end Behavioral;
