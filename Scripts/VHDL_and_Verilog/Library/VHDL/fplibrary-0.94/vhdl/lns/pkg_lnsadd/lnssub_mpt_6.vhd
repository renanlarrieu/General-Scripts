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


-- Implementation of MultiPartiteSubtracter object for LNS arithmetic in base 2.0 with 8-bit integer part and 6-bit fractional part
-- wI = 9 bits
-- wO = 9 bits

library ieee;
use ieee.std_logic_1164.all;

package pkg_lnssub_mpt_6 is
  component LNSSub_MPT_T1_6 is
    port( x : in  std_logic_vector(7 downto 0);
          r : out std_logic_vector(2 downto 0) );
  end component;

  component LNSSub_MPT_T2_6 is
    port( x : in  std_logic_vector(6 downto 0);
          r : out std_logic_vector(4 downto 0) );
  end component;

  component LNSSub_MPT_T3_6 is
    port( x : in  std_logic_vector(5 downto 0);
          r : out std_logic_vector(4 downto 0) );
  end component;

  component LNSSub_MPT_T4_6 is
    port( x : in  std_logic_vector(4 downto 0);
          r : out std_logic_vector(4 downto 0) );
  end component;

  component LNSSub_MPT_T5_6 is
    port( x : in  std_logic_vector(3 downto 0);
          r : out std_logic_vector(4 downto 0) );
  end component;

  component LNSSub_MPT_T6_6 is
    port( x : in  std_logic_vector(2 downto 0);
          r : out std_logic_vector(4 downto 0) );
  end component;

  component LNSSub_MPT_T7_6 is
    port( x : in  std_logic_vector(2 downto 0);
          r : out std_logic_vector(4 downto 0) );
  end component;
end package;


-- MultiPartite: LNS subtraction function: [-7.999999999999998 -4.0[ -> [0.0 0.12500000000000003[
-- wI = 8 bits
-- wO = 3 bits
-- Decomposition: 5, 3 / 4 / 3
-- Guard bits: 1
-- Size: 192 = 4.2^5 + 1.2^6

library ieee;
use ieee.std_logic_1164.all;

package pkg_LNSSub_MPT_T1_6 is
  component LNSSub_MPT_T1_6_tiv is
    port( x : in  std_logic_vector(4 downto 0);
          r : out std_logic_vector(3 downto 0) );
  end component;

  component LNSSub_MPT_T1_6_to0 is
    port( x : in  std_logic_vector(5 downto 0);
          r : out std_logic_vector(0 downto 0) );
  end component;

  component LNSSub_MPT_T1_6_to0_xor is
    port( a : in  std_logic_vector(3 downto 0);
          b : in  std_logic_vector(2 downto 0);
          r : out std_logic_vector(3 downto 0) );
  end component;
end package;


library ieee;
use ieee.std_logic_1164.all;

entity LNSSub_MPT_T1_6_tiv is
  port( x : in  std_logic_vector(4 downto 0);
        r : out std_logic_vector(3 downto 0) );
end entity;

architecture arch of LNSSub_MPT_T1_6_tiv is
begin
  with x select
    r <=
      "0010" when "00000", -- t[0] = 2
      "0010" when "00001", -- t[1] = 2
      "0010" when "00010", -- t[2] = 2
      "0010" when "00011", -- t[3] = 2
      "0010" when "00100", -- t[4] = 2
      "0010" when "00101", -- t[5] = 2
      "0010" when "00110", -- t[6] = 2
      "0010" when "00111", -- t[7] = 2
      "0011" when "01000", -- t[8] = 3
      "0011" when "01001", -- t[9] = 3
      "0011" when "01010", -- t[10] = 3
      "0011" when "01011", -- t[11] = 3
      "0011" when "01100", -- t[12] = 3
      "0011" when "01101", -- t[13] = 3
      "0100" when "01110", -- t[14] = 4
      "0100" when "01111", -- t[15] = 4
      "0100" when "10000", -- t[16] = 4
      "0100" when "10001", -- t[17] = 4
      "0101" when "10010", -- t[18] = 5
      "0101" when "10011", -- t[19] = 5
      "0101" when "10100", -- t[20] = 5
      "0110" when "10101", -- t[21] = 6
      "0110" when "10110", -- t[22] = 6
      "0111" when "10111", -- t[23] = 7
      "0111" when "11000", -- t[24] = 7
      "1000" when "11001", -- t[25] = 8
      "1000" when "11010", -- t[26] = 8
      "1001" when "11011", -- t[27] = 9
      "1010" when "11100", -- t[28] = 10
      "1010" when "11101", -- t[29] = 10
      "1011" when "11110", -- t[30] = 11
      "1100" when "11111", -- t[31] = 12
      "----" when others;
end architecture;


library ieee;
use ieee.std_logic_1164.all;

entity LNSSub_MPT_T1_6_to0 is
  port( x : in  std_logic_vector(5 downto 0);
        r : out std_logic_vector(0 downto 0) );
end entity;

architecture arch of LNSSub_MPT_T1_6_to0 is
begin
  with x select
    r <=
      "0" when "000000", -- t[0] = 0
      "0" when "000001", -- t[1] = 0
      "0" when "000010", -- t[2] = 0
      "0" when "000011", -- t[3] = 0
      "0" when "000100", -- t[4] = 0
      "0" when "000101", -- t[5] = 0
      "0" when "000110", -- t[6] = 0
      "0" when "000111", -- t[7] = 0
      "0" when "001000", -- t[8] = 0
      "0" when "001001", -- t[9] = 0
      "0" when "001010", -- t[10] = 0
      "0" when "001011", -- t[11] = 0
      "0" when "001100", -- t[12] = 0
      "0" when "001101", -- t[13] = 0
      "0" when "001110", -- t[14] = 0
      "0" when "001111", -- t[15] = 0
      "0" when "010000", -- t[16] = 0
      "0" when "010001", -- t[17] = 0
      "0" when "010010", -- t[18] = 0
      "0" when "010011", -- t[19] = 0
      "0" when "010100", -- t[20] = 0
      "0" when "010101", -- t[21] = 0
      "0" when "010110", -- t[22] = 0
      "0" when "010111", -- t[23] = 0
      "0" when "011000", -- t[24] = 0
      "0" when "011001", -- t[25] = 0
      "0" when "011010", -- t[26] = 0
      "0" when "011011", -- t[27] = 0
      "0" when "011100", -- t[28] = 0
      "0" when "011101", -- t[29] = 0
      "0" when "011110", -- t[30] = 0
      "0" when "011111", -- t[31] = 0
      "0" when "100000", -- t[32] = 0
      "0" when "100001", -- t[33] = 0
      "0" when "100010", -- t[34] = 0
      "0" when "100011", -- t[35] = 0
      "0" when "100100", -- t[36] = 0
      "0" when "100101", -- t[37] = 0
      "0" when "100110", -- t[38] = 0
      "0" when "100111", -- t[39] = 0
      "0" when "101000", -- t[40] = 0
      "0" when "101001", -- t[41] = 0
      "0" when "101010", -- t[42] = 0
      "0" when "101011", -- t[43] = 0
      "0" when "101100", -- t[44] = 0
      "0" when "101101", -- t[45] = 0
      "0" when "101110", -- t[46] = 0
      "0" when "101111", -- t[47] = 0
      "0" when "110000", -- t[48] = 0
      "0" when "110001", -- t[49] = 0
      "0" when "110010", -- t[50] = 0
      "0" when "110011", -- t[51] = 0
      "0" when "110100", -- t[52] = 0
      "0" when "110101", -- t[53] = 0
      "0" when "110110", -- t[54] = 0
      "0" when "110111", -- t[55] = 0
      "0" when "111000", -- t[56] = 0
      "0" when "111001", -- t[57] = 0
      "0" when "111010", -- t[58] = 0
      "0" when "111011", -- t[59] = 0
      "0" when "111100", -- t[60] = 0
      "0" when "111101", -- t[61] = 0
      "0" when "111110", -- t[62] = 0
      "0" when "111111", -- t[63] = 0
      "-" when others;
end architecture;


library ieee;
use ieee.std_logic_1164.all;
library fplib;
use fplib.pkg_LNSSub_MPT_T1_6.all;

entity LNSSub_MPT_T1_6_to0_xor is
  port( a : in  std_logic_vector(3 downto 0);
        b : in  std_logic_vector(2 downto 0);
        r : out std_logic_vector(3 downto 0) );
end entity;

architecture arch of LNSSub_MPT_T1_6_to0_xor is
  signal sign  : std_logic;
  signal in_t  : std_logic_vector(5 downto 0);
  signal out_t : std_logic_vector(0 downto 0);
begin
  sign <= not b(2);
  in_t(5 downto 2) <= a(3 downto 0);
  in_t(0) <= b(0) xor sign;
  in_t(1) <= b(1) xor sign;

  inst_to0 : LNSSub_MPT_T1_6_to0
    port map( x => in_t,
              r => out_t );

  r(3 downto 1) <= (3 downto 1 => sign);
  r(0) <= out_t(0) xor sign;
end architecture;


library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library fplib;
use fplib.pkg_LNSSub_MPT_T1_6.all;

entity LNSSub_MPT_T1_6 is
  port( x : in  std_logic_vector(7 downto 0);
        r : out std_logic_vector(2 downto 0) );
end entity;

architecture arch of LNSSub_MPT_T1_6 is
  signal in_tiv  : std_logic_vector(4 downto 0);
  signal out_tiv : std_logic_vector(3 downto 0);
  signal a0      : std_logic_vector(3 downto 0);
  signal b0      : std_logic_vector(2 downto 0);
  signal out0    : std_logic_vector(3 downto 0);
  signal sum     : std_logic_vector(3 downto 0);
begin
  in_tiv <= x(7 downto 3);
  inst_tiv : LNSSub_MPT_T1_6_tiv
    port map( x => in_tiv,
              r => out_tiv );

  a0 <= x(7 downto 4);
  b0 <= x(2 downto 0);
  inst_to0_xor : LNSSub_MPT_T1_6_to0_xor
    port map( a => a0,
              b => b0,
              r => out0 );


  sum <= out_tiv + out0;
  r <= sum(3 downto 1);
end architecture;


-- MultiPartite: LNS subtraction function: [-4.0 -2.0[ -> [0.0 0.5[
-- wI = 7 bits
-- wO = 5 bits
-- Decomposition: 4, 3 / 3 / 3
-- Guard bits: 0
-- Size: 112 = 5.2^4 + 1.2^5

library ieee;
use ieee.std_logic_1164.all;

package pkg_LNSSub_MPT_T2_6 is
  component LNSSub_MPT_T2_6_tiv is
    port( x : in  std_logic_vector(3 downto 0);
          r : out std_logic_vector(4 downto 0) );
  end component;

  component LNSSub_MPT_T2_6_to0 is
    port( x : in  std_logic_vector(4 downto 0);
          r : out std_logic_vector(0 downto 0) );
  end component;

  component LNSSub_MPT_T2_6_to0_xor is
    port( a : in  std_logic_vector(2 downto 0);
          b : in  std_logic_vector(2 downto 0);
          r : out std_logic_vector(4 downto 0) );
  end component;
end package;


library ieee;
use ieee.std_logic_1164.all;

entity LNSSub_MPT_T2_6_tiv is
  port( x : in  std_logic_vector(3 downto 0);
        r : out std_logic_vector(4 downto 0) );
end entity;

architecture arch of LNSSub_MPT_T2_6_tiv is
begin
  with x select
    r <=
      "00111" when "0000", -- t[0] = 7
      "00111" when "0001", -- t[1] = 7
      "01000" when "0010", -- t[2] = 8
      "01001" when "0011", -- t[3] = 9
      "01001" when "0100", -- t[4] = 9
      "01010" when "0101", -- t[5] = 10
      "01011" when "0110", -- t[6] = 11
      "01100" when "0111", -- t[7] = 12
      "01101" when "1000", -- t[8] = 13
      "01111" when "1001", -- t[9] = 15
      "10000" when "1010", -- t[10] = 16
      "10010" when "1011", -- t[11] = 18
      "10011" when "1100", -- t[12] = 19
      "10101" when "1101", -- t[13] = 21
      "10111" when "1110", -- t[14] = 23
      "11010" when "1111", -- t[15] = 26
      "-----" when others;
end architecture;


library ieee;
use ieee.std_logic_1164.all;

entity LNSSub_MPT_T2_6_to0 is
  port( x : in  std_logic_vector(4 downto 0);
        r : out std_logic_vector(0 downto 0) );
end entity;

architecture arch of LNSSub_MPT_T2_6_to0 is
begin
  with x select
    r <=
      "0" when "00000", -- t[0] = 0
      "0" when "00001", -- t[1] = 0
      "0" when "00010", -- t[2] = 0
      "0" when "00011", -- t[3] = 0
      "0" when "00100", -- t[4] = 0
      "0" when "00101", -- t[5] = 0
      "0" when "00110", -- t[6] = 0
      "0" when "00111", -- t[7] = 0
      "0" when "01000", -- t[8] = 0
      "0" when "01001", -- t[9] = 0
      "0" when "01010", -- t[10] = 0
      "0" when "01011", -- t[11] = 0
      "0" when "01100", -- t[12] = 0
      "0" when "01101", -- t[13] = 0
      "0" when "01110", -- t[14] = 0
      "0" when "01111", -- t[15] = 0
      "0" when "10000", -- t[16] = 0
      "0" when "10001", -- t[17] = 0
      "0" when "10010", -- t[18] = 0
      "0" when "10011", -- t[19] = 0
      "0" when "10100", -- t[20] = 0
      "0" when "10101", -- t[21] = 0
      "0" when "10110", -- t[22] = 0
      "0" when "10111", -- t[23] = 0
      "0" when "11000", -- t[24] = 0
      "0" when "11001", -- t[25] = 0
      "0" when "11010", -- t[26] = 0
      "0" when "11011", -- t[27] = 0
      "0" when "11100", -- t[28] = 0
      "0" when "11101", -- t[29] = 0
      "0" when "11110", -- t[30] = 0
      "1" when "11111", -- t[31] = 1
      "-" when others;
end architecture;


library ieee;
use ieee.std_logic_1164.all;
library fplib;
use fplib.pkg_LNSSub_MPT_T2_6.all;

entity LNSSub_MPT_T2_6_to0_xor is
  port( a : in  std_logic_vector(2 downto 0);
        b : in  std_logic_vector(2 downto 0);
        r : out std_logic_vector(4 downto 0) );
end entity;

architecture arch of LNSSub_MPT_T2_6_to0_xor is
  signal sign  : std_logic;
  signal in_t  : std_logic_vector(4 downto 0);
  signal out_t : std_logic_vector(0 downto 0);
begin
  sign <= not b(2);
  in_t(4 downto 2) <= a(2 downto 0);
  in_t(0) <= b(0) xor sign;
  in_t(1) <= b(1) xor sign;

  inst_to0 : LNSSub_MPT_T2_6_to0
    port map( x => in_t,
              r => out_t );

  r(4 downto 1) <= (4 downto 1 => sign);
  r(0) <= out_t(0) xor sign;
end architecture;


library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library fplib;
use fplib.pkg_LNSSub_MPT_T2_6.all;

entity LNSSub_MPT_T2_6 is
  port( x : in  std_logic_vector(6 downto 0);
        r : out std_logic_vector(4 downto 0) );
end entity;

architecture arch of LNSSub_MPT_T2_6 is
  signal in_tiv  : std_logic_vector(3 downto 0);
  signal out_tiv : std_logic_vector(4 downto 0);
  signal a0      : std_logic_vector(2 downto 0);
  signal b0      : std_logic_vector(2 downto 0);
  signal out0    : std_logic_vector(4 downto 0);
  signal sum     : std_logic_vector(4 downto 0);
begin
  in_tiv <= x(6 downto 3);
  inst_tiv : LNSSub_MPT_T2_6_tiv
    port map( x => in_tiv,
              r => out_tiv );

  a0 <= x(6 downto 4);
  b0 <= x(2 downto 0);
  inst_to0_xor : LNSSub_MPT_T2_6_to0_xor
    port map( a => a0,
              b => b0,
              r => out0 );


  sum <= out_tiv + out0;
  r <= sum(4 downto 0);
end architecture;


-- MultiPartite: LNS subtraction function: [-2.0 -1.0[ -> [0.0 1.0[
-- wI = 6 bits
-- wO = 5 bits
-- Decomposition: 3, 3 / 2 / 3
-- Guard bits: 1
-- Size: 80 = 6.2^3 + 2.2^4

library ieee;
use ieee.std_logic_1164.all;

package pkg_LNSSub_MPT_T3_6 is
  component LNSSub_MPT_T3_6_tiv is
    port( x : in  std_logic_vector(2 downto 0);
          r : out std_logic_vector(5 downto 0) );
  end component;

  component LNSSub_MPT_T3_6_to0 is
    port( x : in  std_logic_vector(3 downto 0);
          r : out std_logic_vector(1 downto 0) );
  end component;

  component LNSSub_MPT_T3_6_to0_xor is
    port( a : in  std_logic_vector(1 downto 0);
          b : in  std_logic_vector(2 downto 0);
          r : out std_logic_vector(5 downto 0) );
  end component;
end package;


library ieee;
use ieee.std_logic_1164.all;

entity LNSSub_MPT_T3_6_tiv is
  port( x : in  std_logic_vector(2 downto 0);
        r : out std_logic_vector(5 downto 0) );
end entity;

architecture arch of LNSSub_MPT_T3_6_tiv is
begin
  with x select
    r <=
      "011101" when "000", -- t[0] = 29
      "100000" when "001", -- t[1] = 32
      "100011" when "010", -- t[2] = 35
      "100111" when "011", -- t[3] = 39
      "101011" when "100", -- t[4] = 43
      "110000" when "101", -- t[5] = 48
      "110110" when "110", -- t[6] = 54
      "111101" when "111", -- t[7] = 61
      "------" when others;
end architecture;


library ieee;
use ieee.std_logic_1164.all;

entity LNSSub_MPT_T3_6_to0 is
  port( x : in  std_logic_vector(3 downto 0);
        r : out std_logic_vector(1 downto 0) );
end entity;

architecture arch of LNSSub_MPT_T3_6_to0 is
begin
  with x select
    r <=
      "00" when "0000", -- t[0] = 0
      "00" when "0001", -- t[1] = 0
      "00" when "0010", -- t[2] = 0
      "01" when "0011", -- t[3] = 1
      "00" when "0100", -- t[4] = 0
      "00" when "0101", -- t[5] = 0
      "01" when "0110", -- t[6] = 1
      "01" when "0111", -- t[7] = 1
      "00" when "1000", -- t[8] = 0
      "00" when "1001", -- t[9] = 0
      "01" when "1010", -- t[10] = 1
      "10" when "1011", -- t[11] = 2
      "00" when "1100", -- t[12] = 0
      "01" when "1101", -- t[13] = 1
      "10" when "1110", -- t[14] = 2
      "10" when "1111", -- t[15] = 2
      "--" when others;
end architecture;


library ieee;
use ieee.std_logic_1164.all;
library fplib;
use fplib.pkg_LNSSub_MPT_T3_6.all;

entity LNSSub_MPT_T3_6_to0_xor is
  port( a : in  std_logic_vector(1 downto 0);
        b : in  std_logic_vector(2 downto 0);
        r : out std_logic_vector(5 downto 0) );
end entity;

architecture arch of LNSSub_MPT_T3_6_to0_xor is
  signal sign  : std_logic;
  signal in_t  : std_logic_vector(3 downto 0);
  signal out_t : std_logic_vector(1 downto 0);
begin
  sign <= not b(2);
  in_t(3 downto 2) <= a(1 downto 0);
  in_t(0) <= b(0) xor sign;
  in_t(1) <= b(1) xor sign;

  inst_to0 : LNSSub_MPT_T3_6_to0
    port map( x => in_t,
              r => out_t );

  r(5 downto 2) <= (5 downto 2 => sign);
  r(0) <= out_t(0) xor sign;
  r(1) <= out_t(1) xor sign;
end architecture;


library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library fplib;
use fplib.pkg_LNSSub_MPT_T3_6.all;

entity LNSSub_MPT_T3_6 is
  port( x : in  std_logic_vector(5 downto 0);
        r : out std_logic_vector(4 downto 0) );
end entity;

architecture arch of LNSSub_MPT_T3_6 is
  signal in_tiv  : std_logic_vector(2 downto 0);
  signal out_tiv : std_logic_vector(5 downto 0);
  signal a0      : std_logic_vector(1 downto 0);
  signal b0      : std_logic_vector(2 downto 0);
  signal out0    : std_logic_vector(5 downto 0);
  signal sum     : std_logic_vector(5 downto 0);
begin
  in_tiv <= x(5 downto 3);
  inst_tiv : LNSSub_MPT_T3_6_tiv
    port map( x => in_tiv,
              r => out_tiv );

  a0 <= x(5 downto 4);
  b0 <= x(2 downto 0);
  inst_to0_xor : LNSSub_MPT_T3_6_to0_xor
    port map( a => a0,
              b => b0,
              r => out0 );


  sum <= out_tiv + out0;
  r <= sum(5 downto 1);
end architecture;


-- MultiPartite: LNS subtraction function: [-1.0 -0.5[ -> [0.0 2.0[
-- wI = 5 bits
-- wO = 5 bits
-- Decomposition: 2, 3 / 1 / 3
-- Guard bits: 1
-- Size: 40 = 6.2^2 + 2.2^3

library ieee;
use ieee.std_logic_1164.all;

package pkg_LNSSub_MPT_T4_6 is
  component LNSSub_MPT_T4_6_tiv is
    port( x : in  std_logic_vector(1 downto 0);
          r : out std_logic_vector(5 downto 0) );
  end component;

  component LNSSub_MPT_T4_6_to0 is
    port( x : in  std_logic_vector(2 downto 0);
          r : out std_logic_vector(1 downto 0) );
  end component;

  component LNSSub_MPT_T4_6_to0_xor is
    port( a : in  std_logic_vector(0 downto 0);
          b : in  std_logic_vector(2 downto 0);
          r : out std_logic_vector(5 downto 0) );
  end component;
end package;


library ieee;
use ieee.std_logic_1164.all;

entity LNSSub_MPT_T4_6_tiv is
  port( x : in  std_logic_vector(1 downto 0);
        r : out std_logic_vector(5 downto 0) );
end entity;

architecture arch of LNSSub_MPT_T4_6_tiv is
begin
  with x select
    r <=
      "100011" when "00", -- t[0] = 35
      "101000" when "01", -- t[1] = 40
      "101110" when "10", -- t[2] = 46
      "110101" when "11", -- t[3] = 53
      "------" when others;
end architecture;


library ieee;
use ieee.std_logic_1164.all;

entity LNSSub_MPT_T4_6_to0 is
  port( x : in  std_logic_vector(2 downto 0);
        r : out std_logic_vector(1 downto 0) );
end entity;

architecture arch of LNSSub_MPT_T4_6_to0 is
begin
  with x select
    r <=
      "00" when "000", -- t[0] = 0
      "00" when "001", -- t[1] = 0
      "01" when "010", -- t[2] = 1
      "10" when "011", -- t[3] = 2
      "00" when "100", -- t[4] = 0
      "01" when "101", -- t[5] = 1
      "10" when "110", -- t[6] = 2
      "11" when "111", -- t[7] = 3
      "--" when others;
end architecture;


library ieee;
use ieee.std_logic_1164.all;
library fplib;
use fplib.pkg_LNSSub_MPT_T4_6.all;

entity LNSSub_MPT_T4_6_to0_xor is
  port( a : in  std_logic_vector(0 downto 0);
        b : in  std_logic_vector(2 downto 0);
        r : out std_logic_vector(5 downto 0) );
end entity;

architecture arch of LNSSub_MPT_T4_6_to0_xor is
  signal sign  : std_logic;
  signal in_t  : std_logic_vector(2 downto 0);
  signal out_t : std_logic_vector(1 downto 0);
begin
  sign <= not b(2);
  in_t(2 downto 2) <= a(0 downto 0);
  in_t(0) <= b(0) xor sign;
  in_t(1) <= b(1) xor sign;

  inst_to0 : LNSSub_MPT_T4_6_to0
    port map( x => in_t,
              r => out_t );

  r(5 downto 2) <= (5 downto 2 => sign);
  r(0) <= out_t(0) xor sign;
  r(1) <= out_t(1) xor sign;
end architecture;


library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library fplib;
use fplib.pkg_LNSSub_MPT_T4_6.all;

entity LNSSub_MPT_T4_6 is
  port( x : in  std_logic_vector(4 downto 0);
        r : out std_logic_vector(4 downto 0) );
end entity;

architecture arch of LNSSub_MPT_T4_6 is
  signal in_tiv  : std_logic_vector(1 downto 0);
  signal out_tiv : std_logic_vector(5 downto 0);
  signal a0      : std_logic_vector(0 downto 0);
  signal b0      : std_logic_vector(2 downto 0);
  signal out0    : std_logic_vector(5 downto 0);
  signal sum     : std_logic_vector(5 downto 0);
begin
  in_tiv <= x(4 downto 3);
  inst_tiv : LNSSub_MPT_T4_6_tiv
    port map( x => in_tiv,
              r => out_tiv );

  a0 <= x(4 downto 4);
  b0 <= x(2 downto 0);
  inst_to0_xor : LNSSub_MPT_T4_6_to0_xor
    port map( a => a0,
              b => b0,
              r => out0 );


  sum <= out_tiv + out0;
  r <= sum(5 downto 1);
end architecture;


-- MultiPartite: LNS subtraction function: [-0.5 -0.25[ -> [0.0 4.0[
-- wI = 4 bits
-- wO = 5 bits
-- Decomposition: 1, 3 / 1 / 3
-- Guard bits: 0
-- Size: 18 = 5.2^1 + 1.2^3

library ieee;
use ieee.std_logic_1164.all;

package pkg_LNSSub_MPT_T5_6 is
  component LNSSub_MPT_T5_6_tiv is
    port( x : in  std_logic_vector(0 downto 0);
          r : out std_logic_vector(4 downto 0) );
  end component;

  component LNSSub_MPT_T5_6_to0 is
    port( x : in  std_logic_vector(2 downto 0);
          r : out std_logic_vector(0 downto 0) );
  end component;

  component LNSSub_MPT_T5_6_to0_xor is
    port( a : in  std_logic_vector(0 downto 0);
          b : in  std_logic_vector(2 downto 0);
          r : out std_logic_vector(4 downto 0) );
  end component;
end package;


library ieee;
use ieee.std_logic_1164.all;

entity LNSSub_MPT_T5_6_tiv is
  port( x : in  std_logic_vector(0 downto 0);
        r : out std_logic_vector(4 downto 0) );
end entity;

architecture arch of LNSSub_MPT_T5_6_tiv is
begin
  with x select
    r <=
      "10000" when "0", -- t[0] = 16
      "10011" when "1", -- t[1] = 19
      "-----" when others;
end architecture;


library ieee;
use ieee.std_logic_1164.all;

entity LNSSub_MPT_T5_6_to0 is
  port( x : in  std_logic_vector(2 downto 0);
        r : out std_logic_vector(0 downto 0) );
end entity;

architecture arch of LNSSub_MPT_T5_6_to0 is
begin
  with x select
    r <=
      "0" when "000", -- t[0] = 0
      "0" when "001", -- t[1] = 0
      "0" when "010", -- t[2] = 0
      "1" when "011", -- t[3] = 1
      "0" when "100", -- t[4] = 0
      "0" when "101", -- t[5] = 0
      "1" when "110", -- t[6] = 1
      "1" when "111", -- t[7] = 1
      "-" when others;
end architecture;


library ieee;
use ieee.std_logic_1164.all;
library fplib;
use fplib.pkg_LNSSub_MPT_T5_6.all;

entity LNSSub_MPT_T5_6_to0_xor is
  port( a : in  std_logic_vector(0 downto 0);
        b : in  std_logic_vector(2 downto 0);
        r : out std_logic_vector(4 downto 0) );
end entity;

architecture arch of LNSSub_MPT_T5_6_to0_xor is
  signal sign  : std_logic;
  signal in_t  : std_logic_vector(2 downto 0);
  signal out_t : std_logic_vector(0 downto 0);
begin
  sign <= not b(2);
  in_t(2 downto 2) <= a(0 downto 0);
  in_t(0) <= b(0) xor sign;
  in_t(1) <= b(1) xor sign;

  inst_to0 : LNSSub_MPT_T5_6_to0
    port map( x => in_t,
              r => out_t );

  r(4 downto 1) <= (4 downto 1 => sign);
  r(0) <= out_t(0) xor sign;
end architecture;


library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library fplib;
use fplib.pkg_LNSSub_MPT_T5_6.all;

entity LNSSub_MPT_T5_6 is
  port( x : in  std_logic_vector(3 downto 0);
        r : out std_logic_vector(4 downto 0) );
end entity;

architecture arch of LNSSub_MPT_T5_6 is
  signal in_tiv  : std_logic_vector(0 downto 0);
  signal out_tiv : std_logic_vector(4 downto 0);
  signal a0      : std_logic_vector(0 downto 0);
  signal b0      : std_logic_vector(2 downto 0);
  signal out0    : std_logic_vector(4 downto 0);
  signal sum     : std_logic_vector(4 downto 0);
begin
  in_tiv <= x(3 downto 3);
  inst_tiv : LNSSub_MPT_T5_6_tiv
    port map( x => in_tiv,
              r => out_tiv );

  a0 <= x(3 downto 3);
  b0 <= x(2 downto 0);
  inst_to0_xor : LNSSub_MPT_T5_6_to0_xor
    port map( a => a0,
              b => b0,
              r => out0 );


  sum <= out_tiv + out0;
  r <= sum(4 downto 0);
end architecture;


-- MultiPartite: LNS subtraction function: [-0.25 -0.12500000000000003[ -> [0.0 4.0[
-- wI = 3 bits
-- wO = 5 bits
-- Decomposition: 1, 2 / 0 / 2
-- Guard bits: 0
-- Size: 12 = 5.2^1 + 1.2^1

library ieee;
use ieee.std_logic_1164.all;

package pkg_LNSSub_MPT_T6_6 is
  component LNSSub_MPT_T6_6_tiv is
    port( x : in  std_logic_vector(0 downto 0);
          r : out std_logic_vector(4 downto 0) );
  end component;

  component LNSSub_MPT_T6_6_to0 is
    port( x : in  std_logic_vector(0 downto 0);
          r : out std_logic_vector(0 downto 0) );
  end component;

  component LNSSub_MPT_T6_6_to0_xor is
    port( b : in  std_logic_vector(1 downto 0);
          r : out std_logic_vector(4 downto 0) );
  end component;
end package;


library ieee;
use ieee.std_logic_1164.all;

entity LNSSub_MPT_T6_6_tiv is
  port( x : in  std_logic_vector(0 downto 0);
        r : out std_logic_vector(4 downto 0) );
end entity;

architecture arch of LNSSub_MPT_T6_6_tiv is
begin
  with x select
    r <=
      "10111" when "0", -- t[0] = 23
      "11010" when "1", -- t[1] = 26
      "-----" when others;
end architecture;


library ieee;
use ieee.std_logic_1164.all;

entity LNSSub_MPT_T6_6_to0 is
  port( x : in  std_logic_vector(0 downto 0);
        r : out std_logic_vector(0 downto 0) );
end entity;

architecture arch of LNSSub_MPT_T6_6_to0 is
begin
  with x select
    r <=
      "0" when "0", -- t[0] = 0
      "1" when "1", -- t[1] = 1
      "-" when others;
end architecture;


library ieee;
use ieee.std_logic_1164.all;
library fplib;
use fplib.pkg_LNSSub_MPT_T6_6.all;

entity LNSSub_MPT_T6_6_to0_xor is
  port( b : in  std_logic_vector(1 downto 0);
        r : out std_logic_vector(4 downto 0) );
end entity;

architecture arch of LNSSub_MPT_T6_6_to0_xor is
  signal sign  : std_logic;
  signal in_t  : std_logic_vector(0 downto 0);
  signal out_t : std_logic_vector(0 downto 0);
begin
  sign <= not b(1);
  in_t(0) <= b(0) xor sign;

  inst_to0 : LNSSub_MPT_T6_6_to0
    port map( x => in_t,
              r => out_t );

  r(4 downto 1) <= (4 downto 1 => sign);
  r(0) <= out_t(0) xor sign;
end architecture;


library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library fplib;
use fplib.pkg_LNSSub_MPT_T6_6.all;

entity LNSSub_MPT_T6_6 is
  port( x : in  std_logic_vector(2 downto 0);
        r : out std_logic_vector(4 downto 0) );
end entity;

architecture arch of LNSSub_MPT_T6_6 is
  signal in_tiv  : std_logic_vector(0 downto 0);
  signal out_tiv : std_logic_vector(4 downto 0);
  signal b0      : std_logic_vector(1 downto 0);
  signal out0    : std_logic_vector(4 downto 0);
  signal sum     : std_logic_vector(4 downto 0);
begin
  in_tiv <= x(2 downto 2);
  inst_tiv : LNSSub_MPT_T6_6_tiv
    port map( x => in_tiv,
              r => out_tiv );

  b0 <= x(1 downto 0);
  inst_to0_xor : LNSSub_MPT_T6_6_to0_xor
    port map( b => b0,
              r => out0 );


  sum <= out_tiv + out0;
  r <= sum(4 downto 0);
end architecture;


-- MultiPartite: LNS subtraction function: [-0.12500000000000003 0.0[ -> [0.0 7.999999999999998[
-- wI = 3 bits
-- wO = 5 bits
-- Decomposition: 1, 2 / 0 / 2
-- Guard bits: 1
-- Size: 16 = 6.2^1 + 2.2^1

library ieee;
use ieee.std_logic_1164.all;

package pkg_LNSSub_MPT_T7_6 is
  component LNSSub_MPT_T7_6_tiv is
    port( x : in  std_logic_vector(0 downto 0);
          r : out std_logic_vector(5 downto 0) );
  end component;

  component LNSSub_MPT_T7_6_to0 is
    port( x : in  std_logic_vector(0 downto 0);
          r : out std_logic_vector(1 downto 0) );
  end component;

  component LNSSub_MPT_T7_6_to0_xor is
    port( b : in  std_logic_vector(1 downto 0);
          r : out std_logic_vector(5 downto 0) );
  end component;
end package;


library ieee;
use ieee.std_logic_1164.all;

entity LNSSub_MPT_T7_6_tiv is
  port( x : in  std_logic_vector(0 downto 0);
        r : out std_logic_vector(5 downto 0) );
end entity;

architecture arch of LNSSub_MPT_T7_6_tiv is
begin
  with x select
    r <=
      "100000" when "0", -- t[0] = 32
      "101101" when "1", -- t[1] = 45
      "------" when others;
end architecture;


library ieee;
use ieee.std_logic_1164.all;

entity LNSSub_MPT_T7_6_to0 is
  port( x : in  std_logic_vector(0 downto 0);
        r : out std_logic_vector(1 downto 0) );
end entity;

architecture arch of LNSSub_MPT_T7_6_to0 is
begin
  with x select
    r <=
      "01" when "0", -- t[0] = 1
      "11" when "1", -- t[1] = 3
      "--" when others;
end architecture;


library ieee;
use ieee.std_logic_1164.all;
library fplib;
use fplib.pkg_LNSSub_MPT_T7_6.all;

entity LNSSub_MPT_T7_6_to0_xor is
  port( b : in  std_logic_vector(1 downto 0);
        r : out std_logic_vector(5 downto 0) );
end entity;

architecture arch of LNSSub_MPT_T7_6_to0_xor is
  signal sign  : std_logic;
  signal in_t  : std_logic_vector(0 downto 0);
  signal out_t : std_logic_vector(1 downto 0);
begin
  sign <= not b(1);
  in_t(0) <= b(0) xor sign;

  inst_to0 : LNSSub_MPT_T7_6_to0
    port map( x => in_t,
              r => out_t );

  r(5 downto 2) <= (5 downto 2 => sign);
  r(0) <= out_t(0) xor sign;
  r(1) <= out_t(1) xor sign;
end architecture;


library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library fplib;
use fplib.pkg_LNSSub_MPT_T7_6.all;

entity LNSSub_MPT_T7_6 is
  port( x : in  std_logic_vector(2 downto 0);
        r : out std_logic_vector(4 downto 0) );
end entity;

architecture arch of LNSSub_MPT_T7_6 is
  signal in_tiv  : std_logic_vector(0 downto 0);
  signal out_tiv : std_logic_vector(5 downto 0);
  signal b0      : std_logic_vector(1 downto 0);
  signal out0    : std_logic_vector(5 downto 0);
  signal sum     : std_logic_vector(5 downto 0);
begin
  in_tiv <= x(2 downto 2);
  inst_tiv : LNSSub_MPT_T7_6_tiv
    port map( x => in_tiv,
              r => out_tiv );

  b0 <= x(1 downto 0);
  inst_to0_xor : LNSSub_MPT_T7_6_to0_xor
    port map( b => b0,
              r => out0 );


  sum <= out_tiv + out0;
  r <= sum(5 downto 1);
end architecture;


library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library fplib;
use fplib.pkg_lnssub_mpt_6.all;

entity LNSSub_MPT_6 is
  port( x : in  std_logic_vector(8 downto 0);
        r : out std_logic_vector(8 downto 0) );
end entity;

architecture arch of LNSSub_MPT_6 is

  signal out_t1 : std_logic_vector(2 downto 0);
  signal out_t2 : std_logic_vector(4 downto 0);
  signal out_t3 : std_logic_vector(4 downto 0);
  signal out_t4 : std_logic_vector(4 downto 0);
  signal out_t5 : std_logic_vector(4 downto 0);
  signal out_t6 : std_logic_vector(4 downto 0);
  signal out_t7 : std_logic_vector(4 downto 0);
begin
  inst_t1 : LNSSub_MPT_T1_6
    port map( x => x(7 downto 0),
              r => out_t1 );

  inst_t2 : LNSSub_MPT_T2_6
    port map( x => x(6 downto 0),
              r => out_t2 );

  inst_t3 : LNSSub_MPT_T3_6
    port map( x => x(5 downto 0),
              r => out_t3 );

  inst_t4 : LNSSub_MPT_T4_6
    port map( x => x(4 downto 0),
              r => out_t4 );

  inst_t5 : LNSSub_MPT_T5_6
    port map( x => x(3 downto 0),
              r => out_t5 );

  inst_t6 : LNSSub_MPT_T6_6
    port map( x => x(2 downto 0),
              r => out_t6 );

  inst_t7 : LNSSub_MPT_T7_6
    port map( x => x(2 downto 0),
              r => out_t7 );

  r <= (8 downto 3 => '0') & out_t1
         when x(8) /= '1' else
       (8 downto 5 => '0') & out_t2
         when x(7) /= '1' else
       (8 downto 6 => '0') & out_t3 & (0 downto 0 => '0')
         when x(6) /= '1' else
       (8 downto 7 => '0') & out_t4 & (1 downto 0 => '0')
         when x(5) /= '1' else
       (8 downto 8 => '0') & out_t5 & (2 downto 0 => '0')
         when x(4) /= '1' else
       (8 downto 8 => '0') & out_t6 & (2 downto 0 => '0')
         when x(3) /= '1' else
       out_t7 & (3 downto 0 => '0');
end architecture;


library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library fplib;
use fplib.pkg_lnssub_mpt_6.all;
use fplib.pkg_misc.all;

entity LNSSub_MPT_6_Clk is
  port( x   : in  std_logic_vector(8 downto 0);
        r   : out std_logic_vector(8 downto 0);
        clk : in  std_logic );
end entity;

architecture arch of LNSSub_MPT_6_Clk is
  signal x_1  : std_logic_vector(8 downto 0);
  signal x_10 : std_logic_vector(8 downto 0);

  signal out_t1_10 : std_logic_vector(2 downto 0);
  signal out_t2_10 : std_logic_vector(4 downto 0);
  signal out_t3_10 : std_logic_vector(4 downto 0);
  signal out_t4_10 : std_logic_vector(4 downto 0);
  signal out_t5_10 : std_logic_vector(4 downto 0);
  signal out_t6_10 : std_logic_vector(4 downto 0);
  signal out_t7_10 : std_logic_vector(4 downto 0);
begin
  x_1 <= x;

  inst_t1 : LNSSub_MPT_T1_6
    port map( x   => x_1(7 downto 0),
              r   => out_t1_10 );

  inst_t2 : LNSSub_MPT_T2_6
    port map( x   => x_1(6 downto 0),
              r   => out_t2_10 );

  inst_t3 : LNSSub_MPT_T3_6
    port map( x   => x_1(5 downto 0),
              r   => out_t3_10 );

  inst_t4 : LNSSub_MPT_T4_6
    port map( x   => x_1(4 downto 0),
              r   => out_t4_10 );

  inst_t5 : LNSSub_MPT_T5_6
    port map( x   => x_1(3 downto 0),
              r   => out_t5_10 );

  inst_t6 : LNSSub_MPT_T6_6
    port map( x   => x_1(2 downto 0),
              r   => out_t6_10 );

  inst_t7 : LNSSub_MPT_T7_6
    port map( x   => x_1(2 downto 0),
              r   => out_t7_10 );

  x_delay : Delay
    generic map ( w => 9,
                  n => 0 )
    port map ( input  => x_1,
               output => x_10,
               clk    => clk );

  r <= (8 downto 3 => '0') & out_t1_10
         when x_10(8) /= '1' else
       (8 downto 5 => '0') & out_t2_10
         when x_10(7) /= '1' else
       (8 downto 6 => '0') & out_t3_10 & (0 downto 0 => '0')
         when x_10(6) /= '1' else
       (8 downto 7 => '0') & out_t4_10 & (1 downto 0 => '0')
         when x_10(5) /= '1' else
       (8 downto 8 => '0') & out_t5_10 & (2 downto 0 => '0')
         when x_10(4) /= '1' else
       (8 downto 8 => '0') & out_t6_10 & (2 downto 0 => '0')
         when x_10(3) /= '1' else
       out_t7_10 & (3 downto 0 => '0');
end architecture;
