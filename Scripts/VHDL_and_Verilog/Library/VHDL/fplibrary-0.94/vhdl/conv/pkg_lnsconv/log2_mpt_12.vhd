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
-- wI = 12 bits
-- wO = 12 bits
-- Decomposition: 6, 6 / 6, 5, 4 / 2, 2, 2
-- Guard bits: 4
-- Size: 3008 = 16.2^6 + 10.2^7 + 8.2^6 + 6.2^5

library ieee;
use ieee.std_logic_1164.all;

package pkg_Log2_MPT_12 is
  component Log2_MPT_12_tiv is
    port( x : in  std_logic_vector(5 downto 0);
          r : out std_logic_vector(15 downto 0) );
  end component;

  component Log2_MPT_12_to2 is
    port( x : in  std_logic_vector(6 downto 0);
          r : out std_logic_vector(9 downto 0) );
  end component;

  component Log2_MPT_12_to1 is
    port( x : in  std_logic_vector(5 downto 0);
          r : out std_logic_vector(7 downto 0) );
  end component;

  component Log2_MPT_12_to0 is
    port( x : in  std_logic_vector(4 downto 0);
          r : out std_logic_vector(5 downto 0) );
  end component;

  component Log2_MPT_12_to2_xor is
    port( a : in  std_logic_vector(5 downto 0);
          b : in  std_logic_vector(1 downto 0);
          r : out std_logic_vector(15 downto 0) );
  end component;

  component Log2_MPT_12_to1_xor is
    port( a : in  std_logic_vector(4 downto 0);
          b : in  std_logic_vector(1 downto 0);
          r : out std_logic_vector(15 downto 0) );
  end component;

  component Log2_MPT_12_to0_xor is
    port( a : in  std_logic_vector(3 downto 0);
          b : in  std_logic_vector(1 downto 0);
          r : out std_logic_vector(15 downto 0) );
  end component;
end package;


library ieee;
use ieee.std_logic_1164.all;

entity Log2_MPT_12_tiv is
  port( x : in  std_logic_vector(5 downto 0);
        r : out std_logic_vector(15 downto 0) );
end entity;

architecture arch of Log2_MPT_12_tiv is
begin
  with x select
    r <=
      "0000001011011011" when "000000", -- t[0] = 731
      "0000100010001001" when "000001", -- t[1] = 2185
      "0000111000100010" when "000010", -- t[2] = 3618
      "0001001110100110" when "000011", -- t[3] = 5030
      "0001100100010100" when "000100", -- t[4] = 6420
      "0001111001101111" when "000101", -- t[5] = 7791
      "0010001110110110" when "000110", -- t[6] = 9142
      "0010100011101010" when "000111", -- t[7] = 10474
      "0010111000001011" when "001000", -- t[8] = 11787
      "0011001100011010" when "001001", -- t[9] = 13082
      "0011100000011000" when "001010", -- t[10] = 14360
      "0011110100000101" when "001011", -- t[11] = 15621
      "0100000111100001" when "001100", -- t[12] = 16865
      "0100011010101101" when "001101", -- t[13] = 18093
      "0100101101101010" when "001110", -- t[14] = 19306
      "0101000000010110" when "001111", -- t[15] = 20502
      "0101010010110100" when "010000", -- t[16] = 21684
      "0101100101000100" when "010001", -- t[17] = 22852
      "0101110111000101" when "010010", -- t[18] = 24005
      "0110001000111000" when "010011", -- t[19] = 25144
      "0110011010011110" when "010100", -- t[20] = 26270
      "0110101011110110" when "010101", -- t[21] = 27382
      "0110111101000010" when "010110", -- t[22] = 28482
      "0111001110000001" when "010111", -- t[23] = 29569
      "0111011110110011" when "011000", -- t[24] = 30643
      "0111101111011010" when "011001", -- t[25] = 31706
      "0111111111110100" when "011010", -- t[26] = 32756
      "1000010000000011" when "011011", -- t[27] = 33795
      "1000100000000111" when "011100", -- t[28] = 34823
      "1000110000000000" when "011101", -- t[29] = 35840
      "1000111111101101" when "011110", -- t[30] = 36845
      "1001001111010001" when "011111", -- t[31] = 37841
      "1001011110101010" when "100000", -- t[32] = 38826
      "1001101101111000" when "100001", -- t[33] = 39800
      "1001111100111101" when "100010", -- t[34] = 40765
      "1010001011111000" when "100011", -- t[35] = 41720
      "1010011010101010" when "100100", -- t[36] = 42666
      "1010101001010010" when "100101", -- t[37] = 43602
      "1010110111110001" when "100110", -- t[38] = 44529
      "1011000110000111" when "100111", -- t[39] = 45447
      "1011010100010100" when "101000", -- t[40] = 46356
      "1011100010011000" when "101001", -- t[41] = 47256
      "1011110000010100" when "101010", -- t[42] = 48148
      "1011111110001000" when "101011", -- t[43] = 49032
      "1100001011110100" when "101100", -- t[44] = 49908
      "1100011001010111" when "101101", -- t[45] = 50775
      "1100100110110010" when "101110", -- t[46] = 51634
      "1100110100000110" when "101111", -- t[47] = 52486
      "1101000001010010" when "110000", -- t[48] = 53330
      "1101001110010111" when "110001", -- t[49] = 54167
      "1101011011010100" when "110010", -- t[50] = 54996
      "1101101000001011" when "110011", -- t[51] = 55819
      "1101110100111010" when "110100", -- t[52] = 56634
      "1110000001100010" when "110101", -- t[53] = 57442
      "1110001110000011" when "110110", -- t[54] = 58243
      "1110011010011110" when "110111", -- t[55] = 59038
      "1110100110110001" when "111000", -- t[56] = 59825
      "1110110010111111" when "111001", -- t[57] = 60607
      "1110111111000110" when "111010", -- t[58] = 61382
      "1111001011000110" when "111011", -- t[59] = 62150
      "1111010111000001" when "111100", -- t[60] = 62913
      "1111100010110101" when "111101", -- t[61] = 63669
      "1111101110100100" when "111110", -- t[62] = 64420
      "1111111010001100" when "111111", -- t[63] = 65164
      "----------------" when others;
end architecture;


library ieee;
use ieee.std_logic_1164.all;

entity Log2_MPT_12_to2 is
  port( x : in  std_logic_vector(6 downto 0);
        r : out std_logic_vector(9 downto 0) );
end entity;

architecture arch of Log2_MPT_12_to2 is
begin
  with x select
    r <=
      "0010110111" when "0000000", -- t[0] = 183
      "1000100110" when "0000001", -- t[1] = 550
      "0010110100" when "0000010", -- t[2] = 180
      "1000011110" when "0000011", -- t[3] = 542
      "0010110010" when "0000100", -- t[4] = 178
      "1000010110" when "0000101", -- t[5] = 534
      "0010101111" when "0000110", -- t[6] = 175
      "1000001110" when "0000111", -- t[7] = 526
      "0010101100" when "0001000", -- t[8] = 172
      "1000000110" when "0001001", -- t[9] = 518
      "0010101010" when "0001010", -- t[10] = 170
      "0111111111" when "0001011", -- t[11] = 511
      "0010100111" when "0001100", -- t[12] = 167
      "0111110111" when "0001101", -- t[13] = 503
      "0010100101" when "0001110", -- t[14] = 165
      "0111110000" when "0001111", -- t[15] = 496
      "0010100011" when "0010000", -- t[16] = 163
      "0111101001" when "0010001", -- t[17] = 489
      "0010100001" when "0010010", -- t[18] = 161
      "0111100011" when "0010011", -- t[19] = 483
      "0010011110" when "0010100", -- t[20] = 158
      "0111011100" when "0010101", -- t[21] = 476
      "0010011100" when "0010110", -- t[22] = 156
      "0111010110" when "0010111", -- t[23] = 470
      "0010011010" when "0011000", -- t[24] = 154
      "0111010000" when "0011001", -- t[25] = 464
      "0010011000" when "0011010", -- t[26] = 152
      "0111001010" when "0011011", -- t[27] = 458
      "0010010110" when "0011100", -- t[28] = 150
      "0111000100" when "0011101", -- t[29] = 452
      "0010010100" when "0011110", -- t[30] = 148
      "0110111110" when "0011111", -- t[31] = 446
      "0010010011" when "0100000", -- t[32] = 147
      "0110111001" when "0100001", -- t[33] = 441
      "0010010001" when "0100010", -- t[34] = 145
      "0110110011" when "0100011", -- t[35] = 435
      "0010001111" when "0100100", -- t[36] = 143
      "0110101110" when "0100101", -- t[37] = 430
      "0010001101" when "0100110", -- t[38] = 141
      "0110101001" when "0100111", -- t[39] = 425
      "0010001100" when "0101000", -- t[40] = 140
      "0110100100" when "0101001", -- t[41] = 420
      "0010001010" when "0101010", -- t[42] = 138
      "0110011111" when "0101011", -- t[43] = 415
      "0010001000" when "0101100", -- t[44] = 136
      "0110011010" when "0101101", -- t[45] = 410
      "0010000111" when "0101110", -- t[46] = 135
      "0110010101" when "0101111", -- t[47] = 405
      "0010000101" when "0110000", -- t[48] = 133
      "0110010001" when "0110001", -- t[49] = 401
      "0010000100" when "0110010", -- t[50] = 132
      "0110001100" when "0110011", -- t[51] = 396
      "0010000010" when "0110100", -- t[52] = 130
      "0110001000" when "0110101", -- t[53] = 392
      "0010000001" when "0110110", -- t[54] = 129
      "0110000011" when "0110111", -- t[55] = 387
      "0001111111" when "0111000", -- t[56] = 127
      "0101111111" when "0111001", -- t[57] = 383
      "0001111110" when "0111010", -- t[58] = 126
      "0101111011" when "0111011", -- t[59] = 379
      "0001111101" when "0111100", -- t[60] = 125
      "0101110111" when "0111101", -- t[61] = 375
      "0001111011" when "0111110", -- t[62] = 123
      "0101110011" when "0111111", -- t[63] = 371
      "0001111010" when "1000000", -- t[64] = 122
      "0101101111" when "1000001", -- t[65] = 367
      "0001111001" when "1000010", -- t[66] = 121
      "0101101100" when "1000011", -- t[67] = 364
      "0001111000" when "1000100", -- t[68] = 120
      "0101101000" when "1000101", -- t[69] = 360
      "0001110110" when "1000110", -- t[70] = 118
      "0101100100" when "1000111", -- t[71] = 356
      "0001110101" when "1001000", -- t[72] = 117
      "0101100001" when "1001001", -- t[73] = 353
      "0001110100" when "1001010", -- t[74] = 116
      "0101011101" when "1001011", -- t[75] = 349
      "0001110011" when "1001100", -- t[76] = 115
      "0101011010" when "1001101", -- t[77] = 346
      "0001110010" when "1001110", -- t[78] = 114
      "0101010110" when "1001111", -- t[79] = 342
      "0001110001" when "1010000", -- t[80] = 113
      "0101010011" when "1010001", -- t[81] = 339
      "0001110000" when "1010010", -- t[82] = 112
      "0101010000" when "1010011", -- t[83] = 336
      "0001101111" when "1010100", -- t[84] = 111
      "0101001101" when "1010101", -- t[85] = 333
      "0001101110" when "1010110", -- t[86] = 110
      "0101001010" when "1010111", -- t[87] = 330
      "0001101101" when "1011000", -- t[88] = 109
      "0101000111" when "1011001", -- t[89] = 327
      "0001101100" when "1011010", -- t[90] = 108
      "0101000100" when "1011011", -- t[91] = 324
      "0001101011" when "1011100", -- t[92] = 107
      "0101000001" when "1011101", -- t[93] = 321
      "0001101010" when "1011110", -- t[94] = 106
      "0100111110" when "1011111", -- t[95] = 318
      "0001101001" when "1100000", -- t[96] = 105
      "0100111011" when "1100001", -- t[97] = 315
      "0001101000" when "1100010", -- t[98] = 104
      "0100111000" when "1100011", -- t[99] = 312
      "0001100111" when "1100100", -- t[100] = 103
      "0100110101" when "1100101", -- t[101] = 309
      "0001100110" when "1100110", -- t[102] = 102
      "0100110011" when "1100111", -- t[103] = 307
      "0001100101" when "1101000", -- t[104] = 101
      "0100110000" when "1101001", -- t[105] = 304
      "0001100100" when "1101010", -- t[106] = 100
      "0100101110" when "1101011", -- t[107] = 302
      "0001100011" when "1101100", -- t[108] = 99
      "0100101011" when "1101101", -- t[109] = 299
      "0001100010" when "1101110", -- t[110] = 98
      "0100101000" when "1101111", -- t[111] = 296
      "0001100010" when "1110000", -- t[112] = 98
      "0100100110" when "1110001", -- t[113] = 294
      "0001100001" when "1110010", -- t[114] = 97
      "0100100100" when "1110011", -- t[115] = 292
      "0001100000" when "1110100", -- t[116] = 96
      "0100100001" when "1110101", -- t[117] = 289
      "0001011111" when "1110110", -- t[118] = 95
      "0100011111" when "1110111", -- t[119] = 287
      "0001011111" when "1111000", -- t[120] = 95
      "0100011101" when "1111001", -- t[121] = 285
      "0001011110" when "1111010", -- t[122] = 94
      "0100011010" when "1111011", -- t[123] = 282
      "0001011101" when "1111100", -- t[124] = 93
      "0100011000" when "1111101", -- t[125] = 280
      "0001011100" when "1111110", -- t[126] = 92
      "0100010110" when "1111111", -- t[127] = 278
      "----------" when others;
end architecture;


library ieee;
use ieee.std_logic_1164.all;

entity Log2_MPT_12_to1 is
  port( x : in  std_logic_vector(5 downto 0);
        r : out std_logic_vector(7 downto 0) );
end entity;

architecture arch of Log2_MPT_12_to1 is
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
      "01111100" when "000111", -- t[7] = 124
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
      "01101010" when "010011", -- t[19] = 106
      "00100010" when "010100", -- t[20] = 34
      "01101000" when "010101", -- t[21] = 104
      "00100001" when "010110", -- t[22] = 33
      "01100101" when "010111", -- t[23] = 101
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
      "01010010" when "101011", -- t[43] = 82
      "00011011" when "101100", -- t[44] = 27
      "01010001" when "101101", -- t[45] = 81
      "00011010" when "101110", -- t[46] = 26
      "01001111" when "101111", -- t[47] = 79
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
      "01000110" when "111101", -- t[61] = 70
      "00010111" when "111110", -- t[62] = 23
      "01000101" when "111111", -- t[63] = 69
      "--------" when others;
end architecture;


library ieee;
use ieee.std_logic_1164.all;

entity Log2_MPT_12_to0 is
  port( x : in  std_logic_vector(4 downto 0);
        r : out std_logic_vector(5 downto 0) );
end entity;

architecture arch of Log2_MPT_12_to0 is
begin
  with x select
    r <=
      "001011" when "00000", -- t[0] = 11
      "100001" when "00001", -- t[1] = 33
      "001010" when "00010", -- t[2] = 10
      "011111" when "00011", -- t[3] = 31
      "001001" when "00100", -- t[4] = 9
      "011101" when "00101", -- t[5] = 29
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
library fplib;
use fplib.pkg_Log2_MPT_12.all;

entity Log2_MPT_12_to2_xor is
  port( a : in  std_logic_vector(5 downto 0);
        b : in  std_logic_vector(1 downto 0);
        r : out std_logic_vector(15 downto 0) );
end entity;

architecture arch of Log2_MPT_12_to2_xor is
  signal sign  : std_logic;
  signal in_t  : std_logic_vector(6 downto 0);
  signal out_t : std_logic_vector(9 downto 0);
begin
  sign <= not b(1);
  in_t(6 downto 1) <= a(5 downto 0);
  in_t(0) <= b(0) xor sign;

  inst_to2 : Log2_MPT_12_to2
    port map( x => in_t,
              r => out_t );

  r(15 downto 10) <= (15 downto 10 => sign);
  r(0) <= out_t(0) xor sign;
  r(1) <= out_t(1) xor sign;
  r(2) <= out_t(2) xor sign;
  r(3) <= out_t(3) xor sign;
  r(4) <= out_t(4) xor sign;
  r(5) <= out_t(5) xor sign;
  r(6) <= out_t(6) xor sign;
  r(7) <= out_t(7) xor sign;
  r(8) <= out_t(8) xor sign;
  r(9) <= out_t(9) xor sign;
end architecture;


library ieee;
use ieee.std_logic_1164.all;
library fplib;
use fplib.pkg_Log2_MPT_12.all;

entity Log2_MPT_12_to1_xor is
  port( a : in  std_logic_vector(4 downto 0);
        b : in  std_logic_vector(1 downto 0);
        r : out std_logic_vector(15 downto 0) );
end entity;

architecture arch of Log2_MPT_12_to1_xor is
  signal sign  : std_logic;
  signal in_t  : std_logic_vector(5 downto 0);
  signal out_t : std_logic_vector(7 downto 0);
begin
  sign <= not b(1);
  in_t(5 downto 1) <= a(4 downto 0);
  in_t(0) <= b(0) xor sign;

  inst_to1 : Log2_MPT_12_to1
    port map( x => in_t,
              r => out_t );

  r(15 downto 8) <= (15 downto 8 => sign);
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
use fplib.pkg_Log2_MPT_12.all;

entity Log2_MPT_12_to0_xor is
  port( a : in  std_logic_vector(3 downto 0);
        b : in  std_logic_vector(1 downto 0);
        r : out std_logic_vector(15 downto 0) );
end entity;

architecture arch of Log2_MPT_12_to0_xor is
  signal sign  : std_logic;
  signal in_t  : std_logic_vector(4 downto 0);
  signal out_t : std_logic_vector(5 downto 0);
begin
  sign <= not b(1);
  in_t(4 downto 1) <= a(3 downto 0);
  in_t(0) <= b(0) xor sign;

  inst_to0 : Log2_MPT_12_to0
    port map( x => in_t,
              r => out_t );

  r(15 downto 6) <= (15 downto 6 => sign);
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
use fplib.pkg_Log2_MPT_12.all;

entity Log2_MPT_12 is
  port( x : in  std_logic_vector(11 downto 0);
        r : out std_logic_vector(11 downto 0) );
end entity;

architecture arch of Log2_MPT_12 is
  signal in_tiv  : std_logic_vector(5 downto 0);
  signal out_tiv : std_logic_vector(15 downto 0);
  signal a2      : std_logic_vector(5 downto 0);
  signal b2      : std_logic_vector(1 downto 0);
  signal out2    : std_logic_vector(15 downto 0);
  signal a1      : std_logic_vector(4 downto 0);
  signal b1      : std_logic_vector(1 downto 0);
  signal out1    : std_logic_vector(15 downto 0);
  signal a0      : std_logic_vector(3 downto 0);
  signal b0      : std_logic_vector(1 downto 0);
  signal out0    : std_logic_vector(15 downto 0);
  signal sum     : std_logic_vector(15 downto 0);
begin
  in_tiv <= x(11 downto 6);
  inst_tiv : Log2_MPT_12_tiv
    port map( x => in_tiv,
              r => out_tiv );

  a2 <= x(11 downto 6);
  b2 <= x(5 downto 4);
  inst_to2_xor : Log2_MPT_12_to2_xor
    port map( a => a2,
              b => b2,
              r => out2 );

  a1 <= x(11 downto 7);
  b1 <= x(3 downto 2);
  inst_to1_xor : Log2_MPT_12_to1_xor
    port map( a => a1,
              b => b1,
              r => out1 );

  a0 <= x(11 downto 8);
  b0 <= x(1 downto 0);
  inst_to0_xor : Log2_MPT_12_to0_xor
    port map( a => a0,
              b => b0,
              r => out0 );


  sum <= out_tiv + out2 + out1 + out0;
  r <= sum(15 downto 4);
end architecture;
