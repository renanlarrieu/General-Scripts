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

package pkg_lnsadd is
  function addLatency( wF : positive ) return natural;

  component LNSAdd_Swap is
    generic ( wE : positive;
              wF : positive );
    port ( nA : in  std_logic_vector(wE+wF+2 downto 0);
           nB : in  std_logic_vector(wE+wF+2 downto 0);
           nR : out std_logic_vector(wE+wF+2 downto 0);
           nS : out std_logic_vector(wE+wF+2 downto 0);
           eD : out std_logic_vector(wE+wF-1 downto 0) );
  end component;

  component LNSAdd_Add is
    generic ( wE : positive;
              wF : positive );
    port ( x : in  std_logic_vector(min(wE,log(wF+1)+1)+wF-1 downto 0);
           r : out std_logic_vector(wF downto 0) );
  end component;

  component LNSAdd_Sub is
    generic ( wE : positive;
              wF : positive );
    port ( x : in  std_logic_vector(min(wE,log(wF+1)+1)+wF-1 downto 0);
           r : out std_logic_vector(wE+wF downto 0) );
  end component;
  
  component LNSAdd_Add_Clk is
    generic ( wE : positive;
              wF : positive );
    port ( x   : in  std_logic_vector(min(wE,log(wF+1)+1)+wF-1 downto 0);
           r   : out std_logic_vector(wF downto 0);
           clk : in  std_logic );
  end component;

  component LNSAdd_Sub_Clk is
    generic ( wE : positive;
              wF : positive );
    port ( x   : in  std_logic_vector(min(wE,log(wF+1)+1)+wF-1 downto 0);
           r   : out std_logic_vector(wE+wF downto 0);
           clk : in  std_logic );
  end component;
end package;

package body pkg_lnsadd is
  function addLatency( wF : positive ) return natural is
  begin
    if wF < 8 then
      return 0;
    else
      return 1;
    end if;
  end function;
end package body;
