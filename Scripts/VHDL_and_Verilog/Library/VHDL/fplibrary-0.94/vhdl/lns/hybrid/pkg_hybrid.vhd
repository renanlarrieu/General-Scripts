library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

library fplib;
use fplib.all;
use fplib.pkg_misc.all;

package pkg_hybrid is
  function addHybridLatency( wF : positive ) return natural;
  function Get_WBreak_Hybrid (K, F : positive) return positive;

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


  component LNSAdd_Hybrid_Swap is
    generic ( wE : positive;
              wF : positive );
    port ( nA : in  std_logic_vector(wE+wF+2 downto 0);
           nB : in  std_logic_vector(wE+wF+2 downto 0);
           nR : out std_logic_vector(wE+wF+2 downto 0);
           nS : out std_logic_vector(wE+wF+2 downto 0);
           eD : out std_logic_vector(wE+wF downto 0) );
  end component;

	component LNSSub_Hybrid_Clk is
	  generic(
		wE : positive := 5;
		wF : positive := 8;
		reg : boolean := true;
		wMPTBreak : positive := 8
	  );
	  port( x : in  std_logic_vector(min(wE,log(wF+1)+1)+wF-1 downto 0);
	        r : out std_logic_vector(wE+wF downto 0);
        	clk : in std_logic  );
	end component;

	component LNSADD_CTF_CLK is
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

	end component;

end package;


package body pkg_hybrid is
	function addHybridLatency( wF : positive ) return natural is
	begin
		if wF < 8 then
		    return 0;
		else
		    return 1;
		end if;
	end function;

	function Get_WBreak_Hybrid (K, F : positive) return positive is
	begin
		case F is
			when 6 =>
				return 3;
			when 7 =>
				return 4;
			when 8 =>
				return 4;
			when 9 =>
				return 5;
			when 10 =>
				return 5;
			when 11 =>
				return 6;
			when 12 =>
				return 6;
			when 13 =>
				return 7;
			when others =>
				return F / 2;
		end case;
	end;

end package body;
