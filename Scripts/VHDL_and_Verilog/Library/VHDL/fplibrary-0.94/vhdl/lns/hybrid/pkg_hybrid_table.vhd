library ieee;
use ieee.std_logic_1164.all;

library fplib;

package pkg_hybrid_table is
	component LNSSub_Hybrid_6 is
      generic ( wMPTBreak : positive := 6 );
	  port( x : in  std_logic_vector(8 downto 0);
	        r : out std_logic_vector(8 downto 0) );
	end component;
	
	component LNSSub_Hybrid_6_Clk is
      generic ( wMPTBreak : positive := 6 );
	  port( x   : in  std_logic_vector(8 downto 0);
	        r   : out std_logic_vector(8 downto 0);
	        clk : in  std_logic );
	end component;

	component LNSSub_Hybrid_7 is
      generic ( wMPTBreak : positive := 7 );
	  port( x : in  std_logic_vector(10 downto 0);
	        r : out std_logic_vector(9 downto 0) );
	end component;
	
	component LNSSub_Hybrid_7_Clk is
      generic ( wMPTBreak : positive := 7 );
	  port( x   : in  std_logic_vector(10 downto 0);
	        r   : out std_logic_vector(9 downto 0);
	        clk : in  std_logic );
	end component;

	component LNSSub_Hybrid_8 is
      generic ( wMPTBreak : positive := 8 );
	  port( x : in  std_logic_vector(11 downto 0);
	        r : out std_logic_vector(11 downto 0) );
	end component;
	
	component LNSSub_Hybrid_8_Clk is
      generic ( wMPTBreak : positive := 8 );
	  port( x   : in  std_logic_vector(11 downto 0);
	        r   : out std_logic_vector(11 downto 0);
	        clk : in  std_logic );
	end component;

	component LNSSub_Hybrid_9 is
      generic ( wMPTBreak : positive := 9 );
	  port( x : in  std_logic_vector(12 downto 0);
	        r : out std_logic_vector(12 downto 0) );
	end component;
	
	component LNSSub_Hybrid_9_Clk is
      generic ( wMPTBreak : positive := 9 );
	  port( x   : in  std_logic_vector(12 downto 0);
	        r   : out std_logic_vector(12 downto 0);
	        clk : in  std_logic );
	end component;


	component LNSSub_Hybrid_10 is
      generic ( wMPTBreak : positive := 10 );
	  port( x : in  std_logic_vector(13 downto 0);
	        r : out std_logic_vector(13 downto 0) );
	end component;
	
	component LNSSub_Hybrid_10_Clk is
      generic ( wMPTBreak : positive := 10 );
	  port( x   : in  std_logic_vector(13 downto 0);
	        r   : out std_logic_vector(13 downto 0);
	        clk : in  std_logic );
	end component;

	component LNSSub_Hybrid_MnMx_10 is
      generic ( wMPTBreak : positive := 10 );
	  port( x : in  std_logic_vector(13 downto 0);
	        r : out std_logic_vector(13 downto 0) );
	end component;

	component LNSSub_Hybrid_MnMx_10_Clk is
      generic ( wMPTBreak : positive := 10 );
	  port( x   : in  std_logic_vector(13 downto 0);
	        r   : out std_logic_vector(13 downto 0);
	        clk : in  std_logic );
	end component;

	component LNSSub_Hybrid_11 is
      generic ( wMPTBreak : positive := 11 );
	  port( x : in  std_logic_vector(14 downto 0);
	        r : out std_logic_vector(14 downto 0) );
	end component;
	
	component LNSSub_Hybrid_11_Clk is
      generic ( wMPTBreak : positive := 11 );
	  port( x   : in  std_logic_vector(14 downto 0);
	        r   : out std_logic_vector(14 downto 0);
	        clk : in  std_logic );
	end component;

	component LNSSub_Hybrid_MnMx_11 is
      generic ( wMPTBreak : positive := 11 );
	  port( x : in  std_logic_vector(14 downto 0);
	        r : out std_logic_vector(14 downto 0) );
	end component;

	component LNSSub_Hybrid_MnMx_11_Clk is
      generic ( wMPTBreak : positive := 11 );
	  port( x   : in  std_logic_vector(14 downto 0);
	        r   : out std_logic_vector(14 downto 0);
	        clk : in  std_logic );
	end component;
	
	component LNSSub_Hybrid_12 is
      generic ( wMPTBreak : positive := 12 );
	  port( x : in  std_logic_vector(15 downto 0);
	        r : out std_logic_vector(15 downto 0) );
	end component;
	
	component LNSSub_Hybrid_12_clk is
      generic ( wMPTBreak : positive := 12 );
	  port( x : in  std_logic_vector(15 downto 0);
	        r : out std_logic_vector(15 downto 0);
	        clk : in  std_logic  );
	end component;
	
	component LNSSub_Hybrid_MnMx_12 is
      generic ( wMPTBreak : positive := 12 );
	  port( x : in  std_logic_vector(15 downto 0);
	        r : out std_logic_vector(15 downto 0) );
	end component;
	
	component LNSSub_Hybrid_MnMx_12_Clk is
      generic ( wMPTBreak : positive := 12 );
	  port( x : in  std_logic_vector(15 downto 0);
	        r : out std_logic_vector(15 downto 0);
	        clk : in  std_logic  );
	end component;
	
	component LNSSub_Hybrid_13 is
      generic ( wMPTBreak : positive := 13 );
	  port( x : in  std_logic_vector(16 downto 0);
	        r : out std_logic_vector(16 downto 0) );
	end component;
	
	component LNSSub_Hybrid_13_clk is
      generic ( wMPTBreak : positive := 13 );
	  port( x : in  std_logic_vector(16 downto 0);
	        r : out std_logic_vector(16 downto 0);
	        clk : in  std_logic  );
	end component;
	
	component LNSSub_Hybrid_MnMx_13 is
      generic ( wMPTBreak : positive := 13 );
	  port( x : in  std_logic_vector(16 downto 0);
	        r : out std_logic_vector(16 downto 0) );
	end component;
	
	component LNSSub_Hybrid_MnMx_13_Clk is
      generic ( wMPTBreak : positive := 13 );
	  port( x : in  std_logic_vector(16 downto 0);
	        r : out std_logic_vector(16 downto 0);
	        clk : in  std_logic  );
	end component;
end package;
