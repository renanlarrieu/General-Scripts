library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

library fplib;
use fplib.all;

entity lns_add_cotran_clk is
  generic ( wE : positive := 5;
            wF : positive := 8;
            MC : boolean := false;
            reg : boolean := false);
  port ( nA  : in  std_logic_vector(wE+wF+2 downto 0);
         nB  : in  std_logic_vector(wE+wF+2 downto 0);
         nR  : out std_logic_vector(wE+wF+2 downto 0);
         clk : in  std_logic;
         reset : in std_logic);
end entity;

architecture arch of lns_add_cotran_clk is
	component LNS_ADDSUB_COTRAN_CLK is
	  generic (
		K  :     positive := 5;
		F  :     positive := 8;
		MC :     boolean := true;
		reg : boolean := true);
	  port (
		X  : in  std_logic_vector (K+F+1 downto 0);
		Y  : in  std_logic_vector (K+F+1 downto 0);
		Op : in  std_logic;                 -- 0: add, 1: sub
		R  : out std_logic_vector (K+F+1 downto 0);
		Ov : out std_logic;
		Zero : out std_logic;
		clk : in std_logic;
		reset : in std_logic);
	
	end component;

--	component Delay is
--		generic ( w : positive := 1;
--				n : natural );
--		port ( input  : in  std_logic_vector(w-1 downto 0);
--			output : out std_logic_vector(w-1 downto 0);
--			clk    : in  std_logic );
--	end component;
--
	component my_delay is
	  generic ( w : positive;
				n : integer := 1;
            	enable : boolean := true  );
	  port ( x     : in  std_logic_vector(w-1 downto 0);
			 xd    : out std_logic_vector(w-1 downto 0);
			 clk   : in  std_logic);
	end component;

	signal X, Y, R : std_logic_vector(wE + wF + 1 downto 0);
	signal Ov : std_logic;
	signal Zero : std_logic;
	signal xR : std_logic_vector(1 downto 0);
	signal xAB : std_logic_vector(3 downto 0);
	signal xA, xB : std_logic_vector(1 downto 0);
	signal sAB : std_logic;
	
	signal nA_r, nB_r : std_logic_vector(wE + wF + 2 downto 0);
begin
	addsub : lns_addsub_cotran_clk
		generic map (
			K => wE,
			F => wF,
			MC => MC,
			reg => reg)
		port map (
			X => X,
			Y => Y,
			R => R,
			Ov => Ov,
			Zero => Zero,
			Op => '0',
			clk => clk,
			reset => reset);

	delays : if reg = true generate			
		delay_a : my_delay
			generic map (
				w => wE+wF+3,
				n => 3)
			port map (
				x => nA,
				xd => nA_r,
				clk => clk);

		delay_b : my_delay
			generic map (
				w => wE+wF+3,
				n => 3)
			port map (
				x => nB,
				xd => nB_r,
				clk => clk);
	end generate;
	
	no_delays : if reg = false generate
		nA_r <= nA;
		nB_r <= nB;
	end generate;

	X(wE+wF-1 downto 0) <= nA(wE+wF-1 downto 0);
	X(wE+wF) <= nA(wE+wF-1);
	X(wE+wF+1) <= nA(wE+wF);	-- sign
	
	Y(wE+wF-1 downto 0) <= nB(wE+wF-1 downto 0);
	Y(wE+wF) <= nB(wE+wF-1);
	Y(wE+wF+1) <= nB(wE+wF);
	
--	xR <=	"00"	when Ov = '1' and R(wE+wF) = '1' else
	xR <=	"00"	when Zero = '1' else
			"10"	when Ov = '1' else
			"01";
	
	sAB <= nA_r(wE+wF) xor nB_r(wE+wF);
	
	xA <= nA_r(wE+wF+2 downto wE+wF+1);
	xB <= nB_r(wE+wF+2 downto wE+wF+1);
	xAB <= nA_r(wE+wF+2 downto wE+wF+1) & nB_r(wE+wF+2 downto wE+wF+1);
	
--	with xAB select
--		nR(wE+wF+2 downto wE+wF+1) <=	xR					when "0101",
--										"1" & sAB			when "1010",
--										"11"				when "1011",
--										"00"				when "0000",
--										"01"				when "0001",
--										"10"				when "0010",
--										xAB(3 downto 2)	when others;
--
	nR(wE+wF+2 downto wE+wF+1) <=		"11"	when xA = "11" or xB = "11" else
										xR		when xAB = "0101" else
										"1" & sAB when xAB = "1010" else
										xB		when xA = "00" else
										xA;


	with xAB select
		nR(wE+wF) <=	R(wE+wF+1)						when "0101",
						nA_r(wE+wF) and nB_r(wE+wF)	when "0000",
						nB_r(wE+wF)					when "0001",
						nA_r(wE+wF)					when others;
		
	with xAB select
		nR(wE+wF-1 downto 0) <=	R(wE+wF-1 downto 0)	when "0101",
									nA_r(wE+wF-1 downto 0)	when "0100",
									nB_r(wE+wF-1 downto 0)	when others;--when "0001",
									--(wE+wF-1 downto 0 => '-') when others;

end architecture;


