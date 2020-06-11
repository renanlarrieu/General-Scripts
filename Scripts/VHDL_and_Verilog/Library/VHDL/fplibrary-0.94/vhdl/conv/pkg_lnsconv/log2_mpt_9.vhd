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
-- wI = 9 bits
-- wO = 9 bits
-- Decomposition: 5, 4 / 4, 2 / 2, 2
-- Guard bits: 2
-- Size: 568 = 11.2^5 + 6.2^5 + 3.2^3

library ieee;
use ieee.std_logic_1164.all;

package pkg_Log2_MPT_9 is
  component Log2_MPT_9_tiv is
    port( x : in  std_logic_vector(4 downto 0);
          r : out std_logic_vector(10 downto 0) );
  end component;

  component Log2_MPT_9_to1 is
    port( x : in  std_logic_vector(4 downto 0);
          r : out std_logic_vector(5 downto 0) );
  end component;

  component Log2_MPT_9_to0 is
    port( x : in  std_logic_vector(2 downto 0);
          r : out std_logic_vector(2 downto 0) );
  end component;

  component Log2_MPT_9_to1_xor is
    port( a : in  std_logic_vector(3 downto 0);
          b : in  std_logic_vector(1 downto 0);
          r : out std_logic_vector(10 downto 0) );
  end component;

  component Log2_MPT_9_to0_xor is
    port( a : in  std_logic_vector(1 downto 0);
          b : in  std_logic_vector(1 downto 0);
          r : out std_logic_vector(10 downto 0) );
  end component;
end package;


library ieee;
use ieee.std_logic_1164.all;

entity Log2_MPT_9_tiv is
  port( x : in  std_logic_vector(4 downto 0);
        r : out std_logic_vector(10 downto 0) );
end entity;

architecture arch of Log2_MPT_9_tiv is
begin
  with x select
    r <=
      "00000101101" when "00000", -- t[0] = 45
      "00010000111" when "00001", -- t[1] = 135
      "00011011110" when "00010", -- t[2] = 222
      "00100110010" when "00011", -- t[3] = 306
      "00110000100" when "00100", -- t[4] = 388
      "00111010100" when "00101", -- t[5] = 468
      "01000100010" when "00110", -- t[6] = 546
      "01001101110" when "00111", -- t[7] = 622
      "01010111000" when "01000", -- t[8] = 696
      "01100000000" when "01001", -- t[9] = 768
      "01101000110" when "01010", -- t[10] = 838
      "01110001011" when "01011", -- t[11] = 907
      "01111001110" when "01100", -- t[12] = 974
      "10000010000" when "01101", -- t[13] = 1040
      "10001010000" when "01110", -- t[14] = 1104
      "10010001111" when "01111", -- t[15] = 1167
      "10011001101" when "10000", -- t[16] = 1229
      "10100001001" when "10001", -- t[17] = 1289
      "10101000100" when "10010", -- t[18] = 1348
      "10101111110" when "10011", -- t[19] = 1406
      "10110110111" when "10100", -- t[20] = 1463
      "10111101111" when "10101", -- t[21] = 1519
      "11000100101" when "10110", -- t[22] = 1573
      "11001011011" when "10111", -- t[23] = 1627
      "11010010000" when "11000", -- t[24] = 1680
      "11011000100" when "11001", -- t[25] = 1732
      "11011110110" when "11010", -- t[26] = 1782
      "11100101001" when "11011", -- t[27] = 1833
      "11101011010" when "11100", -- t[28] = 1882
      "11110001010" when "11101", -- t[29] = 1930
      "11110111010" when "11110", -- t[30] = 1978
      "11111101001" when "11111", -- t[31] = 2025
      "-----------" when others;
end architecture;


library ieee;
use ieee.std_logic_1164.all;

entity Log2_MPT_9_to1 is
  port( x : in  std_logic_vector(4 downto 0);
        r : out std_logic_vector(5 downto 0) );
end entity;

architecture arch of Log2_MPT_9_to1 is
begin
  with x select
    r <=
      "001011" when "00000", -- t[0] = 11
      "100001" when "00001", -- t[1] = 33
      "001010" when "00010", -- t[2] = 10
      "011111" when "00011", -- t[3] = 31
      "001010" when "00100", -- t[4] = 10
      "011110" when "00101", -- t[5] = 30
      "001001" when "00110", -- t[6] = 9
      "011100" when "00111", -- t[7] = 28
      "001001" when "01000", -- t[8] = 9
      "011011" when "01001", -- t[9] = 27
      "001000" when "01010", -- t[10] = 8
      "011001" when "01011", -- t[11] = 25
      "001000" when "01100", -- t[12] = 8
      "011000" when "01101", -- t[13] = 24
      "000111" when "01110", -- t[14] = 7
      "010111" when "01111", -- t[15] = 23
      "000111" when "10000", -- t[16] = 7
      "010110" when "10001", -- t[17] = 22
      "000111" when "10010", -- t[18] = 7
      "010101" when "10011", -- t[19] = 21
      "000110" when "10100", -- t[20] = 6
      "010100" when "10101", -- t[21] = 20
      "000110" when "10110", -- t[22] = 6
      "010100" when "10111", -- t[23] = 20
      "000110" when "11000", -- t[24] = 6
      "010011" when "11001", -- t[25] = 19
      "000110" when "11010", -- t[26] = 6
      "010010" when "11011", -- t[27] = 18
      "000110" when "11100", -- t[28] = 6
      "010010" when "11101", -- t[29] = 18
      "000101" when "11110", -- t[30] = 5
      "010001" when "11111", -- t[31] = 17
      "------" when others;
end architecture;


library ieee;
use ieee.std_logic_1164.all;

entity Log2_MPT_9_to0 is
  port( x : in  std_logic_vector(2 downto 0);
        r : out std_logic_vector(2 downto 0) );
end entity;

architecture arch of Log2_MPT_9_to0 is
begin
  with x select
    r <=
      "010" when "000", -- t[0] = 2
      "111" when "001", -- t[1] = 7
      "010" when "010", -- t[2] = 2
      "110" when "011", -- t[3] = 6
      "001" when "100", -- t[4] = 1
      "101" when "101", -- t[5] = 5
      "001" when "110", -- t[6] = 1
      "100" when "111", -- t[7] = 4
      "---" when others;
end architecture;


library ieee;
use ieee.std_logic_1164.all;
library fplib;
use fplib.pkg_Log2_MPT_9.all;

entity Log2_MPT_9_to1_xor is
  port( a : in  std_logic_vector(3 downto 0);
        b : in  std_logic_vector(1 downto 0);
        r : out std_logic_vector(10 downto 0) );
end entity;

architecture arch of Log2_MPT_9_to1_xor is
  signal sign  : std_logic;
  signal in_t  : std_logic_vector(4 downto 0);
  signal out_t : std_logic_vector(5 downto 0);
begin
  sign <= not b(1);
  in_t(4 downto 1) <= a(3 downto 0);
  in_t(0) <= b(0) xor sign;

  inst_to1 : Log2_MPT_9_to1
    port map( x => in_t,
              r => out_t );

  r(10 downto 6) <= (10 downto 6 => sign);
  r(0) <= out_t(0) xor sign;
  r(1) <= out_t(1) xor sign;
  r(2) <= out_t(2) xor sign;
  r(3) <= out_t(3) xor sign;
  r(4) <= out_t(4) xor sign;
  r(5) <= out_t(5) xor sign;
end architecture;


library ieee;
use ieee.std_logic_1164.all;
library fplib;
use fplib.pkg_Log2_MPT_9.all;

entity Log2_MPT_9_to0_xor is
  port( a : in  std_logic_vector(1 downto 0);
        b : in  std_logic_vector(1 downto 0);
        r : out std_logic_vector(10 downto 0) );
end entity;

architecture arch of Log2_MPT_9_to0_xor is
  signal sign  : std_logic;
  signal in_t  : std_logic_vector(2 downto 0);
  signal out_t : std_logic_vector(2 downto 0);
begin
  sign <= not b(1);
  in_t(2 downto 1) <= a(1 downto 0);
  in_t(0) <= b(0) xor sign;

  inst_to0 : Log2_MPT_9_to0
    port map( x => in_t,
              r => out_t );

  r(10 downto 3) <= (10 downto 3 => sign);
  r(0) <= out_t(0) xor sign;
  r(1) <= out_t(1) xor sign;
  r(2) <= out_t(2) xor sign;
end architecture;


library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library fplib;
use fplib.pkg_Log2_MPT_9.all;

entity Log2_MPT_9 is
  port( x : in  std_logic_vector(8 downto 0);
        r : out std_logic_vector(8 downto 0) );
end entity;

architecture arch of Log2_MPT_9 is
  signal in_tiv  : std_logic_vector(4 downto 0);
  signal out_tiv : std_logic_vector(10 downto 0);
  signal a1      : std_logic_vector(3 downto 0);
  signal b1      : std_logic_vector(1 downto 0);
  signal out1    : std_logic_vector(10 downto 0);
  signal a0      : std_logic_vector(1 downto 0);
  signal b0      : std_logic_vector(1 downto 0);
  signal out0    : std_logic_vector(10 downto 0);
  signal sum     : std_logic_vector(10 downto 0);
begin
  in_tiv <= x(8 downto 4);
  inst_tiv : Log2_MPT_9_tiv
    port map( x => in_tiv,
              r => out_tiv );

  a1 <= x(8 downto 5);
  b1 <= x(3 downto 2);
  inst_to1_xor : Log2_MPT_9_to1_xor
    port map( a => a1,
              b => b1,
              r => out1 );

  a0 <= x(8 downto 7);
  b0 <= x(1 downto 0);
  inst_to0_xor : Log2_MPT_9_to0_xor
    port map( a => a0,
              b => b0,
              r => out0 );


  sum <= out_tiv + out1 + out0;
  r <= sum(10 downto 2);
end architecture;
