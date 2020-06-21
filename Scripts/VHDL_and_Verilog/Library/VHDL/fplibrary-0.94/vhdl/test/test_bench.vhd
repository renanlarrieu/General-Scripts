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


library fplib;
use fplib.pkg_fplib.all;
library work;
use work.pkg_test.all;

-- Test configuration for LNSAdd_Clk, with wE = 8, wF = 23
configuration Test_Bench of Test is
  for arch
    for all : TestCore
      use entity work.Test_LNSAddCore(arch)
        generic map ( wAddr      => 10,
                      wInVal     => 68,
                      wOutVal    => 34,
                      latency    => fplib.pkg_lnsadd.addLatency(23) + 3 );
      for arch
        for all : TestOp
          use entity work.Test_Op(arch)
            generic map ( wE => 8,
                          wF => 23,
                          nVal  => 2 );
          for arch
            for all : TestOpCore
              use entity fplib.LNSAdd_Clk(arch)
                generic map ( wE => 8,
                              wF => 23 )
                port map ( nA   => inVal(67 downto 34),
                           nB   => inVal(33 downto 0),
                           nR   => outVal,
                           clk  => clk );
            end for;
          end for;
        end for;
        for all : TestROM
          use entity work.Test_ROM(arch);
        end for;
        for all : Comparator
          use entity work.Test_LNSAddComparator(arch)
            generic map ( wE => 8,
                          wF => 23 );
        end for;
      end for;
    end for;
  end for;
end configuration;
