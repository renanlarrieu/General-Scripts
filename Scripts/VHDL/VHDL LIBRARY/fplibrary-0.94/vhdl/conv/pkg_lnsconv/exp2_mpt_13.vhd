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
-- wI = 13 bits
-- wO = 13 bits
-- Decomposition: 7, 6 / 6, 5, 3 / 2, 2, 2
-- Guard bits: 4
-- Size: 4048 = 17.2^7 + 10.2^7 + 8.2^6 + 5.2^4

library ieee;
use ieee.std_logic_1164.all;

package pkg_Exp2_MPT_13 is
  component Exp2_MPT_13_tiv is
    port( x : in  std_logic_vector(6 downto 0);
          r : out std_logic_vector(16 downto 0) );
  end component;

  component Exp2_MPT_13_to2 is
    port( x : in  std_logic_vector(6 downto 0);
          r : out std_logic_vector(9 downto 0) );
  end component;

  component Exp2_MPT_13_to1 is
    port( x : in  std_logic_vector(5 downto 0);
          r : out std_logic_vector(7 downto 0) );
  end component;

  component Exp2_MPT_13_to0 is
    port( x : in  std_logic_vector(3 downto 0);
          r : out std_logic_vector(4 downto 0) );
  end component;

  component Exp2_MPT_13_to2_xor is
    port( a : in  std_logic_vector(5 downto 0);
          b : in  std_logic_vector(1 downto 0);
          r : out std_logic_vector(16 downto 0) );
  end component;

  component Exp2_MPT_13_to1_xor is
    port( a : in  std_logic_vector(4 downto 0);
          b : in  std_logic_vector(1 downto 0);
          r : out std_logic_vector(16 downto 0) );
  end component;

  component Exp2_MPT_13_to0_xor is
    port( a : in  std_logic_vector(2 downto 0);
          b : in  std_logic_vector(1 downto 0);
          r : out std_logic_vector(16 downto 0) );
  end component;
end package;


library ieee;
use ieee.std_logic_1164.all;

entity Exp2_MPT_13_tiv is
  port( x : in  std_logic_vector(6 downto 0);
        r : out std_logic_vector(16 downto 0) );
end entity;

architecture arch of Exp2_MPT_13_tiv is
begin
  with x select
    r <=
      "00000000101110111" when "0000000", -- t[0] = -130697
      "00000010001000001" when "0000001", -- t[1] = -129983
      "00000011100001110" when "0000010", -- t[2] = -129266
      "00000100111100000" when "0000011", -- t[3] = -128544
      "00000110010110101" when "0000100", -- t[4] = -127819
      "00000111110001110" when "0000101", -- t[5] = -127090
      "00001001001101011" when "0000110", -- t[6] = -126357
      "00001010101001101" when "0000111", -- t[7] = -125619
      "00001100000110010" when "0001000", -- t[8] = -124878
      "00001101100011011" when "0001001", -- t[9] = -124133
      "00001111000001000" when "0001010", -- t[10] = -123384
      "00010000011111010" when "0001011", -- t[11] = -122630
      "00010001111101111" when "0001100", -- t[12] = -121873
      "00010011011101001" when "0001101", -- t[13] = -121111
      "00010100111100110" when "0001110", -- t[14] = -120346
      "00010110011101000" when "0001111", -- t[15] = -119576
      "00010111111101110" when "0010000", -- t[16] = -118802
      "00011001011111000" when "0010001", -- t[17] = -118024
      "00011011000000111" when "0010010", -- t[18] = -117241
      "00011100100011001" when "0010011", -- t[19] = -116455
      "00011110000110000" when "0010100", -- t[20] = -115664
      "00011111101001100" when "0010101", -- t[21] = -114868
      "00100001001101011" when "0010110", -- t[22] = -114069
      "00100010110001111" when "0010111", -- t[23] = -113265
      "00100100010110111" when "0011000", -- t[24] = -112457
      "00100101111100100" when "0011001", -- t[25] = -111644
      "00100111100010101" when "0011010", -- t[26] = -110827
      "00101001001001011" when "0011011", -- t[27] = -110005
      "00101010110000101" when "0011100", -- t[28] = -109179
      "00101100011000011" when "0011101", -- t[29] = -108349
      "00101110000000110" when "0011110", -- t[30] = -107514
      "00101111101001110" when "0011111", -- t[31] = -106674
      "00110001010011010" when "0100000", -- t[32] = -105830
      "00110010111101010" when "0100001", -- t[33] = -104982
      "00110100100111111" when "0100010", -- t[34] = -104129
      "00110110010011001" when "0100011", -- t[35] = -103271
      "00110111111111000" when "0100100", -- t[36] = -102408
      "00111001101011011" when "0100101", -- t[37] = -101541
      "00111011011000011" when "0100110", -- t[38] = -100669
      "00111101000110000" when "0100111", -- t[39] = -99792
      "00111110110100001" when "0101000", -- t[40] = -98911
      "01000000100010111" when "0101001", -- t[41] = -98025
      "01000010010010010" when "0101010", -- t[42] = -97134
      "01000100000010010" when "0101011", -- t[43] = -96238
      "01000101110010111" when "0101100", -- t[44] = -95337
      "01000111100100001" when "0101101", -- t[45] = -94431
      "01001001010101111" when "0101110", -- t[46] = -93521
      "01001011001000011" when "0101111", -- t[47] = -92605
      "01001100111011011" when "0110000", -- t[48] = -91685
      "01001110101111001" when "0110001", -- t[49] = -90759
      "01010000100011011" when "0110010", -- t[50] = -89829
      "01010010011000011" when "0110011", -- t[51] = -88893
      "01010100001101111" when "0110100", -- t[52] = -87953
      "01010110000100001" when "0110101", -- t[53] = -87007
      "01010111111011000" when "0110110", -- t[54] = -86056
      "01011001110010100" when "0110111", -- t[55] = -85100
      "01011011101010101" when "0111000", -- t[56] = -84139
      "01011101100011100" when "0111001", -- t[57] = -83172
      "01011111011100111" when "0111010", -- t[58] = -82201
      "01100001010111000" when "0111011", -- t[59] = -81224
      "01100011010001111" when "0111100", -- t[60] = -80241
      "01100101001101010" when "0111101", -- t[61] = -79254
      "01100111001001011" when "0111110", -- t[62] = -78261
      "01101001000110010" when "0111111", -- t[63] = -77262
      "01101011000011101" when "1000000", -- t[64] = -76259
      "01101101000001111" when "1000001", -- t[65] = -75249
      "01101111000000101" when "1000010", -- t[66] = -74235
      "01110001000000010" when "1000011", -- t[67] = -73214
      "01110011000000011" when "1000100", -- t[68] = -72189
      "01110101000001011" when "1000101", -- t[69] = -71157
      "01110111000011000" when "1000110", -- t[70] = -70120
      "01111001000101010" when "1000111", -- t[71] = -69078
      "01111011001000010" when "1001000", -- t[72] = -68030
      "01111101001100000" when "1001001", -- t[73] = -66976
      "01111111010000100" when "1001010", -- t[74] = -65916
      "10000001010101101" when "1001011", -- t[75] = -64851
      "10000011011011101" when "1001100", -- t[76] = -63779
      "10000101100010010" when "1001101", -- t[77] = -62702
      "10000111101001101" when "1001110", -- t[78] = -61619
      "10001001110001101" when "1001111", -- t[79] = -60531
      "10001011111010100" when "1010000", -- t[80] = -59436
      "10001110000100001" when "1010001", -- t[81] = -58335
      "10010000001110011" when "1010010", -- t[82] = -57229
      "10010010011001100" when "1010011", -- t[83] = -56116
      "10010100100101010" when "1010100", -- t[84] = -54998
      "10010110110001111" when "1010101", -- t[85] = -53873
      "10011000111111010" when "1010110", -- t[86] = -52742
      "10011011001101011" when "1010111", -- t[87] = -51605
      "10011101011100010" when "1011000", -- t[88] = -50462
      "10011111101011111" when "1011001", -- t[89] = -49313
      "10100001111100011" when "1011010", -- t[90] = -48157
      "10100100001101101" when "1011011", -- t[91] = -46995
      "10100110011111101" when "1011100", -- t[92] = -45827
      "10101000110010011" when "1011101", -- t[93] = -44653
      "10101011000110000" when "1011110", -- t[94] = -43472
      "10101101011010011" when "1011111", -- t[95] = -42285
      "10101111101111101" when "1100000", -- t[96] = -41091
      "10110010000101101" when "1100001", -- t[97] = -39891
      "10110100011100100" when "1100010", -- t[98] = -38684
      "10110110110100001" when "1100011", -- t[99] = -37471
      "10111001001100101" when "1100100", -- t[100] = -36251
      "10111011100110000" when "1100101", -- t[101] = -35024
      "10111110000000001" when "1100110", -- t[102] = -33791
      "11000000011011001" when "1100111", -- t[103] = -32551
      "11000010110110111" when "1101000", -- t[104] = -31305
      "11000101010011101" when "1101001", -- t[105] = -30051
      "11000111110001001" when "1101010", -- t[106] = -28791
      "11001010001111100" when "1101011", -- t[107] = -27524
      "11001100101110110" when "1101100", -- t[108] = -26250
      "11001111001110111" when "1101101", -- t[109] = -24969
      "11010001101111110" when "1101110", -- t[110] = -23682
      "11010100010001101" when "1101111", -- t[111] = -22387
      "11010110110100011" when "1110000", -- t[112] = -21085
      "11011001011000000" when "1110001", -- t[113] = -19776
      "11011011111100100" when "1110010", -- t[114] = -18460
      "11011110100001111" when "1110011", -- t[115] = -17137
      "11100001001000001" when "1110100", -- t[116] = -15807
      "11100011101111011" when "1110101", -- t[117] = -14469
      "11100110010111100" when "1110110", -- t[118] = -13124
      "11101001000000100" when "1110111", -- t[119] = -11772
      "11101011101010011" when "1111000", -- t[120] = -10413
      "11101110010101010" when "1111001", -- t[121] = -9046
      "11110001000001000" when "1111010", -- t[122] = -7672
      "11110011101101110" when "1111011", -- t[123] = -6290
      "11110110011011011" when "1111100", -- t[124] = -4901
      "11111001001010000" when "1111101", -- t[125] = -3504
      "11111011111001100" when "1111110", -- t[126] = -2100
      "11111110101010000" when "1111111", -- t[127] = -688
      "-----------------" when others;
end architecture;


library ieee;
use ieee.std_logic_1164.all;

entity Exp2_MPT_13_to2 is
  port( x : in  std_logic_vector(6 downto 0);
        r : out std_logic_vector(9 downto 0) );
end entity;

architecture arch of Exp2_MPT_13_to2 is
begin
  with x select
    r <=
      "0001011001" when "0000000", -- t[0] = 89
      "0100001011" when "0000001", -- t[1] = 267
      "0001011010" when "0000010", -- t[2] = 90
      "0100001110" when "0000011", -- t[3] = 270
      "0001011011" when "0000100", -- t[4] = 91
      "0100010001" when "0000101", -- t[5] = 273
      "0001011100" when "0000110", -- t[6] = 92
      "0100010100" when "0000111", -- t[7] = 276
      "0001011101" when "0001000", -- t[8] = 93
      "0100010111" when "0001001", -- t[9] = 279
      "0001011110" when "0001010", -- t[10] = 94
      "0100011010" when "0001011", -- t[11] = 282
      "0001011111" when "0001100", -- t[12] = 95
      "0100011101" when "0001101", -- t[13] = 285
      "0001100000" when "0001110", -- t[14] = 96
      "0100100000" when "0001111", -- t[15] = 288
      "0001100001" when "0010000", -- t[16] = 97
      "0100100011" when "0010001", -- t[17] = 291
      "0001100010" when "0010010", -- t[18] = 98
      "0100100110" when "0010011", -- t[19] = 294
      "0001100011" when "0010100", -- t[20] = 99
      "0100101010" when "0010101", -- t[21] = 298
      "0001100100" when "0010110", -- t[22] = 100
      "0100101101" when "0010111", -- t[23] = 301
      "0001100101" when "0011000", -- t[24] = 101
      "0100110000" when "0011001", -- t[25] = 304
      "0001100110" when "0011010", -- t[26] = 102
      "0100110011" when "0011011", -- t[27] = 307
      "0001100111" when "0011100", -- t[28] = 103
      "0100110111" when "0011101", -- t[29] = 311
      "0001101000" when "0011110", -- t[30] = 104
      "0100111010" when "0011111", -- t[31] = 314
      "0001101010" when "0100000", -- t[32] = 106
      "0100111110" when "0100001", -- t[33] = 318
      "0001101011" when "0100010", -- t[34] = 107
      "0101000001" when "0100011", -- t[35] = 321
      "0001101100" when "0100100", -- t[36] = 108
      "0101000101" when "0100101", -- t[37] = 325
      "0001101101" when "0100110", -- t[38] = 109
      "0101001000" when "0100111", -- t[39] = 328
      "0001101110" when "0101000", -- t[40] = 110
      "0101001100" when "0101001", -- t[41] = 332
      "0001101111" when "0101010", -- t[42] = 111
      "0101001111" when "0101011", -- t[43] = 335
      "0001110001" when "0101100", -- t[44] = 113
      "0101010011" when "0101101", -- t[45] = 339
      "0001110010" when "0101110", -- t[46] = 114
      "0101010111" when "0101111", -- t[47] = 343
      "0001110011" when "0110000", -- t[48] = 115
      "0101011010" when "0110001", -- t[49] = 346
      "0001110100" when "0110010", -- t[50] = 116
      "0101011110" when "0110011", -- t[51] = 350
      "0001110110" when "0110100", -- t[52] = 118
      "0101100010" when "0110101", -- t[53] = 354
      "0001110111" when "0110110", -- t[54] = 119
      "0101100110" when "0110111", -- t[55] = 358
      "0001111000" when "0111000", -- t[56] = 120
      "0101101010" when "0111001", -- t[57] = 362
      "0001111010" when "0111010", -- t[58] = 122
      "0101101110" when "0111011", -- t[59] = 366
      "0001111011" when "0111100", -- t[60] = 123
      "0101110010" when "0111101", -- t[61] = 370
      "0001111100" when "0111110", -- t[62] = 124
      "0101110110" when "0111111", -- t[63] = 374
      "0001111110" when "1000000", -- t[64] = 126
      "0101111010" when "1000001", -- t[65] = 378
      "0001111111" when "1000010", -- t[66] = 127
      "0101111110" when "1000011", -- t[67] = 382
      "0010000000" when "1000100", -- t[68] = 128
      "0110000010" when "1000101", -- t[69] = 386
      "0010000010" when "1000110", -- t[70] = 130
      "0110000110" when "1000111", -- t[71] = 390
      "0010000011" when "1001000", -- t[72] = 131
      "0110001010" when "1001001", -- t[73] = 394
      "0010000101" when "1001010", -- t[74] = 133
      "0110001111" when "1001011", -- t[75] = 399
      "0010000110" when "1001100", -- t[76] = 134
      "0110010011" when "1001101", -- t[77] = 403
      "0010001000" when "1001110", -- t[78] = 136
      "0110011000" when "1001111", -- t[79] = 408
      "0010001001" when "1010000", -- t[80] = 137
      "0110011100" when "1010001", -- t[81] = 412
      "0010001010" when "1010010", -- t[82] = 138
      "0110100000" when "1010011", -- t[83] = 416
      "0010001100" when "1010100", -- t[84] = 140
      "0110100101" when "1010101", -- t[85] = 421
      "0010001110" when "1010110", -- t[86] = 142
      "0110101010" when "1010111", -- t[87] = 426
      "0010001111" when "1011000", -- t[88] = 143
      "0110101110" when "1011001", -- t[89] = 430
      "0010010001" when "1011010", -- t[90] = 145
      "0110110011" when "1011011", -- t[91] = 435
      "0010010010" when "1011100", -- t[92] = 146
      "0110111000" when "1011101", -- t[93] = 440
      "0010010100" when "1011110", -- t[94] = 148
      "0110111100" when "1011111", -- t[95] = 444
      "0010010101" when "1100000", -- t[96] = 149
      "0111000001" when "1100001", -- t[97] = 449
      "0010010111" when "1100010", -- t[98] = 151
      "0111000110" when "1100011", -- t[99] = 454
      "0010011001" when "1100100", -- t[100] = 153
      "0111001011" when "1100101", -- t[101] = 459
      "0010011010" when "1100110", -- t[102] = 154
      "0111010000" when "1100111", -- t[103] = 464
      "0010011100" when "1101000", -- t[104] = 156
      "0111010101" when "1101001", -- t[105] = 469
      "0010011110" when "1101010", -- t[106] = 158
      "0111011010" when "1101011", -- t[107] = 474
      "0010100000" when "1101100", -- t[108] = 160
      "0111100000" when "1101101", -- t[109] = 480
      "0010100001" when "1101110", -- t[110] = 161
      "0111100101" when "1101111", -- t[111] = 485
      "0010100011" when "1110000", -- t[112] = 163
      "0111101010" when "1110001", -- t[113] = 490
      "0010100101" when "1110010", -- t[114] = 165
      "0111101111" when "1110011", -- t[115] = 495
      "0010100111" when "1110100", -- t[116] = 167
      "0111110101" when "1110101", -- t[117] = 501
      "0010101000" when "1110110", -- t[118] = 168
      "0111111010" when "1110111", -- t[119] = 506
      "0010101010" when "1111000", -- t[120] = 170
      "1000000000" when "1111001", -- t[121] = 512
      "0010101100" when "1111010", -- t[122] = 172
      "1000000101" when "1111011", -- t[123] = 517
      "0010101110" when "1111100", -- t[124] = 174
      "1000001011" when "1111101", -- t[125] = 523
      "0010110000" when "1111110", -- t[126] = 176
      "1000010001" when "1111111", -- t[127] = 529
      "----------" when others;
end architecture;


library ieee;
use ieee.std_logic_1164.all;

entity Exp2_MPT_13_to1 is
  port( x : in  std_logic_vector(5 downto 0);
        r : out std_logic_vector(7 downto 0) );
end entity;

architecture arch of Exp2_MPT_13_to1 is
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
      "01011001" when "011011", -- t[27] = 89
      "00011110" when "011100", -- t[28] = 30
      "01011011" when "011101", -- t[29] = 91
      "00011111" when "011110", -- t[30] = 31
      "01011101" when "011111", -- t[31] = 93
      "00011111" when "100000", -- t[32] = 31
      "01011111" when "100001", -- t[33] = 95
      "00100000" when "100010", -- t[34] = 32
      "01100001" when "100011", -- t[35] = 97
      "00100001" when "100100", -- t[36] = 33
      "01100011" when "100101", -- t[37] = 99
      "00100001" when "100110", -- t[38] = 33
      "01100101" when "100111", -- t[39] = 101
      "00100010" when "101000", -- t[40] = 34
      "01100111" when "101001", -- t[41] = 103
      "00100011" when "101010", -- t[42] = 35
      "01101010" when "101011", -- t[43] = 106
      "00100100" when "101100", -- t[44] = 36
      "01101100" when "101101", -- t[45] = 108
      "00100100" when "101110", -- t[46] = 36
      "01101110" when "101111", -- t[47] = 110
      "00100101" when "110000", -- t[48] = 37
      "01110001" when "110001", -- t[49] = 113
      "00100110" when "110010", -- t[50] = 38
      "01110011" when "110011", -- t[51] = 115
      "00100111" when "110100", -- t[52] = 39
      "01110110" when "110101", -- t[53] = 118
      "00101000" when "110110", -- t[54] = 40
      "01111000" when "110111", -- t[55] = 120
      "00101001" when "111000", -- t[56] = 41
      "01111011" when "111001", -- t[57] = 123
      "00101010" when "111010", -- t[58] = 42
      "01111110" when "111011", -- t[59] = 126
      "00101010" when "111100", -- t[60] = 42
      "10000000" when "111101", -- t[61] = 128
      "00101011" when "111110", -- t[62] = 43
      "10000011" when "111111", -- t[63] = 131
      "--------" when others;
end architecture;


library ieee;
use ieee.std_logic_1164.all;

entity Exp2_MPT_13_to0 is
  port( x : in  std_logic_vector(3 downto 0);
        r : out std_logic_vector(4 downto 0) );
end entity;

architecture arch of Exp2_MPT_13_to0 is
begin
  with x select
    r <=
      "00101" when "0000", -- t[0] = 5
      "10001" when "0001", -- t[1] = 17
      "00110" when "0010", -- t[2] = 6
      "10010" when "0011", -- t[3] = 18
      "00110" when "0100", -- t[4] = 6
      "10100" when "0101", -- t[5] = 20
      "00111" when "0110", -- t[6] = 7
      "10110" when "0111", -- t[7] = 22
      "01000" when "1000", -- t[8] = 8
      "11000" when "1001", -- t[9] = 24
      "01000" when "1010", -- t[10] = 8
      "11010" when "1011", -- t[11] = 26
      "01001" when "1100", -- t[12] = 9
      "11101" when "1101", -- t[13] = 29
      "01010" when "1110", -- t[14] = 10
      "11111" when "1111", -- t[15] = 31
      "-----" when others;
end architecture;


library ieee;
use ieee.std_logic_1164.all;
library fplib;
use fplib.pkg_Exp2_MPT_13.all;

entity Exp2_MPT_13_to2_xor is
  port( a : in  std_logic_vector(5 downto 0);
        b : in  std_logic_vector(1 downto 0);
        r : out std_logic_vector(16 downto 0) );
end entity;

architecture arch of Exp2_MPT_13_to2_xor is
  signal sign  : std_logic;
  signal in_t  : std_logic_vector(6 downto 0);
  signal out_t : std_logic_vector(9 downto 0);
begin
  sign <= not b(1);
  in_t(6 downto 1) <= a(5 downto 0);
  in_t(0) <= b(0) xor sign;

  inst_to2 : Exp2_MPT_13_to2
    port map( x => in_t,
              r => out_t );

  r(16 downto 10) <= (16 downto 10 => sign);
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
use fplib.pkg_Exp2_MPT_13.all;

entity Exp2_MPT_13_to1_xor is
  port( a : in  std_logic_vector(4 downto 0);
        b : in  std_logic_vector(1 downto 0);
        r : out std_logic_vector(16 downto 0) );
end entity;

architecture arch of Exp2_MPT_13_to1_xor is
  signal sign  : std_logic;
  signal in_t  : std_logic_vector(5 downto 0);
  signal out_t : std_logic_vector(7 downto 0);
begin
  sign <= not b(1);
  in_t(5 downto 1) <= a(4 downto 0);
  in_t(0) <= b(0) xor sign;

  inst_to1 : Exp2_MPT_13_to1
    port map( x => in_t,
              r => out_t );

  r(16 downto 8) <= (16 downto 8 => sign);
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
use fplib.pkg_Exp2_MPT_13.all;

entity Exp2_MPT_13_to0_xor is
  port( a : in  std_logic_vector(2 downto 0);
        b : in  std_logic_vector(1 downto 0);
        r : out std_logic_vector(16 downto 0) );
end entity;

architecture arch of Exp2_MPT_13_to0_xor is
  signal sign  : std_logic;
  signal in_t  : std_logic_vector(3 downto 0);
  signal out_t : std_logic_vector(4 downto 0);
begin
  sign <= not b(1);
  in_t(3 downto 1) <= a(2 downto 0);
  in_t(0) <= b(0) xor sign;

  inst_to0 : Exp2_MPT_13_to0
    port map( x => in_t,
              r => out_t );

  r(16 downto 5) <= (16 downto 5 => sign);
  r(0) <= out_t(0) xor sign;
  r(1) <= out_t(1) xor sign;
  r(2) <= out_t(2) xor sign;
  r(3) <= out_t(3) xor sign;
  r(4) <= out_t(4) xor sign;
end architecture;


library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library fplib;
use fplib.pkg_Exp2_MPT_13.all;

entity Exp2_MPT_13 is
  port( x : in  std_logic_vector(12 downto 0);
        r : out std_logic_vector(12 downto 0) );
end entity;

architecture arch of Exp2_MPT_13 is
  signal in_tiv  : std_logic_vector(6 downto 0);
  signal out_tiv : std_logic_vector(16 downto 0);
  signal a2      : std_logic_vector(5 downto 0);
  signal b2      : std_logic_vector(1 downto 0);
  signal out2    : std_logic_vector(16 downto 0);
  signal a1      : std_logic_vector(4 downto 0);
  signal b1      : std_logic_vector(1 downto 0);
  signal out1    : std_logic_vector(16 downto 0);
  signal a0      : std_logic_vector(2 downto 0);
  signal b0      : std_logic_vector(1 downto 0);
  signal out0    : std_logic_vector(16 downto 0);
  signal sum     : std_logic_vector(16 downto 0);
begin
  in_tiv <= x(12 downto 6);
  inst_tiv : Exp2_MPT_13_tiv
    port map( x => in_tiv,
              r => out_tiv );

  a2 <= x(12 downto 7);
  b2 <= x(5 downto 4);
  inst_to2_xor : Exp2_MPT_13_to2_xor
    port map( a => a2,
              b => b2,
              r => out2 );

  a1 <= x(12 downto 8);
  b1 <= x(3 downto 2);
  inst_to1_xor : Exp2_MPT_13_to1_xor
    port map( a => a1,
              b => b1,
              r => out1 );

  a0 <= x(12 downto 10);
  b0 <= x(1 downto 0);
  inst_to0_xor : Exp2_MPT_13_to0_xor
    port map( a => a0,
              b => b0,
              r => out0 );


  sum <= out_tiv + out2 + out1 + out0;
  r <= sum(16 downto 4);
end architecture;
