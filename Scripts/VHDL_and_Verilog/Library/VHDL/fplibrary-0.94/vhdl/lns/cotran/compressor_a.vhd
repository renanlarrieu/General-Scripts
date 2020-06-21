-------------------------------------------------------------------------------
-- 3 to 1 by 13 bits compressor
-- The 3 inputs are signed. However, the sign bit is not used, since the result
-- is guaranteed to be NEGATIVE. Remaining bits can be added and sign pateched
-- after the addition.
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

library fplib;
use fplib.all;

entity COMPRESSOR_A is

  generic (
    w : positive := 13);               
  port (
    A : in  std_logic_vector (w downto 0);
    B : in  std_logic_vector (w downto 0);
    C : in  std_logic_vector (w downto 0);
    S : out std_logic_vector (w downto 0));

end COMPRESSOR_A;

-- architecture by_hand of COMPRESSOR_A is

--   component full_adder
--     port (
--       X    : in  std_logic;
--       Y    : in  std_logic;
--       Cin  : in  std_logic;
--       Sum  : out std_logic;
--       Cout : out std_logic);
--   end component;

--   component half_adder
--     port (
--       X    : in  std_logic;
--       Y    : in  std_logic;
--       Sum  : out std_logic;
--       Cout : out std_logic);
--   end component;


--   signal D : std_logic_vector (13 downto 0);
--   signal E : std_logic_vector (13 downto 1);
--   signal F : std_logic_vector (13 downto 1);
  
-- begin  -- by_hand

--   fa_block : for i in 12 downto 0 generate
--     D(i) <= A(i) xor B(i) xor C(i);
--     E(i+1) <= ((A(i) xor B(i)) and C(i)) or (A(i) and B(i));
--   end generate fa_block;

--   D(13) <= A(13) xor B(13) xor C(13);  


--   F <= D(13 downto 1) +  E(13 downto 1);

--   S(0) <= D(0);
--   S(13 downto 1) <= F(13 downto 1);
      
  
-- end by_hand;

architecture auto_generated of COMPRESSOR_A is

begin  -- auto_generated

  S <= B - A - C;

end auto_generated;
