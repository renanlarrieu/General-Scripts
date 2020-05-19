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

entity MatMatProd is
  generic ( fmt : format;
            wE  : positive := 6;
            wF  : positive := 13;
            reg : boolean;
            n1  : positive;
            n2  : positive;
            n3  : positive );
  port ( mA  : in  std_logic_vector(n1*n2*(wE+wF+3)-1 downto 0);
         mB  : in  std_logic_vector(n2*n3*(wE+wF+3)-1 downto 0);
         mR  : out std_logic_vector(n1*n3*(wE+wF+3)-1 downto 0);
         clk : in  std_logic );
end entity;

architecture arch of MatMatProd is
  signal mA_1 : std_logic_vector(n1*n2*(wE+wF+3)-1 downto 0);
  signal mB_1 : std_logic_vector(n2*n3*(wE+wF+3)-1 downto 0);

  signal mBt_1 : std_logic_vector(n3*n2*(wE+wF+3)-1 downto 0);
  signal mRt_1 : std_logic_vector(n3*n1*(wE+wF+3)-1 downto 0);
  
  signal mR_1 : std_logic_vector(n1*n3*(wE+wF+3)-1 downto 0);
begin
  mA_1 <= mA;
  mB_1 <= mB;

  transp_mb1 : for i in 0 to n2-1 generate
    transp_mb2 : for j in 0 to n3-1 generate
      mBt_1((j*n2+i+1)*(wE+wF+3)-1 downto (j*n2+i)*(wE+wF+3)) <= mB_1((i*n3+j+1)*(wE+wF+3)-1 downto (i*n3+j)*(wE+wF+3));
    end generate;
  end generate;
  
  mulab : for i in 0 to n3-1 generate
    dot : MatVectProd
      generic map ( fmt => fmt,
                    wE  => wE,
                    wF  => wF,
                    reg => reg,
                    n1  => n1,
                    n2  => n2 )
      port map ( mA  => mA_1,
                 vB  => mBt_1((i+1)*n2*(wE+wF+3)-1 downto i*n2*(wE+wF+3)),
                 vR  => mRt_1((i+1)*n1*(wE+wF+3)-1 downto i*n1*(wE+wF+3)),
                 clk => clk );
  end generate;

  transp_mr1 : for i in 0 to n3-1 generate
    transp_mr2 : for j in 0 to n1-1 generate
      mR_1((j*n3+i+1)*(wE+wF+3)-1 downto (j*n3+i)*(wE+wF+3)) <= mRt_1((i*n1+j+1)*(wE+wF+3)-1 downto (i*n1+j)*(wE+wF+3));
    end generate;
  end generate;
  
  mR <= mR_1;
end architecture;
