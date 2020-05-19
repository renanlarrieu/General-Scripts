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
use fplib.pkg_lnsadd.all;

package pkg_fplib_lns is
  component LNSAdd is
    generic ( wE : positive := 6;
              wF : positive := 13 );
    port ( nA : in  std_logic_vector(wE+wF+2 downto 0);
           nB : in  std_logic_vector(wE+wF+2 downto 0);
           nR : out std_logic_vector(wE+wF+2 downto 0) );
  end component;
  
  component LNSAdd_Clk is
    generic ( wE : positive := 6;
              wF : positive := 13 );
    port ( nA  : in  std_logic_vector(wE+wF+2 downto 0);
           nB  : in  std_logic_vector(wE+wF+2 downto 0);
           nR  : out std_logic_vector(wE+wF+2 downto 0);
           clk : in  std_logic );
  end component;

  function lnsaddLatency( wE, wF : positive ) return natural;
  
  component LNSMul is
    generic ( wE : positive := 6;
              wF : positive := 13 );
    port ( nA : in  std_logic_vector(wE+wF+2 downto 0);
           nB : in  std_logic_vector(wE+wF+2 downto 0);
           nR : out std_logic_vector(wE+wF+2 downto 0) );
  end component;

  component LNSMul_Clk is
    generic ( wE : positive := 6;
              wF : positive := 13 );
    port ( nA  : in  std_logic_vector(wE+wF+2 downto 0);
           nB  : in  std_logic_vector(wE+wF+2 downto 0);
           nR  : out std_logic_vector(wE+wF+2 downto 0);
           clk : in  std_logic );
  end component;

  function lnsmulLatency( wE, wF : positive ) return natural;
  
  component LNSDiv is
    generic ( wE : positive := 6;
              wF : positive := 13 );
    port ( nA : in  std_logic_vector(wE+wF+2 downto 0);
           nB : in  std_logic_vector(wE+wF+2 downto 0);
           nR : out std_logic_vector(wE+wF+2 downto 0) );
  end component;

  component LNSDiv_Clk is
    generic ( wE : positive := 6;
              wF : positive := 13 );
    port ( nA  : in  std_logic_vector(wE+wF+2 downto 0);
           nB  : in  std_logic_vector(wE+wF+2 downto 0);
           nR  : out std_logic_vector(wE+wF+2 downto 0);
           clk : in  std_logic );
  end component;

  function lnsdivLatency( wE, wF : positive ) return natural;
  
  component LNSSqrt is
    generic ( wE : positive := 6;
              wF : positive := 13 );
    port ( nA : in  std_logic_vector(wE+wF+2 downto 0);
           nR : out std_logic_vector(wE+wF+2 downto 0) );
  end component;

  component LNSSqrt_Clk is
    generic ( wE : positive := 6;
              wF : positive := 13 );
    port ( nA  : in  std_logic_vector(wE+wF+2 downto 0);
           nR  : out std_logic_vector(wE+wF+2 downto 0);
           clk : in  std_logic );
  end component;

  function lnssqrtLatency( wE, wF : positive ) return natural;
end package;

package body pkg_fplib_lns is
  function lnsaddLatency( wE, wF : positive ) return natural is
  begin
    return 3 + addLatency(wF);
  end function;
  
  function lnsmulLatency( wE, wF : positive ) return natural is
  begin
    return 1;
  end function;
  
  function lnsdivLatency( wE, wF : positive ) return natural is
  begin
    return 1;
  end function;
  
  function lnssqrtLatency( wE, wF : positive ) return natural is
  begin
    return 1;
  end function;
end package body;
