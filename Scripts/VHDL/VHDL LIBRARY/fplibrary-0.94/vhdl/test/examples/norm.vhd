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

entity Norm is
  generic ( fmt : format;
            wE  : positive := 6;
            wF  : positive := 13;
            reg : boolean );
  port ( nA  : in  std_logic_vector(wE+wF+2 downto 0);
         nB  : in  std_logic_vector(wE+wF+2 downto 0);
         nR  : out std_logic_vector(wE+wF+2 downto 0);
         clk : in  std_logic );
end entity;

architecture arch of Norm is
  signal nA_1 : std_logic_vector(wE+wF+2 downto 0);
  signal nB_1 : std_logic_vector(wE+wF+2 downto 0);

  signal nA2_1 : std_logic_vector(wE+wF+2 downto 0);
  signal nA2_2 : std_logic_vector(wE+wF+2 downto 0);
  signal nB2_1 : std_logic_vector(wE+wF+2 downto 0);
  signal nB2_2 : std_logic_vector(wE+wF+2 downto 0);

  signal nR2_2 : std_logic_vector(wE+wF+2 downto 0);
  signal nR2_3 : std_logic_vector(wE+wF+2 downto 0);
  
  signal nR_3 : std_logic_vector(wE+wF+2 downto 0);
begin
  nA_1 <= nA;
  nB_1 <= nB;

  mulaa : Mul_Clk
    generic map ( fmt => fmt,
                  wE  => wE,
                  wF  => wF,
                  reg => reg )
    port map ( nA  => nA_1,
               nB  => nA_1,
               nR  => nA2_1,
               clk => clk );
  
  mulbb : Mul_Clk
    generic map ( fmt => fmt,
                  wE  => wE,
                  wF  => wF,
                  reg => reg )
    port map ( nA  => nB_1,
               nB  => nB_1,
               nR  => nB2_1,
               clk => clk );

  wreg1 : if reg = true generate
    process(clk)
    begin
      if clk'event and clk='1' then
        nA2_2 <= nA2_1;
        nB2_2 <= nB2_1;
      end if;
    end process;
  end generate;
  woreg1 : if reg = false generate
    nA2_2 <= nA2_1;
    nB2_2 <= nB2_1;
  end generate;
  
  adda2b2 : Add_Clk
    generic map ( fmt => fmt,
                  wE  => wE,
                  wF  => wF,
                  reg => reg )
    port map ( nA  => nA2_2,
               nB  => nB2_2,
               nR  => nR2_2,
               clk => clk );

  wreg2 : if reg = true and fmt = FP generate
    process(clk)
    begin
      if clk'event and clk='1' then
        nR2_3 <= nR2_2;
      end if;
    end process;
  end generate;
  woreg2 : if reg = false or fmt = LNS generate
    nR2_3 <= nR2_2;
  end generate;

  sqrtr2 : Sqrt_Clk
    generic map ( fmt => fmt,
                  wE  => wE,
                  wF  => wF,
                  reg => reg )
    port map ( nA  => nR2_3,
               nR  => nR_3,
               clk => clk );

  nR <= nR_3;
end architecture;
