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
-- wI = 12 bits
-- wO = 12 bits
-- Decomposition: 7, 5 / 5, 4 / 2, 3
-- Guard bits: 3
-- Size: 2816 = 15.2^7 + 8.2^6 + 6.2^6

library ieee;
use ieee.std_logic_1164.all;

package pkg_Exp2_MPT_12 is
  component Exp2_MPT_12_tiv is
    port( x : in  std_logic_vector(6 downto 0);
          r : out std_logic_vector(14 downto 0) );
  end component;

  component Exp2_MPT_12_to1 is
    port( x : in  std_logic_vector(5 downto 0);
          r : out std_logic_vector(7 downto 0) );
  end component;

  component Exp2_MPT_12_to0 is
    port( x : in  std_logic_vector(5 downto 0);
          r : out std_logic_vector(5 downto 0) );
  end component;

  component Exp2_MPT_12_to1_xor is
    port( a : in  std_logic_vector(4 downto 0);
          b : in  std_logic_vector(1 downto 0);
          r : out std_logic_vector(14 downto 0) );
  end component;

  component Exp2_MPT_12_to0_xor is
    port( a : in  std_logic_vector(3 downto 0);
          b : in  std_logic_vector(2 downto 0);
          r : out std_logic_vector(14 downto 0) );
  end component;
end package;


library ieee;
use ieee.std_logic_1164.all;

entity Exp2_MPT_12_tiv is
  port( x : in  std_logic_vector(6 downto 0);
        r : out std_logic_vector(14 downto 0) );
end entity;

architecture arch of Exp2_MPT_12_tiv is
begin
  with x select
    r <=
      "000000001100011" when "0000000", -- t[0] = -32669
      "000000100010101" when "0000001", -- t[1] = -32491
      "000000111001000" when "0000010", -- t[2] = -32312
      "000001001111101" when "0000011", -- t[3] = -32131
      "000001100110010" when "0000100", -- t[4] = -31950
      "000001111101000" when "0000101", -- t[5] = -31768
      "000010010100000" when "0000110", -- t[6] = -31584
      "000010101011000" when "0000111", -- t[7] = -31400
      "000011000010001" when "0001000", -- t[8] = -31215
      "000011011001100" when "0001001", -- t[9] = -31028
      "000011110000111" when "0001010", -- t[10] = -30841
      "000100001000011" when "0001011", -- t[11] = -30653
      "000100100000001" when "0001100", -- t[12] = -30463
      "000100110111111" when "0001101", -- t[13] = -30273
      "000101001111110" when "0001110", -- t[14] = -30082
      "000101100111111" when "0001111", -- t[15] = -29889
      "000110000000000" when "0010000", -- t[16] = -29696
      "000110011000011" when "0010001", -- t[17] = -29501
      "000110110000110" when "0010010", -- t[18] = -29306
      "000111001001011" when "0010011", -- t[19] = -29109
      "000111100010001" when "0010100", -- t[20] = -28911
      "000111111011000" when "0010101", -- t[21] = -28712
      "001000010100000" when "0010110", -- t[22] = -28512
      "001000101101000" when "0010111", -- t[23] = -28312
      "001001000110011" when "0011000", -- t[24] = -28109
      "001001011111110" when "0011001", -- t[25] = -27906
      "001001111001010" when "0011010", -- t[26] = -27702
      "001010010010111" when "0011011", -- t[27] = -27497
      "001010101100110" when "0011100", -- t[28] = -27290
      "001011000110101" when "0011101", -- t[29] = -27083
      "001011100000110" when "0011110", -- t[30] = -26874
      "001011111011000" when "0011111", -- t[31] = -26664
      "001100010101011" when "0100000", -- t[32] = -26453
      "001100101111111" when "0100001", -- t[33] = -26241
      "001101001010101" when "0100010", -- t[34] = -26027
      "001101100101011" when "0100011", -- t[35] = -25813
      "001110000000011" when "0100100", -- t[36] = -25597
      "001110011011011" when "0100101", -- t[37] = -25381
      "001110110110101" when "0100110", -- t[38] = -25163
      "001111010010001" when "0100111", -- t[39] = -24943
      "001111101101101" when "0101000", -- t[40] = -24723
      "010000001001010" when "0101001", -- t[41] = -24502
      "010000100101001" when "0101010", -- t[42] = -24279
      "010001000001001" when "0101011", -- t[43] = -24055
      "010001011101010" when "0101100", -- t[44] = -23830
      "010001111001101" when "0101101", -- t[45] = -23603
      "010010010110000" when "0101110", -- t[46] = -23376
      "010010110010101" when "0101111", -- t[47] = -23147
      "010011001111011" when "0110000", -- t[48] = -22917
      "010011101100011" when "0110001", -- t[49] = -22685
      "010100001001011" when "0110010", -- t[50] = -22453
      "010100100110101" when "0110011", -- t[51] = -22219
      "010101000100000" when "0110100", -- t[52] = -21984
      "010101100001101" when "0110101", -- t[53] = -21747
      "010101111111011" when "0110110", -- t[54] = -21509
      "010110011101010" when "0110111", -- t[55] = -21270
      "010110111011010" when "0111000", -- t[56] = -21030
      "010111011001100" when "0111001", -- t[57] = -20788
      "010111110111110" when "0111010", -- t[58] = -20546
      "011000010110011" when "0111011", -- t[59] = -20301
      "011000110101000" when "0111100", -- t[60] = -20056
      "011001010011111" when "0111101", -- t[61] = -19809
      "011001110010111" when "0111110", -- t[62] = -19561
      "011010010010001" when "0111111", -- t[63] = -19311
      "011010110001100" when "1000000", -- t[64] = -19060
      "011011010001000" when "1000001", -- t[65] = -18808
      "011011110000110" when "1000010", -- t[66] = -18554
      "011100010000101" when "1000011", -- t[67] = -18299
      "011100110000101" when "1000100", -- t[68] = -18043
      "011101010000111" when "1000101", -- t[69] = -17785
      "011101110001011" when "1000110", -- t[70] = -17525
      "011110010001111" when "1000111", -- t[71] = -17265
      "011110110010101" when "1001000", -- t[72] = -17003
      "011111010011101" when "1001001", -- t[73] = -16739
      "011111110100110" when "1001010", -- t[74] = -16474
      "100000010110000" when "1001011", -- t[75] = -16208
      "100000110111100" when "1001100", -- t[76] = -15940
      "100001011001001" when "1001101", -- t[77] = -15671
      "100001111011000" when "1001110", -- t[78] = -15400
      "100010011101000" when "1001111", -- t[79] = -15128
      "100010111111010" when "1010000", -- t[80] = -14854
      "100011100001101" when "1010001", -- t[81] = -14579
      "100100000100001" when "1010010", -- t[82] = -14303
      "100100100111000" when "1010011", -- t[83] = -14024
      "100101001001111" when "1010100", -- t[84] = -13745
      "100101101101000" when "1010101", -- t[85] = -13464
      "100110010000011" when "1010110", -- t[86] = -13181
      "100110110011111" when "1010111", -- t[87] = -12897
      "100111010111101" when "1011000", -- t[88] = -12611
      "100111111011100" when "1011001", -- t[89] = -12324
      "101000011111101" when "1011010", -- t[90] = -12035
      "101001000100000" when "1011011", -- t[91] = -11744
      "101001101000100" when "1011100", -- t[92] = -11452
      "101010001101001" when "1011101", -- t[93] = -11159
      "101010110010001" when "1011110", -- t[94] = -10863
      "101011010111010" when "1011111", -- t[95] = -10566
      "101011111100100" when "1100000", -- t[96] = -10268
      "101100100010000" when "1100001", -- t[97] = -9968
      "101101000111110" when "1100010", -- t[98] = -9666
      "101101101101101" when "1100011", -- t[99] = -9363
      "101110010011110" when "1100100", -- t[100] = -9058
      "101110111010001" when "1100101", -- t[101] = -8751
      "101111100000101" when "1100110", -- t[102] = -8443
      "110000000111011" when "1100111", -- t[103] = -8133
      "110000101110011" when "1101000", -- t[104] = -7821
      "110001010101100" when "1101001", -- t[105] = -7508
      "110001111100111" when "1101010", -- t[106] = -7193
      "110010100100100" when "1101011", -- t[107] = -6876
      "110011001100010" when "1101100", -- t[108] = -6558
      "110011110100010" when "1101101", -- t[109] = -6238
      "110100011100100" when "1101110", -- t[110] = -5916
      "110101000101000" when "1101111", -- t[111] = -5592
      "110101101101110" when "1110000", -- t[112] = -5266
      "110110010110101" when "1110001", -- t[113] = -4939
      "110110111111110" when "1110010", -- t[114] = -4610
      "110111101001001" when "1110011", -- t[115] = -4279
      "111000010010101" when "1110100", -- t[116] = -3947
      "111000111100100" when "1110101", -- t[117] = -3612
      "111001100110100" when "1110110", -- t[118] = -3276
      "111010010000110" when "1110111", -- t[119] = -2938
      "111010111011010" when "1111000", -- t[120] = -2598
      "111011100101111" when "1111001", -- t[121] = -2257
      "111100010000111" when "1111010", -- t[122] = -1913
      "111100111100000" when "1111011", -- t[123] = -1568
      "111101100111100" when "1111100", -- t[124] = -1220
      "111110010011001" when "1111101", -- t[125] = -871
      "111110111111000" when "1111110", -- t[126] = -520
      "111111101011001" when "1111111", -- t[127] = -167
      "---------------" when others;
end architecture;


library ieee;
use ieee.std_logic_1164.all;

entity Exp2_MPT_12_to1 is
  port( x : in  std_logic_vector(5 downto 0);
        r : out std_logic_vector(7 downto 0) );
end entity;

architecture arch of Exp2_MPT_12_to1 is
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
      "01101001" when "101011", -- t[43] = 105
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

entity Exp2_MPT_12_to0 is
  port( x : in  std_logic_vector(5 downto 0);
        r : out std_logic_vector(5 downto 0) );
end entity;

architecture arch of Exp2_MPT_12_to0 is
begin
  with x select
    r <=
      "000010" when "000000", -- t[0] = 2
      "001000" when "000001", -- t[1] = 8
      "001110" when "000010", -- t[2] = 14
      "010011" when "000011", -- t[3] = 19
      "000010" when "000100", -- t[4] = 2
      "001000" when "000101", -- t[5] = 8
      "001110" when "000110", -- t[6] = 14
      "010100" when "000111", -- t[7] = 20
      "000011" when "001000", -- t[8] = 3
      "001001" when "001001", -- t[9] = 9
      "001111" when "001010", -- t[10] = 15
      "010101" when "001011", -- t[11] = 21
      "000011" when "001100", -- t[12] = 3
      "001001" when "001101", -- t[13] = 9
      "010000" when "001110", -- t[14] = 16
      "010110" when "001111", -- t[15] = 22
      "000011" when "010000", -- t[16] = 3
      "001010" when "010001", -- t[17] = 10
      "010000" when "010010", -- t[18] = 16
      "010111" when "010011", -- t[19] = 23
      "000011" when "010100", -- t[20] = 3
      "001010" when "010101", -- t[21] = 10
      "010001" when "010110", -- t[22] = 17
      "011000" when "010111", -- t[23] = 24
      "000011" when "011000", -- t[24] = 3
      "001011" when "011001", -- t[25] = 11
      "010010" when "011010", -- t[26] = 18
      "011001" when "011011", -- t[27] = 25
      "000011" when "011100", -- t[28] = 3
      "001011" when "011101", -- t[29] = 11
      "010011" when "011110", -- t[30] = 19
      "011010" when "011111", -- t[31] = 26
      "000100" when "100000", -- t[32] = 4
      "001100" when "100001", -- t[33] = 12
      "010100" when "100010", -- t[34] = 20
      "011100" when "100011", -- t[35] = 28
      "000100" when "100100", -- t[36] = 4
      "001100" when "100101", -- t[37] = 12
      "010100" when "100110", -- t[38] = 20
      "011101" when "100111", -- t[39] = 29
      "000100" when "101000", -- t[40] = 4
      "001101" when "101001", -- t[41] = 13
      "010101" when "101010", -- t[42] = 21
      "011110" when "101011", -- t[43] = 30
      "000100" when "101100", -- t[44] = 4
      "001101" when "101101", -- t[45] = 13
      "010110" when "101110", -- t[46] = 22
      "011111" when "101111", -- t[47] = 31
      "000100" when "110000", -- t[48] = 4
      "001110" when "110001", -- t[49] = 14
      "010111" when "110010", -- t[50] = 23
      "100001" when "110011", -- t[51] = 33
      "000100" when "110100", -- t[52] = 4
      "001110" when "110101", -- t[53] = 14
      "011000" when "110110", -- t[54] = 24
      "100010" when "110111", -- t[55] = 34
      "000101" when "111000", -- t[56] = 5
      "001111" when "111001", -- t[57] = 15
      "011001" when "111010", -- t[58] = 25
      "100100" when "111011", -- t[59] = 36
      "000101" when "111100", -- t[60] = 5
      "010000" when "111101", -- t[61] = 16
      "011011" when "111110", -- t[62] = 27
      "100101" when "111111", -- t[63] = 37
      "------" when others;
end architecture;


library ieee;
use ieee.std_logic_1164.all;
library fplib;
use fplib.pkg_Exp2_MPT_12.all;

entity Exp2_MPT_12_to1_xor is
  port( a : in  std_logic_vector(4 downto 0);
        b : in  std_logic_vector(1 downto 0);
        r : out std_logic_vector(14 downto 0) );
end entity;

architecture arch of Exp2_MPT_12_to1_xor is
  signal sign  : std_logic;
  signal in_t  : std_logic_vector(5 downto 0);
  signal out_t : std_logic_vector(7 downto 0);
begin
  sign <= not b(1);
  in_t(5 downto 1) <= a(4 downto 0);
  in_t(0) <= b(0) xor sign;

  inst_to1 : Exp2_MPT_12_to1
    port map( x => in_t,
              r => out_t );

  r(14 downto 8) <= (14 downto 8 => sign);
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
use fplib.pkg_Exp2_MPT_12.all;

entity Exp2_MPT_12_to0_xor is
  port( a : in  std_logic_vector(3 downto 0);
        b : in  std_logic_vector(2 downto 0);
        r : out std_logic_vector(14 downto 0) );
end entity;

architecture arch of Exp2_MPT_12_to0_xor is
  signal sign  : std_logic;
  signal in_t  : std_logic_vector(5 downto 0);
  signal out_t : std_logic_vector(5 downto 0);
begin
  sign <= not b(2);
  in_t(5 downto 2) <= a(3 downto 0);
  in_t(0) <= b(0) xor sign;
  in_t(1) <= b(1) xor sign;

  inst_to0 : Exp2_MPT_12_to0
    port map( x => in_t,
              r => out_t );

  r(14 downto 6) <= (14 downto 6 => sign);
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
use fplib.pkg_Exp2_MPT_12.all;

entity Exp2_MPT_12 is
  port( x : in  std_logic_vector(11 downto 0);
        r : out std_logic_vector(11 downto 0) );
end entity;

architecture arch of Exp2_MPT_12 is
  signal in_tiv  : std_logic_vector(6 downto 0);
  signal out_tiv : std_logic_vector(14 downto 0);
  signal a1      : std_logic_vector(4 downto 0);
  signal b1      : std_logic_vector(1 downto 0);
  signal out1    : std_logic_vector(14 downto 0);
  signal a0      : std_logic_vector(3 downto 0);
  signal b0      : std_logic_vector(2 downto 0);
  signal out0    : std_logic_vector(14 downto 0);
  signal sum     : std_logic_vector(14 downto 0);
begin
  in_tiv <= x(11 downto 5);
  inst_tiv : Exp2_MPT_12_tiv
    port map( x => in_tiv,
              r => out_tiv );

  a1 <= x(11 downto 7);
  b1 <= x(4 downto 3);
  inst_to1_xor : Exp2_MPT_12_to1_xor
    port map( a => a1,
              b => b1,
              r => out1 );

  a0 <= x(11 downto 8);
  b0 <= x(2 downto 0);
  inst_to0_xor : Exp2_MPT_12_to0_xor
    port map( a => a0,
              b => b0,
              r => out0 );


  sum <= out_tiv + out1 + out0;
  r <= sum(14 downto 3);
end architecture;
