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
-- wI = 13 bits
-- wO = 13 bits
-- Decomposition: 7, 6 / 6, 5, 3 / 2, 2, 2
-- Guard bits: 5
-- Size: 4400 = 18.2^7 + 11.2^7 + 9.2^6 + 7.2^4

library ieee;
use ieee.std_logic_1164.all;

package pkg_Log2_MPT_13 is
  component Log2_MPT_13_tiv is
    port( x : in  std_logic_vector(6 downto 0);
          r : out std_logic_vector(17 downto 0) );
  end component;

  component Log2_MPT_13_to2 is
    port( x : in  std_logic_vector(6 downto 0);
          r : out std_logic_vector(10 downto 0) );
  end component;

  component Log2_MPT_13_to1 is
    port( x : in  std_logic_vector(5 downto 0);
          r : out std_logic_vector(8 downto 0) );
  end component;

  component Log2_MPT_13_to0 is
    port( x : in  std_logic_vector(3 downto 0);
          r : out std_logic_vector(6 downto 0) );
  end component;

  component Log2_MPT_13_to2_xor is
    port( a : in  std_logic_vector(5 downto 0);
          b : in  std_logic_vector(1 downto 0);
          r : out std_logic_vector(17 downto 0) );
  end component;

  component Log2_MPT_13_to1_xor is
    port( a : in  std_logic_vector(4 downto 0);
          b : in  std_logic_vector(1 downto 0);
          r : out std_logic_vector(17 downto 0) );
  end component;

  component Log2_MPT_13_to0_xor is
    port( a : in  std_logic_vector(2 downto 0);
          b : in  std_logic_vector(1 downto 0);
          r : out std_logic_vector(17 downto 0) );
  end component;
end package;


library ieee;
use ieee.std_logic_1164.all;

entity Log2_MPT_13_tiv is
  port( x : in  std_logic_vector(6 downto 0);
        r : out std_logic_vector(17 downto 0) );
end entity;

architecture arch of Log2_MPT_13_tiv is
begin
  with x select
    r <=
      "000000010110111010" when "0000000", -- t[0] = 1466
      "000001000100101110" when "0000001", -- t[1] = 4398
      "000001110010001011" when "0000010", -- t[2] = 7307
      "000010011111010010" when "0000011", -- t[3] = 10194
      "000011001100000100" when "0000100", -- t[4] = 13060
      "000011111000011111" when "0000101", -- t[5] = 15903
      "000100100100100110" when "0000110", -- t[6] = 18726
      "000101010000011000" when "0000111", -- t[7] = 21528
      "000101111011110101" when "0001000", -- t[8] = 24309
      "000110100110111101" when "0001001", -- t[9] = 27069
      "000111010001110010" when "0001010", -- t[10] = 29810
      "000111111100010011" when "0001011", -- t[11] = 32531
      "001000100110100001" when "0001100", -- t[12] = 35233
      "001001010000011011" when "0001101", -- t[13] = 37915
      "001001111010000010" when "0001110", -- t[14] = 40578
      "001010100011010111" when "0001111", -- t[15] = 43223
      "001011001100011010" when "0010000", -- t[16] = 45850
      "001011110101001010" when "0010001", -- t[17] = 48458
      "001100011101101001" when "0010010", -- t[18] = 51049
      "001101000101110110" when "0010011", -- t[19] = 53622
      "001101101101110001" when "0010100", -- t[20] = 56177
      "001110010101011011" when "0010101", -- t[21] = 58715
      "001110111100110101" when "0010110", -- t[22] = 61237
      "001111100011111101" when "0010111", -- t[23] = 63741
      "010000001010110110" when "0011000", -- t[24] = 66230
      "010000110001011110" when "0011001", -- t[25] = 68702
      "010001010111110110" when "0011010", -- t[26] = 71158
      "010001111101111110" when "0011011", -- t[27] = 73598
      "010010100011110110" when "0011100", -- t[28] = 76022
      "010011001001011111" when "0011101", -- t[29] = 78431
      "010011101110111001" when "0011110", -- t[30] = 80825
      "010100010100000011" when "0011111", -- t[31] = 83203
      "010100111000111111" when "0100000", -- t[32] = 85567
      "010101011101101100" when "0100001", -- t[33] = 87916
      "010110000010001011" when "0100010", -- t[34] = 90251
      "010110100110011011" when "0100011", -- t[35] = 92571
      "010111001010011101" when "0100100", -- t[36] = 94877
      "010111101110010010" when "0100101", -- t[37] = 97170
      "011000010001111000" when "0100110", -- t[38] = 99448
      "011000110101010001" when "0100111", -- t[39] = 101713
      "011001011000011100" when "0101000", -- t[40] = 103964
      "011001111011011010" when "0101001", -- t[41] = 106202
      "011010011110001010" when "0101010", -- t[42] = 108426
      "011011000000101110" when "0101011", -- t[43] = 110638
      "011011100011000101" when "0101100", -- t[44] = 112837
      "011100000101001111" when "0101101", -- t[45] = 115023
      "011100100111001101" when "0101110", -- t[46] = 117197
      "011101001000111110" when "0101111", -- t[47] = 119358
      "011101101010100011" when "0110000", -- t[48] = 121507
      "011110001011111100" when "0110001", -- t[49] = 123644
      "011110101101001000" when "0110010", -- t[50] = 125768
      "011111001110001001" when "0110011", -- t[51] = 127881
      "011111101110111110" when "0110100", -- t[52] = 129982
      "100000001111101000" when "0110101", -- t[53] = 132072
      "100000110000000110" when "0110110", -- t[54] = 134150
      "100001010000011000" when "0110111", -- t[55] = 136216
      "100001110000100000" when "0111000", -- t[56] = 138272
      "100010010000011100" when "0111001", -- t[57] = 140316
      "100010110000001101" when "0111010", -- t[58] = 142349
      "100011001111110100" when "0111011", -- t[59] = 144372
      "100011101111010000" when "0111100", -- t[60] = 146384
      "100100001110100001" when "0111101", -- t[61] = 148385
      "100100101101100111" when "0111110", -- t[62] = 150375
      "100101001100100011" when "0111111", -- t[63] = 152355
      "100101101011010101" when "1000000", -- t[64] = 154325
      "100110001001111101" when "1000001", -- t[65] = 156285
      "100110101000011010" when "1000010", -- t[66] = 158234
      "100111000110101110" when "1000011", -- t[67] = 160174
      "100111100100110111" when "1000100", -- t[68] = 162103
      "101000000010110111" when "1000101", -- t[69] = 164023
      "101000100000101101" when "1000110", -- t[70] = 165933
      "101000111110011001" when "1000111", -- t[71] = 167833
      "101001011011111100" when "1001000", -- t[72] = 169724
      "101001111001010110" when "1001001", -- t[73] = 171606
      "101010010110100110" when "1001010", -- t[74] = 173478
      "101010110011101101" when "1001011", -- t[75] = 175341
      "101011010000101011" when "1001100", -- t[76] = 177195
      "101011101101100000" when "1001101", -- t[77] = 179040
      "101100001010001100" when "1001110", -- t[78] = 180876
      "101100100110101111" when "1001111", -- t[79] = 182703
      "101101000011001001" when "1010000", -- t[80] = 184521
      "101101011111011011" when "1010001", -- t[81] = 186331
      "101101111011100100" when "1010010", -- t[82] = 188132
      "101110010111100100" when "1010011", -- t[83] = 189924
      "101110110011011100" when "1010100", -- t[84] = 191708
      "101111001111001011" when "1010101", -- t[85] = 193483
      "101111101010110011" when "1010110", -- t[86] = 195251
      "110000000110010010" when "1010111", -- t[87] = 197010
      "110000100001101001" when "1011000", -- t[88] = 198761
      "110000111100110111" when "1011001", -- t[89] = 200503
      "110001010111111110" when "1011010", -- t[90] = 202238
      "110001110010111101" when "1011011", -- t[91] = 203965
      "110010001101110100" when "1011100", -- t[92] = 205684
      "110010101000100100" when "1011101", -- t[93] = 207396
      "110011000011001011" when "1011110", -- t[94] = 209099
      "110011011101101011" when "1011111", -- t[95] = 210795
      "110011111000000011" when "1100000", -- t[96] = 212483
      "110100010010010100" when "1100001", -- t[97] = 214164
      "110100101100011110" when "1100010", -- t[98] = 215838
      "110101000110100000" when "1100011", -- t[99] = 217504
      "110101100000011010" when "1100100", -- t[100] = 219162
      "110101111010001110" when "1100101", -- t[101] = 220814
      "110110010011111010" when "1100110", -- t[102] = 222458
      "110110101101011111" when "1100111", -- t[103] = 224095
      "110111000110111101" when "1101000", -- t[104] = 225725
      "110111100000010101" when "1101001", -- t[105] = 227349
      "110111111001100101" when "1101010", -- t[106] = 228965
      "111000010010101110" when "1101011", -- t[107] = 230574
      "111000101011110001" when "1101100", -- t[108] = 232177
      "111001000100101100" when "1101101", -- t[109] = 233772
      "111001011101100001" when "1101110", -- t[110] = 235361
      "111001110110010000" when "1101111", -- t[111] = 236944
      "111010001110110111" when "1110000", -- t[112] = 238519
      "111010100111011001" when "1110001", -- t[113] = 240089
      "111010111111110011" when "1110010", -- t[114] = 241651
      "111011011000001000" when "1110011", -- t[115] = 243208
      "111011110000010110" when "1110100", -- t[116] = 244758
      "111100001000011101" when "1110101", -- t[117] = 246301
      "111100100000011111" when "1110110", -- t[118] = 247839
      "111100111000011010" when "1110111", -- t[119] = 249370
      "111101010000001111" when "1111000", -- t[120] = 250895
      "111101100111111110" when "1111001", -- t[121] = 252414
      "111101111111100110" when "1111010", -- t[122] = 253926
      "111110010111001001" when "1111011", -- t[123] = 255433
      "111110101110100110" when "1111100", -- t[124] = 256934
      "111111000101111100" when "1111101", -- t[125] = 258428
      "111111011101001101" when "1111110", -- t[126] = 259917
      "111111110100011000" when "1111111", -- t[127] = 261400
      "------------------" when others;
end architecture;


library ieee;
use ieee.std_logic_1164.all;

entity Log2_MPT_13_to2 is
  port( x : in  std_logic_vector(6 downto 0);
        r : out std_logic_vector(10 downto 0) );
end entity;

architecture arch of Log2_MPT_13_to2 is
begin
  with x select
    r <=
      "00101101110" when "0000000", -- t[0] = 366
      "10001001100" when "0000001", -- t[1] = 1100
      "00101101001" when "0000010", -- t[2] = 361
      "10000111011" when "0000011", -- t[3] = 1083
      "00101100011" when "0000100", -- t[4] = 355
      "10000101011" when "0000101", -- t[5] = 1067
      "00101011110" when "0000110", -- t[6] = 350
      "10000011011" when "0000111", -- t[7] = 1051
      "00101011001" when "0001000", -- t[8] = 345
      "10000001100" when "0001001", -- t[9] = 1036
      "00101010100" when "0001010", -- t[10] = 340
      "01111111101" when "0001011", -- t[11] = 1021
      "00101001111" when "0001100", -- t[12] = 335
      "01111101110" when "0001101", -- t[13] = 1006
      "00101001010" when "0001110", -- t[14] = 330
      "01111100000" when "0001111", -- t[15] = 992
      "00101000110" when "0010000", -- t[16] = 326
      "01111010010" when "0010001", -- t[17] = 978
      "00101000001" when "0010010", -- t[18] = 321
      "01111000101" when "0010011", -- t[19] = 965
      "00100111101" when "0010100", -- t[20] = 317
      "01110111000" when "0010101", -- t[21] = 952
      "00100111001" when "0010110", -- t[22] = 313
      "01110101011" when "0010111", -- t[23] = 939
      "00100110101" when "0011000", -- t[24] = 309
      "01110011111" when "0011001", -- t[25] = 927
      "00100110001" when "0011010", -- t[26] = 305
      "01110010011" when "0011011", -- t[27] = 915
      "00100101101" when "0011100", -- t[28] = 301
      "01110001000" when "0011101", -- t[29] = 904
      "00100101001" when "0011110", -- t[30] = 297
      "01101111100" when "0011111", -- t[31] = 892
      "00100100101" when "0100000", -- t[32] = 293
      "01101110001" when "0100001", -- t[33] = 881
      "00100100010" when "0100010", -- t[34] = 290
      "01101100110" when "0100011", -- t[35] = 870
      "00100011110" when "0100100", -- t[36] = 286
      "01101011100" when "0100101", -- t[37] = 860
      "00100011011" when "0100110", -- t[38] = 283
      "01101010001" when "0100111", -- t[39] = 849
      "00100010111" when "0101000", -- t[40] = 279
      "01101000111" when "0101001", -- t[41] = 839
      "00100010100" when "0101010", -- t[42] = 276
      "01100111101" when "0101011", -- t[43] = 829
      "00100010001" when "0101100", -- t[44] = 273
      "01100110100" when "0101101", -- t[45] = 820
      "00100001110" when "0101110", -- t[46] = 270
      "01100101010" when "0101111", -- t[47] = 810
      "00100001011" when "0110000", -- t[48] = 267
      "01100100001" when "0110001", -- t[49] = 801
      "00100001000" when "0110010", -- t[50] = 264
      "01100011000" when "0110011", -- t[51] = 792
      "00100000101" when "0110100", -- t[52] = 261
      "01100010000" when "0110101", -- t[53] = 784
      "00100000010" when "0110110", -- t[54] = 258
      "01100000111" when "0110111", -- t[55] = 775
      "00011111111" when "0111000", -- t[56] = 255
      "01011111111" when "0111001", -- t[57] = 767
      "00011111100" when "0111010", -- t[58] = 252
      "01011110110" when "0111011", -- t[59] = 758
      "00011111010" when "0111100", -- t[60] = 250
      "01011101110" when "0111101", -- t[61] = 750
      "00011110111" when "0111110", -- t[62] = 247
      "01011100110" when "0111111", -- t[63] = 742
      "00011110101" when "1000000", -- t[64] = 245
      "01011011111" when "1000001", -- t[65] = 735
      "00011110010" when "1000010", -- t[66] = 242
      "01011010111" when "1000011", -- t[67] = 727
      "00011110000" when "1000100", -- t[68] = 240
      "01011010000" when "1000101", -- t[69] = 720
      "00011101101" when "1000110", -- t[70] = 237
      "01011001001" when "1000111", -- t[71] = 713
      "00011101011" when "1001000", -- t[72] = 235
      "01011000001" when "1001001", -- t[73] = 705
      "00011101001" when "1001010", -- t[74] = 233
      "01010111011" when "1001011", -- t[75] = 699
      "00011100110" when "1001100", -- t[76] = 230
      "01010110100" when "1001101", -- t[77] = 692
      "00011100100" when "1001110", -- t[78] = 228
      "01010101101" when "1001111", -- t[79] = 685
      "00011100010" when "1010000", -- t[80] = 226
      "01010100110" when "1010001", -- t[81] = 678
      "00011100000" when "1010010", -- t[82] = 224
      "01010100000" when "1010011", -- t[83] = 672
      "00011011110" when "1010100", -- t[84] = 222
      "01010011010" when "1010101", -- t[85] = 666
      "00011011011" when "1010110", -- t[86] = 219
      "01010010011" when "1010111", -- t[87] = 659
      "00011011001" when "1011000", -- t[88] = 217
      "01010001101" when "1011001", -- t[89] = 653
      "00011010111" when "1011010", -- t[90] = 215
      "01010000111" when "1011011", -- t[91] = 647
      "00011010110" when "1011100", -- t[92] = 214
      "01010000010" when "1011101", -- t[93] = 642
      "00011010100" when "1011110", -- t[94] = 212
      "01001111100" when "1011111", -- t[95] = 636
      "00011010010" when "1100000", -- t[96] = 210
      "01001110110" when "1100001", -- t[97] = 630
      "00011010000" when "1100010", -- t[98] = 208
      "01001110001" when "1100011", -- t[99] = 625
      "00011001110" when "1100100", -- t[100] = 206
      "01001101011" when "1100101", -- t[101] = 619
      "00011001100" when "1100110", -- t[102] = 204
      "01001100110" when "1100111", -- t[103] = 614
      "00011001010" when "1101000", -- t[104] = 202
      "01001100000" when "1101001", -- t[105] = 608
      "00011001001" when "1101010", -- t[106] = 201
      "01001011011" when "1101011", -- t[107] = 603
      "00011000111" when "1101100", -- t[108] = 199
      "01001010110" when "1101101", -- t[109] = 598
      "00011000101" when "1101110", -- t[110] = 197
      "01001010001" when "1101111", -- t[111] = 593
      "00011000100" when "1110000", -- t[112] = 196
      "01001001100" when "1110001", -- t[113] = 588
      "00011000010" when "1110010", -- t[114] = 194
      "01001000111" when "1110011", -- t[115] = 583
      "00011000001" when "1110100", -- t[116] = 193
      "01001000011" when "1110101", -- t[117] = 579
      "00010111111" when "1110110", -- t[118] = 191
      "01000111110" when "1110111", -- t[119] = 574
      "00010111101" when "1111000", -- t[120] = 189
      "01000111001" when "1111001", -- t[121] = 569
      "00010111100" when "1111010", -- t[122] = 188
      "01000110101" when "1111011", -- t[123] = 565
      "00010111010" when "1111100", -- t[124] = 186
      "01000110000" when "1111101", -- t[125] = 560
      "00010111001" when "1111110", -- t[126] = 185
      "01000101100" when "1111111", -- t[127] = 556
      "-----------" when others;
end architecture;


library ieee;
use ieee.std_logic_1164.all;

entity Log2_MPT_13_to1 is
  port( x : in  std_logic_vector(5 downto 0);
        r : out std_logic_vector(8 downto 0) );
end entity;

architecture arch of Log2_MPT_13_to1 is
begin
  with x select
    r <=
      "001011010" when "000000", -- t[0] = 90
      "100010000" when "000001", -- t[1] = 272
      "001011000" when "000010", -- t[2] = 88
      "100001000" when "000011", -- t[3] = 264
      "001010101" when "000100", -- t[4] = 85
      "100000001" when "000101", -- t[5] = 257
      "001010011" when "000110", -- t[6] = 83
      "011111001" when "000111", -- t[7] = 249
      "001010000" when "001000", -- t[8] = 80
      "011110010" when "001001", -- t[9] = 242
      "001001110" when "001010", -- t[10] = 78
      "011101100" when "001011", -- t[11] = 236
      "001001100" when "001100", -- t[12] = 76
      "011100110" when "001101", -- t[13] = 230
      "001001010" when "001110", -- t[14] = 74
      "011100000" when "001111", -- t[15] = 224
      "001001000" when "010000", -- t[16] = 72
      "011011010" when "010001", -- t[17] = 218
      "001000111" when "010010", -- t[18] = 71
      "011010101" when "010011", -- t[19] = 213
      "001000101" when "010100", -- t[20] = 69
      "011010000" when "010101", -- t[21] = 208
      "001000011" when "010110", -- t[22] = 67
      "011001011" when "010111", -- t[23] = 203
      "001000010" when "011000", -- t[24] = 66
      "011000111" when "011001", -- t[25] = 199
      "001000000" when "011010", -- t[26] = 64
      "011000010" when "011011", -- t[27] = 194
      "000111111" when "011100", -- t[28] = 63
      "010111110" when "011101", -- t[29] = 190
      "000111110" when "011110", -- t[30] = 62
      "010111010" when "011111", -- t[31] = 186
      "000111100" when "100000", -- t[32] = 60
      "010110110" when "100001", -- t[33] = 182
      "000111011" when "100010", -- t[34] = 59
      "010110011" when "100011", -- t[35] = 179
      "000111010" when "100100", -- t[36] = 58
      "010101111" when "100101", -- t[37] = 175
      "000111001" when "100110", -- t[38] = 57
      "010101100" when "100111", -- t[39] = 172
      "000111000" when "101000", -- t[40] = 56
      "010101000" when "101001", -- t[41] = 168
      "000110111" when "101010", -- t[42] = 55
      "010100101" when "101011", -- t[43] = 165
      "000110110" when "101100", -- t[44] = 54
      "010100010" when "101101", -- t[45] = 162
      "000110101" when "101110", -- t[46] = 53
      "010011111" when "101111", -- t[47] = 159
      "000110100" when "110000", -- t[48] = 52
      "010011100" when "110001", -- t[49] = 156
      "000110011" when "110010", -- t[50] = 51
      "010011010" when "110011", -- t[51] = 154
      "000110010" when "110100", -- t[52] = 50
      "010010111" when "110101", -- t[53] = 151
      "000110001" when "110110", -- t[54] = 49
      "010010100" when "110111", -- t[55] = 148
      "000110000" when "111000", -- t[56] = 48
      "010010010" when "111001", -- t[57] = 146
      "000110000" when "111010", -- t[58] = 48
      "010010000" when "111011", -- t[59] = 144
      "000101111" when "111100", -- t[60] = 47
      "010001101" when "111101", -- t[61] = 141
      "000101110" when "111110", -- t[62] = 46
      "010001011" when "111111", -- t[63] = 139
      "---------" when others;
end architecture;


library ieee;
use ieee.std_logic_1164.all;

entity Log2_MPT_13_to0 is
  port( x : in  std_logic_vector(3 downto 0);
        r : out std_logic_vector(6 downto 0) );
end entity;

architecture arch of Log2_MPT_13_to0 is
begin
  with x select
    r <=
      "0010101" when "0000", -- t[0] = 21
      "1000001" when "0001", -- t[1] = 65
      "0010011" when "0010", -- t[2] = 19
      "0111010" when "0011", -- t[3] = 58
      "0010001" when "0100", -- t[4] = 17
      "0110100" when "0101", -- t[5] = 52
      "0010000" when "0110", -- t[6] = 16
      "0110000" when "0111", -- t[7] = 48
      "0001110" when "1000", -- t[8] = 14
      "0101100" when "1001", -- t[9] = 44
      "0001101" when "1010", -- t[10] = 13
      "0101001" when "1011", -- t[11] = 41
      "0001100" when "1100", -- t[12] = 12
      "0100110" when "1101", -- t[13] = 38
      "0001011" when "1110", -- t[14] = 11
      "0100011" when "1111", -- t[15] = 35
      "-------" when others;
end architecture;


library ieee;
use ieee.std_logic_1164.all;
library fplib;
use fplib.pkg_Log2_MPT_13.all;

entity Log2_MPT_13_to2_xor is
  port( a : in  std_logic_vector(5 downto 0);
        b : in  std_logic_vector(1 downto 0);
        r : out std_logic_vector(17 downto 0) );
end entity;

architecture arch of Log2_MPT_13_to2_xor is
  signal sign  : std_logic;
  signal in_t  : std_logic_vector(6 downto 0);
  signal out_t : std_logic_vector(10 downto 0);
begin
  sign <= not b(1);
  in_t(6 downto 1) <= a(5 downto 0);
  in_t(0) <= b(0) xor sign;

  inst_to2 : Log2_MPT_13_to2
    port map( x => in_t,
              r => out_t );

  r(17 downto 11) <= (17 downto 11 => sign);
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
  r(10) <= out_t(10) xor sign;
end architecture;


library ieee;
use ieee.std_logic_1164.all;
library fplib;
use fplib.pkg_Log2_MPT_13.all;

entity Log2_MPT_13_to1_xor is
  port( a : in  std_logic_vector(4 downto 0);
        b : in  std_logic_vector(1 downto 0);
        r : out std_logic_vector(17 downto 0) );
end entity;

architecture arch of Log2_MPT_13_to1_xor is
  signal sign  : std_logic;
  signal in_t  : std_logic_vector(5 downto 0);
  signal out_t : std_logic_vector(8 downto 0);
begin
  sign <= not b(1);
  in_t(5 downto 1) <= a(4 downto 0);
  in_t(0) <= b(0) xor sign;

  inst_to1 : Log2_MPT_13_to1
    port map( x => in_t,
              r => out_t );

  r(17 downto 9) <= (17 downto 9 => sign);
  r(0) <= out_t(0) xor sign;
  r(1) <= out_t(1) xor sign;
  r(2) <= out_t(2) xor sign;
  r(3) <= out_t(3) xor sign;
  r(4) <= out_t(4) xor sign;
  r(5) <= out_t(5) xor sign;
  r(6) <= out_t(6) xor sign;
  r(7) <= out_t(7) xor sign;
  r(8) <= out_t(8) xor sign;
end architecture;


library ieee;
use ieee.std_logic_1164.all;
library fplib;
use fplib.pkg_Log2_MPT_13.all;

entity Log2_MPT_13_to0_xor is
  port( a : in  std_logic_vector(2 downto 0);
        b : in  std_logic_vector(1 downto 0);
        r : out std_logic_vector(17 downto 0) );
end entity;

architecture arch of Log2_MPT_13_to0_xor is
  signal sign  : std_logic;
  signal in_t  : std_logic_vector(3 downto 0);
  signal out_t : std_logic_vector(6 downto 0);
begin
  sign <= not b(1);
  in_t(3 downto 1) <= a(2 downto 0);
  in_t(0) <= b(0) xor sign;

  inst_to0 : Log2_MPT_13_to0
    port map( x => in_t,
              r => out_t );

  r(17 downto 7) <= (17 downto 7 => sign);
  r(0) <= out_t(0) xor sign;
  r(1) <= out_t(1) xor sign;
  r(2) <= out_t(2) xor sign;
  r(3) <= out_t(3) xor sign;
  r(4) <= out_t(4) xor sign;
  r(5) <= out_t(5) xor sign;
  r(6) <= out_t(6) xor sign;
end architecture;


library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library fplib;
use fplib.pkg_Log2_MPT_13.all;

entity Log2_MPT_13 is
  port( x : in  std_logic_vector(12 downto 0);
        r : out std_logic_vector(12 downto 0) );
end entity;

architecture arch of Log2_MPT_13 is
  signal in_tiv  : std_logic_vector(6 downto 0);
  signal out_tiv : std_logic_vector(17 downto 0);
  signal a2      : std_logic_vector(5 downto 0);
  signal b2      : std_logic_vector(1 downto 0);
  signal out2    : std_logic_vector(17 downto 0);
  signal a1      : std_logic_vector(4 downto 0);
  signal b1      : std_logic_vector(1 downto 0);
  signal out1    : std_logic_vector(17 downto 0);
  signal a0      : std_logic_vector(2 downto 0);
  signal b0      : std_logic_vector(1 downto 0);
  signal out0    : std_logic_vector(17 downto 0);
  signal sum     : std_logic_vector(17 downto 0);
begin
  in_tiv <= x(12 downto 6);
  inst_tiv : Log2_MPT_13_tiv
    port map( x => in_tiv,
              r => out_tiv );

  a2 <= x(12 downto 7);
  b2 <= x(5 downto 4);
  inst_to2_xor : Log2_MPT_13_to2_xor
    port map( a => a2,
              b => b2,
              r => out2 );

  a1 <= x(12 downto 8);
  b1 <= x(3 downto 2);
  inst_to1_xor : Log2_MPT_13_to1_xor
    port map( a => a1,
              b => b1,
              r => out1 );

  a0 <= x(12 downto 10);
  b0 <= x(1 downto 0);
  inst_to0_xor : Log2_MPT_13_to0_xor
    port map( a => a0,
              b => b0,
              r => out0 );


  sum <= out_tiv + out2 + out1 + out0;
  r <= sum(17 downto 5);
end architecture;
