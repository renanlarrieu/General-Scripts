library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity LNSAdd_MCRand_Clk is
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
end entity;


-- 3-stage pipeline
architecture arch of LNSAdd_MCRand_Clk is
	component PRNG is
		generic (
			w : natural
		);
		port (
			clk : in std_logic;
			reset : in std_logic;
			val : out std_logic_vector(w - 1 downto 0)
		);
	end component;
	
	constant wRand : positive := 2 ** wRandLog;
	
	signal bIsEssZero, bIsSub : boolean;
	signal ShiftAmount_1, ShiftAmount_2 : unsigned(K+F downto 0);
	signal ZEssZero : unsigned(wRand downto 0);
	signal ZEssZero2 : unsigned(wRand downto 0);
	signal Xi1 : std_logic_vector(wRand - 1 downto 0);
	signal XiEZ2 : unsigned(wRand downto 0);
	signal XiEZMsb_2, XiEZMsb_3 : std_ulogic;
	signal XiNormal_2, XiNormal_3 : signed(1 downto 0);
	signal IsEssZero_2, IsEssZero_3 : boolean;
	signal IsSub_2, IsSub_3 : boolean;
begin

	---------- stage 1
	ShiftAmount_1 <= unsigned(Zp) - to_unsigned(F, 5);
	
	bIsEssZero <= true when IsEssZero = '1' else false;
	bIsSub <= true when IsSub = '1' else false;
	
	---------- stage 2
	ZEssZero <=	("1" & (wRand-1 downto 0 => '0'))
				srl to_integer(ShiftAmount_2(wRandLog-1 downto 0));
	
	ZEssZero2 <=	ZEssZero	when ShiftAmount_2(K+F downto wRandLog) = 0 else
					(wRand downto 0 => '0');
	
	generator : PRNG
		generic map (
			w => wRand)
		port map (
			clk => clk,
			reset => reset,
			val => Xi1);
	
	with Xi1(1 downto 0) select
		XiNormal_2 <=	"11" when "10",
						"01" when "01",
						"00" when others;
	
	XiEZ2 <= unsigned(Xi1) + ZEssZero2;
	XiEZMsb_2 <= XiEZ2(wRand);
	
	---------- stage 3

	XiR <=	'0' & XiEZMsb_3			when IsEssZero_3 and not IsSub_3 else
			XiEZMsb_3 & XiEZMsb_3	when IsEssZero_3 and IsSub_3 else
			std_logic_vector(XiNormal_2);
				
	process(clk)
		procedure update_regs is
		begin
			ShiftAmount_2 <= ShiftAmount_1;
			IsEssZero_2 <= bIsEssZero;
			IsSub_2 <= bIsSub;
			
			XiEZMsb_3 <= XiEZMsb_2;
			XiNormal_3 <= XiNormal_2;
			IsEssZero_3 <= IsEssZero_2;
			IsSub_3 <= IsSub_2;
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
