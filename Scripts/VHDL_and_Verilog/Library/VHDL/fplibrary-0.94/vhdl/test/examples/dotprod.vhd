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
use fplib.pkg_fplib.all;
library work;
use work.pkg_harness.all;

entity DotProd is
  generic ( fmt : format;
            wE  : positive := 6;
            wF  : positive := 13;
            reg : boolean;
            n   : positive );
  port ( vA  : in  std_logic_vector(n*(wE+wF+3)-1 downto 0);
         vB  : in  std_logic_vector(n*(wE+wF+3)-1 downto 0);
         nR  : out std_logic_vector(wE+wF+2 downto 0);
         clk : in  std_logic );
end entity;

architecture arch of DotProd is
  signal vA_1 : std_logic_vector(n*(wE+wF+3)-1 downto 0);
  signal vB_1 : std_logic_vector(n*(wE+wF+3)-1 downto 0);

  signal vAB_1 : std_logic_vector(n*(wE+wF+3)-1 downto 0);
  signal vAB_2 : std_logic_vector(n*(wE+wF+3)-1 downto 0);

  signal nR_2 : std_logic_vector(wE+wF+2 downto 0);
begin
  vA_1 <= vA;
  vB_1 <= vB;

  mulab : for i in 0 to n-1 generate
    mul : Mul_Clk
      generic map ( fmt => fmt,
                    wE  => wE,
                    wF  => wF,
                    reg => reg )
      port map ( nA  => vA_1((i+1)*(wE+wF+3)-1 downto i*(wE+wF+3)),
                 nB  => vB_1((i+1)*(wE+wF+3)-1 downto i*(wE+wF+3)),
                 nR  => vAB_1((i+1)*(wE+wF+3)-1 downto i*(wE+wF+3)),
                 clk => clk );
  end generate;
  
  wreg1 : if reg = true generate
    process(clk)
    begin
      if clk'event and clk='1' then
        vAB_2 <= vAB_1;
      end if;
    end process;
  end generate;
  woreg1 : if reg = false generate
    vAB_2 <= vAB_1;
  end generate;

  addab : AddTree
    generic map ( fmt => fmt,
                  wE  => wE,
                  wF  => wF,
                  reg => reg,
                  n   => n )
    port map ( nA  => vAB_2,
               nR  => nR_2,
               clk => clk );

  nR <= nR_2;
end architecture;
