--
-- Curso de FPGA WR Kits Channel
--
--
-- Aula 37: Pacotes em VHDL
--
--
-- Kit FPGA EE02-SOQ
--
-- Adquira em http://www.professoremersonmartins.com.br/site/products/KIT-FPGA-%252d-EE02-%252d-SOQ.html
--
--
-- Autor: Eng. Wagner Rambo     Data: Fevereiro de 2016
--
-- www.wrkits.com.br | facebook.com/wrkits | youtube.com/user/canalwrkits
--

library ieee;
    use ieee.std_logic_1164.all;
    use ieee.std_logic_unsigned.all;
    
package lfsr_pkg is

    -- LFSR Feedback for 2**n
    function many_to_one_fb (DATA, TAPS :std_logic_vector) return std_logic_vector;
    function one_to_many_fb (DATA, TAPS :std_logic_vector) return std_logic_vector;

end;

package body lfsr_pkg is

    function many_to_one_fb (DATA, TAPS :std_logic_vector) return std_logic_vector is
        variable xor_taps :std_logic;
        variable all_0s   :std_logic;
        variable feedback :std_logic;
    begin

        -- Validate if lfsr = to zero (Prohibit Value)
        if (DATA(DATA'length-2 downto 0) = 0) then
            all_0s := '1';
        else
            all_0s := '0';
        end if;

        xor_taps := '0';
        for idx in 0 to (TAPS'length-1) loop
            if (TAPS(idx) = '1') then
                xor_taps := xor_taps xor DATA(idx);
            end if;
        end loop;

        feedback := xor_taps xor all_0s;

        return DATA((DATA'length-2) downto 0) & feedback;

    end function;

    function one_to_many_fb (DATA, TAPS :std_logic_vector) return std_logic_vector is
        variable xor_taps  :std_logic;
        variable all_0s    :std_logic;
        variable feedback  :std_logic;
        variable result    :std_logic_vector (DATA'length-1 downto 0);
    begin

        -- Validate if lfsr = to zero (Prohibit Value)
        if (DATA(DATA'length-2 downto 0) = 0) then
            all_0s := '1';
        else
            all_0s := '0';
        end if;

        feedback := DATA(DATA'length-1) xor all_0s;

        -- XOR the taps with the feedback
        result(0) := feedback;
        for idx in 0 to (TAPS'length-2) loop
            if (TAPS(idx) = '1') then
                result(idx+1) := feedback xor DATA(idx);
            else
                result(idx+1) := DATA(idx);
            end if;
        end loop;
        
        return result;

    end function;
end package body;