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
-- wI = 11 bits
-- wO = 11 bits
-- Decomposition: 6, 5 / 5, 3 / 3, 2
-- Guard bits: 3
-- Size: 2000 = 14.2^6 + 8.2^7 + 5.2^4

library ieee;
use ieee.std_logic_1164.all;

package pkg_Log2_MPT_11 is
  component Log2_MPT_11_tiv is
    port( x : in  std_logic_vector(5 downto 0);
          r : out std_logic_vector(13 downto 0) );
  end component;

  component Log2_MPT_11_to1 is
    port( x : in  std_logic_vector(6 downto 0);
          r : out std_logic_vector(7 downto 0) );
  end component;

  component Log2_MPT_11_to0 is
    port( x : in  std_logic_vector(3 downto 0);
          r : out std_logic_vector(4 downto 0) );
  end component;

  component Log2_MPT_11_to1_xor is
    port( a : in  std_logic_vector(4 downto 0);
          b : in  std_logic_vector(2 downto 0);
          r : out std_logic_vector(13 downto 0) );
  end component;

  component Log2_MPT_11_to0_xor is
    port( a : in  std_logic_vector(2 downto 0);
          b : in  std_logic_vector(1 downto 0);
          r : out std_logic_vector(13 downto 0) );
  end component;
end package;


library ieee;
use ieee.std_logic_1164.all;

entity Log2_MPT_11_tiv is
  port( x : in  std_logic_vector(5 downto 0);
        r : out std_logic_vector(13 downto 0) );
end entity;

architecture arch of Log2_MPT_11_tiv is
begin
  with x select
    r <=
      "00000010110110" when "000000", -- t[0] = 182
      "00001000100010" when "000001", -- t[1] = 546
      "00001110001000" when "000010", -- t[2] = 904
      "00010011101001" when "000011", -- t[3] = 1257
      "00011001000101" when "000100", -- t[4] = 1605
      "00011110011011" when "000101", -- t[5] = 1947
      "00100011101101" when "000110", -- t[6] = 2285
      "00101000111010" when "000111", -- t[7] = 2618
      "00101110000010" when "001000", -- t[8] = 2946
      "00110011000110" when "001001", -- t[9] = 3270
      "00111000000110" when "001010", -- t[10] = 3590
      "00111101000001" when "001011", -- t[11] = 3905
      "01000001111000" when "001100", -- t[12] = 4216
      "01000110101011" when "001101", -- t[13] = 4523
      "01001011011010" when "001110", -- t[14] = 4826
      "01010000000101" when "001111", -- t[15] = 5125
      "01010100101101" when "010000", -- t[16] = 5421
      "01011001010001" when "010001", -- t[17] = 5713
      "01011101110001" when "010010", -- t[18] = 6001
      "01100010001110" when "010011", -- t[19] = 6286
      "01100110100111" when "010100", -- t[20] = 6567
      "01101010111101" when "010101", -- t[21] = 6845
      "01101111010000" when "010110", -- t[22] = 7120
      "01110011100000" when "010111", -- t[23] = 7392
      "01110111101101" when "011000", -- t[24] = 7661
      "01111011110110" when "011001", -- t[25] = 7926
      "01111111111101" when "011010", -- t[26] = 8189
      "10000100000001" when "011011", -- t[27] = 8449
      "10001000000010" when "011100", -- t[28] = 8706
      "10001100000000" when "011101", -- t[29] = 8960
      "10001111111011" when "011110", -- t[30] = 9211
      "10010011110100" when "011111", -- t[31] = 9460
      "10010111101010" when "100000", -- t[32] = 9706
      "10011011011110" when "100001", -- t[33] = 9950
      "10011111001111" when "100010", -- t[34] = 10191
      "10100010111110" when "100011", -- t[35] = 10430
      "10100110101010" when "100100", -- t[36] = 10666
      "10101010010100" when "100101", -- t[37] = 10900
      "10101101111100" when "100110", -- t[38] = 11132
      "10110001100010" when "100111", -- t[39] = 11362
      "10110101000101" when "101000", -- t[40] = 11589
      "10111000100110" when "101001", -- t[41] = 11814
      "10111100000101" when "101010", -- t[42] = 12037
      "10111111100010" when "101011", -- t[43] = 12258
      "11000010111101" when "101100", -- t[44] = 12477
      "11000110010110" when "101101", -- t[45] = 12694
      "11001001101100" when "101110", -- t[46] = 12908
      "11001101000001" when "101111", -- t[47] = 13121
      "11010000010100" when "110000", -- t[48] = 13332
      "11010011100110" when "110001", -- t[49] = 13542
      "11010110110101" when "110010", -- t[50] = 13749
      "11011010000010" when "110011", -- t[51] = 13954
      "11011101001110" when "110100", -- t[52] = 14158
      "11100000011000" when "110101", -- t[53] = 14360
      "11100011100001" when "110110", -- t[54] = 14561
      "11100110100111" when "110111", -- t[55] = 14759
      "11101001101100" when "111000", -- t[56] = 14956
      "11101100101111" when "111001", -- t[57] = 15151
      "11101111110001" when "111010", -- t[58] = 15345
      "11110010110001" when "111011", -- t[59] = 15537
      "11110101110000" when "111100", -- t[60] = 15728
      "11111000101101" when "111101", -- t[61] = 15917
      "11111011101001" when "111110", -- t[62] = 16105
      "11111110100011" when "111111", -- t[63] = 16291
      "--------------" when others;
end architecture;


library ieee;
use ieee.std_logic_1164.all;

entity Log2_MPT_11_to1 is
  port( x : in  std_logic_vector(6 downto 0);
        r : out std_logic_vector(7 downto 0) );
end entity;

architecture arch of Log2_MPT_11_to1 is
begin
  with x select
    r <=
      "00010110" when "0000000", -- t[0] = 22
      "01000100" when "0000001", -- t[1] = 68
      "01110001" when "0000010", -- t[2] = 113
      "10011111" when "0000011", -- t[3] = 159
      "00010110" when "0000100", -- t[4] = 22
      "01000010" when "0000101", -- t[5] = 66
      "01101110" when "0000110", -- t[6] = 110
      "10011010" when "0000111", -- t[7] = 154
      "00010101" when "0001000", -- t[8] = 21
      "01000000" when "0001001", -- t[9] = 64
      "01101011" when "0001010", -- t[10] = 107
      "10010110" when "0001011", -- t[11] = 150
      "00010100" when "0001100", -- t[12] = 20
      "00111110" when "0001101", -- t[13] = 62
      "01101000" when "0001110", -- t[14] = 104
      "10010001" when "0001111", -- t[15] = 145
      "00010100" when "0010000", -- t[16] = 20
      "00111100" when "0010001", -- t[17] = 60
      "01100101" when "0010010", -- t[18] = 101
      "10001101" when "0010011", -- t[19] = 141
      "00010011" when "0010100", -- t[20] = 19
      "00111011" when "0010101", -- t[21] = 59
      "01100010" when "0010110", -- t[22] = 98
      "10001001" when "0010111", -- t[23] = 137
      "00010011" when "0011000", -- t[24] = 19
      "00111001" when "0011001", -- t[25] = 57
      "01100000" when "0011010", -- t[26] = 96
      "10000110" when "0011011", -- t[27] = 134
      "00010010" when "0011100", -- t[28] = 18
      "00111000" when "0011101", -- t[29] = 56
      "01011101" when "0011110", -- t[30] = 93
      "10000010" when "0011111", -- t[31] = 130
      "00010010" when "0100000", -- t[32] = 18
      "00110110" when "0100001", -- t[33] = 54
      "01011011" when "0100010", -- t[34] = 91
      "01111111" when "0100011", -- t[35] = 127
      "00010001" when "0100100", -- t[36] = 17
      "00110101" when "0100101", -- t[37] = 53
      "01011001" when "0100110", -- t[38] = 89
      "01111100" when "0100111", -- t[39] = 124
      "00010001" when "0101000", -- t[40] = 17
      "00110100" when "0101001", -- t[41] = 52
      "01010110" when "0101010", -- t[42] = 86
      "01111001" when "0101011", -- t[43] = 121
      "00010000" when "0101100", -- t[44] = 16
      "00110010" when "0101101", -- t[45] = 50
      "01010100" when "0101110", -- t[46] = 84
      "01110110" when "0101111", -- t[47] = 118
      "00010000" when "0110000", -- t[48] = 16
      "00110001" when "0110001", -- t[49] = 49
      "01010011" when "0110010", -- t[50] = 83
      "01110100" when "0110011", -- t[51] = 116
      "00010000" when "0110100", -- t[52] = 16
      "00110000" when "0110101", -- t[53] = 48
      "01010001" when "0110110", -- t[54] = 81
      "01110001" when "0110111", -- t[55] = 113
      "00001111" when "0111000", -- t[56] = 15
      "00101111" when "0111001", -- t[57] = 47
      "01001111" when "0111010", -- t[58] = 79
      "01101111" when "0111011", -- t[59] = 111
      "00001111" when "0111100", -- t[60] = 15
      "00101110" when "0111101", -- t[61] = 46
      "01001101" when "0111110", -- t[62] = 77
      "01101100" when "0111111", -- t[63] = 108
      "00001111" when "1000000", -- t[64] = 15
      "00101101" when "1000001", -- t[65] = 45
      "01001100" when "1000010", -- t[66] = 76
      "01101010" when "1000011", -- t[67] = 106
      "00001110" when "1000100", -- t[68] = 14
      "00101100" when "1000101", -- t[69] = 44
      "01001010" when "1000110", -- t[70] = 74
      "01101000" when "1000111", -- t[71] = 104
      "00001110" when "1001000", -- t[72] = 14
      "00101011" when "1001001", -- t[73] = 43
      "01001001" when "1001010", -- t[74] = 73
      "01100110" when "1001011", -- t[75] = 102
      "00001110" when "1001100", -- t[76] = 14
      "00101011" when "1001101", -- t[77] = 43
      "01000111" when "1001110", -- t[78] = 71
      "01100100" when "1001111", -- t[79] = 100
      "00001110" when "1010000", -- t[80] = 14
      "00101010" when "1010001", -- t[81] = 42
      "01000110" when "1010010", -- t[82] = 70
      "01100010" when "1010011", -- t[83] = 98
      "00001101" when "1010100", -- t[84] = 13
      "00101001" when "1010101", -- t[85] = 41
      "01000101" when "1010110", -- t[86] = 69
      "01100000" when "1010111", -- t[87] = 96
      "00001101" when "1011000", -- t[88] = 13
      "00101000" when "1011001", -- t[89] = 40
      "01000011" when "1011010", -- t[90] = 67
      "01011110" when "1011011", -- t[91] = 94
      "00001101" when "1011100", -- t[92] = 13
      "00100111" when "1011101", -- t[93] = 39
      "01000010" when "1011110", -- t[94] = 66
      "01011101" when "1011111", -- t[95] = 93
      "00001101" when "1100000", -- t[96] = 13
      "00100111" when "1100001", -- t[97] = 39
      "01000001" when "1100010", -- t[98] = 65
      "01011011" when "1100011", -- t[99] = 91
      "00001100" when "1100100", -- t[100] = 12
      "00100110" when "1100101", -- t[101] = 38
      "01000000" when "1100110", -- t[102] = 64
      "01011001" when "1100111", -- t[103] = 89
      "00001100" when "1101000", -- t[104] = 12
      "00100101" when "1101001", -- t[105] = 37
      "00111111" when "1101010", -- t[106] = 63
      "01011000" when "1101011", -- t[107] = 88
      "00001100" when "1101100", -- t[108] = 12
      "00100101" when "1101101", -- t[109] = 37
      "00111110" when "1101110", -- t[110] = 62
      "01010110" when "1101111", -- t[111] = 86
      "00001100" when "1110000", -- t[112] = 12
      "00100100" when "1110001", -- t[113] = 36
      "00111101" when "1110010", -- t[114] = 61
      "01010101" when "1110011", -- t[115] = 85
      "00001100" when "1110100", -- t[116] = 12
      "00100100" when "1110101", -- t[117] = 36
      "00111100" when "1110110", -- t[118] = 60
      "01010100" when "1110111", -- t[119] = 84
      "00001011" when "1111000", -- t[120] = 11
      "00100011" when "1111001", -- t[121] = 35
      "00111011" when "1111010", -- t[122] = 59
      "01010010" when "1111011", -- t[123] = 82
      "00001011" when "1111100", -- t[124] = 11
      "00100010" when "1111101", -- t[125] = 34
      "00111010" when "1111110", -- t[126] = 58
      "01010001" when "1111111", -- t[127] = 81
      "--------" when others;
end architecture;


library ieee;
use ieee.std_logic_1164.all;

entity Log2_MPT_11_to0 is
  port( x : in  std_logic_vector(3 downto 0);
        r : out std_logic_vector(4 downto 0) );
end entity;

architecture arch of Log2_MPT_11_to0 is
begin
  with x select
    r <=
      "00101" when "0000", -- t[0] = 5
      "10000" when "0001", -- t[1] = 16
      "00100" when "0010", -- t[2] = 4
      "01110" when "0011", -- t[3] = 14
      "00100" when "0100", -- t[4] = 4
      "01101" when "0101", -- t[5] = 13
      "00100" when "0110", -- t[6] = 4
      "01100" when "0111", -- t[7] = 12
      "00011" when "1000", -- t[8] = 3
      "01011" when "1001", -- t[9] = 11
      "00011" when "1010", -- t[10] = 3
      "01010" when "1011", -- t[11] = 10
      "00011" when "1100", -- t[12] = 3
      "01001" when "1101", -- t[13] = 9
      "00010" when "1110", -- t[14] = 2
      "01000" when "1111", -- t[15] = 8
      "-----" when others;
end architecture;


library ieee;
use ieee.std_logic_1164.all;
library fplib;
use fplib.pkg_Log2_MPT_11.all;

entity Log2_MPT_11_to1_xor is
  port( a : in  std_logic_vector(4 downto 0);
        b : in  std_logic_vector(2 downto 0);
        r : out std_logic_vector(13 downto 0) );
end entity;

architecture arch of Log2_MPT_11_to1_xor is
  signal sign  : std_logic;
  signal in_t  : std_logic_vector(6 downto 0);
  signal out_t : std_logic_vector(7 downto 0);
begin
  sign <= not b(2);
  in_t(6 downto 2) <= a(4 downto 0);
  in_t(0) <= b(0) xor sign;
  in_t(1) <= b(1) xor sign;

  inst_to1 : Log2_MPT_11_to1
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
use fplib.pkg_Log2_MPT_11.all;

entity Log2_MPT_11_to0_xor is
  port( a : in  std_logic_vector(2 downto 0);
        b : in  std_logic_vector(1 downto 0);
        r : out std_logic_vector(13 downto 0) );
end entity;

architecture arch of Log2_MPT_11_to0_xor is
  signal sign  : std_logic;
  signal in_t  : std_logic_vector(3 downto 0);
  signal out_t : std_logic_vector(4 downto 0);
begin
  sign <= not b(1);
  in_t(3 downto 1) <= a(2 downto 0);
  in_t(0) <= b(0) xor sign;

  inst_to0 : Log2_MPT_11_to0
    port map( x => in_t,
              r => out_t );

  r(13 downto 5) <= (13 downto 5 => sign);
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
use fplib.pkg_Log2_MPT_11.all;

entity Log2_MPT_11 is
  port( x : in  std_logic_vector(10 downto 0);
        r : out std_logic_vector(10 downto 0) );
end entity;

architecture arch of Log2_MPT_11 is
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
  inst_tiv : Log2_MPT_11_tiv
    port map( x => in_tiv,
              r => out_tiv );

  a1 <= x(10 downto 6);
  b1 <= x(4 downto 2);
  inst_to1_xor : Log2_MPT_11_to1_xor
    port map( a => a1,
              b => b1,
              r => out1 );

  a0 <= x(10 downto 8);
  b0 <= x(1 downto 0);
  inst_to0_xor : Log2_MPT_11_to0_xor
    port map( a => a0,
              b => b0,
              r => out0 );


  sum <= out_tiv + out1 + out0;
  r <= sum(13 downto 3);
end architecture;
