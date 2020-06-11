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
use fplib.pkg_lnsconv.all;

entity LNS_To_IEEE754 is
  generic ( wE : positive := 6;
            wF : positive := 13 );
  port ( nA : in  std_logic_vector(wE+wF+2 downto 0);
         nR : out std_logic_vector(wE+wF downto 0));
end entity;

architecture arch of LNS_To_IEEE754 is
  signal eZero : std_logic;
  
  signal xA : std_logic_vector(1 downto 0);
  signal eR : std_logic_vector(wE-1 downto 0);
  signal fR : std_logic_vector(wF-1 downto 0);
begin
  eZero <= '1' when nA(wE+wF-1 downto wF+1) = "1" & (wE-1 downto 1 => '0') else
           '0';

  with eZero select
    xA <= nA(wE+wF+2 downto wE+wF+1) when '0',
          "00"                       when others;

  eR <= nA(wE+wF-1 downto wF) + ("0" & (wE-2 downto 0 => '1'));
  
  e2 : Exp2
    generic map ( wF => wF )
    port map ( x => nA(wF-1 downto 0),
               r => fR );

  with xA select
    nR <= nA(wE+wF) & (wE+wF-1 downto 0 => '0')                                   when "00",
          nA(wE+wF) & eR & fR                                                     when "01",
          nA(wE+wF) & (wE+wF-1 downto wF => '1') & (wF-1 downto 1 => '0') & xA(0) when others;
end architecture;
