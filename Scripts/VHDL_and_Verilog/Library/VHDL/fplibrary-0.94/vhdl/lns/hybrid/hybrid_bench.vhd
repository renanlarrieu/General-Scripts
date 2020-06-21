library ieee;
use ieee.std_logic_1164.all;

library fplib;
use fplib.all;

entity hybrid_bench is
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

architecture arch of hybrid_bench is
	component lns_add_hybrid_clk is
	  generic ( wE : positive := 5;
	            wF : positive := 8;
	            MC : boolean := false;
	            reg : boolean := false);
	  port ( nA  : in  std_logic_vector(wE+wF+2 downto 0);
	         nB  : in  std_logic_vector(wE+wF+2 downto 0);
	         nR  : out std_logic_vector(wE+wF+2 downto 0);
	         clk : in  std_logic;
	         reset : in std_logic);
	end component;
	
	signal nA_r, nB_r : std_logic_vector(wE+wF+2 downto 0);
	signal nR_0 : std_logic_vector(wE+wF+2 downto 0);
begin
	add : lns_add_hybrid_clk
		generic map (
			wE => wE,
			wF => wF,
			MC => MC,
			reg => reg)
		port map (
			nA => nA_r,
			nB => nB_r,
			nR => nR_0,
			clk => clk,
			reset => reset);
	
	process(clk)
	begin
		if rising_edge(clk) then
			nA_r <= nA;
			nB_r <= nB;
			nR <= nR_0;
		end if;
	end process;
end architecture;
