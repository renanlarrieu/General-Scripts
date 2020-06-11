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
-- wI = 9 bits
-- wO = 9 bits
-- Decomposition: 5, 4 / 3, 2 / 2, 2
-- Guard bits: 3
-- Size: 512 = 12.2^5 + 6.2^4 + 4.2^3

library ieee;
use ieee.std_logic_1164.all;

package pkg_Exp2_MPT_9 is
  component Exp2_MPT_9_tiv is
    port( x : in  std_logic_vector(4 downto 0);
          r : out std_logic_vector(11 downto 0) );
  end component;

  component Exp2_MPT_9_to1 is
    port( x : in  std_logic_vector(3 downto 0);
          r : out std_logic_vector(5 downto 0) );
  end component;

  component Exp2_MPT_9_to0 is
    port( x : in  std_logic_vector(2 downto 0);
          r : out std_logic_vector(3 downto 0) );
  end component;

  component Exp2_MPT_9_to1_xor is
    port( a : in  std_logic_vector(2 downto 0);
          b : in  std_logic_vector(1 downto 0);
          r : out std_logic_vector(11 downto 0) );
  end component;

  component Exp2_MPT_9_to0_xor is
    port( a : in  std_logic_vector(1 downto 0);
          b : in  std_logic_vector(1 downto 0);
          r : out std_logic_vector(11 downto 0) );
  end component;
end package;


library ieee;
use ieee.std_logic_1164.all;

entity Exp2_MPT_9_tiv is
  port( x : in  std_logic_vector(4 downto 0);
        r : out std_logic_vector(11 downto 0) );
end entity;

architecture arch of Exp2_MPT_9_tiv is
begin
  with x select
    r <=
      "000000110111" when "00000", -- t[0] = -4041
      "000010010001" when "00001", -- t[1] = -3951
      "000011101110" when "00010", -- t[2] = -3858
      "000101001100" when "00011", -- t[3] = -3764
      "000110101101" when "00100", -- t[4] = -3667
      "001000010000" when "00101", -- t[5] = -3568
      "001001110101" when "00110", -- t[6] = -3467
      "001011011100" when "00111", -- t[7] = -3364
      "001101000110" when "01000", -- t[8] = -3258
      "001110110001" when "01001", -- t[9] = -3151
      "010000100000" when "01010", -- t[10] = -3040
      "010010010000" when "01011", -- t[11] = -2928
      "010100000011" when "01100", -- t[12] = -2813
      "010101111001" when "01101", -- t[13] = -2695
      "010111110001" when "01110", -- t[14] = -2575
      "011001101100" when "01111", -- t[15] = -2452
      "011011101001" when "10000", -- t[16] = -2327
      "011101101001" when "10001", -- t[17] = -2199
      "011111101100" when "10010", -- t[18] = -2068
      "100001110010" when "10011", -- t[19] = -1934
      "100011111011" when "10100", -- t[20] = -1797
      "100110000111" when "10101", -- t[21] = -1657
      "101000010110" when "10110", -- t[22] = -1514
      "101010101000" when "10111", -- t[23] = -1368
      "101100111101" when "11000", -- t[24] = -1219
      "101111010110" when "11001", -- t[25] = -1066
      "110001110010" when "11010", -- t[26] = -910
      "110100010001" when "11011", -- t[27] = -751
      "110110110100" when "11100", -- t[28] = -588
      "111001011010" when "11101", -- t[29] = -422
      "111100000100" when "11110", -- t[30] = -252
      "111110110010" when "11111", -- t[31] = -78
      "------------" when others;
end architecture;


library ieee;
use ieee.std_logic_1164.all;

entity Exp2_MPT_9_to1 is
  port( x : in  std_logic_vector(3 downto 0);
        r : out std_logic_vector(5 downto 0) );
end entity;

architecture arch of Exp2_MPT_9_to1 is
begin
  with x select
    r <=
      "001011" when "0000", -- t[0] = 11
      "100010" when "0001", -- t[1] = 34
      "001100" when "0010", -- t[2] = 12
      "100101" when "0011", -- t[3] = 37
      "001101" when "0100", -- t[4] = 13
      "101001" when "0101", -- t[5] = 41
      "001110" when "0110", -- t[6] = 14
      "101100" when "0111", -- t[7] = 44
      "010000" when "1000", -- t[8] = 16
      "110001" when "1001", -- t[9] = 49
      "010001" when "1010", -- t[10] = 17
      "110101" when "1011", -- t[11] = 53
      "010011" when "1100", -- t[12] = 19
      "111010" when "1101", -- t[13] = 58
      "010101" when "1110", -- t[14] = 21
      "111111" when "1111", -- t[15] = 63
      "------" when others;
end architecture;


library ieee;
use ieee.std_logic_1164.all;

entity Exp2_MPT_9_to0 is
  port( x : in  std_logic_vector(2 downto 0);
        r : out std_logic_vector(3 downto 0) );
end entity;

architecture arch of Exp2_MPT_9_to0 is
begin
  with x select
    r <=
      "0011" when "000", -- t[0] = 3
      "1001" when "001", -- t[1] = 9
      "0011" when "010", -- t[2] = 3
      "1010" when "011", -- t[3] = 10
      "0100" when "100", -- t[4] = 4
      "1100" when "101", -- t[5] = 12
      "0101" when "110", -- t[6] = 5
      "1111" when "111", -- t[7] = 15
      "----" when others;
end architecture;


library ieee;
use ieee.std_logic_1164.all;
library fplib;
use fplib.pkg_Exp2_MPT_9.all;

entity Exp2_MPT_9_to1_xor is
  port( a : in  std_logic_vector(2 downto 0);
        b : in  std_logic_vector(1 downto 0);
        r : out std_logic_vector(11 downto 0) );
end entity;

architecture arch of Exp2_MPT_9_to1_xor is
  signal sign  : std_logic;
  signal in_t  : std_logic_vector(3 downto 0);
  signal out_t : std_logic_vector(5 downto 0);
begin
  sign <= not b(1);
  in_t(3 downto 1) <= a(2 downto 0);
  in_t(0) <= b(0) xor sign;

  inst_to1 : Exp2_MPT_9_to1
    port map( x => in_t,
              r => out_t );

  r(11 downto 6) <= (11 downto 6 => sign);
  r(0) <= out_t(0) xor sign;
  r(1) <= out_t(1) xor sign;
  r(2) <= out_t(2) xor sign;
  r(3) <= out_t(3) xor sign;
  r(4) <= out_t(4) xor sign;
  r(5) <= out_t(5) xor sign;
end architecture;


library ieee;
use ieee.std_logic_1164.all;
library fplib;
use fplib.pkg_Exp2_MPT_9.all;

entity Exp2_MPT_9_to0_xor is
  port( a : in  std_logic_vector(1 downto 0);
        b : in  std_logic_vector(1 downto 0);
        r : out std_logic_vector(11 downto 0) );
end entity;

architecture arch of Exp2_MPT_9_to0_xor is
  signal sign  : std_logic;
  signal in_t  : std_logic_vector(2 downto 0);
  signal out_t : std_logic_vector(3 downto 0);
begin
  sign <= not b(1);
  in_t(2 downto 1) <= a(1 downto 0);
  in_t(0) <= b(0) xor sign;

  inst_to0 : Exp2_MPT_9_to0
    port map( x => in_t,
              r => out_t );

  r(11 downto 4) <= (11 downto 4 => sign);
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
use fplib.pkg_Exp2_MPT_9.all;

entity Exp2_MPT_9 is
  port( x : in  std_logic_vector(8 downto 0);
        r : out std_logic_vector(8 downto 0) );
end entity;

architecture arch of Exp2_MPT_9 is
  signal in_tiv  : std_logic_vector(4 downto 0);
  signal out_tiv : std_logic_vector(11 downto 0);
  signal a1      : std_logic_vector(2 downto 0);
  signal b1      : std_logic_vector(1 downto 0);
  signal out1    : std_logic_vector(11 downto 0);
  signal a0      : std_logic_vector(1 downto 0);
  signal b0      : std_logic_vector(1 downto 0);
  signal out0    : std_logic_vector(11 downto 0);
  signal sum     : std_logic_vector(11 downto 0);
begin
  in_tiv <= x(8 downto 4);
  inst_tiv : Exp2_MPT_9_tiv
    port map( x => in_tiv,
              r => out_tiv );

  a1 <= x(8 downto 6);
  b1 <= x(3 downto 2);
  inst_to1_xor : Exp2_MPT_9_to1_xor
    port map( a => a1,
              b => b1,
              r => out1 );

  a0 <= x(8 downto 7);
  b0 <= x(1 downto 0);
  inst_to0_xor : Exp2_MPT_9_to0_xor
    port map( a => a0,
              b => b0,
              r => out0 );


  sum <= out_tiv + out1 + out0;
  r <= sum(11 downto 3);
end architecture;
