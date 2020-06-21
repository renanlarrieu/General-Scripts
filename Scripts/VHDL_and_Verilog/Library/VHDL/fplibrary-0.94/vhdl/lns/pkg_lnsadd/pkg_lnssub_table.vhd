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

package pkg_lnssub_table is
  component LNSSub_MPT_6 is
    port( x : in  std_logic_vector(8 downto 0);
          r : out std_logic_vector(8 downto 0) );
  end component;

  component LNSSub_MPT_6_Clk is
    port( x   : in  std_logic_vector(8 downto 0);
          r   : out std_logic_vector(8 downto 0);
          clk : in  std_logic );
  end component;

  constant LNSSub_MPT_6_wO : positive := 9;

  component LNSSub_MPT_7 is
    port( x : in  std_logic_vector(10 downto 0);
          r : out std_logic_vector(9 downto 0) );
  end component;

  component LNSSub_MPT_7_Clk is
    port( x   : in  std_logic_vector(10 downto 0);
          r   : out std_logic_vector(9 downto 0);
          clk : in  std_logic );
  end component;

  constant LNSSub_MPT_7_wO : positive := 10;

  component LNSSub_MPT_8 is
    port( x : in  std_logic_vector(11 downto 0);
          r : out std_logic_vector(11 downto 0) );
  end component;

  component LNSSub_MPT_8_Clk is
    port( x   : in  std_logic_vector(11 downto 0);
          r   : out std_logic_vector(11 downto 0);
          clk : in  std_logic );
  end component;

  constant LNSSub_MPT_8_wO : positive := 12;

  component LNSSub_MPT_9 is
    port( x : in  std_logic_vector(12 downto 0);
          r : out std_logic_vector(12 downto 0) );
  end component;

  component LNSSub_MPT_9_Clk is
    port( x   : in  std_logic_vector(12 downto 0);
          r   : out std_logic_vector(12 downto 0);
          clk : in  std_logic );
  end component;

  constant LNSSub_MPT_9_wO : positive := 13;

  component LNSSub_MPT_10 is
    port( x : in  std_logic_vector(13 downto 0);
          r : out std_logic_vector(13 downto 0) );
  end component;

  component LNSSub_MPT_10_Clk is
    port( x   : in  std_logic_vector(13 downto 0);
          r   : out std_logic_vector(13 downto 0);
          clk : in  std_logic );
  end component;

  constant LNSSub_MPT_10_wO : positive := 14;

  component LNSSub_MPT_11 is
    port( x : in  std_logic_vector(14 downto 0);
          r : out std_logic_vector(14 downto 0) );
  end component;

  component LNSSub_MPT_11_Clk is
    port( x   : in  std_logic_vector(14 downto 0);
          r   : out std_logic_vector(14 downto 0);
          clk : in  std_logic );
  end component;

  constant LNSSub_MPT_11_wO : positive := 15;

  component LNSSub_MPT_12 is
    port( x : in  std_logic_vector(15 downto 0);
          r : out std_logic_vector(15 downto 0) );
  end component;

  component LNSSub_MPT_12_Clk is
    port( x   : in  std_logic_vector(15 downto 0);
          r   : out std_logic_vector(15 downto 0);
          clk : in  std_logic );
  end component;

  constant LNSSub_MPT_12_wO : positive := 16;

  component LNSSub_MPT_13 is
    port( x : in  std_logic_vector(16 downto 0);
          r : out std_logic_vector(16 downto 0) );
  end component;

  component LNSSub_MPT_13_Clk is
    port( x   : in  std_logic_vector(16 downto 0);
          r   : out std_logic_vector(16 downto 0);
          clk : in  std_logic );
  end component;

  constant LNSSub_MPT_13_wO : positive := 17;

  component LNSSub_MNMX_10 is
    port ( x : in  std_logic_vector(13 downto 0);
           r : out std_logic_vector(13 downto 0) );
  end component;
  constant LNSSub_MNMX_10_wO : positive := 14;

  component LNSSub_MNMX_11 is
    port ( x : in  std_logic_vector(14 downto 0);
           r : out std_logic_vector(14 downto 0) );
  end component;
  constant LNSSub_MNMX_11_wO : positive := 15;

  component LNSSub_MNMX_13 is
    port ( x : in  std_logic_vector(16 downto 0);
           r : out std_logic_vector(16 downto 0) );
  end component;
  constant LNSSub_MNMX_13_wO : positive := 17;

end package;
