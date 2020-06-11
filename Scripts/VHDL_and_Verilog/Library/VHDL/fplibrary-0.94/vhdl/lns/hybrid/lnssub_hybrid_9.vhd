library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library fplib;
use fplib.pkg_lnssub_mpt_9.all;

entity LNSSub_Hybrid_9 is
  generic ( wMPTBreak : positive := 9 );
  port( x : in  std_logic_vector(12 downto 0);
        r : out std_logic_vector(12 downto 0) );
end entity;

architecture arch of LNSSub_Hybrid_9 is

  signal out_t0 : std_logic_vector(2 downto 0);
  signal out_t1 : std_logic_vector(5 downto 0);
  signal out_t2 : std_logic_vector(7 downto 0);
  signal out_t3 : std_logic_vector(7 downto 0);
  signal out_t4 : std_logic_vector(7 downto 0);
  signal out_t5 : std_logic_vector(7 downto 0);
  signal out_t6 : std_logic_vector(6 downto 0);
  signal out_t7 : std_logic_vector(6 downto 0);
  signal out_t8 : std_logic_vector(5 downto 0);
  signal out_t9 : std_logic_vector(6 downto 0);
begin
  inst_t0 : LNSSub_MPT_T0_9
    port map( x => x,
              r => out_t0 );

  inst_t1 : LNSSub_MPT_T1_9
    port map( x => x(10 downto 0),
              r => out_t1 );

  inst_t2 : LNSSub_MPT_T2_9
    port map( x => x(9 downto 0),
              r => out_t2 );

  inst_t3 : LNSSub_MPT_T3_9
    port map( x => x(8 downto 0),
              r => out_t3 );

  inst_t4 : LNSSub_MPT_T4_9
    port map( x => x(7 downto 0),
              r => out_t4 );

  inst_t5 : LNSSub_MPT_T5_9
    port map( x => x(6 downto 0),
              r => out_t5 );

  inst_t6 : LNSSub_MPT_T6_9
    port map( x => x(5 downto 0),
              r => out_t6 );

  inst_t7 : LNSSub_MPT_T7_9
    port map( x => x(4 downto 0),
              r => out_t7 );

  inst_t8 : LNSSub_MPT_T8_9
    port map( x => x(3 downto 0),
              r => out_t8 );

  inst_t9 : LNSSub_MPT_T9_9
    port map( x => x(3 downto 0),
              r => out_t9 );

  r <= (12 downto 3 => '0') & out_t0
         when x(12 downto 12) /= (12 downto 12 => '1') or wMPTBreak >= 11 else
       (12 downto 6 => '0') & out_t1
         when x(11) /= '1' or wMPTBreak = 10 else
       (12 downto 8 => '0') & out_t2
         when x(10) /= '1' or wMPTBreak = 9 else
       (12 downto 9 => '0') & out_t3 & (0 downto 0 => '0')
         when x(9) /= '1' or wMPTBreak = 8 else
       (12 downto 10 => '0') & out_t4 & (1 downto 0 => '0')
         when x(8) /= '1' or wMPTBreak = 7 else
       (12 downto 11 => '0') & out_t5 & (2 downto 0 => '0')
         when x(7) /= '1' or wMPTBreak = 6 else
       (12 downto 11 => '0') & out_t6 & (3 downto 0 => '0')
         when x(6) /= '1' or wMPTBreak = 5 else
       (12 downto 12 => '0') & out_t7 & (4 downto 0 => '0')
         when x(5) /= '1' or wMPTBreak = 4 else
       (12 downto 12 => '0') & out_t8 & (5 downto 0 => '0')
         when x(4) /= '1' or wMPTBreak = 3 else
       out_t9 & (5 downto 0 => '0');
end architecture;


library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library fplib;
use fplib.pkg_lnssub_mpt_9.all;
use fplib.pkg_misc.all;

entity LNSSub_Hybrid_9_Clk is
  generic ( wMPTBreak : positive := 9 );
  port( x   : in  std_logic_vector(12 downto 0);
        r   : out std_logic_vector(12 downto 0);
        clk : in  std_logic );
end entity;

architecture arch of LNSSub_Hybrid_9_Clk is
  signal x_1  : std_logic_vector(12 downto 0);
  signal x_10 : std_logic_vector(12 downto 0);

  signal out_t0_1  : std_logic_vector(2 downto 0);
  signal out_t0_10 : std_logic_vector(2 downto 0);
  signal out_t1_10 : std_logic_vector(5 downto 0);
  signal out_t2_10 : std_logic_vector(7 downto 0);
  signal out_t3_10 : std_logic_vector(7 downto 0);
  signal out_t4_10 : std_logic_vector(7 downto 0);
  signal out_t5_10 : std_logic_vector(7 downto 0);
  signal out_t6_10 : std_logic_vector(6 downto 0);
  signal out_t7_10 : std_logic_vector(6 downto 0);
  signal out_t8_10 : std_logic_vector(5 downto 0);
  signal out_t9_10 : std_logic_vector(6 downto 0);
begin
  x_1 <= x;

  inst_t0 : LNSSub_MPT_T0_9
    port map( x   => x_1,
              r   => out_t0_1 );

  out_t0_delay : Delay
    generic map ( w => 3,
                  n => 1 )
    port map ( input  => out_t0_1,
               output => out_t0_10,
               clk    => clk );

  inst_t1 : LNSSub_MPT_T1_9_Clk
    port map( x   => x_1(10 downto 0),
              r   => out_t1_10,
              clk => clk );

  inst_t2 : LNSSub_MPT_T2_9_Clk
    port map( x   => x_1(9 downto 0),
              r   => out_t2_10,
              clk => clk );

  inst_t3 : LNSSub_MPT_T3_9_Clk
    port map( x   => x_1(8 downto 0),
              r   => out_t3_10,
              clk => clk );

  inst_t4 : LNSSub_MPT_T4_9_Clk
    port map( x   => x_1(7 downto 0),
              r   => out_t4_10,
              clk => clk );

  inst_t5 : LNSSub_MPT_T5_9_Clk
    port map( x   => x_1(6 downto 0),
              r   => out_t5_10,
              clk => clk );

  inst_t6 : LNSSub_MPT_T6_9_Clk
    port map( x   => x_1(5 downto 0),
              r   => out_t6_10,
              clk => clk );

  inst_t7 : LNSSub_MPT_T7_9_Clk
    port map( x   => x_1(4 downto 0),
              r   => out_t7_10,
              clk => clk );

  inst_t8 : LNSSub_MPT_T8_9_Clk
    port map( x   => x_1(3 downto 0),
              r   => out_t8_10,
              clk => clk );

  inst_t9 : LNSSub_MPT_T9_9_Clk
    port map( x   => x_1(3 downto 0),
              r   => out_t9_10,
              clk => clk );

  x_delay : Delay
    generic map ( w => 13,
                  n => 1 )
    port map ( input  => x_1,
               output => x_10,
               clk    => clk );

  r <= (12 downto 3 => '0') & out_t0_10
         when x_10(12 downto 12) /= (12 downto 12 => '1') or wMPTBreak >= 11 else
       (12 downto 6 => '0') & out_t1_10
         when x_10(11) /= '1' or wMPTBreak = 10 else
       (12 downto 8 => '0') & out_t2_10
         when x_10(10) /= '1' or wMPTBreak = 9 else
       (12 downto 9 => '0') & out_t3_10 & (0 downto 0 => '0')
         when x_10(9) /= '1' or wMPTBreak = 8 else
       (12 downto 10 => '0') & out_t4_10 & (1 downto 0 => '0')
         when x_10(8) /= '1' or wMPTBreak = 7 else
       (12 downto 11 => '0') & out_t5_10 & (2 downto 0 => '0')
         when x_10(7) /= '1' or wMPTBreak = 6 else
       (12 downto 11 => '0') & out_t6_10 & (3 downto 0 => '0')
         when x_10(6) /= '1' or wMPTBreak = 5 else
       (12 downto 12 => '0') & out_t7_10 & (4 downto 0 => '0')
         when x_10(5) /= '1' or wMPTBreak = 4 else
       (12 downto 12 => '0') & out_t8_10 & (5 downto 0 => '0')
         when x_10(4) /= '1' or wMPTBreak = 3 else
       out_t9_10 & (5 downto 0 => '0');
end architecture;
