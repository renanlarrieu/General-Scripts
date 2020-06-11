library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

library fplib;
use fplib.pkg_hybrid.all;
use fplib.pkg_cotran.all;
use fplib.pkg_misc.all;
use fplib.pkg_lnsadd.all;


entity lns_add_hybrid_clk is
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

architecture arch of lns_add_hybrid_clk is

	component my_delay is
	  generic ( w : positive;
				n : integer := 1;
				enable : boolean := true );
	  port ( x     : in  std_logic_vector(w-1 downto 0);
			 xd    : out std_logic_vector(w-1 downto 0);
			 clk   : in  std_logic);
	end component;

  --component LNSAdd_Add_Clk
--	  generic ( wE : positive;
--	            wF : positive );
--	  port ( x   : in  std_logic_vector(mini(wE,log(wF+1)+1)+wF-1 downto 0);
--	         r   : out std_logic_vector(wF downto 0);
--	         clk : in  std_logic );
--  end component;

--   component LNSAdd_Add
--	  generic ( wE : positive;
--	            wF : positive );
--	  port ( x   : in  std_logic_vector(mini(wE,log(wF+1)+1)+wF-1 downto 0);
--	         r   : out std_logic_vector(wF downto 0));
--  end component;

  constant wEssZero : positive := Get_WEssZero(wE, wF);
  constant wMPTBreak : positive := wF+3;

	signal Ov : std_logic;
	signal Zero_1, Zero_4 : std_logic;
	signal xR : std_logic_vector(1 downto 0);
	signal xAB : std_logic_vector(3 downto 0);
	signal sAB : std_logic;
	
	signal nA0_1, nA0_3, nA0_4 : std_logic_vector(wE + wF + 2 downto 0);
	signal nB0_1, nB0_4 : std_logic_vector(wE + wF + 2 downto 0);
	signal Z_1 : std_logic_vector(wE + wF downto 0);
	
	signal ZCotran : std_logic_vector(wE + wF downto 0);
	signal IsSub_1 : std_logic;
	signal SBArg_2, SBArg_3 : std_logic_vector(wE+wF downto 0);
	signal DBR_2, DBR_3, DBR_4 : std_logic_vector(wE+wF+1 downto 0);
	signal SB0_4 : std_logic_vector(wF downto 0);
	signal SB1 : std_logic_vector(wF downto 0);
	signal R1 : std_logic_vector(wE+wF+1 downto 0);
	
	signal RCotran : std_logic_vector(wE+wF+1 downto 0);
	signal RMpt0_2, RMpt0_3 : std_logic_vector(wE+wF downto 0);
	signal RMpt1_3, RMpt1_4 : std_logic_vector(wE+wF+1 downto 0);
	signal UseMpt_1, UseMpt_4 : std_logic;
	signal SignR_4 : std_logic;
	signal SBArgShifted_3, SBArgShifted_4 : std_logic_vector(wF downto 1);
	signal SBArgSign_3, SBArgSign_4 : std_logic;
	signal SBEssZero_3, SBEssZero_4 : std_logic;
	
	signal RMin, RMax : std_logic_vector(wE+wF downto 0);
begin
	swap : lnsadd_hybrid_swap
		generic map (
			wE => wE,
			wF => wF)
		port map (
			nA => nA,
			nB => nB,
			nR => nA0_1,
			nS => nB0_1,
			eD => Z_1
			);

	-- Forcing the upper bits to 1 should make the synthesizer optimize away
	-- the upper part of the F1 table
	ZCotran <= (wE+wF downto wMPTBreak => '1') & Z_1(wMPTBReak-1 downto 0);
	
	IsSub_1 <= nA(wE+wF) xor nB(wE+wF);
	
	-- Use multipartite Db table only when sub and Z > 2^wMptBreak
	--UseMpt_1 <= IsSub_1 and (not Z_1(wMptBreak));
	UseMpt_1 <= '0' when IsSub_1 = '0'
         or Z_1(wE+wF downto wMptBreak) = (wE+wF downto wMptBreak => '1') else
	   '1';

	-- underflow : X-X=0
 	Zero_1 <=	'1' when IsSub_1 = '1' and Z_1 = (wE+wF downto 0 => '0') else
 			'0';

   RMin <= nB0_1(wE+wF-1) & nB0_1(wE+wF-1 downto 0);
   RMax <= nA0_1(wE+wF-1) & nA0_1(wE+wF-1 downto 0);
   
	cotran_addsub : lnsadd_ctf_clk
		generic map (
			K => wE,
			F => wF,
			reg => reg)
		port map (
			Z => ZCotran,
			RMin => RMin,
			RMax => RMax,
			IsSub => IsSub_1,
			SBArg => SBArg_2,
			DBR => DBR_2,
			clk => clk,
			reset => reset);

	mpt_sub : lnssub_hybrid_clk
		generic map (
			wE => wE,
			wF => wF,
			reg => reg,
			wMPTBreak => wMPTBreak)
		port map (
			x => Z_1(wEssZero-1 downto 0),
			r => RMpt0_2,
			clk => clk);

	--------------------------------- stage 3


  mpt_add_clk : if reg = true generate
	  add_tbl : LNSAdd_Add_Clk
	    generic map (
	      wE => wE+1,
	      wF => wF)
	    port map (
	      x  => SBArg_3(wEssZero-1 downto 0),
	      r  => SB0_4,
	      clk => clk);
  end generate;
  
  mpt_add_noclk : if reg = false generate
	  add_tbl : LNSAdd_Add
	    generic map (
	      wE => wE+1,
	      wF => wF)
	    port map (
	      x  => SBArg_3(wEssZero-1 downto 0),
	      r  => SB0_4);
  end generate;

  SBEssZero_3 <= 	'1' when SBArg_3(wE+wF downto wEssZero) /= (wE+wF downto wEssZero => '1') else
					'0';

  SBArgShifted_3 <= SBArg_3(wF downto 1);
  SBArgSign_3 <= SBArg_3(wE+wF);
  
  RMpt1_3 <= (nA0_3(wE+wF-1) & nA0_3(wE+wF-1) & nA0_3(wE+wF-1 downto 0)) - (RMpt0_3(wE+wF) & RMpt0_3);

	--------------------------------- stage 4

  -- special cases : essential zero, zero, positive
  SB1 <=
			"1" & SBArgShifted_4		when SBArgSign_4 = '0' else	-- approximation by .5 * Z
			(wF downto 0 => '0')		when SBEssZero_4 = '1' else
			SB0_4;


  RCotran <= DBR_4 + ((wE+wF+1 downto wF+1 => '0') & SB1);


  -- mux E
  with UseMpt_4 select
  	R1 <=	RMpt1_4   when '1',
  			RCotran   when others;



  Ov <= (R1(wE+wF+1) xor R1(wE+wF)) ;

	delay_a : my_delay
		generic map (
			w => wE+wF+3,
			n => 2,
			enable => reg)
		port map (
			x => nA0_1,
			xd => nA0_3,
			clk => clk);

	delay_b : my_delay
		generic map (
			w => wE+wF+3,
			n => 3,
			enable => reg)
		port map (
			x => nB0_1,
			xd => nB0_4,
			clk => clk);

	delay_zero : my_delay
		generic map (
			w => 1,
			n => 3,
			enable => reg)
		port map (
			x(0) => Zero_1,
			xd(0) => Zero_4,
			clk => clk);

	delay_usempt : my_delay
		generic map (
			w => 1,
			n => 3,
			enable => reg)
		port map (
			x(0) => UseMpt_1,
			xd(0) => UseMpt_4,
			clk => clk);
	
	xR <=	"00"	when Zero_4 = '1' else
			"10"	when Ov = '1' else
			"01";
	
	sAB <= nA0_4(wE+wF) xor nB0_4(wE+wF);
	
	xAB <= nA0_4(wE+wF+2 downto wE+wF+1) & nB0_4(wE+wF+2 downto wE+wF+1);
	
	with xAB select
		nR(wE+wF+2 downto wE+wF+1) <=	xR					when "0101",
										"1" & sAB			when "1010",
										"11"				when "1011",
										xAB(3 downto 2)	when others;
	SignR_4 <= nA0_4(wE+wF);


	with xAB select
		nR(wE+wF) <=	SignR_4							when "0101",
						nA0_4(wE+wF) and nB0_4(wE+wF)	when "0000",
						nA0_4(wE+wF)					when others;
		
	with xAB select
		nR(wE+wF-1 downto 0) <=	R1(wE+wF-1 downto 0)	when "0101",
								nA0_4(wE+wF-1 downto 0)	when others;


  process(clk, DBR_2, RMpt0_2, SBArg_2, DBR_3, RMpt1_3, nA0_3, SBArgShifted_3, SBArgSign_3, SBEssZero_3)
  	procedure update_regs is
  	begin
  		DBR_3 <= DBR_2;
  		RMpt0_3 <= RMpt0_2;
  		SBArg_3 <= SBArg_2;
  		
  		DBR_4 <= DBR_3;
  		RMpt1_4 <= RMpt1_3;
  		nA0_4 <= nA0_3;
  		SBArgShifted_4 <= SBArgShifted_3;
  		SBArgSign_4 <= SBArgSign_3;
  		SBEssZero_4 <= SBEssZero_3;
  	end procedure;
  begin
  	if reg = true then
		if rising_edge(clk) then
			update_regs;
		end if;
	else
		update_regs;
	end if;
  end process;

end architecture;


