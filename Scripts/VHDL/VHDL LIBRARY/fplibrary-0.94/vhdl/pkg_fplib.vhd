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
use fplib.pkg_fplib_fp.all;
use fplib.pkg_fplib_lns.all;

package pkg_fplib is
  type format is (FP, LNS);

  component Add is
    generic ( fmt : format;
              wE  : positive := 6;
              wF  : positive := 13 );
    port ( nA : in  std_logic_vector(wE+wF+2 downto 0);
           nB : in  std_logic_vector(wE+wF+2 downto 0);
           nR : out std_logic_vector(wE+wF+2 downto 0) );
  end component;

  component Add_Clk is
    generic ( fmt : format;
              wE  : positive := 6;
              wF  : positive := 13;
              reg : boolean  := true );
    port ( nA  : in  std_logic_vector(wE+wF+2 downto 0);
           nB  : in  std_logic_vector(wE+wF+2 downto 0);
           nR  : out std_logic_vector(wE+wF+2 downto 0);
           clk : in  std_logic );
  end component;

  function addLatency( fmt    : format;
                       wE, wF : positive ) return natural;
  
  component Mul is
    generic ( fmt : format;
              wE  : positive := 6;
              wF  : positive := 13 );
    port ( nA : in  std_logic_vector(wE+wF+2 downto 0);
           nB : in  std_logic_vector(wE+wF+2 downto 0);
           nR : out std_logic_vector(wE+wF+2 downto 0) );
  end component;

  component Mul_Clk is
    generic ( fmt : format;
              wE  : positive := 6;
              wF  : positive := 13;
              reg : boolean  := true );
    port ( nA  : in  std_logic_vector(wE+wF+2 downto 0);
           nB  : in  std_logic_vector(wE+wF+2 downto 0);
           nR  : out std_logic_vector(wE+wF+2 downto 0);
           clk : in  std_logic );
  end component;
  
  function mulLatency( fmt    : format;
                       wE, wF : positive ) return natural;
  
  component Div is
    generic ( fmt : format;
              wE  : positive := 6;
              wF  : positive := 13 );
    port ( nA : in  std_logic_vector(wE+wF+2 downto 0);
           nB : in  std_logic_vector(wE+wF+2 downto 0);
           nR : out std_logic_vector(wE+wF+2 downto 0) );
  end component;

  component Div_Clk is
    generic ( fmt : format;
              wE  : positive := 6;
              wF  : positive := 13;
              reg : boolean  := true );
    port ( nA  : in  std_logic_vector(wE+wF+2 downto 0);
           nB  : in  std_logic_vector(wE+wF+2 downto 0);
           nR  : out std_logic_vector(wE+wF+2 downto 0);
           clk : in  std_logic );
  end component;
  
  function divLatency( fmt    : format;
                       wE, wF : positive ) return natural;
  
  component Sqrt is
    generic ( fmt : format;
              wE  : positive := 6;
              wF  : positive := 13 );
    port ( nA : in  std_logic_vector(wE+wF+2 downto 0);
           nR : out std_logic_vector(wE+wF+2 downto 0) );
  end component;

  component Sqrt_Clk is
    generic ( fmt : format;
              wE  : positive := 6;
              wF  : positive := 13;
              reg : boolean  := true );
    port ( nA  : in  std_logic_vector(wE+wF+2 downto 0);
           nR  : out std_logic_vector(wE+wF+2 downto 0);
           clk : in  std_logic );
  end component;

  function sqrtLatency( fmt    : format;
                        wE, wF : positive ) return natural;
  
  component FXP_To_FP is
    generic ( wE    : positive := 6;
              wF    : positive := 13;
              wFX_I : positive := 6;
              wFX_F : positive := 13 );
    port ( nA : in  std_logic_vector(wFX_I+wFX_F-1 downto 0);
           nR : out std_logic_vector(wE+wF+2 downto 0));
  end component;

  component FP_To_FXP is
    generic ( wE    : positive := 6;
              wF    : positive := 13;
              wFX_I : positive := 6;
              wFX_F : positive := 13 );
    port ( nA : in  std_logic_vector(wE+wF+2 downto 0);
           nR : out std_logic_vector(wFX_I+wFX_F-1 downto 0));
  end component;

  component IEEE754_To_FP is
    generic ( wE : positive := 6;
              wF : positive := 13 );
    port ( nA : in  std_logic_vector(wE+wF downto 0);
           nR : out std_logic_vector(wE+wF+2 downto 0));
  end component;

  component IEEE754_To_LNS is
    generic ( wE : positive := 6;
              wF : positive := 13 );
    port ( nA : in  std_logic_vector(wE+wF downto 0);
           nR : out std_logic_vector(wE+wF+2 downto 0));
  end component;

  component FP_To_IEEE754 is
    generic ( wE : positive := 6;
              wF : positive := 13 );
    port ( nA : in  std_logic_vector(wE+wF+2 downto 0);
           nR : out std_logic_vector(wE+wF downto 0));
  end component;

  component LNS_To_IEEE754 is
    generic ( wE : positive := 6;
              wF : positive := 13 );
    port ( nA : in  std_logic_vector(wE+wF+2 downto 0);
           nR : out std_logic_vector(wE+wF downto 0));
  end component;
end package;

package body pkg_fplib is
  function addLatency( fmt    : format;
                       wE, wF : positive ) return natural is
  begin
    if fmt = FP then
      return fpaddLatency(wE, wF);
    elsif fmt = LNS then
      return lnsaddLatency(wE, wF);
    end if;
  end function;
  
  function mulLatency( fmt    : format;
                       wE, wF : positive ) return natural is
  begin
    if fmt = FP then
      return fpmulLatency(wE, wF);
    elsif fmt = LNS then
      return lnsmulLatency(wE, wF);
    end if;
  end function;
  
  function divLatency( fmt    : format;
                       wE, wF : positive ) return natural is
  begin
    if fmt = FP then
      return fpdivLatency(wE, wF);
    elsif fmt = LNS then
      return lnsdivLatency(wE, wF);
    end if;
  end function;
  
  function sqrtLatency( fmt    : format;
                        wE, wF : positive ) return natural is
  begin
    if fmt = FP then
      return fpsqrtLatency(wE, wF);
    elsif fmt = LNS then
      return lnssqrtLatency(wE, wF);
    end if;
  end function;
end package body;
