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
library fplib;
use fplib.pkg_misc.all;
use fplib.pkg_lnsadd_table.all;

entity LNSAdd_Add_Clk is
  generic ( wE : positive;
            wF : positive );
  port ( x   : in  std_logic_vector(min(wE,log(wF+1)+1)+wF-1 downto 0);
         r   : out std_logic_vector(wF downto 0);
         clk : in  std_logic );
end entity;

architecture arch of LNSAdd_Add_Clk is
  constant wI        : positive := log(wF+1)+1+wF;
  constant wEssZero  : positive := min(wI, wE+wF);
  constant wO        : positive := wF+1;
  constant wOm       : positive := wF+1;

  signal x0 : std_logic_vector(wI-1 downto 0);
  signal r0 : std_logic_vector(wOm-1 downto 0);
begin
  pad_x : if wI > wEssZero generate
    x0 <= (wI-1 downto wEssZero => '1') & x;
  end generate;
  nopad_x : if wI = wEssZero generate
    x0 <= x;
  end generate;

  tbl_3_6 : if wE = 3 and wF = 6 generate
    table : LNSAdd_MPT_6_Clk
      port map ( x   => x0,
                 r   => r0(LNSAdd_MPT_6_wO-1 downto 0),
                 clk => clk );
    pad_r : if wOm > LNSAdd_MPT_6_wO generate
      r0(wOm-1 downto LNSAdd_MPT_6_wO) <= (wOm-1 downto LNSAdd_MPT_6_wO => '0');
    end generate;
  end generate;
  tbl_3_7 : if wE = 3 and wF = 7 generate
    table : LNSAdd_MPT_7_Clk
      port map ( x   => x0,
                 r   => r0(LNSAdd_MPT_7_wO-1 downto 0),
                 clk => clk );
    pad_r : if wOm > LNSAdd_MPT_7_wO generate
      r0(wOm-1 downto LNSAdd_MPT_7_wO) <= (wOm-1 downto LNSAdd_MPT_7_wO => '0');
    end generate;
  end generate;
  tbl_3_8 : if wE = 3 and wF = 8 generate
    table : LNSAdd_MPT_8_Clk
      port map ( x   => x0,
                 r   => r0(LNSAdd_MPT_8_wO-1 downto 0),
                 clk => clk );
    pad_r : if wOm > LNSAdd_MPT_8_wO generate
      r0(wOm-1 downto LNSAdd_MPT_8_wO) <= (wOm-1 downto LNSAdd_MPT_8_wO => '0');
    end generate;
  end generate;
  tbl_3_9 : if wE = 3 and wF = 9 generate
    table : LNSAdd_MPT_9_Clk
      port map ( x   => x0,
                 r   => r0(LNSAdd_MPT_9_wO-1 downto 0),
                 clk => clk );
    pad_r : if wOm > LNSAdd_MPT_9_wO generate
      r0(wOm-1 downto LNSAdd_MPT_9_wO) <= (wOm-1 downto LNSAdd_MPT_9_wO => '0');
    end generate;
  end generate;
  tbl_3_10 : if wE = 3 and wF = 10 generate
    table : LNSAdd_MPT_10_Clk
      port map ( x   => x0,
                 r   => r0(LNSAdd_MPT_10_wO-1 downto 0),
                 clk => clk );
    pad_r : if wOm > LNSAdd_MPT_10_wO generate
      r0(wOm-1 downto LNSAdd_MPT_10_wO) <= (wOm-1 downto LNSAdd_MPT_10_wO => '0');
    end generate;
  end generate;
  tbl_3_11 : if wE = 3 and wF = 11 generate
    table : LNSAdd_MPT_11_Clk
      port map ( x   => x0,
                 r   => r0(LNSAdd_MPT_11_wO-1 downto 0),
                 clk => clk );
    pad_r : if wOm > LNSAdd_MPT_11_wO generate
      r0(wOm-1 downto LNSAdd_MPT_11_wO) <= (wOm-1 downto LNSAdd_MPT_11_wO => '0');
    end generate;
  end generate;
  tbl_3_12 : if wE = 3 and wF = 12 generate
    table : LNSAdd_MPT_12_Clk
      port map ( x   => x0,
                 r   => r0(LNSAdd_MPT_12_wO-1 downto 0),
                 clk => clk );
    pad_r : if wOm > LNSAdd_MPT_12_wO generate
      r0(wOm-1 downto LNSAdd_MPT_12_wO) <= (wOm-1 downto LNSAdd_MPT_12_wO => '0');
    end generate;
  end generate;
  tbl_3_13 : if wE = 3 and wF = 13 generate
    table : LNSAdd_MPT_13_Clk
      port map ( x   => x0,
                 r   => r0(LNSAdd_MPT_13_wO-1 downto 0),
                 clk => clk );
    pad_r : if wOm > LNSAdd_MPT_13_wO generate
      r0(wOm-1 downto LNSAdd_MPT_13_wO) <= (wOm-1 downto LNSAdd_MPT_13_wO => '0');
    end generate;
  end generate;
  tbl_4_6 : if wE = 4 and wF = 6 generate
    table : LNSAdd_MPT_6_Clk
      port map ( x   => x0,
                 r   => r0(LNSAdd_MPT_6_wO-1 downto 0),
                 clk => clk );
    pad_r : if wOm > LNSAdd_MPT_6_wO generate
      r0(wOm-1 downto LNSAdd_MPT_6_wO) <= (wOm-1 downto LNSAdd_MPT_6_wO => '0');
    end generate;
  end generate;
  tbl_4_7 : if wE = 4 and wF = 7 generate
    table : LNSAdd_MPT_7_Clk
      port map ( x   => x0,
                 r   => r0(LNSAdd_MPT_7_wO-1 downto 0),
                 clk => clk );
    pad_r : if wOm > LNSAdd_MPT_7_wO generate
      r0(wOm-1 downto LNSAdd_MPT_7_wO) <= (wOm-1 downto LNSAdd_MPT_7_wO => '0');
    end generate;
  end generate;
  tbl_4_8 : if wE = 4 and wF = 8 generate
    table : LNSAdd_MPT_8_Clk
      port map ( x   => x0,
                 r   => r0(LNSAdd_MPT_8_wO-1 downto 0),
                 clk => clk );
    pad_r : if wOm > LNSAdd_MPT_8_wO generate
      r0(wOm-1 downto LNSAdd_MPT_8_wO) <= (wOm-1 downto LNSAdd_MPT_8_wO => '0');
    end generate;
  end generate;
  tbl_4_9 : if wE = 4 and wF = 9 generate
    table : LNSAdd_MPT_9_Clk
      port map ( x   => x0,
                 r   => r0(LNSAdd_MPT_9_wO-1 downto 0),
                 clk => clk );
    pad_r : if wOm > LNSAdd_MPT_9_wO generate
      r0(wOm-1 downto LNSAdd_MPT_9_wO) <= (wOm-1 downto LNSAdd_MPT_9_wO => '0');
    end generate;
  end generate;
  tbl_4_10 : if wE = 4 and wF = 10 generate
    table : LNSAdd_MPT_10_Clk
      port map ( x   => x0,
                 r   => r0(LNSAdd_MPT_10_wO-1 downto 0),
                 clk => clk );
    pad_r : if wOm > LNSAdd_MPT_10_wO generate
      r0(wOm-1 downto LNSAdd_MPT_10_wO) <= (wOm-1 downto LNSAdd_MPT_10_wO => '0');
    end generate;
  end generate;
  tbl_4_11 : if wE = 4 and wF = 11 generate
    table : LNSAdd_MPT_11_Clk
      port map ( x   => x0,
                 r   => r0(LNSAdd_MPT_11_wO-1 downto 0),
                 clk => clk );
    pad_r : if wOm > LNSAdd_MPT_11_wO generate
      r0(wOm-1 downto LNSAdd_MPT_11_wO) <= (wOm-1 downto LNSAdd_MPT_11_wO => '0');
    end generate;
  end generate;
  tbl_4_12 : if wE = 4 and wF = 12 generate
    table : LNSAdd_MPT_12_Clk
      port map ( x   => x0,
                 r   => r0(LNSAdd_MPT_12_wO-1 downto 0),
                 clk => clk );
    pad_r : if wOm > LNSAdd_MPT_12_wO generate
      r0(wOm-1 downto LNSAdd_MPT_12_wO) <= (wOm-1 downto LNSAdd_MPT_12_wO => '0');
    end generate;
  end generate;
  tbl_4_13 : if wE = 4 and wF = 13 generate
    table : LNSAdd_MPT_13_Clk
      port map ( x   => x0,
                 r   => r0(LNSAdd_MPT_13_wO-1 downto 0),
                 clk => clk );
    pad_r : if wOm > LNSAdd_MPT_13_wO generate
      r0(wOm-1 downto LNSAdd_MPT_13_wO) <= (wOm-1 downto LNSAdd_MPT_13_wO => '0');
    end generate;
  end generate;
  tbl_5_6 : if wE = 5 and wF = 6 generate
    table : LNSAdd_MPT_6_Clk
      port map ( x   => x0,
                 r   => r0(LNSAdd_MPT_6_wO-1 downto 0),
                 clk => clk );
    pad_r : if wOm > LNSAdd_MPT_6_wO generate
      r0(wOm-1 downto LNSAdd_MPT_6_wO) <= (wOm-1 downto LNSAdd_MPT_6_wO => '0');
    end generate;
  end generate;
  tbl_5_7 : if wE = 5 and wF = 7 generate
    table : LNSAdd_MPT_7_Clk
      port map ( x   => x0,
                 r   => r0(LNSAdd_MPT_7_wO-1 downto 0),
                 clk => clk );
    pad_r : if wOm > LNSAdd_MPT_7_wO generate
      r0(wOm-1 downto LNSAdd_MPT_7_wO) <= (wOm-1 downto LNSAdd_MPT_7_wO => '0');
    end generate;
  end generate;
  tbl_5_8 : if wE = 5 and wF = 8 generate
    table : LNSAdd_MPT_8_Clk
      port map ( x   => x0,
                 r   => r0(LNSAdd_MPT_8_wO-1 downto 0),
                 clk => clk );
    pad_r : if wOm > LNSAdd_MPT_8_wO generate
      r0(wOm-1 downto LNSAdd_MPT_8_wO) <= (wOm-1 downto LNSAdd_MPT_8_wO => '0');
    end generate;
  end generate;
  tbl_5_9 : if wE = 5 and wF = 9 generate
    table : LNSAdd_MPT_9_Clk
      port map ( x   => x0,
                 r   => r0(LNSAdd_MPT_9_wO-1 downto 0),
                 clk => clk );
    pad_r : if wOm > LNSAdd_MPT_9_wO generate
      r0(wOm-1 downto LNSAdd_MPT_9_wO) <= (wOm-1 downto LNSAdd_MPT_9_wO => '0');
    end generate;
  end generate;
  tbl_5_10 : if wE = 5 and wF = 10 generate
    table : LNSAdd_MPT_10_Clk
      port map ( x   => x0,
                 r   => r0(LNSAdd_MPT_10_wO-1 downto 0),
                 clk => clk );
    pad_r : if wOm > LNSAdd_MPT_10_wO generate
      r0(wOm-1 downto LNSAdd_MPT_10_wO) <= (wOm-1 downto LNSAdd_MPT_10_wO => '0');
    end generate;
  end generate;
  tbl_5_11 : if wE = 5 and wF = 11 generate
    table : LNSAdd_MPT_11_Clk
      port map ( x   => x0,
                 r   => r0(LNSAdd_MPT_11_wO-1 downto 0),
                 clk => clk );
    pad_r : if wOm > LNSAdd_MPT_11_wO generate
      r0(wOm-1 downto LNSAdd_MPT_11_wO) <= (wOm-1 downto LNSAdd_MPT_11_wO => '0');
    end generate;
  end generate;
  tbl_5_12 : if wE = 5 and wF = 12 generate
    table : LNSAdd_MPT_12_Clk
      port map ( x   => x0,
                 r   => r0(LNSAdd_MPT_12_wO-1 downto 0),
                 clk => clk );
    pad_r : if wOm > LNSAdd_MPT_12_wO generate
      r0(wOm-1 downto LNSAdd_MPT_12_wO) <= (wOm-1 downto LNSAdd_MPT_12_wO => '0');
    end generate;
  end generate;
  tbl_5_13 : if wE = 5 and wF = 13 generate
    table : LNSAdd_MPT_13_Clk
      port map ( x   => x0,
                 r   => r0(LNSAdd_MPT_13_wO-1 downto 0),
                 clk => clk );
    pad_r : if wOm > LNSAdd_MPT_13_wO generate
      r0(wOm-1 downto LNSAdd_MPT_13_wO) <= (wOm-1 downto LNSAdd_MPT_13_wO => '0');
    end generate;
  end generate;
  tbl_6_6 : if wE = 6 and wF = 6 generate
    table : LNSAdd_MPT_6_Clk
      port map ( x   => x0,
                 r   => r0(LNSAdd_MPT_6_wO-1 downto 0),
                 clk => clk );
    pad_r : if wOm > LNSAdd_MPT_6_wO generate
      r0(wOm-1 downto LNSAdd_MPT_6_wO) <= (wOm-1 downto LNSAdd_MPT_6_wO => '0');
    end generate;
  end generate;
  tbl_6_7 : if wE = 6 and wF = 7 generate
    table : LNSAdd_MPT_7_Clk
      port map ( x   => x0,
                 r   => r0(LNSAdd_MPT_7_wO-1 downto 0),
                 clk => clk );
    pad_r : if wOm > LNSAdd_MPT_7_wO generate
      r0(wOm-1 downto LNSAdd_MPT_7_wO) <= (wOm-1 downto LNSAdd_MPT_7_wO => '0');
    end generate;
  end generate;
  tbl_6_8 : if wE = 6 and wF = 8 generate
    table : LNSAdd_MPT_8_Clk
      port map ( x   => x0,
                 r   => r0(LNSAdd_MPT_8_wO-1 downto 0),
                 clk => clk );
    pad_r : if wOm > LNSAdd_MPT_8_wO generate
      r0(wOm-1 downto LNSAdd_MPT_8_wO) <= (wOm-1 downto LNSAdd_MPT_8_wO => '0');
    end generate;
  end generate;
  tbl_6_9 : if wE = 6 and wF = 9 generate
    table : LNSAdd_MPT_9_Clk
      port map ( x   => x0,
                 r   => r0(LNSAdd_MPT_9_wO-1 downto 0),
                 clk => clk );
    pad_r : if wOm > LNSAdd_MPT_9_wO generate
      r0(wOm-1 downto LNSAdd_MPT_9_wO) <= (wOm-1 downto LNSAdd_MPT_9_wO => '0');
    end generate;
  end generate;
  tbl_6_10 : if wE = 6 and wF = 10 generate
    table : LNSAdd_MPT_10_Clk
      port map ( x   => x0,
                 r   => r0(LNSAdd_MPT_10_wO-1 downto 0),
                 clk => clk );
    pad_r : if wOm > LNSAdd_MPT_10_wO generate
      r0(wOm-1 downto LNSAdd_MPT_10_wO) <= (wOm-1 downto LNSAdd_MPT_10_wO => '0');
    end generate;
  end generate;
  tbl_6_11 : if wE = 6 and wF = 11 generate
    table : LNSAdd_MPT_11_Clk
      port map ( x   => x0,
                 r   => r0(LNSAdd_MPT_11_wO-1 downto 0),
                 clk => clk );
    pad_r : if wOm > LNSAdd_MPT_11_wO generate
      r0(wOm-1 downto LNSAdd_MPT_11_wO) <= (wOm-1 downto LNSAdd_MPT_11_wO => '0');
    end generate;
  end generate;
  tbl_6_12 : if wE = 6 and wF = 12 generate
    table : LNSAdd_MPT_12_Clk
      port map ( x   => x0,
                 r   => r0(LNSAdd_MPT_12_wO-1 downto 0),
                 clk => clk );
    pad_r : if wOm > LNSAdd_MPT_12_wO generate
      r0(wOm-1 downto LNSAdd_MPT_12_wO) <= (wOm-1 downto LNSAdd_MPT_12_wO => '0');
    end generate;
  end generate;
  tbl_6_13 : if wE = 6 and wF = 13 generate
    table : LNSAdd_MPT_13_Clk
      port map ( x   => x0,
                 r   => r0(LNSAdd_MPT_13_wO-1 downto 0),
                 clk => clk );
    pad_r : if wOm > LNSAdd_MPT_13_wO generate
      r0(wOm-1 downto LNSAdd_MPT_13_wO) <= (wOm-1 downto LNSAdd_MPT_13_wO => '0');
    end generate;
  end generate;
  tbl_7_6 : if wE = 7 and wF = 6 generate
    table : LNSAdd_MPT_6_Clk
      port map ( x   => x0,
                 r   => r0(LNSAdd_MPT_6_wO-1 downto 0),
                 clk => clk );
    pad_r : if wOm > LNSAdd_MPT_6_wO generate
      r0(wOm-1 downto LNSAdd_MPT_6_wO) <= (wOm-1 downto LNSAdd_MPT_6_wO => '0');
    end generate;
  end generate;
  tbl_7_7 : if wE = 7 and wF = 7 generate
    table : LNSAdd_MPT_7_Clk
      port map ( x   => x0,
                 r   => r0(LNSAdd_MPT_7_wO-1 downto 0),
                 clk => clk );
    pad_r : if wOm > LNSAdd_MPT_7_wO generate
      r0(wOm-1 downto LNSAdd_MPT_7_wO) <= (wOm-1 downto LNSAdd_MPT_7_wO => '0');
    end generate;
  end generate;
  tbl_7_8 : if wE = 7 and wF = 8 generate
    table : LNSAdd_MPT_8_Clk
      port map ( x   => x0,
                 r   => r0(LNSAdd_MPT_8_wO-1 downto 0),
                 clk => clk );
    pad_r : if wOm > LNSAdd_MPT_8_wO generate
      r0(wOm-1 downto LNSAdd_MPT_8_wO) <= (wOm-1 downto LNSAdd_MPT_8_wO => '0');
    end generate;
  end generate;
  tbl_7_9 : if wE = 7 and wF = 9 generate
    table : LNSAdd_MPT_9_Clk
      port map ( x   => x0,
                 r   => r0(LNSAdd_MPT_9_wO-1 downto 0),
                 clk => clk );
    pad_r : if wOm > LNSAdd_MPT_9_wO generate
      r0(wOm-1 downto LNSAdd_MPT_9_wO) <= (wOm-1 downto LNSAdd_MPT_9_wO => '0');
    end generate;
  end generate;
  tbl_7_10 : if wE = 7 and wF = 10 generate
    table : LNSAdd_MPT_10_Clk
      port map ( x   => x0,
                 r   => r0(LNSAdd_MPT_10_wO-1 downto 0),
                 clk => clk );
    pad_r : if wOm > LNSAdd_MPT_10_wO generate
      r0(wOm-1 downto LNSAdd_MPT_10_wO) <= (wOm-1 downto LNSAdd_MPT_10_wO => '0');
    end generate;
  end generate;
  tbl_7_11 : if wE = 7 and wF = 11 generate
    table : LNSAdd_MPT_11_Clk
      port map ( x   => x0,
                 r   => r0(LNSAdd_MPT_11_wO-1 downto 0),
                 clk => clk );
    pad_r : if wOm > LNSAdd_MPT_11_wO generate
      r0(wOm-1 downto LNSAdd_MPT_11_wO) <= (wOm-1 downto LNSAdd_MPT_11_wO => '0');
    end generate;
  end generate;
  tbl_7_12 : if wE = 7 and wF = 12 generate
    table : LNSAdd_MPT_12_Clk
      port map ( x   => x0,
                 r   => r0(LNSAdd_MPT_12_wO-1 downto 0),
                 clk => clk );
    pad_r : if wOm > LNSAdd_MPT_12_wO generate
      r0(wOm-1 downto LNSAdd_MPT_12_wO) <= (wOm-1 downto LNSAdd_MPT_12_wO => '0');
    end generate;
  end generate;
  tbl_7_13 : if wE = 7 and wF = 13 generate
    table : LNSAdd_MPT_13_Clk
      port map ( x   => x0,
                 r   => r0(LNSAdd_MPT_13_wO-1 downto 0),
                 clk => clk );
    pad_r : if wOm > LNSAdd_MPT_13_wO generate
      r0(wOm-1 downto LNSAdd_MPT_13_wO) <= (wOm-1 downto LNSAdd_MPT_13_wO => '0');
    end generate;
  end generate;
  tbl_8_6 : if wE = 8 and wF = 6 generate
    table : LNSAdd_MPT_6_Clk
      port map ( x   => x0,
                 r   => r0(LNSAdd_MPT_6_wO-1 downto 0),
                 clk => clk );
    pad_r : if wOm > LNSAdd_MPT_6_wO generate
      r0(wOm-1 downto LNSAdd_MPT_6_wO) <= (wOm-1 downto LNSAdd_MPT_6_wO => '0');
    end generate;
  end generate;
  tbl_8_7 : if wE = 8 and wF = 7 generate
    table : LNSAdd_MPT_7_Clk
      port map ( x   => x0,
                 r   => r0(LNSAdd_MPT_7_wO-1 downto 0),
                 clk => clk );
    pad_r : if wOm > LNSAdd_MPT_7_wO generate
      r0(wOm-1 downto LNSAdd_MPT_7_wO) <= (wOm-1 downto LNSAdd_MPT_7_wO => '0');
    end generate;
  end generate;
  tbl_8_8 : if wE = 8 and wF = 8 generate
    table : LNSAdd_MPT_8_Clk
      port map ( x   => x0,
                 r   => r0(LNSAdd_MPT_8_wO-1 downto 0),
                 clk => clk );
    pad_r : if wOm > LNSAdd_MPT_8_wO generate
      r0(wOm-1 downto LNSAdd_MPT_8_wO) <= (wOm-1 downto LNSAdd_MPT_8_wO => '0');
    end generate;
  end generate;
  tbl_8_9 : if wE = 8 and wF = 9 generate
    table : LNSAdd_MPT_9_Clk
      port map ( x   => x0,
                 r   => r0(LNSAdd_MPT_9_wO-1 downto 0),
                 clk => clk );
    pad_r : if wOm > LNSAdd_MPT_9_wO generate
      r0(wOm-1 downto LNSAdd_MPT_9_wO) <= (wOm-1 downto LNSAdd_MPT_9_wO => '0');
    end generate;
  end generate;
  tbl_8_10 : if wE = 8 and wF = 10 generate
    table : LNSAdd_MPT_10_Clk
      port map ( x   => x0,
                 r   => r0(LNSAdd_MPT_10_wO-1 downto 0),
                 clk => clk );
    pad_r : if wOm > LNSAdd_MPT_10_wO generate
      r0(wOm-1 downto LNSAdd_MPT_10_wO) <= (wOm-1 downto LNSAdd_MPT_10_wO => '0');
    end generate;
  end generate;
  tbl_8_11 : if wE = 8 and wF = 11 generate
    table : LNSAdd_MPT_11_Clk
      port map ( x   => x0,
                 r   => r0(LNSAdd_MPT_11_wO-1 downto 0),
                 clk => clk );
    pad_r : if wOm > LNSAdd_MPT_11_wO generate
      r0(wOm-1 downto LNSAdd_MPT_11_wO) <= (wOm-1 downto LNSAdd_MPT_11_wO => '0');
    end generate;
  end generate;
  tbl_8_12 : if wE = 8 and wF = 12 generate
    table : LNSAdd_MPT_12_Clk
      port map ( x   => x0,
                 r   => r0(LNSAdd_MPT_12_wO-1 downto 0),
                 clk => clk );
    pad_r : if wOm > LNSAdd_MPT_12_wO generate
      r0(wOm-1 downto LNSAdd_MPT_12_wO) <= (wOm-1 downto LNSAdd_MPT_12_wO => '0');
    end generate;
  end generate;
  tbl_8_13 : if wE = 8 and wF = 13 generate
    table : LNSAdd_MPT_13_Clk
      port map ( x   => x0,
                 r   => r0(LNSAdd_MPT_13_wO-1 downto 0),
                 clk => clk );
    pad_r : if wOm > LNSAdd_MPT_13_wO generate
      r0(wOm-1 downto LNSAdd_MPT_13_wO) <= (wOm-1 downto LNSAdd_MPT_13_wO => '0');
    end generate;
  end generate;

  r <= r0;
end architecture;
