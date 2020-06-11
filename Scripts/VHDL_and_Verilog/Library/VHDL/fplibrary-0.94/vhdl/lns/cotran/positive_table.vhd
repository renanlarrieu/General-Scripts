library ieee;
use ieee.std_logic_1164.all;


entity Positive_Table is
	generic (
		K : positive := 5;
		F : positive := 8;
		J : positive := 5
	);
	port (
		Z : in std_logic_vector(K+F downto 0);
		SB : out std_logic_vector(F downto 0)
		
	);
end entity;

architecture arch of Positive_Table is
	component LNSSub_CTF_Pos_6_4 is
		port(
			Addr : in std_logic_vector(5 downto 0);
			Val : out std_logic_vector(6 downto 0)
		);
	end component;

	component LNSSub_CTF_Pos_6_5 is
		port(
			Addr : in std_logic_vector(6 downto 0);
			Val : out std_logic_vector(6 downto 0)
		);
	end component;

	component LNSSub_CTF_Pos_7_4 is
		port(
			Addr : in std_logic_vector(5 downto 0);
			Val : out std_logic_vector(7 downto 0)
		);
	end component;

	component LNSSub_CTF_Pos_7_5 is
		port(
			Addr : in std_logic_vector(6 downto 0);
			Val : out std_logic_vector(7 downto 0)
		);
	end component;

	component LNSSub_CTF_Pos_7_6 is
		port(
			Addr : in std_logic_vector(7 downto 0);
			Val : out std_logic_vector(7 downto 0)
		);
	end component;

	component LNSSub_CTF_Pos_8_5 is
		port(
			Addr : in std_logic_vector(6 downto 0);
			Val : out std_logic_vector(8 downto 0)
		);
	end component;

	component LNSSub_CTF_Pos_8_6 is
		port(
			Addr : in std_logic_vector(7 downto 0);
			Val : out std_logic_vector(8 downto 0)
		);
	end component;

	component LNSSub_CTF_Pos_8_7 is
		port(
			Addr : in std_logic_vector(8 downto 0);
			Val : out std_logic_vector(8 downto 0)
		);
	end component;

	component LNSSub_CTF_Pos_9_6 is
		port(
			Addr : in std_logic_vector(7 downto 0);
			Val : out std_logic_vector(9 downto 0)
		);
	end component;

	component LNSSub_CTF_Pos_9_7 is
		port(
			Addr : in std_logic_vector(8 downto 0);
			Val : out std_logic_vector(9 downto 0)
		);
	end component;

	component LNSSub_CTF_Pos_9_8 is
		port(
			Addr : in std_logic_vector(9 downto 0);
			Val : out std_logic_vector(9 downto 0)
		);
	end component;

	component LNSSub_CTF_Pos_10_6 is
		port(
			Addr : in std_logic_vector(7 downto 0);
			Val : out std_logic_vector(10 downto 0)
		);
	end component;

	component LNSSub_CTF_Pos_10_7 is
		port(
			Addr : in std_logic_vector(8 downto 0);
			Val : out std_logic_vector(10 downto 0)
		);
	end component;

	component LNSSub_CTF_Pos_10_8 is
		port(
			Addr : in std_logic_vector(9 downto 0);
			Val : out std_logic_vector(10 downto 0)
		);
	end component;

	component LNSSub_CTF_Pos_11_7 is
		port(
			Addr : in std_logic_vector(8 downto 0);
			Val : out std_logic_vector(11 downto 0)
		);
	end component;

	component LNSSub_CTF_Pos_11_8 is
		port(
			Addr : in std_logic_vector(9 downto 0);
			Val : out std_logic_vector(11 downto 0)
		);
	end component;

	component LNSSub_CTF_Pos_11_9 is
		port(
			Addr : in std_logic_vector(10 downto 0);
			Val : out std_logic_vector(11 downto 0)
		);
	end component;

	component LNSSub_CTF_Pos_12_8 is
		port(
			Addr : in std_logic_vector(9 downto 0);
			Val : out std_logic_vector(12 downto 0)
		);
	end component;

	component LNSSub_CTF_Pos_12_9 is
		port(
			Addr : in std_logic_vector(10 downto 0);
			Val : out std_logic_vector(12 downto 0)
		);
	end component;

	component LNSSub_CTF_Pos_13_8 is
		port(
			Addr : in std_logic_vector(9 downto 0);
			Val : out std_logic_vector(13 downto 0)
		);
	end component;

	component LNSSub_CTF_Pos_13_9 is
		port(
			Addr : in std_logic_vector(10 downto 0);
			Val : out std_logic_vector(13 downto 0)
		);
	end component;

begin

	tbl_6 : if F = 6 generate
		tbl_6_4 : if J = 4 generate
			tbl : LNSSub_CTF_Pos_6_4
				port map (
					Addr => Z(J+1 downto 0),
					Val => SB
				);
		end generate;

		tbl_6_5 : if J = 5 generate
			tbl : LNSSub_CTF_Pos_6_5
				port map (
					Addr => Z(J+1 downto 0),
					Val => SB
				);
		end generate;
	end generate;

	tbl_7 : if F = 7 generate
		tbl_7_4 : if J = 4 generate
			tbl : LNSSub_CTF_Pos_7_4
				port map (
					Addr => Z(J+1 downto 0),
					Val => SB
				);
		end generate;

		tbl_7_5 : if J = 5 generate
			tbl : LNSSub_CTF_Pos_7_5
				port map (
					Addr => Z(J+1 downto 0),
					Val => SB
				);
		end generate;

		tbl_7_6 : if J = 6 generate
			tbl : LNSSub_CTF_Pos_7_6
				port map (
					Addr => Z(J+1 downto 0),
					Val => SB
				);
		end generate;
	end generate;
	
	tbl_8 : if F = 8 generate
		tbl_8_5 : if J = 5 generate
			tbl : LNSSub_CTF_Pos_8_5
				port map (
					Addr => Z(J+1 downto 0),
					Val => SB
				);
		end generate;

		tbl_8_6 : if J = 6 generate
			tbl : LNSSub_CTF_Pos_8_6
				port map (
					Addr => Z(J+1 downto 0),
					Val => SB
				);
		end generate;

		tbl_8_7 : if J = 7 generate
			tbl : LNSSub_CTF_Pos_8_7
				port map (
					Addr => Z(J+1 downto 0),
					Val => SB
				);
		end generate;
	end generate;
	
	tbl_9 : if F = 9 generate
		tbl_9_6 : if J = 6 generate
			tbl : LNSSub_CTF_Pos_9_6
				port map (
					Addr => Z(J+1 downto 0),
					Val => SB
				);
		end generate;

		tbl_9_7 : if J = 7 generate
			tbl : LNSSub_CTF_Pos_9_7
				port map (
					Addr => Z(J+1 downto 0),
					Val => SB
				);
		end generate;

		tbl_9_8 : if J = 8 generate
			tbl : LNSSub_CTF_Pos_9_8
				port map (
					Addr => Z(J+1 downto 0),
					Val => SB
				);
		end generate;
	end generate;

	tbl_10 : if F = 10 generate
		tbl_10_6 : if J = 6 generate
			tbl : LNSSub_CTF_Pos_10_6
				port map (
					Addr => Z(J+1 downto 0),
					Val => SB
				);
		end generate;

		tbl_10_7 : if J = 7 generate
			tbl : LNSSub_CTF_Pos_10_7
				port map (
					Addr => Z(J+1 downto 0),
					Val => SB
				);
		end generate;

		tbl_10_8 : if J = 8 generate
			tbl : LNSSub_CTF_Pos_10_8
				port map (
					Addr => Z(J+1 downto 0),
					Val => SB
				);
		end generate;
	end generate;
	
	tbl_11 : if F = 11 generate
		tbl_11_7 : if J = 7 generate
			tbl : LNSSub_CTF_Pos_11_7
				port map (
					Addr => Z(J+1 downto 0),
					Val => SB
				);
		end generate;

		tbl_11_8 : if J = 8 generate
			tbl : LNSSub_CTF_Pos_11_8
				port map (
					Addr => Z(J+1 downto 0),
					Val => SB
				);
		end generate;

		tbl_11_9 : if J = 9 generate
			tbl : LNSSub_CTF_Pos_11_9
				port map (
					Addr => Z(J+1 downto 0),
					Val => SB
				);
		end generate;
	end generate;

	tbl_12 : if F = 12 generate
		tbl_12_8 : if J = 8 generate
			tbl : LNSSub_CTF_Pos_12_8
				port map (
					Addr => Z(J+1 downto 0),
					Val => SB
				);
		end generate;

		tbl_12_9 : if J = 9 generate
			tbl : LNSSub_CTF_Pos_12_9
				port map (
					Addr => Z(J+1 downto 0),
					Val => SB
				);
		end generate;
	end generate;

	tbl_13 : if F = 13 generate
		tbl_13_8 : if J = 8 generate
			tbl : LNSSub_CTF_Pos_13_8
				port map (
					Addr => Z(J+1 downto 0),
					Val => SB
				);
		end generate;

		tbl_13_9 : if J = 9 generate
			tbl : LNSSub_CTF_Pos_13_9
				port map (
					Addr => Z(J+1 downto 0),
					Val => SB
				);
		end generate;
	end generate;

end architecture;
