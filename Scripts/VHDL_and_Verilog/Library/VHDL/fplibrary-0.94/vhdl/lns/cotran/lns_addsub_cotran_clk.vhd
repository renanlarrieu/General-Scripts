library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

library fplib;
use work.pkg_cotran.all;
use fplib.pkg_misc.all;
use fplib.pkg_lnsadd.all;

entity LNS_ADDSUB_COTRAN_CLK is
  generic (
    K  :     positive := 5;
    F  :     positive := 8;
    MC :     boolean := false;
    reg :    boolean := true);
  port (
    X  : in  std_logic_vector (K+F+1 downto 0);
    Y  : in  std_logic_vector (K+F+1 downto 0);
    Op : in  std_logic;                 -- 0: add, 1: sub
    R  : out std_logic_vector (K+F+1 downto 0);
    Ov : out std_logic;
	Zero : out std_logic;
	clk : in std_logic;
	reset : in std_logic);

end LNS_ADDSUB_COTRAN_CLK;

architecture cotran of LNS_ADDSUB_COTRAN_CLK is

  constant wEssZero : positive := Get_WEssZero(K, F);
  constant wBreak : positive := Get_WBreak(K, F);
  constant DB_Max_Input : std_logic_vector := Max_Input(K, F);
  constant UseF3 : boolean := true;

  signal SelMuxA : std_logic;
  signal SelMuxC_1, SelMuxC_2, SelMuxB_1, SelMuxB_2 : std_logic_vector (1 downto 0);
  signal IsSub, IsSub_2, IsSub_3, IsSub_4 : std_logic;
  signal Special, IsEssZero : std_logic;
  signal Xv     : std_logic_vector (K+F downto 0);
  signal Yv     : std_logic_vector (K+F downto 0);
  signal SignX  : std_logic;
  signal SignY  : std_logic;
  signal Za     : std_logic_vector (K+F downto 0);
  signal Zb     : std_logic_vector (K+F downto 0);
  signal Z, Z_2, Z_3       : std_logic_vector (K+F downto 0);
  signal Zp     : std_logic_vector(K+F downto 0);
  signal Zh     : std_logic_vector (wEssZero-1 downto wBreak);
  signal Zl     : std_logic_vector (wBreak-1 downto 0);
  signal F1_v_1, F1_v_2   : std_logic_vector (K+F downto 0);
  signal F2_v_1, F2_v_2   : std_logic_vector (K+F downto 0);
  signal Zsum   : std_logic_vector (K+F downto 0);
  signal Zdif   : std_logic_vector (K+F downto 0);
  signal ZEssZero : std_logic_vector (K+F downto 0);
  signal Zfinal_2, Zfinal_3 : std_logic_vector (K+F downto 0);
  signal SB0    : std_logic_vector (F downto 0);
  signal SB1    : std_logic_vector (F downto 0);
  signal DB0, DB0_3    : std_logic_vector (K+F downto 0);
  signal SignR_1, SignR_2, SignR_3, SignR_4  : std_logic;
  signal R0_1, R0_2, R0_3     : std_logic_vector (K+F downto 0);
  signal R1     : std_logic_vector (K+F+1 downto 0);
  signal SBEssZero_3, SBEssZero_4 : std_logic;
  signal ZfinalSign_4 : std_logic;
  signal ZfinalF_4 : std_logic_vector(F downto 1);
  signal DBR_3, DBR_4 : std_logic_vector(K+F+1 downto 0);
  signal DBRMC : std_logic_vector(K+F+1 downto 0);
  signal IsZero_2, IsZero_3, IsZero_4 : std_logic;
  signal XiR_3, XiR_4 : std_logic_vector(1 downto 0);
  signal XiRExt : std_logic_vector(K+F+1 downto 0);
  signal SBPos_3, SBPos_4 : std_logic_vector(F downto 0);
  
  --signal Ov : std_logic;
  
   component F1_TBL
     generic (
       K : positive;
       F : positive;
       wEssZero : positive;
       wBreak : positive);
     port (
       Addr : in  std_logic_vector (wEssZero-1 downto wBreak);  -- custom
       Val  : out std_logic_vector (K+F downto 0));
   end component;

   component F2_TBL
     generic (
       K : positive;
       F : positive;
       wEssZero : positive;
       wBreak : positive);
     port (
       Addr : in  std_logic_vector (wBreak-1 downto 0);
       Val  : out std_logic_vector (K+F downto 0));
   end component;


 component COMPRESSOR_A
    generic (
      w : positive);
    port (
      A : in  std_logic_vector (w downto 0);
      B : in  std_logic_vector (w downto 0);
      C : in  std_logic_vector (w downto 0);
      S : out std_logic_vector (w downto 0));
  end component;

  component LNSAdd_MCRand_Clk is
	generic (
		K : positive := 5;
		F : positive := 8;
		wRandLog : natural := 3; -- 8
		reg : boolean := true
	);
	port (
		Zp : in std_logic_vector(K+F downto 0);
		IsEssZero : in std_logic;
		IsSub : in std_logic;
		XiR : out std_logic_vector(1 downto 0);
		
		clk : in std_logic;
		reset : in std_logic
	);
  end component;
  
	component Positive_Table is
		generic (
			K : positive := 5;
			F : positive := 8;
			J : positive := 5
		);
		port (
			Z : in std_logic_vector(K+F downto 0);
			SB : out std_logic_vector(F downto 0)
			
		);
	end component;

begin  -- cotran

  
  Xv <= X(K+F downto 0);
  SignX <= X(K+F+1);
  Yv <= Y(K+F downto 0);
  SignY <= Y(K+F+1);

  IsSub <= SignX xor SignY xor Op;      -- IsSub = 1 -> use db
  
  Za <= Xv - Yv;                        -- leonardo uses special cells.
  Zb <= Yv - Xv;                        -- better results letting Leon. optim.

  with Za(K+F) select                   -- MUX for the negative
    Z <=
    Za when '1',                        -- Y > X
    Zb when others;                     -- X > Y

  with Za(K+F) select
	Zp <=
	Zb when '1',
	Za when others;


  Zh <= Z(wEssZero-1 downto wBreak);
  Zl <= Z(wBreak-1 downto 0);

--  IsEssZero <=  (not Z(12)) or
--                ( (not Z(11)) and (not Z(10)) ) or
--                ( (not Z(11)) and (not Z(9))  ) or
--                ( (not Z(11)) and (not Z(8))  );

  IsEssZero <= '1' when Z(K+F downto wBreak) < DB_Max_Input(K+F downto wBreak) else '0';

  Special <=
    '1' when Zh = (wEssZero-1 downto wBreak => '1') else
    '0';
  
  f1 : F1_TBL
    generic map (
      K    => K,
      F    => F,
      wEssZero => wEssZero,
      wBreak => wBreak)
    port map (
      Addr => Zh,
      Val  => F1_v_1);

  f2 : F2_TBL
    generic map (
      K    => K,
      F    => F,
      wEssZero => wEssZero,
      wBreak => wBreak)
    port map (
      Addr => Zl,
      Val  => F2_v_1);

  SelMuxA <= (Za(K+F) and ((not IsSub) or IsEssZero or Special) ) or
             (Zb(K+F) and (IsSub and (not IsEssZero) and (not Special)) );
                           
  with SelMuxA select
    R0_1 <=
    Yv when '1',
    Xv when others;


  rand : if MC = true generate
	rand : LNSAdd_MCRand_Clk
		generic map (
			K => K,
			F => F,
			wRandLog => 3,
			reg => reg
		)
		port map (
			Zp => Zp,
			IsEssZero => IsEssZero,
			IsSub => IsSub,
			XiR => XiR_3,
			clk => clk,
			reset => reset
		);
  end generate;
  
  no_rand : if MC = false generate
	XiR_3 <=	"00";
  end generate;

	--------------------------- 2

  csa_A : compressor_a
    generic map (
      w => K+F)
    port map (
      A => F1_v_2(K+F downto 0),
      B => F2_v_2(K+F downto 0),
      C => Z_2(K+F downto 0),
      S => Zdif(K+F downto 0));

--  Zdif(K+F) <= '1'; -- always negative
  
  Zsum  <= Z_2;

  ZEssZero <= '1' & (K+F-1 downto 0 => '0');

  SelMuxB_1 <= IsSub & (IsEssZero or Special);
          
  with SelMuxB_2 select                        -- MUX for the address to sb()
    Zfinal_2 <=
    Zdif  when "10",
    ZEssZero when "11",
    Zsum  when others;


  SelMuxC_1 <= (IsEssZero or (not IsSub)) & Special;

  with SelMuxC_2 select
    DB0 <=
    F1_v_2                   when "00",   -- subtraction, not special case
    F2_v_2                   when "01",   -- subtraction, special case (not EZ)
    (F+K downto 0 => '0') when others;  -- addition, or subtraction and EZ

  -- Special case : Z=11111110|000XX
--  SelMuxD_2 <=	'1' when	Z_2(K+F downto wBreak+1) = (K+F downto wBreak+1 => '1')
--							and Z_2(wBreak) = '0'
--							and Z_2(wBreak-1 downto delta) = (wBreak-1 downto delta => '0') else
--				'0';
--

  -- only test sign bit : Z cannot be positive
  IsZero_2 <= not Z_2(K+F);

	--------------------------- 3

  add_clk : if reg = true generate
	  add_tbl : LNSAdd_Add_Clk
	    generic map (
	      wE => K+1,
	      wF => F)
	    port map (
	      x  => Zfinal_3(wEssZero-1 downto 0),
	      r  => SB0,
	      clk => clk);
  end generate;
  
  add_noclk : if reg = false generate
	  add_tbl : LNSAdd_Add
	    generic map (
	      wE => K+1,
	      wF => F)
	    port map (
	      x  => Zfinal_3(wEssZero-1 downto 0),
	      r  => SB0);
  end generate;

  SBEssZero_3 <= 	'1' when Zfinal_3(K+F downto wEssZero) /= (K+F downto wEssZero => '1') else
					'0';


  DBR_3 <= (DB0_3(K+F) & DB0_3) + (R0_3(K+F) & R0_3);

  pos_tbl : Positive_Table
    generic map (
      K => K,
      F => F,
      J => wBreak)
    port map (
      Z => Z_3,
      SB => SBPos_3);

   ---------------------------- 4


  -- special cases : zero, essential zero, positive
  SB1 <=
--			"1" & (F-1 downto 0 => '0')	when ZfinalSign_4 = '0' else
			SBPos_4						when ZfinalSign_4 = '0' and UseF3 else
			"1" & ZfinalF_4				when ZfinalSign_4 = '0' and not UseF3 else	-- approximation by 1 + .5 * Z
			(F downto 0 => '0')			when SBEssZero_4 = '1' else
			SB0;

  XiRExt <= (K+F+1 downto 2 => XiR_4(1)) & XiR_4;
  DBRMC <= DBR_4 + XiRExt;

  R1 <= DBRMC + ((K+F+1 downto F+1 => '0') & SB1);


  -- underflow : Z=0
  Zero <= IsSub_4 and IsZero_4;

  Ov <= (R1(K+F+1) xor R1(K+F)) ;

  with Za(K+F) select                   -- Check sign of Za = X-Y
    SignR_1 <=
    SignX when '0',                     -- X is bigger
    SignY when others;                  -- Y is bigger

  R <= SignR_4 & R1(K+F downto 0);
  
  process(clk, F1_v_1, F2_v_1, Z, R0_1, SelMuxB_1, SelMuxC_1,
     SignR_1, IsSub, DB0, Zfinal_2, R0_2, SignR_2, IsSub_2,
     IsZero_2, Z_2, IsSub_3, SignR_3, SBEssZero_3, Zfinal_3,
     IsZero_3, DBR_3, XiR_3, SBPos_3)
  	procedure update_regs is
  	begin
		F1_v_2 <= F1_v_1;
		F2_v_2 <= F2_v_1;
		Z_2 <= Z;
		R0_2 <= R0_1;
		SelMuxB_2 <= SelMuxB_1;
		SelMuxC_2 <= SelMuxC_1;
		SignR_2 <= SignR_1;
		IsSub_2 <= IsSub;
		
		DB0_3 <= DB0;
		Zfinal_3 <= Zfinal_2;
		R0_3 <= R0_2;
		SignR_3 <= SignR_2;
		IsSub_3 <= IsSub_2;
		IsZero_3 <= IsZero_2;
		Z_3 <= Z_2;
		
		IsSub_4 <= IsSub_3;
		SignR_4 <= SignR_3;
		SBEssZero_4 <= SBEssZero_3;
		ZfinalSign_4 <= Zfinal_3(K+F);
		ZfinalF_4 <= Zfinal_3(F downto 1);
		IsZero_4 <= IsZero_3;
		DBR_4 <= DBR_3;
		XiR_4 <= XiR_3;
		SBPos_4 <= SBPos_3;
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
end cotran;

