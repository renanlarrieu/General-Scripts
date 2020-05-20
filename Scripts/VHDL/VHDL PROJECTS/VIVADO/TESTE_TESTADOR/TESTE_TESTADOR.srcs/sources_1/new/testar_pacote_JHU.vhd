library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
use IEEE.std_logic_signed.all;
-- use IEEE.std_logic_1164.all;
--use IEEE.std_logic_textio.all;
--use IEEE.std_logic_arith.all;
--use IEEE.numeric_bit.all;
--use IEEE.numeric_std.all;
--use IEEE.std_logic_signed.all;
--use IEEE.std_logic_unsigned.all;
--use IEEE.math_real.all;
--use IEEE.math_complex.all;


entity testar_pacote_JHU is
    port(   
                entrada                   : in                      signed   (7 downto 0)  :="11000000";-- (others => '1');
                saida                        :         out          std_logic_vector(31 downto 0)
                
        
            
                );

end testar_pacote_JHU;

architecture Behavioral of testar_pacote_JHU is
--------------------------------------------------------------------------------------
 function SIGNED_TO_FP(v : signed) return std_logic_vector is
--Convert a signed binary integer to 32-bit floating pt sign-magnitude format 
    variable i   : integer range 0 to v'left+1;
    variable j   : integer range 0 to 255;
    variable fp  : std_logic_vector(31 downto 0);  --returned FP
    variable exp : integer range -1024 to 1024;    --exponent
    variable m   : unsigned(v'length downto 0);    --mantissa + leading bit
    
  begin
    m   := '0' & unsigned(abs(v));  --we use the mag of v to create a mantissa
    --start with biased exp equiv to 2**(LENGTH-1), so m becomes the mantissa, m.mmmmm...
    --i.e. mag(v) = 2**(exp-127) * m.m m m m m....
    exp := 127 + m'length-1;
    --normalize m as the mantissa with one bit in front of the decimal point 
    for i in 0 to m'left loop
      if m(m'left) = '1' then
        j := i;
        exit;
      else
        m := m(m'left-1 downto 0) & '0';
                                        --exp:= exp - 1;
      end if;
    end loop;
    exp              := exp - j;
    fp(30 downto 23) := std_logic_vector(TO_UNSIGNED(exp, 8));
    --Make sure we have enough bits for a normalized full mantissa (23)
    -- and at the same time remove the mantissa leading 1
    if m'length < 24 then  -- <24 bits, bottom bits set to 0, and drop the leading 1        
      fp(23-m'length downto 0)  := (others => '0');
      fp(22 downto 24-m'length) := std_logic_vector(m(m'length-2 downto 0));
    else  --if >= 24, drop leading 1 and take next 23 bits for fp
      fp(22 downto 0) := std_logic_vector(m(m'length-2 downto m'length-24));
    end if;

    if v(v'left) = '1' then
      fp(31) := '1';
    else fp(31) := '0';
    end if;
    return fp;
  end function SIGNED_TO_FP;
---------------------------------------------------------------------------------------

signal v                                                            : signed(7 downto 0);
--signal a                                                               :std_logic_vector;
--signal teste                                                    :         std_logic_vector;
begin
v <= entrada;
----------------------------------------------------------

--a<=SIGNED_TO_FP(v );
--a<=a-"1";
--saida <=a;
------------------------------------------------------------
saida <=SIGNED_TO_FP(v );


end Behavioral;
