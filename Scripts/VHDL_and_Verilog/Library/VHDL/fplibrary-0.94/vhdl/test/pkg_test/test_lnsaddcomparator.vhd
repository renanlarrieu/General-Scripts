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

entity Test_LNSAddComparator is
  generic ( wE : positive;
            wF : positive );
  port ( nA  : in  std_logic_vector(wE+wF+2 downto 0);
         nB1 : in  std_logic_vector(wE+wF+2 downto 0);
         nB2 : in  std_logic_vector(wE+wF+2 downto 0);
         eq  : out std_logic );
end entity;

architecture arch of Test_LNSAddComparator is
  signal exn   : std_logic;
  signal xeq   : std_logic;
  signal seq   : std_logic;
  signal xA    : std_logic_vector(1 downto 0);
  signal xB1   : std_logic_vector(1 downto 0);
  signal xB2   : std_logic_vector(1 downto 0);
  signal eA    : std_logic_vector(wE+wF-1 downto 0);
  signal eB1   : std_logic_vector(wE+wF-1 downto 0);
  signal eB2   : std_logic_vector(wE+wF-1 downto 0);
begin
  xA  <=  nA(wE+wF+2 downto wE+wF+1);
  xB1 <= nB1(wE+wF+2 downto wE+wF+1);
  xB2 <= nB2(wE+wF+2 downto wE+wF+1);
  exn <= '0' when xA = "01" else
         '1';
  xeq <= '1' when xA = xB1 or xA = xB2 else
         '0';
  seq <= not (nA(wE+wF) xor nB1(wE+wF));
  eA  <= (not  nA(wE+wF-1)) &  nA(wE+wF-2 downto 0);
  eB1 <= (not nB1(wE+wF-1)) & nB1(wE+wF-2 downto 0);
  eB2 <= (not nB2(wE+wF-1)) & nB2(wE+wF-2 downto 0);
  eq <= '1' when (xA > xB1 or (xA = xB1 and seq='1' and eA >= eB1)) and
                 (xA < xB2 or (xA = xB2 and seq='1' and eA <= eB2)) else
        exn and xeq;
end architecture;
