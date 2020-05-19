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

entity LNSSqrt_Clk is
  generic ( wE : positive := 6;
            wF : positive := 13 );
  port ( nA  : in  std_logic_vector(wE+wF+2 downto 0);
         nR  : out std_logic_vector(wE+wF+2 downto 0);
         clk : in  std_logic );
end entity;

architecture arch of LNSSqrt_Clk is
  signal sRn : std_logic;
  signal eRn : std_logic_vector(wE+wF-1 downto 0);
  signal xRn : std_logic_vector(1 downto 0);
  signal nRn : std_logic_vector(wE+wF+2 downto 0);
  signal nRx : std_logic_vector(wE+wF+2 downto 0);

  signal xsA  : std_logic_vector(2 downto 0);
begin
  eRn <= nA(wE+wF-1) & nA(wE+wF-1 downto 1);

  sRn <= nA(wE+wF);
  xRn <= "01";
  nRn <= xRn & sRn & eRn;

  xsA <= nA(wE+wF+2 downto wE+wF);

  with xsA select
    nR(wE+wF+2 downto wE+wF+1) <= xsA(2 downto 1) when "001" | "000" | "010" | "100",
                                            "11"            when others;

  nR(wE+wF downto 0) <= nRn(wE+wF downto 0);
end architecture;
