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


-- MultiPartite: 2^x - 1        on [0,1[
-- wI = 10 bits
-- wO = 10 bits
-- Decomposition: 5, 5 / 5, 3 / 2, 3
-- Guard bits: 3
-- Size: 1120 = 13.2^5 + 8.2^6 + 6.2^5

library ieee;
use ieee.std_logic_1164.all;

package pkg_Exp2_MPT_10 is
  component Exp2_MPT_10_tiv is
    port( x : in  std_logic_vector(4 downto 0);
          r : out std_logic_vector(12 downto 0) );
  end component;

  component Exp2_MPT_10_to1 is
    port( x : in  std_logic_vector(5 downto 0);
          r : out std_logic_vector(7 downto 0) );
  end component;

  component Exp2_MPT_10_to0 is
    port( x : in  std_logic_vector(4 downto 0);
          r : out std_logic_vector(5 downto 0) );
  end component;

  component Exp2_MPT_10_to1_xor is
    port( a : in  std_logic_vector(4 downto 0);
          b : in  std_logic_vector(1 downto 0);
          r : out std_logic_vector(12 downto 0) );
  end component;

  component Exp2_MPT_10_to0_xor is
    port( a : in  std_logic_vector(2 downto 0);
          b : in  std_logic_vector(2 downto 0);
          r : out std_logic_vector(12 downto 0) );
  end component;
end package;


library ieee;
use ieee.std_logic_1164.all;

entity Exp2_MPT_10_tiv is
  port( x : in  std_logic_vector(4 downto 0);
        r : out std_logic_vector(12 downto 0) );
end entity;

architecture arch of Exp2_MPT_10_tiv is
begin
  with x select
    r <=
      "0000001100011" when "00000", -- t[0] = -8093
      "0000100011001" when "00001", -- t[1] = -7911
      "0000111010010" when "00010", -- t[2] = -7726
      "0001010001111" when "00011", -- t[3] = -7537
      "0001101010001" when "00100", -- t[4] = -7343
      "0010000010110" when "00101", -- t[5] = -7146
      "0010011100000" when "00110", -- t[6] = -6944
      "0010110101111" when "00111", -- t[7] = -6737
      "0011010000010" when "01000", -- t[8] = -6526
      "0011101011010" when "01001", -- t[9] = -6310
      "0100000110110" when "01010", -- t[10] = -6090
      "0100100010111" when "01011", -- t[11] = -5865
      "0100111111101" when "01100", -- t[12] = -5635
      "0101011101000" when "01101", -- t[13] = -5400
      "0101111011001" when "01110", -- t[14] = -5159
      "0110011001110" when "01111", -- t[15] = -4914
      "0110111001001" when "10000", -- t[16] = -4663
      "0111011001010" when "10001", -- t[17] = -4406
      "0111111010000" when "10010", -- t[18] = -4144
      "1000011011100" when "10011", -- t[19] = -3876
      "1000111101101" when "10100", -- t[20] = -3603
      "1001100000101" when "10101", -- t[21] = -3323
      "1010000100011" when "10110", -- t[22] = -3037
      "1010101000111" when "10111", -- t[23] = -2745
      "1011001110001" when "11000", -- t[24] = -2447
      "1011110100010" when "11001", -- t[25] = -2142
      "1100011011010" when "11010", -- t[26] = -1830
      "1101000011001" when "11011", -- t[27] = -1511
      "1101101011110" when "11100", -- t[28] = -1186
      "1110010101011" when "11101", -- t[29] = -853
      "1110111111111" when "11110", -- t[30] = -513
      "1111101011010" when "11111", -- t[31] = -166
      "-------------" when others;
end architecture;


library ieee;
use ieee.std_logic_1164.all;

entity Exp2_MPT_10_to1 is
  port( x : in  std_logic_vector(5 downto 0);
        r : out std_logic_vector(7 downto 0) );
end entity;

architecture arch of Exp2_MPT_10_to1 is
begin
  with x select
    r <=
      "00010110" when "000000", -- t[0] = 22
      "01000011" when "000001", -- t[1] = 67
      "00010110" when "000010", -- t[2] = 22
      "01000100" when "000011", -- t[3] = 68
      "00010111" when "000100", -- t[4] = 23
      "01000110" when "000101", -- t[5] = 70
      "00010111" when "000110", -- t[6] = 23
      "01000111" when "000111", -- t[7] = 71
      "00011000" when "001000", -- t[8] = 24
      "01001001" when "001001", -- t[9] = 73
      "00011000" when "001010", -- t[10] = 24
      "01001010" when "001011", -- t[11] = 74
      "00011001" when "001100", -- t[12] = 25
      "01001100" when "001101", -- t[13] = 76
      "00011010" when "001110", -- t[14] = 26
      "01001110" when "001111", -- t[15] = 78
      "00011010" when "010000", -- t[16] = 26
      "01001111" when "010001", -- t[17] = 79
      "00011011" when "010010", -- t[18] = 27
      "01010001" when "010011", -- t[19] = 81
      "00011011" when "010100", -- t[20] = 27
      "01010011" when "010101", -- t[21] = 83
      "00011100" when "010110", -- t[22] = 28
      "01010101" when "010111", -- t[23] = 85
      "00011101" when "011000", -- t[24] = 29
      "01010111" when "011001", -- t[25] = 87
      "00011101" when "011010", -- t[26] = 29
      "01011000" when "011011", -- t[27] = 88
      "00011110" when "011100", -- t[28] = 30
      "01011010" when "011101", -- t[29] = 90
      "00011110" when "011110", -- t[30] = 30
      "01011100" when "011111", -- t[31] = 92
      "00011111" when "100000", -- t[32] = 31
      "01011110" when "100001", -- t[33] = 94
      "00100000" when "100010", -- t[34] = 32
      "01100000" when "100011", -- t[35] = 96
      "00100001" when "100100", -- t[36] = 33
      "01100011" when "100101", -- t[37] = 99
      "00100001" when "100110", -- t[38] = 33
      "01100101" when "100111", -- t[39] = 101
      "00100010" when "101000", -- t[40] = 34
      "01100111" when "101001", -- t[41] = 103
      "00100011" when "101010", -- t[42] = 35
      "01101001" when "101011", -- t[43] = 105
      "00100100" when "101100", -- t[44] = 36
      "01101100" when "101101", -- t[45] = 108
      "00100100" when "101110", -- t[46] = 36
      "01101110" when "101111", -- t[47] = 110
      "00100101" when "110000", -- t[48] = 37
      "01110000" when "110001", -- t[49] = 112
      "00100110" when "110010", -- t[50] = 38
      "01110011" when "110011", -- t[51] = 115
      "00100111" when "110100", -- t[52] = 39
      "01110101" when "110101", -- t[53] = 117
      "00101000" when "110110", -- t[54] = 40
      "01111000" when "110111", -- t[55] = 120
      "00101001" when "111000", -- t[56] = 41
      "01111011" when "111001", -- t[57] = 123
      "00101001" when "111010", -- t[58] = 41
      "01111101" when "111011", -- t[59] = 125
      "00101010" when "111100", -- t[60] = 42
      "10000000" when "111101", -- t[61] = 128
      "00101011" when "111110", -- t[62] = 43
      "10000011" when "111111", -- t[63] = 131
      "--------" when others;
end architecture;


library ieee;
use ieee.std_logic_1164.all;

entity Exp2_MPT_10_to0 is
  port( x : in  std_logic_vector(4 downto 0);
        r : out std_logic_vector(5 downto 0) );
end entity;

architecture arch of Exp2_MPT_10_to0 is
begin
  with x select
    r <=
      "000010" when "00000", -- t[0] = 2
      "001000" when "00001", -- t[1] = 8
      "001110" when "00010", -- t[2] = 14
      "010100" when "00011", -- t[3] = 20
      "000011" when "00100", -- t[4] = 3
      "001001" when "00101", -- t[5] = 9
      "001111" when "00110", -- t[6] = 15
      "010110" when "00111", -- t[7] = 22
      "000011" when "01000", -- t[8] = 3
      "001010" when "01001", -- t[9] = 10
      "010001" when "01010", -- t[10] = 17
      "011000" when "01011", -- t[11] = 24
      "000011" when "01100", -- t[12] = 3
      "001011" when "01101", -- t[13] = 11
      "010010" when "01110", -- t[14] = 18
      "011010" when "01111", -- t[15] = 26
      "000100" when "10000", -- t[16] = 4
      "001100" when "10001", -- t[17] = 12
      "010100" when "10010", -- t[18] = 20
      "011100" when "10011", -- t[19] = 28
      "000100" when "10100", -- t[20] = 4
      "001101" when "10101", -- t[21] = 13
      "010110" when "10110", -- t[22] = 22
      "011111" when "10111", -- t[23] = 31
      "000100" when "11000", -- t[24] = 4
      "001110" when "11001", -- t[25] = 14
      "011000" when "11010", -- t[26] = 24
      "100010" when "11011", -- t[27] = 34
      "000101" when "11100", -- t[28] = 5
      "001111" when "11101", -- t[29] = 15
      "011010" when "11110", -- t[30] = 26
      "100101" when "11111", -- t[31] = 37
      "------" when others;
end architecture;


library ieee;
use ieee.std_logic_1164.all;
library fplib;
use fplib.pkg_Exp2_MPT_10.all;

entity Exp2_MPT_10_to1_xor is
  port( a : in  std_logic_vector(4 downto 0);
        b : in  std_logic_vector(1 downto 0);
        r : out std_logic_vector(12 downto 0) );
end entity;

architecture arch of Exp2_MPT_10_to1_xor is
  signal sign  : std_logic;
  signal in_t  : std_logic_vector(5 downto 0);
  signal out_t : std_logic_vector(7 downto 0);
begin
  sign <= not b(1);
  in_t(5 downto 1) <= a(4 downto 0);
  in_t(0) <= b(0) xor sign;

  inst_to1 : Exp2_MPT_10_to1
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
use fplib.pkg_Exp2_MPT_10.all;

entity Exp2_MPT_10_to0_xor is
  port( a : in  std_logic_vector(2 downto 0);
        b : in  std_logic_vector(2 downto 0);
        r : out std_logic_vector(12 downto 0) );
end entity;

architecture arch of Exp2_MPT_10_to0_xor is
  signal sign  : std_logic;
  signal in_t  : std_logic_vector(4 downto 0);
  signal out_t : std_logic_vector(5 downto 0);
begin
  sign <= not b(2);
  in_t(4 downto 2) <= a(2 downto 0);
  in_t(0) <= b(0) xor sign;
  in_t(1) <= b(1) xor sign;

  inst_to0 : Exp2_MPT_10_to0
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
use fplib.pkg_Exp2_MPT_10.all;

entity Exp2_MPT_10 is
  port( x : in  std_logic_vector(9 downto 0);
        r : out std_logic_vector(9 downto 0) );
end entity;

architecture arch of Exp2_MPT_10 is
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
  inst_tiv : Exp2_MPT_10_tiv
    port map( x => in_tiv,
              r => out_tiv );

  a1 <= x(9 downto 5);
  b1 <= x(4 downto 3);
  inst_to1_xor : Exp2_MPT_10_to1_xor
    port map( a => a1,
              b => b1,
              r => out1 );

  a0 <= x(9 downto 7);
  b0 <= x(2 downto 0);
  inst_to0_xor : Exp2_MPT_10_to0_xor
    port map( a => a0,
              b => b0,
              r => out0 );


  sum <= out_tiv + out1 + out0;
  r <= sum(12 downto 3);
end architecture;
