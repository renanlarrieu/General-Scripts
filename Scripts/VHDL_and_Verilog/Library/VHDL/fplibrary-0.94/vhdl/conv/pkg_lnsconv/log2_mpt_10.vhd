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
-- wI = 10 bits
-- wO = 10 bits
-- Decomposition: 5, 5 / 5, 3 / 2, 3
-- Guard bits: 3
-- Size: 1120 = 13.2^5 + 8.2^6 + 6.2^5

library ieee;
use ieee.std_logic_1164.all;

package pkg_Log2_MPT_10 is
  component Log2_MPT_10_tiv is
    port( x : in  std_logic_vector(4 downto 0);
          r : out std_logic_vector(12 downto 0) );
  end component;

  component Log2_MPT_10_to1 is
    port( x : in  std_logic_vector(5 downto 0);
          r : out std_logic_vector(7 downto 0) );
  end component;

  component Log2_MPT_10_to0 is
    port( x : in  std_logic_vector(4 downto 0);
          r : out std_logic_vector(5 downto 0) );
  end component;

  component Log2_MPT_10_to1_xor is
    port( a : in  std_logic_vector(4 downto 0);
          b : in  std_logic_vector(1 downto 0);
          r : out std_logic_vector(12 downto 0) );
  end component;

  component Log2_MPT_10_to0_xor is
    port( a : in  std_logic_vector(2 downto 0);
          b : in  std_logic_vector(2 downto 0);
          r : out std_logic_vector(12 downto 0) );
  end component;
end package;


library ieee;
use ieee.std_logic_1164.all;

entity Log2_MPT_10_tiv is
  port( x : in  std_logic_vector(4 downto 0);
        r : out std_logic_vector(12 downto 0) );
end entity;

architecture arch of Log2_MPT_10_tiv is
begin
  with x select
    r <=
      "0000010110101" when "00000", -- t[0] = 181
      "0001000011011" when "00001", -- t[1] = 539
      "0001101110111" when "00010", -- t[2] = 887
      "0010011001001" when "00011", -- t[3] = 1225
      "0011000010001" when "00100", -- t[4] = 1553
      "0011101010001" when "00101", -- t[5] = 1873
      "0100010001000" when "00110", -- t[6] = 2184
      "0100110110111" when "00111", -- t[7] = 2487
      "0101011011111" when "01000", -- t[8] = 2783
      "0101111111111" when "01001", -- t[9] = 3071
      "0110100011001" when "01010", -- t[10] = 3353
      "0111000101100" when "01011", -- t[11] = 3628
      "0111100111000" when "01100", -- t[12] = 3896
      "1000000111111" when "01101", -- t[13] = 4159
      "1000101000000" when "01110", -- t[14] = 4416
      "1001000111011" when "01111", -- t[15] = 4667
      "1001100110010" when "10000", -- t[16] = 4914
      "1010000100011" when "10001", -- t[17] = 5155
      "1010100001111" when "10010", -- t[18] = 5391
      "1010111110111" when "10011", -- t[19] = 5623
      "1011011011010" when "10100", -- t[20] = 5850
      "1011110111001" when "10101", -- t[21] = 6073
      "1100010010100" when "10110", -- t[22] = 6292
      "1100101101011" when "10111", -- t[23] = 6507
      "1101000111110" when "11000", -- t[24] = 6718
      "1101100001101" when "11001", -- t[25] = 6925
      "1101111011001" when "11010", -- t[26] = 7129
      "1110010100010" when "11011", -- t[27] = 7330
      "1110101100110" when "11100", -- t[28] = 7526
      "1111000101000" when "11101", -- t[29] = 7720
      "1111011100111" when "11110", -- t[30] = 7911
      "1111110100010" when "11111", -- t[31] = 8098
      "-------------" when others;
end architecture;


library ieee;
use ieee.std_logic_1164.all;

entity Log2_MPT_10_to1 is
  port( x : in  std_logic_vector(5 downto 0);
        r : out std_logic_vector(7 downto 0) );
end entity;

architecture arch of Log2_MPT_10_to1 is
begin
  with x select
    r <=
      "00101101" when "000000", -- t[0] = 45
      "10001000" when "000001", -- t[1] = 136
      "00101100" when "000010", -- t[2] = 44
      "10000100" when "000011", -- t[3] = 132
      "00101010" when "000100", -- t[4] = 42
      "10000000" when "000101", -- t[5] = 128
      "00101001" when "000110", -- t[6] = 41
      "01111101" when "000111", -- t[7] = 125
      "00101000" when "001000", -- t[8] = 40
      "01111001" when "001001", -- t[9] = 121
      "00100111" when "001010", -- t[10] = 39
      "01110110" when "001011", -- t[11] = 118
      "00100110" when "001100", -- t[12] = 38
      "01110011" when "001101", -- t[13] = 115
      "00100101" when "001110", -- t[14] = 37
      "01110000" when "001111", -- t[15] = 112
      "00100100" when "010000", -- t[16] = 36
      "01101101" when "010001", -- t[17] = 109
      "00100011" when "010010", -- t[18] = 35
      "01101011" when "010011", -- t[19] = 107
      "00100010" when "010100", -- t[20] = 34
      "01101000" when "010101", -- t[21] = 104
      "00100010" when "010110", -- t[22] = 34
      "01100110" when "010111", -- t[23] = 102
      "00100001" when "011000", -- t[24] = 33
      "01100011" when "011001", -- t[25] = 99
      "00100000" when "011010", -- t[26] = 32
      "01100001" when "011011", -- t[27] = 97
      "00011111" when "011100", -- t[28] = 31
      "01011111" when "011101", -- t[29] = 95
      "00011111" when "011110", -- t[30] = 31
      "01011101" when "011111", -- t[31] = 93
      "00011110" when "100000", -- t[32] = 30
      "01011011" when "100001", -- t[33] = 91
      "00011101" when "100010", -- t[34] = 29
      "01011001" when "100011", -- t[35] = 89
      "00011101" when "100100", -- t[36] = 29
      "01010111" when "100101", -- t[37] = 87
      "00011100" when "100110", -- t[38] = 28
      "01010110" when "100111", -- t[39] = 86
      "00011100" when "101000", -- t[40] = 28
      "01010100" when "101001", -- t[41] = 84
      "00011011" when "101010", -- t[42] = 27
      "01010011" when "101011", -- t[43] = 83
      "00011011" when "101100", -- t[44] = 27
      "01010001" when "101101", -- t[45] = 81
      "00011010" when "101110", -- t[46] = 26
      "01010000" when "101111", -- t[47] = 80
      "00011010" when "110000", -- t[48] = 26
      "01001110" when "110001", -- t[49] = 78
      "00011001" when "110010", -- t[50] = 25
      "01001101" when "110011", -- t[51] = 77
      "00011001" when "110100", -- t[52] = 25
      "01001011" when "110101", -- t[53] = 75
      "00011000" when "110110", -- t[54] = 24
      "01001010" when "110111", -- t[55] = 74
      "00011000" when "111000", -- t[56] = 24
      "01001001" when "111001", -- t[57] = 73
      "00011000" when "111010", -- t[58] = 24
      "01001000" when "111011", -- t[59] = 72
      "00010111" when "111100", -- t[60] = 23
      "01000111" when "111101", -- t[61] = 71
      "00010111" when "111110", -- t[62] = 23
      "01000101" when "111111", -- t[63] = 69
      "--------" when others;
end architecture;


library ieee;
use ieee.std_logic_1164.all;

entity Log2_MPT_10_to0 is
  port( x : in  std_logic_vector(4 downto 0);
        r : out std_logic_vector(5 downto 0) );
end entity;

architecture arch of Log2_MPT_10_to0 is
begin
  with x select
    r <=
      "000101" when "00000", -- t[0] = 5
      "010000" when "00001", -- t[1] = 16
      "011011" when "00010", -- t[2] = 27
      "100110" when "00011", -- t[3] = 38
      "000100" when "00100", -- t[4] = 4
      "001110" when "00101", -- t[5] = 14
      "011000" when "00110", -- t[6] = 24
      "100010" when "00111", -- t[7] = 34
      "000100" when "01000", -- t[8] = 4
      "001101" when "01001", -- t[9] = 13
      "010110" when "01010", -- t[10] = 22
      "011110" when "01011", -- t[11] = 30
      "000100" when "01100", -- t[12] = 4
      "001100" when "01101", -- t[13] = 12
      "010100" when "01110", -- t[14] = 20
      "011100" when "01111", -- t[15] = 28
      "000011" when "10000", -- t[16] = 3
      "001011" when "10001", -- t[17] = 11
      "010010" when "10010", -- t[18] = 18
      "011001" when "10011", -- t[19] = 25
      "000011" when "10100", -- t[20] = 3
      "001010" when "10101", -- t[21] = 10
      "010001" when "10110", -- t[22] = 17
      "010111" when "10111", -- t[23] = 23
      "000011" when "11000", -- t[24] = 3
      "001001" when "11001", -- t[25] = 9
      "001111" when "11010", -- t[26] = 15
      "010110" when "11011", -- t[27] = 22
      "000010" when "11100", -- t[28] = 2
      "001000" when "11101", -- t[29] = 8
      "001110" when "11110", -- t[30] = 14
      "010100" when "11111", -- t[31] = 20
      "------" when others;
end architecture;


library ieee;
use ieee.std_logic_1164.all;
library fplib;
use fplib.pkg_Log2_MPT_10.all;

entity Log2_MPT_10_to1_xor is
  port( a : in  std_logic_vector(4 downto 0);
        b : in  std_logic_vector(1 downto 0);
        r : out std_logic_vector(12 downto 0) );
end entity;

architecture arch of Log2_MPT_10_to1_xor is
  signal sign  : std_logic;
  signal in_t  : std_logic_vector(5 downto 0);
  signal out_t : std_logic_vector(7 downto 0);
begin
  sign <= not b(1);
  in_t(5 downto 1) <= a(4 downto 0);
  in_t(0) <= b(0) xor sign;

  inst_to1 : Log2_MPT_10_to1
    port map( x => in_t,
              r => out_t );

  r(12 downto 8) <= (12 downto 8 => sign);
  r(0) <= out_t(0) xor sign;
  r(1) <= out_t(1) xor sign;
  r(2) <= out_t(2) xor sign;
  r(3) <= out_t(3) xor sign;
  r(4) <= out_t(4) xor sign;
  r(5) <= out_t(5) xor sign;
  r(6) <= out_t(6) xor sign;
  r(7) <= out_t(7) xor sign;
end architecture;


library ieee;
use ieee.std_logic_1164.all;
library fplib;
use fplib.pkg_Log2_MPT_10.all;

entity Log2_MPT_10_to0_xor is
  port( a : in  std_logic_vector(2 downto 0);
        b : in  std_logic_vector(2 downto 0);
        r : out std_logic_vector(12 downto 0) );
end entity;

architecture arch of Log2_MPT_10_to0_xor is
  signal sign  : std_logic;
  signal in_t  : std_logic_vector(4 downto 0);
  signal out_t : std_logic_vector(5 downto 0);
begin
  sign <= not b(2);
  in_t(4 downto 2) <= a(2 downto 0);
  in_t(0) <= b(0) xor sign;
  in_t(1) <= b(1) xor sign;

  inst_to0 : Log2_MPT_10_to0
    port map( x => in_t,
              r => out_t );

  r(12 downto 6) <= (12 downto 6 => sign);
  r(0) <= out_t(0) xor sign;
  r(1) <= out_t(1) xor sign;
  r(2) <= out_t(2) xor sign;
  r(3) <= out_t(3) xor sign;
  r(4) <= out_t(4) xor sign;
  r(5) <= out_t(5) xor sign;
end architecture;


library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library fplib;
use fplib.pkg_Log2_MPT_10.all;

entity Log2_MPT_10 is
  port( x : in  std_logic_vector(9 downto 0);
        r : out std_logic_vector(9 downto 0) );
end entity;

architecture arch of Log2_MPT_10 is
  signal in_tiv  : std_logic_vector(4 downto 0);
  signal out_tiv : std_logic_vector(12 downto 0);
  signal a1      : std_logic_vector(4 downto 0);
  signal b1      : std_logic_vector(1 downto 0);
  signal out1    : std_logic_vector(12 downto 0);
  signal a0      : std_logic_vector(2 downto 0);
  signal b0      : std_logic_vector(2 downto 0);
  signal out0    : std_logic_vector(12 downto 0);
  signal sum     : std_logic_vector(12 downto 0);
begin
  in_tiv <= x(9 downto 5);
  inst_tiv : Log2_MPT_10_tiv
    port map( x => in_tiv,
              r => out_tiv );

  a1 <= x(9 downto 5);
  b1 <= x(4 downto 3);
  inst_to1_xor : Log2_MPT_10_to1_xor
    port map( a => a1,
              b => b1,
              r => out1 );

  a0 <= x(9 downto 7);
  b0 <= x(2 downto 0);
  inst_to0_xor : Log2_MPT_10_to0_xor
    port map( a => a0,
              b => b0,
              r => out0 );


  sum <= out_tiv + out1 + out0;
  r <= sum(12 downto 3);
end architecture;
