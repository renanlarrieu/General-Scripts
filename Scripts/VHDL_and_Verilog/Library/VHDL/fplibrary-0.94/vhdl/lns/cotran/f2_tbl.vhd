library ieee;
use ieee.std_logic_1164.all;

library fplib;
use fplib.all;
use fplib.pkg_cotran.all;

entity F2_TBL is

  generic (
    K : positive := 5;
    F : positive := 8;
    wEssZero : positive := 12;
    wBreak : positive := 5);

  port (
    Addr : in  std_logic_vector (wBreak-1 downto 0);
    Val  : out std_logic_vector (K+F downto 0));

end F2_TBL;

architecture arch of F2_TBL is
	constant w_out : positive := Max_FX_Out(F);

	component LNSSub_CTF_F2_6_3 is
	  port (
		Addr : in  std_logic_vector (2 downto 0);
		Val  : out std_logic_vector (9 downto 0));
	end component;
	
	component LNSSub_CTF_F2_6_4 is
	  port (
		Addr : in  std_logic_vector (3 downto 0);
		Val  : out std_logic_vector (9 downto 0));
	end component;
	
	component LNSSub_CTF_F2_6_5 is
	  port (
		Addr : in  std_logic_vector (4 downto 0);
		Val  : out std_logic_vector (9 downto 0));
	end component;
	
	component LNSSub_CTF_F2_7_4 is
	  port (
		Addr : in  std_logic_vector (3 downto 0);
		Val  : out std_logic_vector (10 downto 0));
	end component;
	
	component LNSSub_CTF_F2_7_5 is
	  port (
		Addr : in  std_logic_vector (4 downto 0);
		Val  : out std_logic_vector (10 downto 0));
	end component;
	
	component LNSSub_CTF_F2_7_6 is
	  port (
		Addr : in  std_logic_vector (5 downto 0);
		Val  : out std_logic_vector (10 downto 0));
	end component;

	component LNSSub_CTF_F2_8_3 is
	  port (
		Addr : in  std_logic_vector (2 downto 0);
		Val  : out std_logic_vector (12 downto 0));
	end component;

	component LNSSub_CTF_F2_8_4 is
	  port (
		Addr : in  std_logic_vector (3 downto 0);
		Val  : out std_logic_vector (12 downto 0));
	end component;
	
	component LNSSub_CTF_F2_8_5 is
	  port (
		Addr : in  std_logic_vector (4 downto 0);
		Val  : out std_logic_vector (12 downto 0));
	end component;
	
	component LNSSub_CTF_F2_8_6 is
	  port (
		Addr : in  std_logic_vector (5 downto 0);
		Val  : out std_logic_vector (12 downto 0));
	end component;

	component LNSSub_CTF_F2_8_7 is
	  port (
		Addr : in  std_logic_vector (6 downto 0);
		Val  : out std_logic_vector (12 downto 0));
	end component;
	
	component LNSSub_CTF_F2_9_5 is
	  port (
		Addr : in  std_logic_vector (4 downto 0);
		Val  : out std_logic_vector (13 downto 0));
	end component;
	
	component LNSSub_CTF_F2_9_6 is
	  port (
		Addr : in  std_logic_vector (5 downto 0);
		Val  : out std_logic_vector (13 downto 0));
	end component;
	
	component LNSSub_CTF_F2_9_7 is
	  port (
		Addr : in  std_logic_vector (6 downto 0);
		Val  : out std_logic_vector (13 downto 0));
	end component;
	
	component LNSSub_CTF_F2_9_8 is
	  port (
		Addr : in  std_logic_vector (7 downto 0);
		Val  : out std_logic_vector (13 downto 0));
	end component;
	
	component LNSSub_CTF_F2_10_5 is
	  port (
	    Addr : in  std_logic_vector (4 downto 0);
	    Val  : out std_logic_vector (14 downto 0));
	end component;
	
	component LNSSub_CTF_F2_10_6 is
	  port (
	    Addr : in  std_logic_vector (5 downto 0);
	    Val  : out std_logic_vector (14 downto 0));
	end component;

	component LNSSub_CTF_F2_10_7 is
	  port (
	    Addr : in  std_logic_vector (6 downto 0);
	    Val  : out std_logic_vector (14 downto 0));
	end component;

	component LNSSub_CTF_F2_10_8 is
	  port (
	    Addr : in  std_logic_vector (7 downto 0);
	    Val  : out std_logic_vector (14 downto 0));
	end component;

	component LNSSub_CTF_F2_11_6 is
	  port (
	    Addr : in  std_logic_vector (5 downto 0);
	    Val  : out std_logic_vector (15 downto 0));
	end component;

	component LNSSub_CTF_F2_11_7 is
	  port (
	    Addr : in  std_logic_vector (6 downto 0);
	    Val  : out std_logic_vector (15 downto 0));
	end component;

	component LNSSub_CTF_F2_11_8 is
	  port (
	    Addr : in  std_logic_vector (7 downto 0);
	    Val  : out std_logic_vector (15 downto 0));
	end component;

	component LNSSub_CTF_F2_11_9 is
	  port (
	    Addr : in  std_logic_vector (8 downto 0);
	    Val  : out std_logic_vector (15 downto 0));
	end component;

	component LNSSub_CTF_F2_12_6 is
	  port (
	    Addr : in  std_logic_vector (5 downto 0);
	    Val  : out std_logic_vector (16 downto 0));
	end component;

	component LNSSub_CTF_F2_12_7 is
	  port (
	    Addr : in  std_logic_vector (6 downto 0);
	    Val  : out std_logic_vector (16 downto 0));
	end component;

	component LNSSub_CTF_F2_12_8 is
	  port (
	    Addr : in  std_logic_vector (7 downto 0);
	    Val  : out std_logic_vector (16 downto 0));
	end component;

	component LNSSub_CTF_F2_12_9 is
	  port (
	    Addr : in  std_logic_vector (8 downto 0);
	    Val  : out std_logic_vector (16 downto 0));
	end component;

	component LNSSub_CTF_F2_13_7 is
	  port (
	    Addr : in  std_logic_vector (6 downto 0);
	    Val  : out std_logic_vector (17 downto 0));
	end component;

	component LNSSub_CTF_F2_13_8 is
	  port (
	    Addr : in  std_logic_vector (7 downto 0);
	    Val  : out std_logic_vector (17 downto 0));
	end component;

	component LNSSub_CTF_F2_13_9 is
	  port (
	    Addr : in  std_logic_vector (8 downto 0);
	    Val  : out std_logic_vector (17 downto 0));
	end component;

	signal val_lo : std_logic_vector(w_out - 1 downto 0);
begin  -- parametric
	Val <= (K+F downto w_out => val_lo(w_out-1)) & val_lo;

	tbl_6 : if F=6 generate
		tbl_6_3 : if wBreak=3 generate
			tbl : LNSSub_CTF_F2_6_3
				port map (
					Addr => Addr,
					Val => val_lo);
		end generate;

		tbl_5_6_10_4 : if wBreak=4 generate
			tbl : LNSSub_CTF_F2_6_4
				port map (
					Addr => Addr,
					Val => val_lo);
		end generate;

		tbl_5_6_10_5 : if wBreak=5 generate
			tbl : LNSSub_CTF_F2_6_5
				port map (
					Addr => Addr,
					Val => val_lo);
		end generate;
	end generate;

	tbl_7 : if F=7 generate
		tbl_5_7_11_4 : if wBreak=4 generate
			tbl : LNSSub_CTF_F2_7_4
				port map (
					Addr => Addr,
					Val => val_lo);
		end generate;

		tbl_5_7_11_5 : if wBreak=5 generate
			tbl : LNSSub_CTF_F2_7_5
				port map (
					Addr => Addr,
					Val => val_lo);
		end generate;

		tbl_5_7_11_6 : if wBreak=6 generate
			tbl : LNSSub_CTF_F2_7_6
				port map (
					Addr => Addr,
					Val => val_lo);
		end generate;
	end generate;

	tbl_8 : if F=8 generate
		tbl_8_3 : if wBreak=3 generate
			tbl : LNSSub_CTF_F2_8_3
				port map (
					Addr => Addr,
					Val => val_lo);
		end generate;

		tbl_5_8_12_4 : if wBreak=4 generate
			tbl : LNSSub_CTF_F2_8_4
				port map (
					Addr => Addr,
					Val => val_lo);
		end generate;

		tbl_5_8_12_5 : if wBreak=5 generate
			tbl : LNSSub_CTF_F2_8_5
				port map (
					Addr => Addr,
					Val => val_lo);
		end generate;

		tbl_5_8_12_6 : if wBreak=6 generate
			tbl : LNSSub_CTF_F2_8_6
				port map (
					Addr => Addr,
					Val => val_lo);
		end generate;

		tbl_5_8_12_7 : if wBreak=7 generate
			tbl : LNSSub_CTF_F2_8_7
				port map (
					Addr => Addr,
					Val => val_lo);
		end generate;
	end generate;
	
	tbl_9 : if F=9 generate
		tbl_9_5 : if wBreak=5 generate
			tbl : LNSSub_CTF_F2_9_5
				port map (
					Addr => Addr,
					Val => val_lo);
		end generate;

		tbl_6_9_13_6 : if wBreak=6 generate
			tbl : LNSSub_CTF_F2_9_6
				port map (
					Addr => Addr,
					Val => val_lo);
		end generate;

		tbl_6_9_13_7 : if wBreak=7 generate
			tbl : LNSSub_CTF_F2_9_7
				port map (
					Addr => Addr,
					Val => val_lo);
		end generate;

		tbl_6_9_13_8 : if wBreak=8 generate
			tbl : LNSSub_CTF_F2_9_8
				port map (
					Addr => Addr,
					Val => val_lo);
		end generate;
	end generate;
	
	tbl_10 : if F=10 generate
		tbl_10_5 : if wBreak=5 generate
			tbl : LNSSub_CTF_F2_10_5
				port map (
					Addr => Addr,
					Val => val_lo);
		end generate;

		tbl_5_10_14_6 : if wBreak=6 generate
			tbl : LNSSub_CTF_F2_10_6
				port map (
					Addr => Addr,
					Val => val_lo);
		end generate;

		tbl_5_10_14_7 : if wBreak=7 generate
			tbl : LNSSub_CTF_F2_10_7
				port map (
					Addr => Addr,
					Val => val_lo);
		end generate;

		tbl_5_10_14_8 : if wBreak=8 generate
			tbl : LNSSub_CTF_F2_10_8
				port map (
					Addr => Addr,
					Val => val_lo);
		end generate;
	end generate;

	tbl_11 : if F=11 generate
		tbl_11_6 : if wBreak=6 generate
			tbl : LNSSub_CTF_F2_11_6
				port map (
					Addr => Addr,
					Val => val_lo);
		end generate;

		tbl_5_11_15_7 : if wBreak=7 generate
			tbl : LNSSub_CTF_F2_11_7
				port map (
					Addr => Addr,
					Val => val_lo);
		end generate;

		tbl_5_11_15_8 : if wBreak=8 generate
			tbl : LNSSub_CTF_F2_11_8
				port map (
					Addr => Addr,
					Val => val_lo);
		end generate;

		tbl_5_11_15_9 : if wBreak=9 generate
			tbl : LNSSub_CTF_F2_11_9
				port map (
					Addr => Addr,
					Val => val_lo);
		end generate;
	end generate;

	tbl_12 : if F=12 generate
		tbl_12_6 : if wBreak=6 generate
			tbl : LNSSub_CTF_F2_12_6
				port map (
					Addr => Addr,
					Val => val_lo);
		end generate;

		tbl_12_7 : if wBreak=7 generate
			tbl : LNSSub_CTF_F2_12_7
				port map (
					Addr => Addr,
					Val => val_lo);
		end generate;

		tbl_12_8 : if wBreak=8 generate
			tbl : LNSSub_CTF_F2_12_8
				port map (
					Addr => Addr,
					Val => val_lo);
		end generate;

		tbl_12_9 : if wBreak=9 generate
			tbl : LNSSub_CTF_F2_12_9
				port map (
					Addr => Addr,
					Val => val_lo);
		end generate;
	end generate;

	tbl_13 : if F=13 generate
		tbl_13_7 : if wBreak=7 generate
			tbl : LNSSub_CTF_F2_13_7
				port map (
					Addr => Addr,
					Val => val_lo);
		end generate;

		tbl_13_8 : if wBreak=8 generate
			tbl : LNSSub_CTF_F2_13_8
				port map (
					Addr => Addr,
					Val => val_lo);
		end generate;

		tbl_13_9 : if wBreak=9 generate
			tbl : LNSSub_CTF_F2_13_9
				port map (
					Addr => Addr,
					Val => val_lo);
		end generate;
	end generate;
end arch;




