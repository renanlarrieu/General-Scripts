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


-- MultiPartite: log2(x)        on [1,2[
-- wI = 6 bits
-- wO = 6 bits
-- Decomposition: 4, 2 / 1 / 2
-- Guard bits: 1
-- Size: 120 = 7.2^4 + 2.2^2

library ieee;
use ieee.std_logic_1164.all;

package pkg_Log2_MPT_6 is
  component Log2_MPT_6_tiv is
    port( x : in  std_logic_vector(3 downto 0);
          r : out std_logic_vector(6 downto 0) );
  end component;

  component Log2_MPT_6_to0 is
    port( x : in  std_logic_vector(1 downto 0);
          r : out std_logic_vector(1 downto 0) );
  end component;

  component Log2_MPT_6_to0_xor is
    port( a : in  std_logic_vector(0 downto 0);
          b : in  std_logic_vector(1 downto 0);
          r : out std_logic_vector(6 downto 0) );
  end component;
end package;


library ieee;
use ieee.std_logic_1164.all;

entity Log2_MPT_6_tiv is
  port( x : in  std_logic_vector(3 downto 0);
        r : out std_logic_vector(6 downto 0) );
end entity;

architecture arch of Log2_MPT_6_tiv is
begin
  with x select
    r <=
      "0000101" when "0000", -- t[0] = 5
      "0010000" when "0001", -- t[1] = 16
      "0011010" when "0010", -- t[2] = 26
      "0100100" when "0011", -- t[3] = 36
      "0101110" when "0100", -- t[4] = 46
      "0110110" when "0101", -- t[5] = 54
      "0111111" when "0110", -- t[6] = 63
      "1000111" when "0111", -- t[7] = 71
      "1001110" when "1000", -- t[8] = 78
      "1010110" when "1001", -- t[9] = 86
      "1011101" when "1010", -- t[10] = 93
      "1100100" when "1011", -- t[11] = 100
      "1101010" when "1100", -- t[12] = 106
      "1110001" when "1101", -- t[13] = 113
      "1110111" when "1110", -- t[14] = 119
      "1111101" when "1111", -- t[15] = 125
      "-------" when others;
end architecture;


library ieee;
use ieee.std_logic_1164.all;

entity Log2_MPT_6_to0 is
  port( x : in  std_logic_vector(1 downto 0);
        r : out std_logic_vector(1 downto 0) );
end entity;

architecture arch of Log2_MPT_6_to0 is
begin
  with x select
    r <=
      "01" when "00", -- t[0] = 1
      "11" when "01", -- t[1] = 3
      "00" when "10", -- t[2] = 0
      "10" when "11", -- t[3] = 2
      "--" when others;
end architecture;


library ieee;
use ieee.std_logic_1164.all;
library fplib;
use fplib.pkg_Log2_MPT_6.all;

entity Log2_MPT_6_to0_xor is
  port( a : in  std_logic_vector(0 downto 0);
        b : in  std_logic_vector(1 downto 0);
        r : out std_logic_vector(6 downto 0) );
end entity;

architecture arch of Log2_MPT_6_to0_xor is
  signal sign  : std_logic;
  signal in_t  : std_logic_vector(1 downto 0);
  signal out_t : std_logic_vector(1 downto 0);
begin
  sign <= not b(1);
  in_t(1 downto 1) <= a(0 downto 0);
  in_t(0) <= b(0) xor sign;

  inst_to0 : Log2_MPT_6_to0
    port map( x => in_t,
              r => out_t );

  r(6 downto 2) <= (6 downto 2 => sign);
  r(0) <= out_t(0) xor sign;
  r(1) <= out_t(1) xor sign;
end architecture;


library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library fplib;
use fplib.pkg_Log2_MPT_6.all;

entity Log2_MPT_6 is
  port( x : in  std_logic_vector(5 downto 0);
        r : out std_logic_vector(5 downto 0) );
end entity;

architecture arch of Log2_MPT_6 is
  signal in_tiv  : std_logic_vector(3 downto 0);
  signal out_tiv : std_logic_vector(6 downto 0);
  signal a0      : std_logic_vector(0 downto 0);
  signal b0      : std_logic_vector(1 downto 0);
  signal out0    : std_logic_vector(6 downto 0);
  signal sum     : std_logic_vector(6 downto 0);
begin
  in_tiv <= x(5 downto 2);
  inst_tiv : Log2_MPT_6_tiv
    port map( x => in_tiv,
              r => out_tiv );

  a0 <= x(5 downto 5);
  b0 <= x(1 downto 0);
  inst_to0_xor : Log2_MPT_6_to0_xor
    port map( a => a0,
              b => b0,
              r => out0 );


  sum <= out_tiv + out0;
  r <= sum(6 downto 1);
end architecture;
