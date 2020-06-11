library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library fplib;
use fplib.pkg_lnssub_mpt_6.all;

entity LNSSub_Hybrid_6 is
  generic ( wMPTBreak : positive := 6 );
  port( x : in  std_logic_vector(8 downto 0);
        r : out std_logic_vector(8 downto 0) );
end entity;

architecture arch of LNSSub_Hybrid_6 is

  signal out_t1 : std_logic_vector(2 downto 0);
  signal out_t2 : std_logic_vector(4 downto 0);
  signal out_t3 : std_logic_vector(4 downto 0);
  signal out_t4 : std_logic_vector(4 downto 0);
  signal out_t5 : std_logic_vector(4 downto 0);
  signal out_t6 : std_logic_vector(4 downto 0);
  signal out_t7 : std_logic_vector(4 downto 0);
begin
  inst_t1 : LNSSub_MPT_T1_6
    port map( x => x(7 downto 0),
              r => out_t1 );

  inst_t2 : LNSSub_MPT_T2_6
    port map( x => x(6 downto 0),
              r => out_t2 );

  inst_t3 : LNSSub_MPT_T3_6
    port map( x => x(5 downto 0),
              r => out_t3 );

  inst_t4 : LNSSub_MPT_T4_6
    port map( x => x(4 downto 0),
              r => out_t4 );

  inst_t5 : LNSSub_MPT_T5_6
    port map( x => x(3 downto 0),
              r => out_t5 );

  inst_t6 : LNSSub_MPT_T6_6
    port map( x => x(2 downto 0),
              r => out_t6 );

  inst_t7 : LNSSub_MPT_T7_6
    port map( x => x(2 downto 0),
              r => out_t7 );

  r <= (8 downto 3 => '0') & out_t1
         when x(8) /= '1' or wMPTBreak >= 7 else
       (8 downto 5 => '0') & out_t2
         when x(7) /= '1' or wMPTBreak = 6 else
       (8 downto 6 => '0') & out_t3 & (0 downto 0 => '0')
         when x(6) /= '1' or wMPTBreak = 5 else
       (8 downto 7 => '0') & out_t4 & (1 downto 0 => '0')
         when x(5) /= '1' or wMPTBreak = 4 else
       (8 downto 8 => '0') & out_t5 & (2 downto 0 => '0')
         when x(4) /= '1' or wMPTBreak = 3 else
       (8 downto 8 => '0') & out_t6 & (2 downto 0 => '0')
         when x(3) /= '1' or wMPTBreak = 2 else
       out_t7 & (3 downto 0 => '0');
end architecture;
