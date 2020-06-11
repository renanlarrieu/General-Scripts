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
use fplib.pkg_fplib.all;
use fplib.pkg_misc.all;
library work;
use work.pkg_harness.all;

entity DotProdP is
  generic ( fmt : format;
            wE  : positive := 6;
            wF  : positive := 13;
            n   : positive );
  port ( nA1 : in  std_logic_vector(wE+wF+2 downto 0);
         nB1 : in  std_logic_vector(wE+wF+2 downto 0);
         nA2 : in  std_logic_vector(wE+wF+2 downto 0);
         nB2 : in  std_logic_vector(wE+wF+2 downto 0);
         nR  : out std_logic_vector(wE+wF+2 downto 0);
         rst : in  std_logic;
         clk : in  std_logic );
end entity;

architecture arch of DotProdP is
  constant alat : positive := addLatency(fmt,wE,wF);
  constant mlat : positive := mulLatency(fmt,wE,wF);
  constant lat  : positive := (n-1) * (mlat+alat);
  constant wCy : positive := log(lat-1)+1;

  signal nM1A_1 : std_logic_vector(wE+wF+2 downto 0);
  signal nM1B_1 : std_logic_vector(wE+wF+2 downto 0);
  signal nM1R_2 : std_logic_vector(wE+wF+2 downto 0);

  signal nM2A_1 : std_logic_vector(wE+wF+2 downto 0);
  signal nM2B_1 : std_logic_vector(wE+wF+2 downto 0);
  signal nM2R_2 : std_logic_vector(wE+wF+2 downto 0);

  signal nAA_2 : std_logic_vector(wE+wF+2 downto 0);
  signal nAA_3 : std_logic_vector(wE+wF+2 downto 0);
  signal nAB_2 : std_logic_vector(wE+wF+2 downto 0);
  signal nAB_3 : std_logic_vector(wE+wF+2 downto 0);
  signal nAR_4 : std_logic_vector(wE+wF+2 downto 0);
  signal nAR_1 : std_logic_vector(wE+wF+2 downto 0);
  signal nAR_2 : std_logic_vector(wE+wF+2 downto 0);

  signal Cy_1  : std_logic_vector(wCy-1 downto 0);
  signal NCy_1 : std_logic_vector(wCy-1 downto 0);
  signal Cy_2  : std_logic_vector(wCy-1 downto 0);

  signal lastCy_1 : std_logic;
  signal ldM2_1   : std_logic;
begin
  with rst select
    Cy_1 <= (wCy-1 downto 0 => '0') when '1',
            Cy_2                    when others;
  
  lastCy_1 <= '1' when Cy_1 = conv_std_logic_vector(lat-1, wCy) else '0';

  with lastCy_1 select
    NCy_1 <= (wCy-1 downto 0 => '0')                when '1',
             Cy_1 + ((wCy-1 downto 1 => '0') & "1") when others;

  ldM2_1 <= '1' when Cy_1 >= conv_std_logic_vector(mlat-1,        wCy) and
                     Cy_1 <= conv_std_logic_vector(2*mlat+alat-2, wCy) else '0';
  
  process(clk)
  begin
    if clk'event and clk='1' then
      Cy_2    <= NCy_1;
    end if;
  end process;

  nM1A_1 <= nA1;
  nM1B_1 <= nB1;
  nM2A_1 <= nA2;
  nM2B_1 <= nB2;

  mul1 : Mul_Clk
    generic map ( fmt => fmt,
                  wE  => wE,
                  wF  => wF,
                  reg => true )
    port map ( nA  => nM1A_1,
               nB  => nM1B_1,
               nR  => nM1R_2,
               clk => clk );

  mul2 : Mul_Clk
    generic map ( fmt => fmt,
                  wE  => wE,
                  wF  => wF,
                  reg => true )
    port map ( nA  => nM2A_1,
               nB  => nM2B_1,
               nR  => nM2R_2,
               clk => clk );

  dly : Delay
    generic map ( w => wE+wF+3,
                  n => mlat-1 )
    port map ( input  => nAR_1,
               output => nAR_2,
               clk    => clk );

  nAA_2 <= nM1R_2;
  with ldM2_1 select
    nAB_2 <= nM2R_2 when '1',
             nAR_2  when others;
  
  process(clk)
  begin
    if clk'event and clk='1' then
      nAA_3 <= nAA_2;
      nAB_3 <= nAB_2;
    end if;
  end process;

  add : Add_Clk
    generic map ( fmt => fmt,
                  wE  => wE,
                  wF  => wF,
                  reg => true )
    port map ( nA  => nAA_3,
               nB  => nAB_3,
               nR  => nAR_4,
               clk => clk );

  nR <= nAR_4;
  
  process(clk)
  begin
    if clk'event and clk='1' then
      nAR_1 <= nAR_4;
    end if;
  end process;
end architecture;
