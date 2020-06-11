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


library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library fplib;
use fplib.pkg_lnsadd.all;
use fplib.pkg_misc.all;

entity LNSAdd is
  generic ( wE : positive := 6;
            wF : positive := 13 );
  port ( nA : in  std_logic_vector(wE+wF+2 downto 0);
         nB : in  std_logic_vector(wE+wF+2 downto 0);
         nR : out std_logic_vector(wE+wF+2 downto 0) );
end entity;

architecture arch of LNSAdd is
  constant wEssZero : positive := min(wE, log(wF+1)+1)+wF;

  signal sAB : std_logic;

  signal nA0 : std_logic_vector(wE+wF+2 downto 0);
  signal nB0 : std_logic_vector(wE+wF+2 downto 0);
  signal eA1 : std_logic_vector(wE+wF+1 downto 0);

  signal eDiff : std_logic_vector(wE+wF-1 downto 0);
  signal eRa0  : std_logic_vector(wF downto 0);
  signal eRa1  : std_logic_vector(wF downto 0);
  signal eRs0  : std_logic_vector(wE+wF downto 0);
  signal eRs1  : std_logic_vector(wE+wF downto 0);
  signal eR1   : std_logic_vector(wE+wF+1 downto 0);

  signal sRn   : std_logic;
  signal eRn   : std_logic_vector(wE+wF+1 downto 0);
  signal xRn   : std_logic_vector(1 downto 0);
  signal nRn   : std_logic_vector(wE+wF+2 downto 0);

  signal xAB : std_logic_vector(3 downto 0);
begin
  sAB <= nA(wE+wF) xor nB(wE+wF);

  swap : LNSAdd_Swap
    generic map ( wE => wE,
                  wF => wF )
    port map ( nA => nA,
               nB => nB,
               nR => nA0,
               nS => nB0,
               eD => eDiff );

  add_tbl : LNSAdd_Add
    generic map ( wE => wE,
                  wF => wF )
    port map ( x => eDiff(wEssZero-1 downto 0),
               r => eRa0 );

  sub_tbl : LNSAdd_Sub
    generic map ( wE => wE,
                  wF => wF )
    port map ( x => eDiff(wEssZero-1 downto 0),
               r => eRs0 );

  ess_zero : if wEssZero < wE+wF generate
    eRa1 <= "1" & (wF-1 downto 0 => '0') when eDiff = (wE+wF-1 downto 0 => '0')                                       else
            (wF downto 0 => '0')         when eDiff(wE+wF-1 downto wEssZero) /= (wE+wF-1 downto wEssZero => '1') else
            eRa0;
    eRs1 <= (wE+wF downto 0 => '1') when eDiff = (wE+wF-1 downto 0 => '0')                                       else
            (wE+wF downto 0 => '0') when eDiff(wE+wF-1 downto wEssZero) /= (wE+wF-1 downto wEssZero => '1') else
            eRs0;
  end generate;
  no_ess_zero : if wEssZero >= wE+wF generate
    eRa1 <= "1" & (wF-1 downto 0 => '0') when eDiff = (wE+wF-1 downto 0 => '0') else
            eRa0;
    eRs1 <= (wE+wF downto 0 => '1') when eDiff = (wE+wF-1 downto 0 => '0') else
            eRs0;
  end generate;

  eA1 <= nA0(wE+wF-1) & nA0(wE+wF-1) & nA0(wE+wF-1 downto 0);
  with sAB select
    eR1 <= (wE+wF+1 downto wF+1 => '0') & eRa1 when '0',
           "0" & eRs1                                  when others;
  
  sRn <= nA0(wE+wF);
  with sAB select
    eRn <= eA1 + eR1 when '0',
           eA1 - eR1 when others;
  xRn <= "00" when eRn(wE+wF+1) = '1' and eRn(wE+wF downto wE+wF-1) /= "11" else
         "10" when eRn(wE+wF+1) = '0' and eRn(wE+wF downto wE+wF-1) /= "00" else
         "01";
  nRn <= xRn & sRn & eRn(wE+wF-1 downto 0);

  xAB <= nA0(wE+wF+2 downto wE+wF+1) & nB0(wE+wF+2 downto wE+wF+1);
  
  with xAB select
    nR(wE+wF+2 downto wE+wF+1) <= xRn             when "0101",
                                            "1" & sAB       when "1010",
                                            "11"            when "1011",
                                            xAB(3 downto 2) when others;
  with xAB select
    nR(wE+wF) <= nRn(wE+wF)                     when "0101",
                      nA0(wE+wF) and nB0(wE+wF) when "0000",
                      nA0(wE+wF)                     when others;

  with xAB select
    nR(wE+wF-1 downto 0) <= nRn(wE+wF-1 downto 0) when "0101",
                                 nA0(wE+wF-1 downto 0) when others;
end architecture;
