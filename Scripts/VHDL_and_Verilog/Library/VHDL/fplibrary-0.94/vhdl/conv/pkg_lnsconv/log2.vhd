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
use fplib.pkg_log2_table.all;

entity Log2 is
  generic ( wF : positive );
  port ( x   : in  std_logic_vector(wF-1 downto 0);
         r   : out std_logic_vector(wF-1 downto 0) );
end entity;

architecture arch of Log2 is
begin
  tbl_6 : if wF = 6 generate
    table : Log2_MPT_6
      port map ( x => x,
                 r => r );
  end generate;
  tbl_7 : if wF = 7 generate
    table : Log2_MPT_7
      port map ( x => x,
                 r => r );
  end generate;
  tbl_8 : if wF = 8 generate
    table : Log2_MPT_8
      port map ( x => x,
                 r => r );
  end generate;
  tbl_9 : if wF = 9 generate
    table : Log2_MPT_9
      port map ( x => x,
                 r => r );
  end generate;
  tbl_10 : if wF = 10 generate
    table : Log2_MPT_10
      port map ( x => x,
                 r => r );
  end generate;
  tbl_11 : if wF = 11 generate
    table : Log2_MPT_11
      port map ( x => x,
                 r => r );
  end generate;
  tbl_12 : if wF = 12 generate
    table : Log2_MPT_12
      port map ( x => x,
                 r => r );
  end generate;
  tbl_13 : if wF = 13 generate
    table : Log2_MPT_13
      port map ( x => x,
                 r => r );
  end generate;
end architecture;
