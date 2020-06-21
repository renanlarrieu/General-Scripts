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
-- wI = 8 bits
-- wO = 8 bits
-- Decomposition: 5, 3 / 3 / 3
-- Guard bits: 1
-- Size: 416 = 9.2^5 + 4.2^5

library ieee;
use ieee.std_logic_1164.all;

package pkg_Log2_MPT_8 is
  component Log2_MPT_8_tiv is
    port( x : in  std_logic_vector(4 downto 0);
          r : out std_logic_vector(8 downto 0) );
  end component;

  component Log2_MPT_8_to0 is
    port( x : in  std_logic_vector(4 downto 0);
          r : out std_logic_vector(3 downto 0) );
  end component;

  component Log2_MPT_8_to0_xor is
    port( a : in  std_logic_vector(2 downto 0);
          b : in  std_logic_vector(2 downto 0);
          r : out std_logic_vector(8 downto 0) );
  end component;
end package;


library ieee;
use ieee.std_logic_1164.all;

entity Log2_MPT_8_tiv is
  port( x : in  std_logic_vector(4 downto 0);
        r : out std_logic_vector(8 downto 0) );
end entity;

architecture arch of Log2_MPT_8_tiv is
begin
  with x select
    r <=
      "000001011" when "00000", -- t[0] = 11
      "000100001" when "00001", -- t[1] = 33
      "000110111" when "00010", -- t[2] = 55
      "001001100" when "00011", -- t[3] = 76
      "001100001" when "00100", -- t[4] = 97
      "001110101" when "00101", -- t[5] = 117
      "010001000" when "00110", -- t[6] = 136
      "010011011" when "00111", -- t[7] = 155
      "010101110" when "01000", -- t[8] = 174
      "011000000" when "01001", -- t[9] = 192
      "011010001" when "01010", -- t[10] = 209
      "011100011" when "01011", -- t[11] = 227
      "011110011" when "01100", -- t[12] = 243
      "100000100" when "01101", -- t[13] = 260
      "100010100" when "01110", -- t[14] = 276
      "100100100" when "01111", -- t[15] = 292
      "100110011" when "10000", -- t[16] = 307
      "101000010" when "10001", -- t[17] = 322
      "101010001" when "10010", -- t[18] = 337
      "101011111" when "10011", -- t[19] = 351
      "101101101" when "10100", -- t[20] = 365
      "101111011" when "10101", -- t[21] = 379
      "110001001" when "10110", -- t[22] = 393
      "110010111" when "10111", -- t[23] = 407
      "110100100" when "11000", -- t[24] = 420
      "110110001" when "11001", -- t[25] = 433
      "110111101" when "11010", -- t[26] = 445
      "111001010" when "11011", -- t[27] = 458
      "111010110" when "11100", -- t[28] = 470
      "111100010" when "11101", -- t[29] = 482
      "111101110" when "11110", -- t[30] = 494
      "111111010" when "11111", -- t[31] = 506
      "---------" when others;
end architecture;


library ieee;
use ieee.std_logic_1164.all;

entity Log2_MPT_8_to0 is
  port( x : in  std_logic_vector(4 downto 0);
        r : out std_logic_vector(3 downto 0) );
end entity;

architecture arch of Log2_MPT_8_to0 is
begin
  with x select
    r <=
      "0001" when "00000", -- t[0] = 1
      "0100" when "00001", -- t[1] = 4
      "0110" when "00010", -- t[2] = 6
      "1001" when "00011", -- t[3] = 9
      "0001" when "00100", -- t[4] = 1
      "0011" when "00101", -- t[5] = 3
      "0110" when "00110", -- t[6] = 6
      "1000" when "00111", -- t[7] = 8
      "0001" when "01000", -- t[8] = 1
      "0011" when "01001", -- t[9] = 3
      "0101" when "01010", -- t[10] = 5
      "0111" when "01011", -- t[11] = 7
      "0001" when "01100", -- t[12] = 1
      "0011" when "01101", -- t[13] = 3
      "0101" when "01110", -- t[14] = 5
      "0111" when "01111", -- t[15] = 7
      "0000" when "10000", -- t[16] = 0
      "0010" when "10001", -- t[17] = 2
      "0100" when "10010", -- t[18] = 4
      "0110" when "10011", -- t[19] = 6
      "0000" when "10100", -- t[20] = 0
      "0010" when "10101", -- t[21] = 2
      "0100" when "10110", -- t[22] = 4
      "0101" when "10111", -- t[23] = 5
      "0000" when "11000", -- t[24] = 0
      "0010" when "11001", -- t[25] = 2
      "0011" when "11010", -- t[26] = 3
      "0101" when "11011", -- t[27] = 5
      "0000" when "11100", -- t[28] = 0
      "0010" when "11101", -- t[29] = 2
      "0011" when "11110", -- t[30] = 3
      "0101" when "11111", -- t[31] = 5
      "----" when others;
end architecture;


library ieee;
use ieee.std_logic_1164.all;
library fplib;
use fplib.pkg_Log2_MPT_8.all;

entity Log2_MPT_8_to0_xor is
  port( a : in  std_logic_vector(2 downto 0);
        b : in  std_logic_vector(2 downto 0);
        r : out std_logic_vector(8 downto 0) );
end entity;

architecture arch of Log2_MPT_8_to0_xor is
  signal sign  : std_logic;
  signal in_t  : std_logic_vector(4 downto 0);
  signal out_t : std_logic_vector(3 downto 0);
begin
  sign <= not b(2);
  in_t(4 downto 2) <= a(2 downto 0);
  in_t(0) <= b(0) xor sign;
  in_t(1) <= b(1) xor sign;

  inst_to0 : Log2_MPT_8_to0
    port map( x => in_t,
              r => out_t );

  r(8 downto 4) <= (8 downto 4 => sign);
  r(0) <= out_t(0) xor sign;
  r(1) <= out_t(1) xor sign;
  r(2) <= out_t(2) xor sign;
  r(3) <= out_t(3) xor sign;
end architecture;


library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library fplib;
use fplib.pkg_Log2_MPT_8.all;

entity Log2_MPT_8 is
  port( x : in  std_logic_vector(7 downto 0);
        r : out std_logic_vector(7 downto 0) );
end entity;

architecture arch of Log2_MPT_8 is
  signal in_tiv  : std_logic_vector(4 downto 0);
  signal out_tiv : std_logic_vector(8 downto 0);
  signal a0      : std_logic_vector(2 downto 0);
  signal b0      : std_logic_vector(2 downto 0);
  signal out0    : std_logic_vector(8 downto 0);
  signal sum     : std_logic_vector(8 downto 0);
begin
  in_tiv <= x(7 downto 3);
  inst_tiv : Log2_MPT_8_tiv
    port map( x => in_tiv,
              r => out_tiv );

  a0 <= x(7 downto 5);
  b0 <= x(2 downto 0);
  inst_to0_xor : Log2_MPT_8_to0_xor
    port map( a => a0,
              b => b0,
              r => out0 );


  sum <= out_tiv + out0;
  r <= sum(8 downto 1);
end architecture;
