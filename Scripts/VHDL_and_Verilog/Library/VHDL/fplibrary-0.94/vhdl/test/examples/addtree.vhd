-- Copyright 2003-2004 Jérémie Detrey, Florent de Dinechin
--
-- This file is part of FPLibrary
--
-- FPLibrary is free software; you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation; either version 2 of the License, or
-- (at your option) any later version.
--
-- FPLibrary is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with FPLibrary; if not, write to the Free Software
-- Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA


library ieee;
use ieee.std_logic_1164.all;
library fplib;
use fplib.pkg_misc.all;
use fplib.pkg_fplib.all;
library work;
use work.pkg_harness.all;

entity AddTree is
  generic ( fmt : format;
            wE  : positive := 6;
            wF  : positive := 13;
            reg : boolean;
            n   : positive );
  port ( nA  : in  std_logic_vector(n*(wE+wF+3)-1 downto 0);
         nR  : out std_logic_vector(wE+wF+2 downto 0);
         clk : in  std_logic );
end entity;

architecture arch of AddTree is
  component AddTree is
    generic ( fmt : format;
              wE  : positive := 6;
              wF  : positive := 13;
              reg : boolean;
              n   : positive );
    port ( nA  : in  std_logic_vector(n*(wE+wF+3)-1 downto 0);
           nR  : out std_logic_vector(wE+wF+2 downto 0);
           clk : in  std_logic );
  end component;

  signal nA_1 : std_logic_vector(n*(wE+wF+3)-1 downto 0);
  
  signal nAs_1 : std_logic_vector(((n+1)/2)*(wE+wF+3)-1 downto 0);
  signal nAs_2 : std_logic_vector(((n+1)/2)*(wE+wF+3)-1 downto 0);

  signal nR_3 : std_logic_vector(wE+wF+2 downto 0);
begin
  nA_1 <= nA;

  noadd : if n = 1 generate
    nR_3 <= nA_1;
  end generate;

  add : if n > 1 generate
    sum : for i in 0 to (n/2)-1 generate
      add : Add_Clk
        generic map ( fmt => fmt,
                      wE  => wE,
                      wF  => wF,
                      reg => reg )
        port map ( nA  => nA_1((2*i+1)*(wE+wF+3)-1 downto 2*i*(wE+wF+3)),
                   nB  => nA_1((2*i+2)*(wE+wF+3)-1 downto (2*i+1)*(wE+wF+3)),
                   nR  => nAs_1((i+1)*(wE+wF+3)-1 downto i*(wE+wF+3)),
                   clk => clk );
    end generate;
    buf : if n mod 2 = 1 generate
      wreg : if reg = true generate
        d : Delay
          generic map ( w => wE+wF+3,
                        n => addLatency(fmt, wE, wF) - 1 )
          port map ( input  => nA_1(n*(wE+wF+3)-1 downto (n-1)*(wE+wF+3)),
                     output => nAs_1(((n/2)+1)*(wE+wF+3)-1 downto (n/2)*(wE+wF+3)),
                     clk    => clk );
      end generate;
      woreg : if reg = false generate
        nAs_1(((n/2)+1)*(wE+wF+3)-1 downto (n/2)*(wE+wF+3)) <= nA_1(n*(wE+wF+3)-1 downto (n-1)*(wE+wF+3));
      end generate;
    end generate;

    wreg1 : if reg = true and n > 2 generate
      process(clk)
      begin
        if clk'event and clk='1' then
          nAs_2 <= nAs_1;
        end if;
      end process;
    end generate;
    woreg1 : if reg = false or n <= 2 generate
      nAs_2 <= nAs_1;
    end generate;

    tree : AddTree
      generic map ( fmt => fmt,
                    wE  => wE,
                    wF  => wF,
                    reg => reg,
                    n   => (n+1)/2 )
      port map ( nA  => nAs_2,
                 nR  => nR_3,
                 clk => clk );
  end generate;

  nR <= nR_3;
end architecture;
