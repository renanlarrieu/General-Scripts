library ieee;
use ieee.std_logic_1164.all;
library fplib;
use fplib.pkg_misc.all;
use fplib.pkg_lnssub_table.all;
use fplib.pkg_hybrid_table.all;


entity LNSSub_Hybrid_Clk is
  generic(
	wE : positive := 5;
	wF : positive := 8;
	reg : boolean := true;
	wMPTBreak : positive := 8
  );
  port( x : in  std_logic_vector(min(wE,log(wF+1)+1)+wF-1 downto 0);
        r : out std_logic_vector(wE+wF downto 0);
        clk : in std_logic );
end entity;


architecture arch of LNSSub_Hybrid_Clk is
  constant mnmx : boolean := false;

  constant wI        : positive := log(wF+1)+1+wF;
  constant wEssZero  : positive := min(wI, wE+wF);
  constant wO        : positive := wE+wF+1;
  constant wOm       : positive := max(wO, LNSSub_MPT_13_wO);

  signal x0 : std_logic_vector(wI-1 downto 0);
  signal r0 : std_logic_vector(wOm-1 downto 0);
begin
  pad_x : if wI > wEssZero generate
    x0 <= (wI-1 downto wEssZero => '1') & x;
  end generate;
  nopad_x : if wI = wEssZero generate
    x0 <= x;
  end generate;

  tbl_6 : if wF = 6 generate
  	tbl_clk : if reg = true generate
    table : LNSSub_Hybrid_6_Clk
      generic map ( wMPTBreak => wMPTBreak )
      port map ( x => x0,
                 r => r0(LNSSub_MPT_6_wO-1 downto 0),
                 clk => clk );
    end generate;
    
    tbl_noclk : if reg = false generate
	    table : LNSSub_Hybrid_6
	      generic map ( wMPTBreak => wMPTBreak )
	      port map ( x => x0,
	                 r => r0(LNSSub_MPT_6_wO-1 downto 0) );
    end generate;
    
    pad_r : if wOm > LNSSub_MPT_6_wO generate
      r0(wOm-1 downto LNSSub_MPT_6_wO) <= (wOm-1 downto LNSSub_MPT_6_wO => '0');
    end generate;
  end generate;

  tbl_7 : if wF = 7 generate
  	tbl_clk : if reg = true generate
    table : LNSSub_Hybrid_7_Clk
      generic map ( wMPTBreak => wMPTBreak )
      port map ( x => x0,
                 r => r0(LNSSub_MPT_7_wO-1 downto 0),
                 clk => clk );
    end generate;
    
    tbl_noclk : if reg = false generate
	    table : LNSSub_Hybrid_7
	      generic map ( wMPTBreak => wMPTBreak )
	      port map ( x => x0,
	                 r => r0(LNSSub_MPT_7_wO-1 downto 0) );
    end generate;
    
    pad_r : if wOm > LNSSub_MPT_7_wO generate
      r0(wOm-1 downto LNSSub_MPT_7_wO) <= (wOm-1 downto LNSSub_MPT_7_wO => '0');
    end generate;
  end generate;

  tbl_8 : if wF = 8 generate
  	tbl_clk : if reg = true generate
    table : LNSSub_Hybrid_8_Clk
      generic map ( wMPTBreak => wMPTBreak )
      port map ( x => x0,
                 r => r0(LNSSub_MPT_8_wO-1 downto 0),
                 clk => clk );
    end generate;
    
    tbl_noclk : if reg = false generate
	    table : LNSSub_Hybrid_8
	      generic map ( wMPTBreak => wMPTBreak )
	      port map ( x => x0,
	                 r => r0(LNSSub_MPT_8_wO-1 downto 0) );
    end generate;
    
    pad_r : if wOm > LNSSub_MPT_8_wO generate
      r0(wOm-1 downto LNSSub_MPT_8_wO) <= (wOm-1 downto LNSSub_MPT_8_wO => '0');
    end generate;
  end generate;

  tbl_9 : if wF = 9 generate
  	tbl_clk : if reg = true generate
    table : LNSSub_Hybrid_9_Clk
      generic map ( wMPTBreak => wMPTBreak )
      port map ( x => x0,
                 r => r0(LNSSub_MPT_9_wO-1 downto 0),
                 clk => clk );
    end generate;
    
    tbl_noclk : if reg = false generate
	    table : LNSSub_Hybrid_9
	      generic map ( wMPTBreak => wMPTBreak )
	      port map ( x => x0,
	                 r => r0(LNSSub_MPT_9_wO-1 downto 0) );
    end generate;
    
    pad_r : if wOm > LNSSub_MPT_9_wO generate
      r0(wOm-1 downto LNSSub_MPT_9_wO) <= (wOm-1 downto LNSSub_MPT_9_wO => '0');
    end generate;
  end generate;

  tbl_10 : if wF = 10 and mnmx = false generate
  	tbl_clk : if reg = true generate
    table : LNSSub_Hybrid_10_Clk
      generic map ( wMPTBreak => wMPTBreak )
      port map ( x => x0,
                 r => r0(LNSSub_MPT_10_wO-1 downto 0),
                 clk => clk );
    end generate;
    
    tbl_noclk : if reg = false generate
	    table : LNSSub_Hybrid_10
	      generic map ( wMPTBreak => wMPTBreak )
	      port map ( x => x0,
	                 r => r0(LNSSub_MPT_10_wO-1 downto 0) );
    end generate;
    
    pad_r : if wOm > LNSSub_MPT_10_wO generate
      r0(wOm-1 downto LNSSub_MPT_10_wO) <= (wOm-1 downto LNSSub_MPT_10_wO => '0');
    end generate;
  end generate;

  tbl_10_mnmx : if wF = 10 and mnmx = true generate
  	tbl_clk : if reg = true generate
    table : LNSSub_Hybrid_MNMX_10_Clk
      generic map ( wMPTBreak => wMPTBreak )
      port map ( x => x0,
                 r => r0(LNSSub_MNMX_10_wO-1 downto 0),
                 clk => clk );
    end generate;
    
    tbl_noclk : if reg = false generate
	    table : LNSSub_Hybrid_MNMX_10
	      generic map ( wMPTBreak => wMPTBreak )
	      port map ( x => x0,
	                 r => r0(LNSSub_MNMX_10_wO-1 downto 0) );
    end generate;
    
    pad_r : if wOm > LNSSub_MNMX_10_wO generate
      r0(wOm-1 downto LNSSub_MNMX_10_wO) <= (wOm-1 downto LNSSub_MNMX_10_wO => '0');
    end generate;
  end generate;

  tbl_11 : if wF = 11 and mnmx = false generate
  	tbl_clk : if reg = true generate
    table : LNSSub_Hybrid_11_Clk
      generic map ( wMPTBreak => wMPTBreak )
      port map ( x => x0,
                 r => r0(LNSSub_MPT_11_wO-1 downto 0),
                 clk => clk );
    end generate;
    
    tbl_noclk : if reg = false generate
	    table : LNSSub_Hybrid_11
	      generic map ( wMPTBreak => wMPTBreak )
	      port map ( x => x0,
	                 r => r0(LNSSub_MPT_11_wO-1 downto 0) );
    end generate;
    
    pad_r : if wOm > LNSSub_MPT_11_wO generate
      r0(wOm-1 downto LNSSub_MPT_11_wO) <= (wOm-1 downto LNSSub_MPT_11_wO => '0');
    end generate;
  end generate;

  tbl_11_mnmx : if wF = 11 and mnmx = true generate
  	tbl_clk : if reg = true generate
    table : LNSSub_Hybrid_MNMX_11_Clk
      generic map ( wMPTBreak => wMPTBreak )
      port map ( x => x0,
                 r => r0(LNSSub_MNMX_11_wO-1 downto 0),
                 clk => clk );
    end generate;
    
    tbl_noclk : if reg = false generate
	    table : LNSSub_Hybrid_MNMX_11
	      generic map ( wMPTBreak => wMPTBreak )
	      port map ( x => x0,
	                 r => r0(LNSSub_MNMX_11_wO-1 downto 0) );
    end generate;
    
    pad_r : if wOm > LNSSub_MNMX_11_wO generate
      r0(wOm-1 downto LNSSub_MNMX_11_wO) <= (wOm-1 downto LNSSub_MNMX_11_wO => '0');
    end generate;
  end generate;

  tbl_12 : if wF = 12 generate
  	tbl_clk : if reg = true generate
    table : LNSSub_Hybrid_12_Clk
	  generic map ( wMPTBreak => wMPTBreak )
      port map ( x => x0,
                 r => r0(LNSSub_MPT_12_wO-1 downto 0),
                 clk => clk );
    end generate;
    
    tbl_noclk : if reg = false generate
	    table : LNSSub_Hybrid_12
	      generic map ( wMPTBreak => wMPTBreak )
	      port map ( x => x0,
	                 r => r0(LNSSub_MPT_12_wO-1 downto 0) );
    end generate;
    
    pad_r : if wOm > LNSSub_MPT_12_wO generate
      r0(wOm-1 downto LNSSub_MPT_12_wO) <= (wOm-1 downto LNSSub_MPT_12_wO => '0');
    end generate;
  end generate;

  tbl_13 : if wF = 13 and mnmx = false generate
  	tbl_clk : if reg = true generate
    table : LNSSub_Hybrid_13_Clk
      generic map ( wMPTBreak => wMPTBreak )
      port map ( x => x0,
                 r => r0(LNSSub_MPT_13_wO-1 downto 0),
                 clk => clk );
    end generate;
    
    tbl_noclk : if reg = false generate
	    table : LNSSub_Hybrid_13
	      generic map ( wMPTBreak => wMPTBreak )
	      port map ( x => x0,
	                 r => r0(LNSSub_MPT_13_wO-1 downto 0) );
    end generate;
    
    pad_r : if wOm > LNSSub_MPT_13_wO generate
      r0(wOm-1 downto LNSSub_MPT_13_wO) <= (wOm-1 downto LNSSub_MPT_13_wO => '0');
    end generate;
  end generate;

  tbl_13_mnmx : if wF = 13 and mnmx = true generate
  	tbl_clk : if reg = true generate
    table : LNSSub_Hybrid_MNMX_13_Clk
      generic map ( wMPTBreak => wMPTBreak )
      port map ( x => x0,
                 r => r0(LNSSub_MNMX_13_wO-1 downto 0),
                 clk => clk );
    end generate;
    
    tbl_noclk : if reg = false generate
	    table : LNSSub_Hybrid_MNMX_13
	      generic map ( wMPTBreak => wMPTBreak )
	      port map ( x => x0,
	                 r => r0(LNSSub_MNMX_13_wO-1 downto 0) );
    end generate;
    
    pad_r : if wOm > LNSSub_MNMX_13_wO generate
      r0(wOm-1 downto LNSSub_MNMX_13_wO) <= (wOm-1 downto LNSSub_MNMX_13_wO => '0');
    end generate;
  end generate;

  cut : if wO < wOm generate
    r(wO-1) <= '1' when r0(wOm-1 downto wO-1) /= (wOm-1 downto wO-1 => '0') else
               '0';
    r(wO-2 downto 0) <= r0(wO-2 downto 0);
  end generate;
  nocut : if wO = wOm generate
    r <= r0;
  end generate;
end architecture;
