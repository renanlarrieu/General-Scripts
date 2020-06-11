library ieee;
    use ieee.std_logic_1164.all;
    use ieee.std_logic_unsigned.all;
    use ieee.std_logic_signed.all;
    use ieee.numeric_std.all;
    
package somador is

    function soma (a1, a2 :integer) return integer;


end;

package body somador is

    function soma (a1, a2 :integer) return integer is
        variable resultado : integer;

    begin
    
        resultado :=a1+a2 ;

    return resultado;
    end function;


end package body;