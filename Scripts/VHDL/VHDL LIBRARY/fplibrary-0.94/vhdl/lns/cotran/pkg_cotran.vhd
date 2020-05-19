library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

library fplib;
use fplib.all;
use fplib.pkg_misc.all;

package pkg_cotran is

	component lns_add_cotran_clk is
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


   function Get_WEssZero (K, F : positive) return positive;
   function Get_WBreak (K, F : positive) return positive;
   
   function Max_Input(K, F : positive) return std_logic_vector;
   function Max_FX_Out(F : positive) return positive;

 end pkg_cotran;
 
 package body pkg_cotran is
 	function Get_WEssZero (K, F : positive) return positive is
 	begin
 		return min(K,log(F+1)+1)+F; --F + 4;
 	end;
 	
 	function Get_WBreak (K, F : positive) return positive is
 	begin
		case F is
			when 6 =>
				return 5;
			when 7 =>
				return 6;
			when 8 =>
				return 6;
			when 9 =>
				return 7;
			when 10 =>
				return 8;
			when 11 =>
				return 8;
			when 12 =>
				return 8;
			when 13 =>
				return 9;
			when others =>
				return F/2+2;
		end case;
 	end;
 	
 	function Max_Input(K, F : positive) return std_logic_vector is
 		variable result : real;
 	begin
 		result := 0.5 + real(2 ** F) * log2((1.0 - (2.0 ** (-(2.0 ** real(-F))))));
 		return std_logic_vector(to_signed(integer(result), K+F+1));
 	end;
 	
	function Max_FX_Out(F : positive) return positive is
	begin
		case F is
			when 6 =>
				return 10;
			when 7 =>
				return 11;
			when 8 =>
				return 13;
			when 9 =>
				return 14;
			when 10 =>
				return 15;
			when 11 =>
				return 16;
			when 12 =>
				return 17;
			when 13 =>
				return 18;
			when others =>
				return F+5;
		end case;
	end;

 end;
