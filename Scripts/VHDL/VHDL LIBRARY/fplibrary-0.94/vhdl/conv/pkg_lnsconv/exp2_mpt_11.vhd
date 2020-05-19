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
-- wI = 11 bits
-- wO = 11 bits
-- Decomposition: 6, 5 / 5, 3 / 3, 2
-- Guard bits: 3
-- Size: 1984 = 14.2^6 + 8.2^7 + 4.2^4

library ieee;
use ieee.std_logic_1164.all;

package pkg_Exp2_MPT_11 is
  component Exp2_MPT_11_tiv is
    port( x : in  std_logic_vector(5 downto 0);
          r : out std_logic_vector(13 downto 0) );
  end component;

  component Exp2_MPT_11_to1 is
    port( x : in  std_logic_vector(6 downto 0);
          r : out std_logic_vector(7 downto 0) );
  end component;

  component Exp2_MPT_11_to0 is
    port( x : in  std_logic_vector(3 downto 0);
          r : out std_logic_vector(3 downto 0) );
  end component;

  component Exp2_MPT_11_to1_xor is
    port( a : in  std_logic_vector(4 downto 0);
          b : in  std_logic_vector(2 downto 0);
          r : out std_logic_vector(13 downto 0) );
  end component;

  component Exp2_MPT_11_to0_xor is
    port( a : in  std_logic_vector(2 downto 0);
          b : in  std_logic_vector(1 downto 0);
          r : out std_logic_vector(13 downto 0) );
  end component;
end package;


library ieee;
use ieee.std_logic_1164.all;

entity Exp2_MPT_11_tiv is
  port( x : in  std_logic_vector(5 downto 0);
        r : out std_logic_vector(13 downto 0) );
end entity;

architecture arch of Exp2_MPT_11_tiv is
begin
  with x select
    r <=
      "00000001100011" when "000000", -- t[0] = -16285
      "00000100010110" when "000001", -- t[1] = -16106
      "00000111001100" when "000010", -- t[2] = -15924
      "00001010000011" when "000011", -- t[3] = -15741
      "00001100111100" when "000100", -- t[4] = -15556
      "00001111110111" when "000101", -- t[5] = -15369
      "00010010110101" when "000110", -- t[6] = -15179
      "00010101110100" when "000111", -- t[7] = -14988
      "00011000110110" when "001000", -- t[8] = -14794
      "00011011111001" when "001001", -- t[9] = -14599
      "00011110111111" when "001010", -- t[10] = -14401
      "00100010000111" when "001011", -- t[11] = -14201
      "00100101010001" when "001100", -- t[12] = -13999
      "00101000011101" when "001101", -- t[13] = -13795
      "00101011101100" when "001110", -- t[14] = -13588
      "00101110111100" when "001111", -- t[15] = -13380
      "00110010001111" when "010000", -- t[16] = -13169
      "00110101100101" when "010001", -- t[17] = -12955
      "00111000111100" when "010010", -- t[18] = -12740
      "00111100010110" when "010011", -- t[19] = -12522
      "00111111110011" when "010100", -- t[20] = -12301
      "01000011010001" when "010101", -- t[21] = -12079
      "01000110110011" when "010110", -- t[22] = -11853
      "01001010010110" when "010111", -- t[23] = -11626
      "01001101111100" when "011000", -- t[24] = -11396
      "01010001100101" when "011001", -- t[25] = -11163
      "01010101010000" when "011010", -- t[26] = -10928
      "01011000111110" when "011011", -- t[27] = -10690
      "01011100101110" when "011100", -- t[28] = -10450
      "01100000100001" when "011101", -- t[29] = -10207
      "01100100010111" when "011110", -- t[30] = -9961
      "01101000001111" when "011111", -- t[31] = -9713
      "01101100001010" when "100000", -- t[32] = -9462
      "01110000000111" when "100001", -- t[33] = -9209
      "01110100001000" when "100010", -- t[34] = -8952
      "01111000001011" when "100011", -- t[35] = -8693
      "01111100010001" when "100100", -- t[36] = -8431
      "10000000011010" when "100101", -- t[37] = -8166
      "10000100100110" when "100110", -- t[38] = -7898
      "10001000110101" when "100111", -- t[39] = -7627
      "10001101000110" when "101000", -- t[40] = -7354
      "10010001011011" when "101001", -- t[41] = -7077
      "10010101110011" when "101010", -- t[42] = -6797
      "10011010001101" when "101011", -- t[43] = -6515
      "10011110101011" when "101100", -- t[44] = -6229
      "10100011001100" when "101101", -- t[45] = -5940
      "10100111110000" when "101110", -- t[46] = -5648
      "10101100010111" when "101111", -- t[47] = -5353
      "10110001000010" when "110000", -- t[48] = -5054
      "10110101110000" when "110001", -- t[49] = -4752
      "10111010100001" when "110010", -- t[50] = -4447
      "10111111010101" when "110011", -- t[51] = -4139
      "11000100001101" when "110100", -- t[52] = -3827
      "11001001001000" when "110101", -- t[53] = -3512
      "11001110000110" when "110110", -- t[54] = -3194
      "11010011001000" when "110111", -- t[55] = -2872
      "11011000001110" when "111000", -- t[56] = -2546
      "11011101010111" when "111001", -- t[57] = -2217
      "11100010100011" when "111010", -- t[58] = -1885
      "11100111110100" when "111011", -- t[59] = -1548
      "11101101000111" when "111100", -- t[60] = -1209
      "11110010011111" when "111101", -- t[61] = -865
      "11110111111010" when "111110", -- t[62] = -518
      "11111101011001" when "111111", -- t[63] = -167
      "--------------" when others;
end architecture;


library ieee;
use ieee.std_logic_1164.all;

entity Exp2_MPT_11_to1 is
  port( x : in  std_logic_vector(6 downto 0);
        r : out std_logic_vector(7 downto 0) );
end entity;

architecture arch of Exp2_MPT_11_to1 is
begin
  with x select
    r <=
      "00001011" when "0000000", -- t[0] = 11
      "00100001" when "0000001", -- t[1] = 33
      "00111000" when "0000010", -- t[2] = 56
      "01001110" when "0000011", -- t[3] = 78
      "00001011" when "0000100", -- t[4] = 11
      "00100010" when "0000101", -- t[5] = 34
      "00111001" when "0000110", -- t[6] = 57
      "01010000" when "0000111", -- t[7] = 80
      "00001011" when "0001000", -- t[8] = 11
      "00100011" when "0001001", -- t[9] = 35
      "00111010" when "0001010", -- t[10] = 58
      "01010001" when "0001011", -- t[11] = 81
      "00001011" when "0001100", -- t[12] = 11
      "00100011" when "0001101", -- t[13] = 35
      "00111011" when "0001110", -- t[14] = 59
      "01010011" when "0001111", -- t[15] = 83
      "00001100" when "0010000", -- t[16] = 12
      "00100100" when "0010001", -- t[17] = 36
      "00111101" when "0010010", -- t[18] = 61
      "01010101" when "0010011", -- t[19] = 85
      "00001100" when "0010100", -- t[20] = 12
      "00100101" when "0010101", -- t[21] = 37
      "00111110" when "0010110", -- t[22] = 62
      "01010111" when "0010111", -- t[23] = 87
      "00001100" when "0011000", -- t[24] = 12
      "00100110" when "0011001", -- t[25] = 38
      "00111111" when "0011010", -- t[26] = 63
      "01011001" when "0011011", -- t[27] = 89
      "00001101" when "0011100", -- t[28] = 13
      "00100111" when "0011101", -- t[29] = 39
      "01000001" when "0011110", -- t[30] = 65
      "01011011" when "0011111", -- t[31] = 91
      "00001101" when "0100000", -- t[32] = 13
      "00100111" when "0100001", -- t[33] = 39
      "01000010" when "0100010", -- t[34] = 66
      "01011101" when "0100011", -- t[35] = 93
      "00001101" when "0100100", -- t[36] = 13
      "00101000" when "0100101", -- t[37] = 40
      "01000100" when "0100110", -- t[38] = 68
      "01011111" when "0100111", -- t[39] = 95
      "00001101" when "0101000", -- t[40] = 13
      "00101001" when "0101001", -- t[41] = 41
      "01000101" when "0101010", -- t[42] = 69
      "01100001" when "0101011", -- t[43] = 97
      "00001110" when "0101100", -- t[44] = 14
      "00101010" when "0101101", -- t[45] = 42
      "01000111" when "0101110", -- t[46] = 71
      "01100011" when "0101111", -- t[47] = 99
      "00001110" when "0110000", -- t[48] = 14
      "00101011" when "0110001", -- t[49] = 43
      "01001000" when "0110010", -- t[50] = 72
      "01100101" when "0110011", -- t[51] = 101
      "00001110" when "0110100", -- t[52] = 14
      "00101100" when "0110101", -- t[53] = 44
      "01001010" when "0110110", -- t[54] = 74
      "01100111" when "0110111", -- t[55] = 103
      "00001111" when "0111000", -- t[56] = 15
      "00101101" when "0111001", -- t[57] = 45
      "01001011" when "0111010", -- t[58] = 75
      "01101010" when "0111011", -- t[59] = 106
      "00001111" when "0111100", -- t[60] = 15
      "00101110" when "0111101", -- t[61] = 46
      "01001101" when "0111110", -- t[62] = 77
      "01101100" when "0111111", -- t[63] = 108
      "00001111" when "1000000", -- t[64] = 15
      "00101111" when "1000001", -- t[65] = 47
      "01001111" when "1000010", -- t[66] = 79
      "01101110" when "1000011", -- t[67] = 110
      "00010000" when "1000100", -- t[68] = 16
      "00110000" when "1000101", -- t[69] = 48
      "01010000" when "1000110", -- t[70] = 80
      "01110001" when "1000111", -- t[71] = 113
      "00010000" when "1001000", -- t[72] = 16
      "00110001" when "1001001", -- t[73] = 49
      "01010010" when "1001010", -- t[74] = 82
      "01110011" when "1001011", -- t[75] = 115
      "00010000" when "1001100", -- t[76] = 16
      "00110010" when "1001101", -- t[77] = 50
      "01010100" when "1001110", -- t[78] = 84
      "01110110" when "1001111", -- t[79] = 118
      "00010001" when "1010000", -- t[80] = 17
      "00110011" when "1010001", -- t[81] = 51
      "01010110" when "1010010", -- t[82] = 86
      "01111000" when "1010011", -- t[83] = 120
      "00010001" when "1010100", -- t[84] = 17
      "00110100" when "1010101", -- t[85] = 52
      "01011000" when "1010110", -- t[86] = 88
      "01111011" when "1010111", -- t[87] = 123
      "00010010" when "1011000", -- t[88] = 18
      "00110110" when "1011001", -- t[89] = 54
      "01011010" when "1011010", -- t[90] = 90
      "01111110" when "1011011", -- t[91] = 126
      "00010010" when "1011100", -- t[92] = 18
      "00110111" when "1011101", -- t[93] = 55
      "01011100" when "1011110", -- t[94] = 92
      "10000001" when "1011111", -- t[95] = 129
      "00010010" when "1100000", -- t[96] = 18
      "00111000" when "1100001", -- t[97] = 56
      "01011110" when "1100010", -- t[98] = 94
      "10000011" when "1100011", -- t[99] = 131
      "00010011" when "1100100", -- t[100] = 19
      "00111001" when "1100101", -- t[101] = 57
      "01100000" when "1100110", -- t[102] = 96
      "10000110" when "1100111", -- t[103] = 134
      "00010011" when "1101000", -- t[104] = 19
      "00111011" when "1101001", -- t[105] = 59
      "01100010" when "1101010", -- t[106] = 98
      "10001001" when "1101011", -- t[107] = 137
      "00010100" when "1101100", -- t[108] = 20
      "00111100" when "1101101", -- t[109] = 60
      "01100100" when "1101110", -- t[110] = 100
      "10001100" when "1101111", -- t[111] = 140
      "00010100" when "1110000", -- t[112] = 20
      "00111101" when "1110001", -- t[113] = 61
      "01100110" when "1110010", -- t[114] = 102
      "10001111" when "1110011", -- t[115] = 143
      "00010101" when "1110100", -- t[116] = 21
      "00111111" when "1110101", -- t[117] = 63
      "01101001" when "1110110", -- t[118] = 105
      "10010011" when "1110111", -- t[119] = 147
      "00010101" when "1111000", -- t[120] = 21
      "01000000" when "1111001", -- t[121] = 64
      "01101011" when "1111010", -- t[122] = 107
      "10010110" when "1111011", -- t[123] = 150
      "00010101" when "1111100", -- t[124] = 21
      "01000001" when "1111101", -- t[125] = 65
      "01101101" when "1111110", -- t[126] = 109
      "10011001" when "1111111", -- t[127] = 153
      "--------" when others;
end architecture;


library ieee;
use ieee.std_logic_1164.all;

entity Exp2_MPT_11_to0 is
  port( x : in  std_logic_vector(3 downto 0);
        r : out std_logic_vector(3 downto 0) );
end entity;

architecture arch of Exp2_MPT_11_to0 is
begin
  with x select
    r <=
      "0010" when "0000", -- t[0] = 2
      "1000" when "0001", -- t[1] = 8
      "0011" when "0010", -- t[2] = 3
      "1001" when "0011", -- t[3] = 9
      "0011" when "0100", -- t[4] = 3
      "1010" when "0101", -- t[5] = 10
      "0011" when "0110", -- t[6] = 3
      "1011" when "0111", -- t[7] = 11
      "0100" when "1000", -- t[8] = 4
      "1100" when "1001", -- t[9] = 12
      "0100" when "1010", -- t[10] = 4
      "1101" when "1011", -- t[11] = 13
      "0100" when "1100", -- t[12] = 4
      "1110" when "1101", -- t[13] = 14
      "0101" when "1110", -- t[14] = 5
      "1111" when "1111", -- t[15] = 15
      "----" when others;
end architecture;


library ieee;
use ieee.std_logic_1164.all;
library fplib;
use fplib.pkg_Exp2_MPT_11.all;

entity Exp2_MPT_11_to1_xor is
  port( a : in  std_logic_vector(4 downto 0);
        b : in  std_logic_vector(2 downto 0);
        r : out std_logic_vector(13 downto 0) );
end entity;

architecture arch of Exp2_MPT_11_to1_xor is
  signal sign  : std_logic;
  signal in_t  : std_logic_vector(6 downto 0);
  signal out_t : std_logic_vector(7 downto 0);
begin
  sign <= not b(2);
  in_t(6 downto 2) <= a(4 downto 0);
  in_t(0) <= b(0) xor sign;
  in_t(1) <= b(1) xor sign;

  inst_to1 : Exp2_MPT_11_to1
    port map( x => in_t,
              r => out_t );

  r(13 downto 8) <= (13 downto 8 => sign);
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
use fplib.pkg_Exp2_MPT_11.all;

entity Exp2_MPT_11_to0_xor is
  port( a : in  std_logic_vector(2 downto 0);
        b : in  std_logic_vector(1 downto 0);
        r : out std_logic_vector(13 downto 0) );
end entity;

architecture arch of Exp2_MPT_11_to0_xor is
  signal sign  : std_logic;
  signal in_t  : std_logic_vector(3 downto 0);
  signal out_t : std_logic_vector(3 downto 0);
begin
  sign <= not b(1);
  in_t(3 downto 1) <= a(2 downto 0);
  in_t(0) <= b(0) xor sign;

  inst_to0 : Exp2_MPT_11_to0
    port map( x => in_t,
              r => out_t );

  r(13 downto 4) <= (13 downto 4 => sign);
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
use fplib.pkg_Exp2_MPT_11.all;

entity Exp2_MPT_11 is
  port( x : in  std_logic_vector(10 downto 0);
        r : out std_logic_vector(10 downto 0) );
end entity;

architecture arch of Exp2_MPT_11 is
  signal in_tiv  : std_logic_vector(5 downto 0);
  signal out_tiv : std_logic_vector(13 downto 0);
  signal a1      : std_logic_vector(4 downto 0);
  signal b1      : std_logic_vector(2 downto 0);
  signal out1    : std_logic_vector(13 downto 0);
  signal a0      : std_logic_vector(2 downto 0);
  signal b0      : std_logic_vector(1 downto 0);
  signal out0    : std_logic_vector(13 downto 0);
  signal sum     : std_logic_vector(13 downto 0);
begin
  in_tiv <= x(10 downto 5);
  inst_tiv : Exp2_MPT_11_tiv
    port map( x => in_tiv,
              r => out_tiv );

  a1 <= x(10 downto 6);
  b1 <= x(4 downto 2);
  inst_to1_xor : Exp2_MPT_11_to1_xor
    port map( a => a1,
              b => b1,
              r => out1 );

  a0 <= x(10 downto 8);
  b0 <= x(1 downto 0);
  inst_to0_xor : Exp2_MPT_11_to0_xor
    port map( a => a0,
              b => b0,
              r => out0 );


  sum <= out_tiv + out1 + out0;
  r <= sum(13 downto 3);
end architecture;
