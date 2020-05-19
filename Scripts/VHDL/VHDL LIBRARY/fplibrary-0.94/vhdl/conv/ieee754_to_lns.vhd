-- Copyright 2003-2004 J�r�mie Detrey, Florent de Dinechin
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
use fplib.pkg_lnsconv.all;

entity IEEE754_To_LNS is
  generic ( wE : positive := 6;
            wF : positive := 13 );
  port ( nA : in  std_logic_vector(wE+wF downto 0);
         nR : out std_logic_vector(wE+wF+2 downto 0));
end entity;

architecture arch of IEEE754_To_LNS is
  signal eMax  : std_logic;
  signal eMin  : std_logic;
  signal eTest : std_logic_vector(1 downto 0);
  signal fZero : std_logic;
  
  signal fR : std_logic_vector(wF-1 downto 0);
begin
  eMax <= '1' when nA(wE+wF-1 downto wF) = (wE-1 downto 0 => '1') else
          '0';
  eMin <= '1' when nA(wE+wF-1 downto wF) = (wE-1 downto 0 => '0') else
          '0';
  eTest <= eMax & eMin;

  fZero <= '0' when nA(wF-1 downto 0) = (wF-1 downto 0 => '0') else
           '1';

  with eTest select
    nR(wE+wF+2 downto wE+wF+1) <= "00"        when "01",
                                  "1" & fZero when "10",
                                  "01"        when others;
  nR(wE+wF) <= nA(wE+wF);
  nR(wE+wF-1 downto wF) <= nA(wE+wF-1 downto wF) - ("0" & (wE-2 downto 0 => '1'));

  l2 : Log2
    generic map ( wF => wF )
    port map ( x => nA(wF-1 downto 0),
               r => fR );
  
  nR(wF-1 downto 0) <= fR;
end architecture;
