library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library fplib;
use fplib.pkg_lnssub_mnmx_10.all;

entity LNSSub_Hybrid_MnMx_10 is
  generic ( wMPTBreak : positive := 10 );
  port( x : in  std_logic_vector(13 downto 0);
        r : out std_logic_vector(13 downto 0) );
end entity;

architecture arch of LNSSub_Hybrid_MnMx_10 is

  signal out_t0 : std_logic_vector(3 downto 0);
  signal out_t1 : std_logic_vector(6 downto 0);
  signal out_t2 : std_logic_vector(8 downto 0);
  signal out_t3 : std_logic_vector(9 downto 0);
  signal out_t4 : std_logic_vector(10 downto 0);
  signal out_t5 : std_logic_vector(9 downto 0);
  signal out_t6 : std_logic_vector(8 downto 0);
  signal out_t7 : std_logic_vector(8 downto 0);
  signal out_t8 : std_logic_vector(7 downto 0);
  signal out_t9 : std_logic_vector(7 downto 0);
begin
   inst_t0 : LNSSub_MNMX_T0_10
    port map( x => x,
              r => out_t0 );

  inst_t1 : LNSSub_MNMX_T1_10
    port map( x => x(11 downto 0),
              r => out_t1 );

  inst_t2 : LNSSub_MNMX_T2_10
    port map( x => x(10 downto 0),
              r => out_t2 );

  inst_t3 : LNSSub_MNMX_T3_10
    port map ( x => x(9 downto 0),
               r => out_t3 );

  inst_t4 : LNSSub_MNMX_T4_10
    port map ( x => x(8 downto 0),
               r => out_t4 );

  inst_t5 : LNSSub_MNMX_T5_10
    port map ( x => x(7 downto 0),
               r => out_t5 );

  inst_t6 : LNSSub_MNMX_T6_10
    port map ( x => x(6 downto 0),
               r => out_t6 );

  inst_t7 : LNSSub_MNMX_T7_10
    port map ( x => x(5 downto 0),
               r => out_t7 );

  inst_t8 : LNSSub_MNMX_T8_10
    port map ( x => x(4 downto 0),
               r => out_t8 );

  inst_t9 : LNSSub_MNMX_T9_10
    port map ( x => x(4 downto 0),
               r => out_t9 );

  r <= (13 downto 4 => '0') & out_t0
         when x(13 downto 13) /= (13 downto 13 => '1') or wMPTBreak >= 12 else
       (13 downto 7 => '0') & out_t1
         when x(12) /= '1' or wMPTBreak = 11 else
       (13 downto 9 => '0') & out_t2
         when x(11) /= '1' or wMPTBreak = 10 else
       (13 downto 10 => '0') & out_t3
         when x(10) /= '1' or wMPTBreak = 9 else
       (13 downto 11 => '0') & out_t4
         when x(9) /= '1' or wMPTBreak = 8 else
       (13 downto 12 => '0') & out_t5 & (1 downto 0 => '0')
         when x(8) /= '1' or wMPTBreak = 7 else
       (13 downto 12 => '0') & out_t6 & (2 downto 0 => '0')
         when x(7) /= '1' or wMPTBreak = 6 else
       (13 downto 13 => '0') & out_t7 & (3 downto 0 => '0')
         when x(6) /= '1' or wMPTBreak = 5 else
       (13 downto 13 => '0') & out_t8 & (4 downto 0 => '0')
         when x(5) /= '1' or wMPTBreak = 4 else
       out_t9 & (5 downto 0 => '0');

end architecture;


