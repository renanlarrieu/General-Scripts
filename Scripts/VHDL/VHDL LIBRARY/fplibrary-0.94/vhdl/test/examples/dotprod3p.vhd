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

entity DotProd3p is
  generic ( fmt : format := FP;
            wE  : positive := 6;
            wF  : positive := 13 );
  port ( vA  : in  std_logic_vector(3*(wE+wF+3)-1 downto 0);
         vB  : in  std_logic_vector(3*(wE+wF+3)-1 downto 0);
         nR  : out std_logic_vector(wE+wF+2 downto 0);
         ldI : out std_logic;
         ldO : out std_logic;
         rst : in  std_logic;
         clk : in  std_logic );
end entity;

architecture arch of DotProd3p is
  function getLat ( alat, mlat : positive ) return positive is
  begin
    if alat = 3 then
      return     mlat + 2*alat - 1;
    elsif alat = 4 then
      return 1 + mlat + 2*alat - 1;
    end if;
  end function;
  
  constant alat : positive := addLatency(fmt,wE,wF);
  constant mlat : positive := mulLatency(fmt,wE,wF);
  constant lat  : positive := getLat(alat, mlat);
  constant nc   : positive := max(3, log(lat)+1);
  
  signal vA_1  : std_logic_vector(3*(wE+wF+3)-1 downto 0);
  signal vB_1  : std_logic_vector(3*(wE+wF+3)-1 downto 0);
  signal vA3_2 : std_logic_vector(  (wE+wF+3)-1 downto 0);
  signal vB3_2 : std_logic_vector(  (wE+wF+3)-1 downto 0);

  signal nM1A_1  : std_logic_vector(wE+wF+2 downto 0);
  signal nM1B_1  : std_logic_vector(wE+wF+2 downto 0);
  signal nM1R_1  : std_logic_vector(wE+wF+2 downto 0);
  signal nM1Ra_2 : std_logic_vector(wE+wF+2 downto 0);
  signal nM1Rb_2 : std_logic_vector(wE+wF+2 downto 0);
  signal nM1Rb_3 : std_logic_vector(wE+wF+2 downto 0);
  signal nM1Rb_5 : std_logic_vector(wE+wF+2 downto 0);
  
  signal nM2A_1  : std_logic_vector(wE+wF+2 downto 0);
  signal nM2B_1  : std_logic_vector(wE+wF+2 downto 0);
  signal nM2R_1  : std_logic_vector(wE+wF+2 downto 0);
  signal nM2Ra_2 : std_logic_vector(wE+wF+2 downto 0);

  signal nAA_1 : std_logic_vector(wE+wF+2 downto 0);
  signal nAB_1 : std_logic_vector(wE+wF+2 downto 0);
  signal nAR_1 : std_logic_vector(wE+wF+2 downto 0);
  signal nAR_2 : std_logic_vector(wE+wF+2 downto 0);
  
  signal cnt_1   : std_logic_vector(nc-1 downto 0);
  signal cnti_1  : std_logic_vector(nc-1 downto 0);
  signal cnt_2   : std_logic_vector(nc-1 downto 0);

  signal valid0_1 : std_logic;
  signal valid_1  : std_logic;
  signal valid_2  : std_logic;
begin
  with rst select
    cnt_1 <= cnt_2                  when '0',
             (nc-1 downto 0 => '0') when others;

  valid0_1 <= '1' when cnt_1 = conv_std_logic_vector(lat, nc) else '0';
  valid_1 <= (not rst) and (valid_2 or valid0_1);
  
  ldI <= not cnt_1(0);

  ldo_alat3 : if alat = 3 generate
    ldO <= valid_1 when cnt_1(0 downto 0) = conv_std_logic_vector( lat    mod 2, 1) else
           '0';
  end generate;
  
  ldo_alat4 : if alat = 4 generate
    ldO <= valid_1 when cnt_1(2 downto 0) = conv_std_logic_vector( lat    mod 8, 3) or
                        cnt_1(2 downto 0) = conv_std_logic_vector((lat+2) mod 8, 3) or
                        cnt_1(2 downto 0) = conv_std_logic_vector((lat+3) mod 8, 3) or
                        cnt_1(2 downto 0) = conv_std_logic_vector((lat+5) mod 8, 3) else
           '0';
  end generate;

  vA_1 <= vA;
  vB_1 <= vB;

  process(clk)
  begin
    if clk'event and clk='1' then
      vA3_2 <= vA_1(3*(wE+wF+3)-1 downto 2*(wE+wF+3));
      vB3_2 <= vB_1(3*(wE+wF+3)-1 downto 2*(wE+wF+3));
    end if;
  end process;

  nM1A_1 <= vA_1(wE+wF+2 downto 0) when cnt_1(0) = '0' else
            vA3_2;
  nM1B_1 <= vB_1(wE+wF+2 downto 0) when cnt_1(0) = '0' else
            vB3_2;

  mul1 : Mul_Clk
    generic map ( fmt => fmt,
                  wE  => wE,
                  wF  => wF,
                  reg => true )
    port map ( nA  => nM1A_1,
               nB  => nM1B_1,
               nR  => nM1R_1,
               clk => clk );

  nM2A_1 <= vA_1(2*(wE+wF+3)-1 downto wE+wF+3);
  nM2B_1 <= vB_1(2*(wE+wF+3)-1 downto wE+wF+3);
    
  mul2 : Mul_Clk
    generic map ( fmt => fmt,
                  wE  => wE,
                  wF  => wF,
                  reg => true )
    port map ( nA  => nM2A_1,
               nB  => nM2B_1,
               nR  => nM2R_1,
               clk => clk );

  process(clk)
  begin
    if clk'event and clk='1' and cnt_1(0 downto 0) = conv_std_logic_vector((mlat-1) mod 2, 1) then
      nM1Ra_2 <= nM1R_1;
      nM2Ra_2 <= nM2R_1;
    end if;
  end process;

  nm1rb_alat3 : if alat = 3 generate
    process(clk)
    begin
      if clk'event and clk='1' and cnt_1(0 downto 0) = conv_std_logic_vector((mlat-1) mod 2, 1) then
        nM1Rb_3 <= nM1Rb_2;
      end if;
    end process;
  end generate;
  
  nm1rb_alat4 : if alat = 4 generate
    process(clk)
    begin
      if clk'event and clk='1' and cnt_1(0 downto 0) = conv_std_logic_vector((mlat-1) mod 2, 1) then
        nM1Rb_3 <= nM1Rb_2;
        nM1Rb_5 <= nM1Rb_3;
      end if;
    end process;
  end generate;

  process(clk)
  begin
    if clk'event and clk='1' then
      nM1Rb_2 <= nM1R_1;
    end if;
  end process;

  na_alat3 : if alat = 3 generate
    nAA_1 <= nM1Ra_2 when cnt_1(0 downto 0) = conv_std_logic_vector( mlat    mod 2, 1) else
             nAR_2;

    nAB_1 <= nM2Ra_2 when cnt_1(0 downto 0) = conv_std_logic_vector( mlat    mod 2, 1) else
             nM1Rb_3;
  end generate;
  
  na_alat4 : if alat = 4 generate
    nAA_1 <= nM1Ra_2 when cnt_1(2 downto 0) = conv_std_logic_vector((mlat+1) mod 8, 3) or
                          cnt_1(2 downto 0) = conv_std_logic_vector((mlat+3) mod 8, 3) or
                          cnt_1(2 downto 0) = conv_std_logic_vector((mlat+4) mod 8, 3) or
                          cnt_1(2 downto 0) = conv_std_logic_vector((mlat+6) mod 8, 3) else
             nAR_2;

    nAB_1 <= nM2Ra_2 when cnt_1(2 downto 0) = conv_std_logic_vector((mlat+1) mod 8, 3) or
                          cnt_1(2 downto 0) = conv_std_logic_vector((mlat+3) mod 8, 3) or
                          cnt_1(2 downto 0) = conv_std_logic_vector((mlat+4) mod 8, 3) or
                          cnt_1(2 downto 0) = conv_std_logic_vector((mlat+6) mod 8, 3) else
             nM1Rb_5;
  end generate;
  
  add : Add_Clk
    generic map ( fmt => fmt,
                  wE  => wE,
                  wF  => wF,
                  reg => true )
    port map ( nA  => nAA_1,
               nB  => nAB_1,
               nR  => nAR_1,
               clk => clk );

  
  process(clk)
  begin
    if clk'event and clk='1' then
      nAR_2 <= nAR_1;
    end if;
  end process;

  nR <= nAR_1;

  cnti_1 <= cnt_1 + ((nc-1 downto 1 => '0') & "1");
  process(clk)
  begin
    if clk'event and clk='1' then
      cnt_2   <= cnti_1;
      valid_2 <= valid_1;
    end if;
  end process;
end architecture;
