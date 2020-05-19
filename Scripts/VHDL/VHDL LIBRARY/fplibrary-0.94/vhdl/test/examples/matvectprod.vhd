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

entity MatVectProd is
  generic ( fmt : format;
            wE  : positive := 6;
            wF  : positive := 13;
            reg : boolean;
            n1  : positive;
            n2  : positive );
  port ( mA  : in  std_logic_vector(n1*n2*(wE+wF+3)-1 downto 0);
         vB  : in  std_logic_vector(n2*(wE+wF+3)-1 downto 0);
         vR  : out std_logic_vector(n1*(wE+wF+3)-1 downto 0);
         clk : in  std_logic );
end entity;

architecture arch of MatVectProd is
  signal mA_1 : std_logic_vector(n1*n2*(wE+wF+3)-1 downto 0);
  signal vB_1 : std_logic_vector(n2*(wE+wF+3)-1 downto 0);

  signal vR_1 : std_logic_vector(n1*(wE+wF+3)-1 downto 0);
begin
  mA_1 <= mA;
  vB_1 <= vB;

  mulab : for i in 0 to n1-1 generate
    dot : DotProd
      generic map ( fmt => fmt,
                    wE  => wE,
                    wF  => wF,
                    reg => reg,
                    n   => n2 )
      port map ( vA  => mA_1((i+1)*n2*(wE+wF+3)-1 downto i*n2*(wE+wF+3)),
                 vB  => vB_1,
                 nR  => vR_1((i+1)*(wE+wF+3)-1 downto i*(wE+wF+3)),
                 clk => clk );
  end generate;

  vR <= vR_1;
end architecture;
