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
-- wI = 8 bits
-- wO = 8 bits
-- Decomposition: 4, 4 / 4, 2 / 2, 2
-- Guard bits: 2
-- Size: 376 = 10.2^4 + 6.2^5 + 3.2^3

library ieee;
use ieee.std_logic_1164.all;

package pkg_Exp2_MPT_8 is
  component Exp2_MPT_8_tiv is
    port( x : in  std_logic_vector(3 downto 0);
          r : out std_logic_vector(9 downto 0) );
  end component;

  component Exp2_MPT_8_to1 is
    port( x : in  std_logic_vector(4 downto 0);
          r : out std_logic_vector(5 downto 0) );
  end component;

  component Exp2_MPT_8_to0 is
    port( x : in  std_logic_vector(2 downto 0);
          r : out std_logic_vector(2 downto 0) );
  end component;

  component Exp2_MPT_8_to1_xor is
    port( a : in  std_logic_vector(3 downto 0);
          b : in  std_logic_vector(1 downto 0);
          r : out std_logic_vector(9 downto 0) );
  end component;

  component Exp2_MPT_8_to0_xor is
    port( a : in  std_logic_vector(1 downto 0);
          b : in  std_logic_vector(1 downto 0);
          r : out std_logic_vector(9 downto 0) );
  end component;
end package;


library ieee;
use ieee.std_logic_1164.all;

entity Exp2_MPT_8_tiv is
  port( x : in  std_logic_vector(3 downto 0);
        r : out std_logic_vector(9 downto 0) );
end entity;

architecture arch of Exp2_MPT_8_tiv is
begin
  with x select
    r <=
      "0000011100" when "0000", -- t[0] = -996
      "0001001010" when "0001", -- t[1] = -950
      "0001111010" when "0010", -- t[2] = -902
      "0010101101" when "0011", -- t[3] = -851
      "0011100010" when "0100", -- t[4] = -798
      "0100011001" when "0101", -- t[5] = -743
      "0101010010" when "0110", -- t[6] = -686
      "0110001110" when "0111", -- t[7] = -626
      "0111001101" when "1000", -- t[8] = -563
      "1000001111" when "1001", -- t[9] = -497
      "1001010011" when "1010", -- t[10] = -429
      "1010011011" when "1011", -- t[11] = -357
      "1011100101" when "1100", -- t[12] = -283
      "1100110011" when "1101", -- t[13] = -205
      "1110000101" when "1110", -- t[14] = -123
      "1111011010" when "1111", -- t[15] = -38
      "----------" when others;
end architecture;


library ieee;
use ieee.std_logic_1164.all;

entity Exp2_MPT_8_to1 is
  port( x : in  std_logic_vector(4 downto 0);
        r : out std_logic_vector(5 downto 0) );
end entity;

architecture arch of Exp2_MPT_8_to1 is
begin
  with x select
    r <=
      "000101" when "00000", -- t[0] = 5
      "010000" when "00001", -- t[1] = 16
      "000101" when "00010", -- t[2] = 5
      "010001" when "00011", -- t[3] = 17
      "000110" when "00100", -- t[4] = 6
      "010010" when "00101", -- t[5] = 18
      "000110" when "00110", -- t[6] = 6
      "010011" when "00111", -- t[7] = 19
      "000110" when "01000", -- t[8] = 6
      "010100" when "01001", -- t[9] = 20
      "000111" when "01010", -- t[10] = 7
      "010101" when "01011", -- t[11] = 21
      "000111" when "01100", -- t[12] = 7
      "010101" when "01101", -- t[13] = 21
      "000111" when "01110", -- t[14] = 7
      "010110" when "01111", -- t[15] = 22
      "000111" when "10000", -- t[16] = 7
      "010111" when "10001", -- t[17] = 23
      "001000" when "10010", -- t[18] = 8
      "011001" when "10011", -- t[19] = 25
      "001000" when "10100", -- t[20] = 8
      "011010" when "10101", -- t[21] = 26
      "001001" when "10110", -- t[22] = 9
      "011011" when "10111", -- t[23] = 27
      "001001" when "11000", -- t[24] = 9
      "011100" when "11001", -- t[25] = 28
      "001001" when "11010", -- t[26] = 9
      "011101" when "11011", -- t[27] = 29
      "001010" when "11100", -- t[28] = 10
      "011111" when "11101", -- t[29] = 31
      "001010" when "11110", -- t[30] = 10
      "100000" when "11111", -- t[31] = 32
      "------" when others;
end architecture;


library ieee;
use ieee.std_logic_1164.all;

entity Exp2_MPT_8_to0 is
  port( x : in  std_logic_vector(2 downto 0);
        r : out std_logic_vector(2 downto 0) );
end entity;

architecture arch of Exp2_MPT_8_to0 is
begin
  with x select
    r <=
      "001" when "000", -- t[0] = 1
      "100" when "001", -- t[1] = 4
      "001" when "010", -- t[2] = 1
      "101" when "011", -- t[3] = 5
      "010" when "100", -- t[4] = 2
      "110" when "101", -- t[5] = 6
      "010" when "110", -- t[6] = 2
      "111" when "111", -- t[7] = 7
      "---" when others;
end architecture;


library ieee;
use ieee.std_logic_1164.all;
library fplib;
use fplib.pkg_Exp2_MPT_8.all;

entity Exp2_MPT_8_to1_xor is
  port( a : in  std_logic_vector(3 downto 0);
        b : in  std_logic_vector(1 downto 0);
        r : out std_logic_vector(9 downto 0) );
end entity;

architecture arch of Exp2_MPT_8_to1_xor is
  signal sign  : std_logic;
  signal in_t  : std_logic_vector(4 downto 0);
  signal out_t : std_logic_vector(5 downto 0);
begin
  sign <= not b(1);
  in_t(4 downto 1) <= a(3 downto 0);
  in_t(0) <= b(0) xor sign;

  inst_to1 : Exp2_MPT_8_to1
    port map( x => in_t,
              r => out_t );

  r(9 downto 6) <= (9 downto 6 => sign);
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
use fplib.pkg_Exp2_MPT_8.all;

entity Exp2_MPT_8_to0_xor is
  port( a : in  std_logic_vector(1 downto 0);
        b : in  std_logic_vector(1 downto 0);
        r : out std_logic_vector(9 downto 0) );
end entity;

architecture arch of Exp2_MPT_8_to0_xor is
  signal sign  : std_logic;
  signal in_t  : std_logic_vector(2 downto 0);
  signal out_t : std_logic_vector(2 downto 0);
begin
  sign <= not b(1);
  in_t(2 downto 1) <= a(1 downto 0);
  in_t(0) <= b(0) xor sign;

  inst_to0 : Exp2_MPT_8_to0
    port map( x => in_t,
              r => out_t );

  r(9 downto 3) <= (9 downto 3 => sign);
  r(0) <= out_t(0) xor sign;
  r(1) <= out_t(1) xor sign;
  r(2) <= out_t(2) xor sign;
end architecture;


library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library fplib;
use fplib.pkg_Exp2_MPT_8.all;

entity Exp2_MPT_8 is
  port( x : in  std_logic_vector(7 downto 0);
        r : out std_logic_vector(7 downto 0) );
end entity;

architecture arch of Exp2_MPT_8 is
  signal in_tiv  : std_logic_vector(3 downto 0);
  signal out_tiv : std_logic_vector(9 downto 0);
  signal a1      : std_logic_vector(3 downto 0);
  signal b1      : std_logic_vector(1 downto 0);
  signal out1    : std_logic_vector(9 downto 0);
  signal a0      : std_logic_vector(1 downto 0);
  signal b0      : std_logic_vector(1 downto 0);
  signal out0    : std_logic_vector(9 downto 0);
  signal sum     : std_logic_vector(9 downto 0);
begin
  in_tiv <= x(7 downto 4);
  inst_tiv : Exp2_MPT_8_tiv
    port map( x => in_tiv,
              r => out_tiv );

  a1 <= x(7 downto 4);
  b1 <= x(3 downto 2);
  inst_to1_xor : Exp2_MPT_8_to1_xor
    port map( a => a1,
              b => b1,
              r => out1 );

  a0 <= x(7 downto 6);
  b0 <= x(1 downto 0);
  inst_to0_xor : Exp2_MPT_8_to0_xor
    port map( a => a0,
              b => b0,
              r => out0 );


  sum <= out_tiv + out1 + out0;
  r <= sum(9 downto 2);
end architecture;
