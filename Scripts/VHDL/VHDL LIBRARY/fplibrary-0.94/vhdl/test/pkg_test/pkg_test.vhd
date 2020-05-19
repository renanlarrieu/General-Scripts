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

package pkg_test is
  component Test_Core is
    generic ( wAddr      : positive;
              wInVal     : positive;
              wOutVal    : positive;
              latency    : positive := 1;
              throughput : positive := 1;
              bundle     : positive := 1 );
    port ( clk : in  std_logic;
           rst : in  std_logic;
           err : out std_logic );
  end component;

  component Test_Op is
    generic ( wE : positive;
              wF : positive;
              nVal  : positive );
    port ( inVal  : in  std_logic_vector(nVal*(wE+wF+3)-1 downto 0);
           outVal : out std_logic_vector(wE+wF+2 downto 0);
           load   : in  std_logic;
           clk    : in  std_logic );
  end component;

  component Test_Comparator is
    generic ( wE : positive;
              wF : positive );
    port ( nA : in  std_logic_vector(wE+wF+2 downto 0);
           nB : in  std_logic_vector(wE+wF+2 downto 0);
           eq : out std_logic );
  end component;

  component Test_LNSAddCore is
    generic ( wAddr      : positive;
              wInVal     : positive;
              wOutVal    : positive;
              latency    : positive := 1;
              throughput : positive := 1;
              bundle     : positive := 1 );
    port ( clk : in  std_logic;
           rst : in  std_logic;
           err : out std_logic );
  end component;

  component Test_LNSAddComparator is
    generic ( wE : positive;
              wF : positive );
    port ( nA  : in  std_logic_vector(wE+wF+2 downto 0);
           nB1 : in  std_logic_vector(wE+wF+2 downto 0);
           nB2 : in  std_logic_vector(wE+wF+2 downto 0);
           eq  : out std_logic );
  end component;
end package;
