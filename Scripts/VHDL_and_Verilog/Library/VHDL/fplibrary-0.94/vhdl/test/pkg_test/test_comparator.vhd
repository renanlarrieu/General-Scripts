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

entity Test_Comparator is
  generic ( wE : positive;
            wF : positive );
  port ( nA : in  std_logic_vector(wE+wF+2 downto 0);
         nB : in  std_logic_vector(wE+wF+2 downto 0);
         eq : out std_logic );
end entity;

architecture arch of Test_Comparator is
  signal exn   : std_logic;
  signal xeq   : std_logic;
begin
  exn <= '0' when nA(wE+wF+2 downto wE+wF+1) = "01" else
         '1';
  xeq <= '1' when nA(wE+wF+2 downto wE+wF+1) = nB(wE+wF+2 downto wE+wF+1) else
         '0';
  eq <= xeq when nA(wE+wF downto 0) = nB(wE+wF downto 0) else
        exn and xeq;
end architecture;
