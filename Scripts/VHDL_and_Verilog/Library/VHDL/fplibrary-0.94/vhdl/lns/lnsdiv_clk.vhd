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

entity LNSDiv_Clk is
  generic ( wE : positive := 6;
            wF : positive := 13 );
  port ( nA  : in  std_logic_vector(wE+wF+2 downto 0);
         nB  : in  std_logic_vector(wE+wF+2 downto 0);
         nR  : out std_logic_vector(wE+wF+2 downto 0);
         clk : in  std_logic );
end entity;

architecture arch of LNSDiv_Clk is
  signal sRn : std_logic;
  signal eRn : std_logic_vector(wE+wF downto 0);
  signal xRn : std_logic_vector(1 downto 0);
  signal nRn : std_logic_vector(wE+wF+2 downto 0);
  signal nRx : std_logic_vector(wE+wF+2 downto 0);

  signal xA  : std_logic_vector(1 downto 0);
  signal xB  : std_logic_vector(1 downto 0);
  signal xAB : std_logic_vector(3 downto 0);
begin
  eRn <= (nA(wE+wF-1) & nA(wE+wF-1 downto 0)) - (nB(wE+wF-1) & nB(wE+wF-1 downto 0));

  sRn <= nA(wE+wF) xor nB(wE+wF);
  xRn <= "00" when eRn(wE+wF downto wE+wF-1) = "10" else
         "10" when eRn(wE+wF downto wE+wF-1) = "01" else
         "01";
  nRn <= xRn & sRn & eRn(wE+wF-1 downto 0);

  xA <= nA(wE+wF+2 downto wE+wF+1);
  xB <= nB(wE+wF+2 downto wE+wF+1);
  xAB <= xA & xB;

  with xAB select
    nR(wE+wF+2 downto wE+wF+1) <= xRn  when "0101",
                                            "00" when "0001" | "0010" | "0110",
                                            "10" when "0100" | "1000" | "1001",
                                            "11" when others;

  nR(wE+wF downto 0) <= nRn(wE+wF downto 0);
end architecture;
