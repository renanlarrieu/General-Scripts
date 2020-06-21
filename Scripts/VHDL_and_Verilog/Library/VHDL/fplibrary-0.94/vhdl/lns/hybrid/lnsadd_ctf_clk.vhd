library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

library fplib;
use fplib.pkg_cotran.all;
use fplib.pkg_hybrid.all;
--use fplib.pkg_misc.all;
use fplib.all;

-- 2-stage pipeline
entity LNSADD_CTF_CLK is
  generic (
    K  :     positive := 5;
    F  :     positive := 8;
    reg :    boolean := true);
  port (
    Z  : in  std_logic_vector(K+F downto 0);
    RMin : in std_logic_vector(K+F downto 0);
    RMax : in std_logic_vector(K+F downto 0);
    IsSub : in std_logic;
    SBArg : out std_logic_vector(K+F downto 0);
    DBR : out std_logic_vector(K+F+1 downto 0);
	clk : in std_logic;
	reset : in std_logic);

end entity;

architecture cotran of LNSADD_CTF_CLK is

  constant wEssZero : positive := Get_WEssZero(K, F);
  constant wBreak : positive := Get_WBreak_Hybrid(K, F);
  constant DB_Max_Input : std_logic_vector := Max_Input(K, F);

  signal SelMuxC_1, SelMuxC_2, SelMuxB_1, SelMuxB_2 : std_logic_vector (1 downto 0);
  signal Special, IsEssZero : std_logic;
  signal Z_2       : std_logic_vector (K+F downto 0);
--  signal Zp     : std_logic_vector(K+F downto 0);
  signal Zh     : std_logic_vector (wEssZero-1 downto wBreak);
  signal Zl     : std_logic_vector (wBreak-1 downto 0);
  signal F1_v_1, F1_v_2   : std_logic_vector (K+F downto 0);
  signal F2_v_1, F2_v_2   : std_logic_vector (K+F downto 0);
  signal Zsum   : std_logic_vector (K+F downto 0);
  signal Zdif   : std_logic_vector (K+F downto 0);
  signal ZEssZero : std_logic_vector (K+F downto 0);
  signal Zfinal_2 : std_logic_vector (K+F downto 0);
  signal DB0    : std_logic_vector (K+F downto 0);
  signal R0, R0_1, R0_2     : std_logic_vector (K+F downto 0);
  
   component F1_TBL
     generic (
       K : positive;
       F : positive;
       wEssZero : positive;
       wBreak : positive);
     port (
       Addr : in  std_logic_vector (wEssZero-1 downto wBreak);
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

begin

  Zh <= Z(wEssZero-1 downto wBreak);
  --Zh <= (wEssZero-1 downto F => '1') & Z(F-1 downto wBreak);
  Zl <= Z(wBreak-1 downto 0);

  IsEssZero <= '1' when Z(K+F downto wBreak) < DB_Max_Input(K+F downto wBreak) else '0';

  Special <=
    '1' when Zh = (wEssZero-1 downto wBreak => '1') else
    '0';
    
  with IsEssZero or Special select
  	R0 <=	RMin when '0',
  			RMax when others;
  
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

--  SelMuxA <= (Za(K+F) and ((not IsSub) or IsEssZero or Special) ) or
--             (Zb(K+F) and (IsSub and (not IsEssZero) and (not Special)) );

  R0_1 <= R0;                           

  SelMuxB_1 <= IsSub & (IsEssZero or Special);

  SelMuxC_1 <= (IsEssZero or (not IsSub)) & Special;

	--------------------------- stage 2

  csa_A : compressor_a
    generic map (
      w => K+F)
    port map (
      A => F1_v_2(K+F downto 0),
      B => F2_v_2(K+F downto 0),
      C => Z_2(K+F downto 0),
      S => Zdif(K+F downto 0));

  Zsum  <= Z_2;

  ZEssZero <= '1' & (K+F-1 downto 0 => '0');

          
  with SelMuxB_2 select                        -- MUX for the address to sb()
    Zfinal_2 <=
    Zdif  when "10",
    ZEssZero when "11",
    Zsum  when others;

  SBArg <= Zfinal_2;

  with SelMuxC_2 select
    DB0 <=
    F1_v_2                   when "00",   -- subtraction, not special case
    F2_v_2                   when "01",   -- subtraction, special case (not EZ)
    (F+K downto 0 => '0') when others;  -- addition, or subtraction and EZ


  DBR <= (DB0(K+F) & DB0) + (R0_2(K+F) & R0_2);

  
  process(clk)
  	procedure update_regs is
  	begin
		F1_v_2 <= F1_v_1;
		F2_v_2 <= F2_v_1;
		Z_2 <= Z;
		R0_2 <= R0_1;
		SelMuxB_2 <= SelMuxB_1;
		SelMuxC_2 <= SelMuxC_1;
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

