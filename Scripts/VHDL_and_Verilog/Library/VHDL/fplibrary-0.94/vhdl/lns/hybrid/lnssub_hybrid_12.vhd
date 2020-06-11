library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library fplib;
use fplib.pkg_lnssub_mpt_12.all;

entity LNSSub_Hybrid_12 is
  generic ( wMPTBreak : positive := 12 );
  port( x : in  std_logic_vector(15 downto 0);
        r : out std_logic_vector(15 downto 0) );
end entity;

architecture arch of LNSSub_Hybrid_12 is

  signal out_t0 : std_logic_vector(5 downto 0);
  signal out_t1 : std_logic_vector(8 downto 0);
  signal out_t2 : std_logic_vector(10 downto 0);
  signal out_t3 : std_logic_vector(10 downto 0);
  signal out_t4 : std_logic_vector(10 downto 0);
  signal out_t5 : std_logic_vector(10 downto 0);
  signal out_t6 : std_logic_vector(9 downto 0);
  signal out_t7 : std_logic_vector(9 downto 0);
  signal out_t8 : std_logic_vector(8 downto 0);
  signal out_t9 : std_logic_vector(7 downto 0);
  signal out_t10 : std_logic_vector(6 downto 0);
  signal out_t11 : std_logic_vector(6 downto 0);
  signal out_t12 : std_logic_vector(6 downto 0);
begin
  inst_t0 : LNSSub_MPT_T0_12
    port map( x => x,
              r => out_t0 );

  inst_t1 : LNSSub_MPT_T1_12
    port map( x => x(13 downto 0),
              r => out_t1 );

  inst_t2 : LNSSub_MPT_T2_12
    port map( x => x(12 downto 0),
              r => out_t2 );

  inst_t3 : LNSSub_MPT_T3_12
    port map( x => x(11 downto 0),
              r => out_t3 );

  inst_t4 : LNSSub_MPT_T4_12
    port map( x => x(10 downto 0),
              r => out_t4 );

  inst_t5 : LNSSub_MPT_T5_12
    port map( x => x(9 downto 0),
              r => out_t5 );

  inst_t6 : LNSSub_MPT_T6_12
    port map( x => x(8 downto 0),
              r => out_t6 );

  inst_t7 : LNSSub_MPT_T7_12
    port map( x => x(7 downto 0),
              r => out_t7 );

  inst_t8 : LNSSub_MPT_T8_12
    port map( x => x(6 downto 0),
              r => out_t8 );

  inst_t9 : LNSSub_MPT_T9_12
    port map( x => x(5 downto 0),
              r => out_t9 );

  inst_t10 : LNSSub_MPT_T10_12
    port map( x => x(4 downto 0),
              r => out_t10 );

  inst_t11 : LNSSub_MPT_T11_12
    port map( x => x(3 downto 0),
              r => out_t11 );

  inst_t12 : LNSSub_MPT_T12_12
    port map( x => x(3 downto 0),
              r => out_t12 );

  r <= (15 downto 6 => '0') & out_t0
         when x(15 downto 15) /= (15 downto 15 => '1') or wMPTBreak >= 14 else
       (15 downto 9 => '0') & out_t1
         when x(14) /= '1' or wMPTBreak = 13 else
       (15 downto 11 => '0') & out_t2
         when x(13) /= '1' or wMPTBreak = 12 else
       (15 downto 12 => '0') & out_t3 & (0 downto 0 => '0')
         when x(12) /= '1' or wMPTBreak = 11 else
       (15 downto 13 => '0') & out_t4 & (1 downto 0 => '0')
         when x(11) /= '1' or wMPTBreak = 10 else
       (15 downto 14 => '0') & out_t5 & (2 downto 0 => '0')
         when x(10) /= '1' or wMPTBreak = 9 else
       (15 downto 14 => '0') & out_t6 & (3 downto 0 => '0')
         when x(9) /= '1' or wMPTBreak = 8 else
       (15 downto 15 => '0') & out_t7 & (4 downto 0 => '0')
         when x(8) /= '1' or wMPTBreak = 7 else
       (15 downto 15 => '0') & out_t8 & (5 downto 0 => '0')
         when x(7) /= '1' or wMPTBreak = 6 else
       (15 downto 15 => '0') & out_t9 & (6 downto 0 => '0')
         when x(6) /= '1' or wMPTBreak = 5 else
       (15 downto 15 => '0') & out_t10 & (7 downto 0 => '0')
         when x(5) /= '1' or wMPTBreak = 4 else
       out_t11 & (8 downto 0 => '0')
         when x(4) /= '1' or wMPTBreak = 3 else
       out_t12 & (8 downto 0 => '0');

end architecture;
