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
use fplib.pkg_fpmul.all;
use fplib.pkg_fpdiv.all;
use fplib.pkg_fpsqrt.all;

package pkg_fplib_fp is
  component FPAdd is
    generic ( wE : positive := 6;
              wF : positive := 13 );
    port ( nA : in  std_logic_vector(wE+wF+2 downto 0);
           nB : in  std_logic_vector(wE+wF+2 downto 0);
           nR : out std_logic_vector(wE+wF+2 downto 0) );
  end component;

  component FPAdd_Clk is
    generic ( wE : positive := 6;
              wF : positive := 13 );
    port ( nA  : in  std_logic_vector(wE+wF+2 downto 0);
           nB  : in  std_logic_vector(wE+wF+2 downto 0);
           nR  : out std_logic_vector(wE+wF+2 downto 0);
           clk : in  std_logic );
  end component;

  function fpaddLatency( wE, wF : positive ) return natural;
  
  component FPMul is
    generic ( wE : positive := 6;
              wF : positive := 13 );
    port ( nA : in  std_logic_vector(wE+wF+2 downto 0);
           nB : in  std_logic_vector(wE+wF+2 downto 0);
           nR : out std_logic_vector(wE+wF+2 downto 0) );
  end component;

  component FPMul_Clk is
    generic ( wE : positive := 6;
              wF : positive := 13 );
    port ( nA  : in  std_logic_vector(wE+wF+2 downto 0);
           nB  : in  std_logic_vector(wE+wF+2 downto 0);
           nR  : out std_logic_vector(wE+wF+2 downto 0);
           clk : in  std_logic );
  end component;

  function fpmulLatency( wE, wF : positive ) return natural;
  
  component FPDiv is
    generic ( wE : positive := 6;
              wF : positive := 13 );
    port ( nA : in  std_logic_vector(wE+wF+2 downto 0);
           nB : in  std_logic_vector(wE+wF+2 downto 0);
           nR : out std_logic_vector(wE+wF+2 downto 0) );
  end component;

  component FPDiv_Clk is
    generic ( wE : positive := 6;
              wF : positive := 13 );
    port ( nA   : in  std_logic_vector(wE+wF+2 downto 0);
           nB   : in  std_logic_vector(wE+wF+2 downto 0);
           nR   : out std_logic_vector(wE+wF+2 downto 0);
           clk  : in  std_logic );
  end component;

  function fpdivLatency( wE, wF : positive ) return natural;
  
  component FPSqrt is
    generic ( wE : positive := 6;
              wF : positive := 13 );
    port ( nA : in  std_logic_vector(wE+wF+2 downto 0);
           nR : out std_logic_vector(wE+wF+2 downto 0) );
  end component;

  component FPSqrt_Clk is
    generic ( wE : positive := 6;
              wF : positive := 13 );
    port ( nA  : in  std_logic_vector(wE+wF+2 downto 0);
           nR  : out std_logic_vector(wE+wF+2 downto 0);
           clk : in  std_logic );
  end component;

  function fpsqrtLatency( wE, wF : positive ) return natural;
end package;

package body pkg_fplib_fp is
  function fpaddLatency( wE, wF : positive ) return natural is
  begin
    return 3 + 1;
  end function;
  
  function fpmulLatency( wE, wF : positive ) return natural is
  begin
    return 3 + prodLatency(wF);
  end function;
  
  function fpdivLatency( wE, wF : positive ) return natural is
  begin
    return 3 + divLatency(wF);
  end function;
  
  function fpsqrtLatency( wE, wF : positive ) return natural is
  begin
    return 3 + sqrtLatency(wF);
  end function;
end package body;
