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

entity LNSAdd_Clk is
  generic ( wE : positive := 6;
            wF : positive := 13 );
  port ( nA  : in  std_logic_vector(wE+wF+2 downto 0);
         nB  : in  std_logic_vector(wE+wF+2 downto 0);
         nR  : out std_logic_vector(wE+wF+2 downto 0);
         clk : in  std_logic );
end entity;

architecture arch of LNSAdd_Clk is
  constant wEssZero : positive := min(wE, log(wF+1)+1)+wF;

  signal nA_1 : std_logic_vector(wE+wF+2 downto 0);
  signal nB_1 : std_logic_vector(wE+wF+2 downto 0);
  
  signal sAB_1  : std_logic;
  signal sAB_2  : std_logic;
  signal sAB_10 : std_logic;
  signal sAB_11 : std_logic;

  signal nA0_1  : std_logic_vector(wE+wF+2 downto 0);
  signal nA0_2  : std_logic_vector(wE+wF+2 downto 0);
  signal nA0_10 : std_logic_vector(wE+wF+2 downto 0);
  signal nA0_11 : std_logic_vector(wE+wF+2 downto 0);
  signal nB0_1  : std_logic_vector(wE+wF+2 downto 0);
  signal nB0_2  : std_logic_vector(wE+wF+2 downto 0);
  signal nB0_10 : std_logic_vector(wE+wF+2 downto 0);
  signal nB0_11 : std_logic_vector(wE+wF+2 downto 0);
  signal eA1_11 : std_logic_vector(wE+wF+1 downto 0);

  signal eDiffNul_2   : std_logic;
  signal eDiffNul_10  : std_logic;
  signal eDiffNul_11  : std_logic;
  signal eDiffEssZ_2  : std_logic;
  signal eDiffEssZ_10 : std_logic;
  signal eDiffEssZ_11 : std_logic;
  
  signal eDiff_1  : std_logic_vector(wE+wF-1 downto 0);
  signal eDiff_2  : std_logic_vector(wE+wF-1 downto 0);
  signal eDiff_10 : std_logic_vector(wE+wF-1 downto 0);
  signal eDiff_11 : std_logic_vector(wE+wF-1 downto 0);
  signal eRa0_10  : std_logic_vector(wF downto 0);
  signal eRa0_11  : std_logic_vector(wF downto 0);
  signal eRa1_11  : std_logic_vector(wF downto 0);
  signal eRs0_10  : std_logic_vector(wE+wF downto 0);
  signal eRs0_11  : std_logic_vector(wE+wF downto 0);
  signal eRs1_11  : std_logic_vector(wE+wF downto 0);
  signal eR1_11   : std_logic_vector(wE+wF+1 downto 0);

  signal sRn_11 : std_logic;
  signal eRn_11 : std_logic_vector(wE+wF+1 downto 0);
  signal xRn_11 : std_logic_vector(1 downto 0);
  signal nRn_11 : std_logic_vector(wE+wF+2 downto 0);

  signal xAB_11 : std_logic_vector(3 downto 0);

  signal nR_11 : std_logic_vector(wE+wF+2 downto 0);
begin
  nA_1 <= nA;
  nB_1 <= nB;
  
  sAB_1 <= nA_1(wE+wF) xor nB_1(wE+wF);

  swap : LNSAdd_Swap
    generic map ( wE => wE,
                  wF => wF )
    port map ( nA => nA_1,
               nB => nB_1,
               nR => nA0_1,
               nS => nB0_1,
               eD => eDiff_1 );

  process(clk)
  begin
    if clk'event and clk='1' then
      sAB_2   <= sAB_1;
      nA0_2   <= nA0_1;
      nB0_2   <= nB0_1;
      eDiff_2 <= eDiff_1;
    end if;
  end process;

  eDiffNul_2 <= '1' when eDiff_2 = (wE+wF-1 downto 0 => '0') else
                '0';
  ess_zero : if wEssZero < wE+wF generate
    eDiffEssZ_2 <= '1' when eDiff_2(wE+wF-1 downto wEssZero) /= (wE+wF-1 downto wEssZero => '1') else
                   '0';
  end generate;
  no_ess_zero : if wEssZero >= wE+wF generate
    eDiffEssZ_2 <= '0';
  end generate;
  
  add_tbl : LNSAdd_Add_Clk
    generic map ( wE => wE,
                  wF => wF )
    port map ( x   => eDiff_2(wEssZero-1 downto 0),
               r   => eRa0_10,
               clk => clk );

  sub_tbl : LNSAdd_Sub_Clk
    generic map ( wE => wE,
                  wF => wF )
    port map ( x   => eDiff_2(wEssZero-1 downto 0),
               r   => eRs0_10,
               clk => clk );
--  process(clk)
--  begin
--    if clk'event and clk='1' then
--      eRa0_10 <= eDiff_2(wF downto 0);
--      eRs0_10 <= eDiff_2 & eDiff_2(2);
--    end if;
--  end process;

  sab_delay : Delay
    generic map ( w => 1,
                  n => addLatency(wF) )
    port map ( input(0)  => sAB_2, ---------------------------------------------
               output(0) => sAB_10, --------------------------------------------
               clk       => clk );
  
  na0_delay : Delay
    generic map ( w => wE+wF+3,
                  n => addLatency(wF) )
    port map ( input  => nA0_2, ------------------------------------------------
               output => nA0_10, -----------------------------------------------
               clk    => clk );
  
  nb0_delay : Delay
    generic map ( w => wE+wF+3,
                  n => addLatency(wF) )
    port map ( input  => nB0_2, ------------------------------------------------
               output => nB0_10, -----------------------------------------------
               clk    => clk );
  
  nul_delay : Delay
    generic map ( w => 1,
                  n => addLatency(wF) )
    port map ( input(0)  => eDiffNul_2, ----------------------------------------
               output(0) => eDiffNul_10, ---------------------------------------
               clk       => clk );
  
  essz_delay : Delay
    generic map ( w => 1,
                  n => addLatency(wF) )
    port map ( input(0)  => eDiffEssZ_2, ---------------------------------------
               output(0) => eDiffEssZ_10, --------------------------------------
               clk       => clk );
  
  process(clk)
  begin
    if clk'event and clk='1' then
      sAB_11       <= sAB_10;
      nA0_11       <= nA0_10;
      nB0_11       <= nB0_10;
      eDiffNul_11  <= eDiffNul_10;
      eDiffEssZ_11 <= eDiffEssZ_10;
      eRa0_11      <= eRa0_10;
      eRs0_11      <= eRs0_10;
    end if;
  end process;

  eRa1_11 <= "1" & (wF-1 downto 0 => '0') when eDiffNul_11 = '1'  else
             (wF downto 0 => '0')         when eDiffEssZ_11 = '1' else
             eRa0_11;
  eRs1_11 <= (wE+wF downto 0 => '1') when eDiffNul_11 = '1'  else
             (wE+wF downto 0 => '0') when eDiffEssZ_11 = '1' else
             eRs0_11;

  eA1_11 <= nA0_11(wE+wF-1) & nA0_11(wE+wF-1) & nA0_11(wE+wF-1 downto 0);
  with sAB_11 select
    eR1_11 <= (wE+wF+1 downto wF+1 => '0') & eRa1_11 when '0',
              "0" & eRs1_11                                  when others;
  
  sRn_11 <= nA0_11(wE+wF);
  with sAB_11 select
    eRn_11 <= eA1_11 + eR1_11 when '0',
              eA1_11 - eR1_11 when others;
  xRn_11 <= "00" when eRn_11(wE+wF+1) = '1' and eRn_11(wE+wF downto wE+wF-1) /= "11" else
            "10" when eRn_11(wE+wF+1) = '0' and eRn_11(wE+wF downto wE+wF-1) /= "00" else
            "01";
  nRn_11 <= xRn_11 & sRn_11 & eRn_11(wE+wF-1 downto 0);

  xAB_11 <= nA0_11(wE+wF+2 downto wE+wF+1) & nB0_11(wE+wF+2 downto wE+wF+1);
  
  with xAB_11 select
    nR_11(wE+wF+2 downto wE+wF+1) <= xRn_11             when "0101",
                                               "1" & sAB_11       when "1010",
                                               "11"               when "1011",
                                               xAB_11(3 downto 2) when others;
  with xAB_11 select
    nR_11(wE+wF) <= nRn_11(wE+wF)                        when "0101",
                         nA0_11(wE+wF) and nB0_11(wE+wF) when "0000",
                         nA0_11(wE+wF)                        when others;

  with xAB_11 select
    nR_11(wE+wF-1 downto 0) <= nRn_11(wE+wF-1 downto 0) when "0101",
                                    nA0_11(wE+wF-1 downto 0) when others;
  
  nR <= nR_11;
end architecture;
