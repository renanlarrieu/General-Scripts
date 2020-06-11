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
use fplib.pkg_fplib_fp.all;
use fplib.pkg_fplib_lns.all;

entity Add is
  generic ( fmt : format;
            wE  : positive := 6;
            wF  : positive := 13 );
  port ( nA : in  std_logic_vector(wE+wF+2 downto 0);
         nB : in  std_logic_vector(wE+wF+2 downto 0);
         nR : out std_logic_vector(wE+wF+2 downto 0) );
end entity;

architecture arch of Add is
begin
  fpop : if fmt = FP generate
    add : FPAdd
      generic map ( wE => wE,
                    wF => wF )
      port map ( nA => nA,
                 nB => nB,
                 nR => nR );
  end generate;
  lnsop : if fmt = LNS generate
    add : LNSAdd
      generic map ( wE => wE,
                    wF => wF )
      port map ( nA => nA,
                 nB => nB,
                 nR => nR );
  end generate;
end architecture;


library ieee;
use ieee.std_logic_1164.all;
library fplib;
use fplib.pkg_fplib.all;
use fplib.pkg_fplib_fp.all;
use fplib.pkg_fplib_lns.all;

entity Add_Clk is
  generic ( fmt : format;
            wE  : positive := 6;
            wF  : positive := 13;
            reg : boolean  := true );
  port ( nA  : in  std_logic_vector(wE+wF+2 downto 0);
         nB  : in  std_logic_vector(wE+wF+2 downto 0);
         nR  : out std_logic_vector(wE+wF+2 downto 0);
         clk : in  std_logic );
end entity;

architecture arch of Add_Clk is
begin
  fpop : if fmt = FP generate
    wreg : if reg = true generate
      add : FPAdd_Clk
        generic map ( wE => wE,
                      wF => wF )
        port map ( nA  => nA,
                   nB  => nB,
                   nR  => nR,
                   clk => clk );
    end generate;
    woreg : if reg = false generate
      add : FPAdd
        generic map ( wE => wE,
                      wF => wF )
        port map ( nA  => nA,
                   nB  => nB,
                   nR  => nR );
    end generate;
  end generate;
  lnsop : if fmt = LNS generate
    wreg : if reg = true generate
      add : LNSAdd_Clk
        generic map ( wE => wE,
                      wF => wF )
        port map ( nA  => nA,
                   nB  => nB,
                   nR  => nR,
                   clk => clk );
    end generate;
    woreg : if reg = false generate
      add : LNSAdd
        generic map ( wE => wE,
                      wF => wF )
        port map ( nA  => nA,
                   nB  => nB,
                   nR  => nR );
    end generate;
  end generate;
end architecture;


library ieee;
use ieee.std_logic_1164.all;
library fplib;
use fplib.pkg_fplib.all;
use fplib.pkg_fplib_fp.all;
use fplib.pkg_fplib_lns.all;

entity Mul is
  generic ( fmt : format;
            wE  : positive := 6;
            wF  : positive := 13 );
  port ( nA : in  std_logic_vector(wE+wF+2 downto 0);
         nB : in  std_logic_vector(wE+wF+2 downto 0);
         nR : out std_logic_vector(wE+wF+2 downto 0) );
end entity;

architecture arch of Mul is
begin
  fpop : if fmt = FP generate
    mul : FPMul
      generic map ( wE => wE,
                    wF => wF )
      port map ( nA => nA,
                 nB => nB,
                 nR => nR );
  end generate;
  lnsop : if fmt = LNS generate
    mul : LNSMul
      generic map ( wE => wE,
                    wF => wF )
      port map ( nA => nA,
                 nB => nB,
                 nR => nR );
  end generate;
end architecture;


library ieee;
use ieee.std_logic_1164.all;
library fplib;
use fplib.pkg_fplib.all;
use fplib.pkg_fplib_fp.all;
use fplib.pkg_fplib_lns.all;

entity Mul_Clk is
  generic ( fmt : format;
            wE  : positive := 6;
            wF  : positive := 13;
            reg : boolean  := true );
  port ( nA  : in  std_logic_vector(wE+wF+2 downto 0);
         nB  : in  std_logic_vector(wE+wF+2 downto 0);
         nR  : out std_logic_vector(wE+wF+2 downto 0);
         clk : in  std_logic );
end entity;

architecture arch of Mul_Clk is
begin
  fpop : if fmt = FP generate
    wreg : if reg = true generate
      mul : FPMul_Clk
        generic map ( wE => wE,
                      wF => wF )
        port map ( nA  => nA,
                   nB  => nB,
                   nR  => nR,
                   clk => clk );
    end generate;
    woreg : if reg = false generate
      mul : FPMul
        generic map ( wE => wE,
                      wF => wF )
        port map ( nA  => nA,
                   nB  => nB,
                   nR  => nR );
    end generate;
  end generate;
  lnsop : if fmt = LNS generate
    wreg : if reg = true generate
      mul : LNSMul_Clk
        generic map ( wE => wE,
                      wF => wF )
        port map ( nA  => nA,
                   nB  => nB,
                   nR  => nR,
                   clk => clk );
    end generate;
    woreg : if reg = false generate
      mul : LNSMul
        generic map ( wE => wE,
                      wF => wF )
        port map ( nA  => nA,
                   nB  => nB,
                   nR  => nR );
    end generate;
  end generate;
end architecture;


library ieee;
use ieee.std_logic_1164.all;
library fplib;
use fplib.pkg_fplib.all;
use fplib.pkg_fplib_fp.all;
use fplib.pkg_fplib_lns.all;

entity Div is
  generic ( fmt : format;
            wE  : positive := 6;
            wF  : positive := 13 );
  port ( nA : in  std_logic_vector(wE+wF+2 downto 0);
         nB : in  std_logic_vector(wE+wF+2 downto 0);
         nR : out std_logic_vector(wE+wF+2 downto 0) );
end entity;

architecture arch of Div is
begin
  fpop : if fmt = FP generate
    div : FPDiv
      generic map ( wE => wE,
                    wF => wF )
      port map ( nA => nA,
                 nB => nB,
                 nR => nR );
  end generate;
  lnsop : if fmt = LNS generate
    div : LNSDiv
      generic map ( wE => wE,
                    wF => wF )
      port map ( nA => nA,
                 nB => nB,
                 nR => nR );
  end generate;
end architecture;


library ieee;
use ieee.std_logic_1164.all;
library fplib;
use fplib.pkg_fplib.all;
use fplib.pkg_fplib_fp.all;
use fplib.pkg_fplib_lns.all;

entity Div_Clk is
  generic ( fmt : format;
            wE  : positive := 6;
            wF  : positive := 13;
            reg : boolean  := true );
  port ( nA  : in  std_logic_vector(wE+wF+2 downto 0);
         nB  : in  std_logic_vector(wE+wF+2 downto 0);
         nR  : out std_logic_vector(wE+wF+2 downto 0);
         clk : in  std_logic );
end entity;

architecture arch of Div_Clk is
begin
  fpop : if fmt = FP generate
    wreg : if reg = true generate
      div : FPDiv_Clk
        generic map ( wE => wE,
                      wF => wF )
        port map ( nA  => nA,
                   nB  => nB,
                   nR  => nR,
                   clk => clk );
    end generate;
    woreg : if reg = false generate
      div : FPDiv
        generic map ( wE => wE,
                      wF => wF )
        port map ( nA  => nA,
                   nB  => nB,
                   nR  => nR );
    end generate;
  end generate;
  lnsop : if fmt = LNS generate
    wreg : if reg = true generate
      div : LNSDiv_Clk
        generic map ( wE => wE,
                      wF => wF )
        port map ( nA  => nA,
                   nB  => nB,
                   nR  => nR,
                   clk => clk );
    end generate;
    woreg : if reg = false generate
      div : LNSDiv
        generic map ( wE => wE,
                      wF => wF )
        port map ( nA  => nA,
                   nB  => nB,
                   nR  => nR );
    end generate;
  end generate;
end architecture;


library ieee;
use ieee.std_logic_1164.all;
library fplib;
use fplib.pkg_fplib.all;
use fplib.pkg_fplib_fp.all;
use fplib.pkg_fplib_lns.all;

entity Sqrt is
  generic ( fmt : format;
            wE  : positive := 6;
            wF  : positive := 13 );
  port ( nA : in  std_logic_vector(wE+wF+2 downto 0);
         nR : out std_logic_vector(wE+wF+2 downto 0) );
end entity;

architecture arch of Sqrt is
begin
  fpop : if fmt = FP generate
    sqrt : FPSqrt
      generic map ( wE => wE,
                    wF => wF )
      port map ( nA => nA,
                 nR => nR );
  end generate;
  lnsop : if fmt = LNS generate
    sqrt : LNSSqrt
      generic map ( wE => wE,
                    wF => wF )
      port map ( nA => nA,
                 nR => nR );
  end generate;
end architecture;


library ieee;
use ieee.std_logic_1164.all;
library fplib;
use fplib.pkg_fplib.all;
use fplib.pkg_fplib_fp.all;
use fplib.pkg_fplib_lns.all;

entity Sqrt_Clk is
  generic ( fmt : format;
            wE  : positive := 6;
            wF  : positive := 13;
            reg : boolean  := true );
  port ( nA  : in  std_logic_vector(wE+wF+2 downto 0);
         nR  : out std_logic_vector(wE+wF+2 downto 0);
         clk : in  std_logic );
end entity;

architecture arch of Sqrt_Clk is
begin
  fpop : if fmt = FP generate
    wreg : if reg = true generate
      sqrt : FPSqrt_Clk
        generic map ( wE => wE,
                      wF => wF )
        port map ( nA  => nA,
                   nR  => nR,
                   clk => clk );
    end generate;
    woreg : if reg = false generate
      sqrt : FPSqrt
        generic map ( wE => wE,
                      wF => wF )
        port map ( nA  => nA,
                   nR  => nR );
    end generate;
  end generate;
  lnsop : if fmt = LNS generate
    wreg : if reg = true generate
      sqrt : LNSSqrt_Clk
        generic map ( wE => wE,
                      wF => wF )
        port map ( nA  => nA,
                   nR  => nR,
                   clk => clk );
    end generate;
    woreg : if reg = false generate
      sqrt : LNSSqrt
        generic map ( wE => wE,
                      wF => wF )
        port map ( nA  => nA,
                   nR  => nR );
    end generate;
  end generate;
end architecture;
