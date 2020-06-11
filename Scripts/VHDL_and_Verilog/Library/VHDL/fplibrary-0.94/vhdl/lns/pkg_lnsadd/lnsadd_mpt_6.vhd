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


-- Implementation of MultiPartiteAdder object for LNS arithmetic in base 2.0 with 8-bit integer part and 6-bit fractional part
-- wI = 9 bits
-- wO = 7 bits

library ieee;
use ieee.std_logic_1164.all;

package pkg_lnsadd_mpt_6 is
  component LNSAdd_MPT_T2_6 is
    port( x : in  std_logic_vector(8 downto 0);
          r : out std_logic_vector(6 downto 0) );
  end component;
end package;


-- MultiPartite: LNS addition function: [-8.0 0.0[ -> [0.0 2.0[
-- wI = 9 bits
-- wO = 7 bits
-- Decomposition: 6, 3 / 4 / 3
-- Guard bits: 2
-- Size: 768 = 9.2^6 + 3.2^6

library ieee;
use ieee.std_logic_1164.all;

package pkg_LNSAdd_MPT_T2_6 is
  component LNSAdd_MPT_T2_6_tiv is
    port( x : in  std_logic_vector(5 downto 0);
          r : out std_logic_vector(8 downto 0) );
  end component;

  component LNSAdd_MPT_T2_6_to0 is
    port( x : in  std_logic_vector(5 downto 0);
          r : out std_logic_vector(2 downto 0) );
  end component;

  component LNSAdd_MPT_T2_6_to0_xor is
    port( a : in  std_logic_vector(3 downto 0);
          b : in  std_logic_vector(2 downto 0);
          r : out std_logic_vector(8 downto 0) );
  end component;
end package;


library ieee;
use ieee.std_logic_1164.all;

entity LNSAdd_MPT_T2_6_tiv is
  port( x : in  std_logic_vector(5 downto 0);
        r : out std_logic_vector(8 downto 0) );
end entity;

architecture arch of LNSAdd_MPT_T2_6_tiv is
begin
  with x select
    r <=
      "000000011" when "000000", -- t[0] = 3
      "000000100" when "000001", -- t[1] = 4
      "000000100" when "000010", -- t[2] = 4
      "000000100" when "000011", -- t[3] = 4
      "000000100" when "000100", -- t[4] = 4
      "000000100" when "000101", -- t[5] = 4
      "000000101" when "000110", -- t[6] = 5
      "000000101" when "000111", -- t[7] = 5
      "000000101" when "001000", -- t[8] = 5
      "000000101" when "001001", -- t[9] = 5
      "000000110" when "001010", -- t[10] = 6
      "000000110" when "001011", -- t[11] = 6
      "000000110" when "001100", -- t[12] = 6
      "000000111" when "001101", -- t[13] = 7
      "000000111" when "001110", -- t[14] = 7
      "000000111" when "001111", -- t[15] = 7
      "000001000" when "010000", -- t[16] = 8
      "000001000" when "010001", -- t[17] = 8
      "000001001" when "010010", -- t[18] = 9
      "000001010" when "010011", -- t[19] = 10
      "000001010" when "010100", -- t[20] = 10
      "000001011" when "010101", -- t[21] = 11
      "000001100" when "010110", -- t[22] = 12
      "000001101" when "010111", -- t[23] = 13
      "000001110" when "011000", -- t[24] = 14
      "000001111" when "011001", -- t[25] = 15
      "000010000" when "011010", -- t[26] = 16
      "000010001" when "011011", -- t[27] = 17
      "000010011" when "011100", -- t[28] = 19
      "000010100" when "011101", -- t[29] = 20
      "000010110" when "011110", -- t[30] = 22
      "000010111" when "011111", -- t[31] = 23
      "000011001" when "100000", -- t[32] = 25
      "000011011" when "100001", -- t[33] = 27
      "000011101" when "100010", -- t[34] = 29
      "000100000" when "100011", -- t[35] = 32
      "000100010" when "100100", -- t[36] = 34
      "000100101" when "100101", -- t[37] = 37
      "000101000" when "100110", -- t[38] = 40
      "000101100" when "100111", -- t[39] = 44
      "000101111" when "101000", -- t[40] = 47
      "000110011" when "101001", -- t[41] = 51
      "000110111" when "101010", -- t[42] = 55
      "000111100" when "101011", -- t[43] = 60
      "001000000" when "101100", -- t[44] = 64
      "001000101" when "101101", -- t[45] = 69
      "001001011" when "101110", -- t[46] = 75
      "001010001" when "101111", -- t[47] = 81
      "001010111" when "110000", -- t[48] = 87
      "001011110" when "110001", -- t[49] = 94
      "001100101" when "110010", -- t[50] = 101
      "001101101" when "110011", -- t[51] = 109
      "001110110" when "110100", -- t[52] = 118
      "001111110" when "110101", -- t[53] = 126
      "010001000" when "110110", -- t[54] = 136
      "010010010" when "110111", -- t[55] = 146
      "010011101" when "111000", -- t[56] = 157
      "010101000" when "111001", -- t[57] = 168
      "010110100" when "111010", -- t[58] = 180
      "011000000" when "111011", -- t[59] = 192
      "011001101" when "111100", -- t[60] = 205
      "011011011" when "111101", -- t[61] = 219
      "011101010" when "111110", -- t[62] = 234
      "011111001" when "111111", -- t[63] = 249
      "---------" when others;
end architecture;


library ieee;
use ieee.std_logic_1164.all;

entity LNSAdd_MPT_T2_6_to0 is
  port( x : in  std_logic_vector(5 downto 0);
        r : out std_logic_vector(2 downto 0) );
end entity;

architecture arch of LNSAdd_MPT_T2_6_to0 is
begin
  with x select
    r <=
      "000" when "000000", -- t[0] = 0
      "000" when "000001", -- t[1] = 0
      "000" when "000010", -- t[2] = 0
      "000" when "000011", -- t[3] = 0
      "000" when "000100", -- t[4] = 0
      "000" when "000101", -- t[5] = 0
      "000" when "000110", -- t[6] = 0
      "000" when "000111", -- t[7] = 0
      "000" when "001000", -- t[8] = 0
      "000" when "001001", -- t[9] = 0
      "000" when "001010", -- t[10] = 0
      "000" when "001011", -- t[11] = 0
      "000" when "001100", -- t[12] = 0
      "000" when "001101", -- t[13] = 0
      "000" when "001110", -- t[14] = 0
      "000" when "001111", -- t[15] = 0
      "000" when "010000", -- t[16] = 0
      "000" when "010001", -- t[17] = 0
      "000" when "010010", -- t[18] = 0
      "000" when "010011", -- t[19] = 0
      "000" when "010100", -- t[20] = 0
      "000" when "010101", -- t[21] = 0
      "000" when "010110", -- t[22] = 0
      "000" when "010111", -- t[23] = 0
      "000" when "011000", -- t[24] = 0
      "000" when "011001", -- t[25] = 0
      "000" when "011010", -- t[26] = 0
      "000" when "011011", -- t[27] = 0
      "000" when "011100", -- t[28] = 0
      "000" when "011101", -- t[29] = 0
      "000" when "011110", -- t[30] = 0
      "000" when "011111", -- t[31] = 0
      "000" when "100000", -- t[32] = 0
      "000" when "100001", -- t[33] = 0
      "000" when "100010", -- t[34] = 0
      "000" when "100011", -- t[35] = 0
      "000" when "100100", -- t[36] = 0
      "000" when "100101", -- t[37] = 0
      "000" when "100110", -- t[38] = 0
      "001" when "100111", -- t[39] = 1
      "000" when "101000", -- t[40] = 0
      "000" when "101001", -- t[41] = 0
      "001" when "101010", -- t[42] = 1
      "001" when "101011", -- t[43] = 1
      "000" when "101100", -- t[44] = 0
      "001" when "101101", -- t[45] = 1
      "001" when "101110", -- t[46] = 1
      "010" when "101111", -- t[47] = 2
      "000" when "110000", -- t[48] = 0
      "001" when "110001", -- t[49] = 1
      "010" when "110010", -- t[50] = 2
      "011" when "110011", -- t[51] = 3
      "000" when "110100", -- t[52] = 0
      "001" when "110101", -- t[53] = 1
      "010" when "110110", -- t[54] = 2
      "100" when "110111", -- t[55] = 4
      "000" when "111000", -- t[56] = 0
      "010" when "111001", -- t[57] = 2
      "011" when "111010", -- t[58] = 3
      "101" when "111011", -- t[59] = 5
      "000" when "111100", -- t[60] = 0
      "010" when "111101", -- t[61] = 2
      "100" when "111110", -- t[62] = 4
      "110" when "111111", -- t[63] = 6
      "---" when others;
end architecture;


library ieee;
use ieee.std_logic_1164.all;
library fplib;
use fplib.pkg_LNSAdd_MPT_T2_6.all;

entity LNSAdd_MPT_T2_6_to0_xor is
  port( a : in  std_logic_vector(3 downto 0);
        b : in  std_logic_vector(2 downto 0);
        r : out std_logic_vector(8 downto 0) );
end entity;

architecture arch of LNSAdd_MPT_T2_6_to0_xor is
  signal sign  : std_logic;
  signal in_t  : std_logic_vector(5 downto 0);
  signal out_t : std_logic_vector(2 downto 0);
begin
  sign <= not b(2);
  in_t(5 downto 2) <= a(3 downto 0);
  in_t(0) <= b(0) xor sign;
  in_t(1) <= b(1) xor sign;

  inst_to0 : LNSAdd_MPT_T2_6_to0
    port map( x => in_t,
              r => out_t );

  r(8 downto 3) <= (8 downto 3 => sign);
  r(0) <= out_t(0) xor sign;
  r(1) <= out_t(1) xor sign;
  r(2) <= out_t(2) xor sign;
end architecture;


library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library fplib;
use fplib.pkg_LNSAdd_MPT_T2_6.all;

entity LNSAdd_MPT_T2_6 is
  port( x : in  std_logic_vector(8 downto 0);
        r : out std_logic_vector(6 downto 0) );
end entity;

architecture arch of LNSAdd_MPT_T2_6 is
  signal in_tiv  : std_logic_vector(5 downto 0);
  signal out_tiv : std_logic_vector(8 downto 0);
  signal a0      : std_logic_vector(3 downto 0);
  signal b0      : std_logic_vector(2 downto 0);
  signal out0    : std_logic_vector(8 downto 0);
  signal sum     : std_logic_vector(8 downto 0);
begin
  in_tiv <= x(8 downto 3);
  inst_tiv : LNSAdd_MPT_T2_6_tiv
    port map( x => in_tiv,
              r => out_tiv );

  a0 <= x(8 downto 5);
  b0 <= x(2 downto 0);
  inst_to0_xor : LNSAdd_MPT_T2_6_to0_xor
    port map( a => a0,
              b => b0,
              r => out0 );


  sum <= out_tiv + out0;
  r <= sum(8 downto 2);
end architecture;


library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library fplib;
use fplib.pkg_lnsadd_mpt_6.all;

entity LNSAdd_MPT_6 is
  port( x : in  std_logic_vector(8 downto 0);
        r : out std_logic_vector(6 downto 0) );
end entity;

architecture arch of LNSAdd_MPT_6 is
  signal out_t2 : std_logic_vector(6 downto 0);
begin
  inst_t2 : LNSAdd_MPT_T2_6
    port map( x => x(8 downto 0),
              r => out_t2 );

  r <= out_t2;
end architecture;


library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library fplib;
use fplib.pkg_lnsadd_mpt_6.all;
use fplib.pkg_misc.all;

entity LNSAdd_MPT_6_Clk is
  port( x   : in  std_logic_vector(8 downto 0);
        r   : out std_logic_vector(6 downto 0);
        clk : in  std_logic );
end entity;

architecture arch of LNSAdd_MPT_6_Clk is
  signal x_1  : std_logic_vector(8 downto 0);
  signal x_10 : std_logic_vector(8 downto 0);

  signal out_t2_10 : std_logic_vector(6 downto 0);
begin
  x_1 <= x;

  inst_t2 : LNSAdd_MPT_T2_6
    port map( x => x(8 downto 0),
              r => out_t2_10 );

  x_delay : Delay
    generic map ( w => 9,
                  n => 0 )
    port map ( input  => x_1,
               output => x_10,
               clk    => clk );

  r <= out_t2_10;
end architecture;
