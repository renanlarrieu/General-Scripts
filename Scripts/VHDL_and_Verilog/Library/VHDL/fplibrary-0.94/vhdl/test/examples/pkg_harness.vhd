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

package pkg_harness is
  component Norm is
    generic ( fmt : format;
              wE  : positive := 6;
              wF  : positive := 13;
              reg : boolean );
    port ( nA  : in  std_logic_vector(wE+wF+2 downto 0);
           nB  : in  std_logic_vector(wE+wF+2 downto 0);
           nR  : out std_logic_vector(wE+wF+2 downto 0);
           clk : in  std_logic );
  end component;
  
  function normLatency( fmt    : format;
                        wE, wF : positive ) return natural;
  
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
  
  function addtreeLatency( fmt    : format;
                           wE, wF : positive;
                           n      : positive ) return natural;

  component DotProd is
    generic ( fmt : format;
              wE  : positive := 6;
              wF  : positive := 13;
              reg : boolean;
              n   : positive );
    port ( vA  : in  std_logic_vector(n*(wE+wF+3)-1 downto 0);
           vB  : in  std_logic_vector(n*(wE+wF+3)-1 downto 0);
           nR  : out std_logic_vector(wE+wF+2 downto 0);
           clk : in  std_logic );
  end component;
  
  function dotprodLatency( fmt    : format;
                           wE, wF : positive;
                           n      : positive ) return natural;

  component MatVectProd is
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
  end component;
  
  function matvectprodLatency( fmt    : format;
                               wE, wF : positive;
                               n1, n2 : positive ) return natural;

  component MatMatProd is
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
  end component;

  function matmatprodLatency( fmt        : format;
                              wE, wF     : positive;
                              n1, n2, n3 : positive ) return natural;

  component DotProdP is
    generic ( fmt : format;
              wE  : positive := 6;
              wF  : positive := 13;
              n   : positive );
    port ( nA1 : in  std_logic_vector(wE+wF+2 downto 0);
           nB1 : in  std_logic_vector(wE+wF+2 downto 0);
           nA2 : in  std_logic_vector(wE+wF+2 downto 0);
           nB2 : in  std_logic_vector(wE+wF+2 downto 0);
           nR  : out std_logic_vector(wE+wF+2 downto 0);
           rst : in  std_logic;
           clk : in  std_logic );
  end component;
end package;

package body pkg_harness is
  function normLatency( fmt    : format;
                        wE, wF : positive ) return natural is
  variable lat : positive := mulLatency(fmt,wE,wF) + addLatency(fmt,wE,wF) + sqrtLatency(fmt,wE,wF);
  begin
    if fmt = FP then
      return lat;
    elsif fmt = LNS then
      return lat - 1;
    end if;
  end function;

  function addtreeLatency( fmt    : format;
                           wE, wF : positive;
                           n      : positive ) return natural is
  variable h   : positive := log(n-1)+1;
  begin
    return h * addLatency(fmt,wE,wF);
  end function;
  
  function dotprodLatency( fmt    : format;
                           wE, wF : positive;
                           n      : positive ) return natural is
  begin
    return mulLatency(fmt,wE,wF) + addtreeLatency(fmt,wE,wF,n);
  end function;
  
  function matvectprodLatency( fmt    : format;
                               wE, wF : positive;
                               n1, n2 : positive ) return natural is
  begin
    return dotprodLatency(fmt,wE,wF,n2);
  end function;
  
  function matmatprodLatency( fmt        : format;
                              wE, wF     : positive;
                              n1, n2, n3 : positive ) return natural is
  begin
    return dotprodLatency(fmt,wE,wF,n2);
  end function;
end package body;
