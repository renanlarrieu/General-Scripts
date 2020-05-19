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

entity Test_Core is
  generic ( wAddr      : positive;
            wInVal     : positive;
            wOutVal    : positive;
            latency    : positive := 1;
            throughput : positive := 1;
            bundle     : positive := 1 );
  port ( clk : in  std_logic;
         rst : in  std_logic;
         err : out std_logic );
end entity;

architecture arch of Test_Core is
  component TestOp is
    port ( inVal  : in  std_logic_vector(wInVal-1 downto 0);
           outVal : out std_logic_vector(wOutVal-1 downto 0);
           load   : in  std_logic;
           clk    : in  std_logic );
  end component;

  component TestROM is
    port ( addr   : in  std_logic_vector(wAddr-1 downto 0);
           inVal  : out std_logic_vector(wInVal-1 downto 0);
           outVal : out std_logic_vector(wOutVal-1 downto 0) );
  end component;

  component Comparator is
    port ( nA : in  std_logic_vector(wOutVal-1 downto 0);
           nB : in  std_logic_vector(wOutVal-1 downto 0);
           eq : out std_logic );
  end component;

  signal n1   : std_logic_vector(wAddr-1 downto 0);
  signal n2   : std_logic_vector(wAddr-1 downto 0);
  signal addr : std_logic_vector(wAddr-1 downto 0);

  signal inVal0   : std_logic_vector(wInVal-1 downto 0);
  signal inVal    : std_logic_vector(wInVal-1 downto 0);
  signal predVal0 : std_logic_vector(wOutVal-1 downto 0);
  signal predVal  : std_logic_vector(wOutVal-1 downto 0);
  signal outVal   : std_logic_vector(wOutVal-1 downto 0);

  signal eq       : std_logic;

  signal err1 : std_logic;
  signal err2 : std_logic;
  signal err3 : std_logic;

  signal load        : std_logic;
  signal rstBuff     : std_logic;
  signal validBuff   : std_logic_vector(latency-1 downto 0);
  signal loadBuff    : std_logic_vector(throughput-1 downto 0);
  signal bundleBuff  : std_logic_vector(bundle-1 downto 0);
  signal addrBuff    : std_logic_vector(latency*wAddr-1 downto 0);
  signal inValBuff   : std_logic_vector(latency*wInVal-1 downto 0);
  signal predValBuff : std_logic_vector(latency*wOutVal-1 downto 0);
begin
  inValBuff(latency*wInVal-1 downto (latency-1)*wInVal) <= inVal0;
  inVal <= inValBuff(wInVal-1 downto 0);
  addrBuff(latency*wAddr-1 downto (latency-1)*wAddr) <= n2;
  addr <= addrBuff(wAddr-1 downto 0);

  with rst select
    n1 <= (others => '0') when '1',
          n2 + load       when others;

  with rst select
    err1 <= '0'  when '1',
            err3 when others;

  process(clk)
  begin
    if clk'event and clk='1' then
      n2 <= n1;
      err2 <= err1;
      rstBuff <= rst;
    end if;
  end process;

  load_sig1 : if throughput = 1 generate
    loadBuff(throughput-1) <= '1';
  end generate;
  load_sig2 : if throughput > 1 generate
    loadBuff(throughput-1) <= '1' when loadBuff(throughput-2 downto 0) = (throughput-2 downto 0 => '0') else
                              rstBuff;
  end generate;
  bundleBuff(bundle-1) <= loadBuff(throughput-1);
  load <= rst when bundleBuff(bundle-1 downto 0) = (bundle-1 downto 0 => '0') else
          not rst;
  validBuff(latency-1) <= load;

  rom : TestROM
    port map ( addr   => n2,
               inVal  => inVal0,
               outVal => predVal0 );

  op : TestOp
    port map ( inVal  => inVal0,
               outVal => outVal,
               load   => load,
               clk    => clk );

  predValBuff(latency*wOutVal-1 downto (latency-1)*wOutVal) <= predVal0;
  predVal <= predValBuff(wOutVal-1 downto 0);

  comp : Comparator
    port map ( nA => outVal,
               nB => predVal,
               eq => eq );

  with err2 select
  err3 <= '1'                     when '1',
          validBuff(0) and not eq when others;
  err <= err3;

  process(clk)
  begin
    if clk'event and clk='1' then
      addrBuff((latency-1)*wAddr-1 downto 0) <= addrBuff(latency*wAddr-1 downto wAddr);
      inValBuff((latency-1)*wInVal-1 downto 0) <= inValBuff(latency*wInVal-1 downto wInVal);
      predValBuff((latency-1)*wOutVal-1 downto 0) <= predValBuff(latency*wOutVal-1 downto wOutVal);
      loadBuff(throughput-2 downto 0) <= loadBuff(throughput-1 downto 1);
      bundleBuff(bundle-2 downto 0) <= bundleBuff(bundle-1 downto 1);
      validBuff(latency-2 downto 0) <= validBuff(latency-1 downto 1);
    end if;
  end process;
end architecture;
