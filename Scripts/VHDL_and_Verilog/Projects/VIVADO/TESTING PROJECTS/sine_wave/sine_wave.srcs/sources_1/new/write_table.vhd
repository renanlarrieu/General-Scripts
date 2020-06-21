library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;
library std;
use ieee.std_logic_textio.all;
use std.textio.all;
entity write_table is
end write_table;
architecture behav of write_table is
function quantization_sgn(nbit : integer; max_abs : real; dval : real) return std_logic_vector is
variable temp    : std_logic_vector(nbit-1 downto 0):=(others=>'0');
constant scale   : real :=(2.0**(real(nbit-1)))/max_abs;
constant minq    : integer := -(2**(nbit-1));
constant maxq    : integer := +(2**(nbit-1))-1;
variable itemp   : integer := 0;
begin
  if(nbit>0) then
    if (dval>=0.0) then 
      itemp := +(integer(+dval*scale+0.49));
    else 
      itemp := -(integer(-dval*scale+0.49));
    end if;
    if(itemp<minq) then itemp := minq; end if;
    if(itemp>maxq) then itemp := maxq; end if;
  end if;
  temp := std_logic_vector(to_signed(itemp,nbit));
  return temp;
end quantization_sgn;
function quantization_uns(nbit : integer; max_abs : real; dval : real) return std_logic_vector is
variable temp        : std_logic_vector(nbit-1 downto 0):=(others=>'0');
constant bit_sign    : std_logic_vector(nbit-1 downto 0):=('1',others=>'0');
begin
  temp := quantization_sgn(nbit, max_abs, dval);
  temp := temp xor bit_sign;
  return temp;
end quantization_uns;
constant nsamples  : integer:=5;  -- LOG2 OF THE VALUE
constant nbit      : integer:=8;
constant step      : real := 1.00/real(2**nsamples);
signal clk         : std_logic:='0';
signal sine        : real:=0.0;
signal qsine_sgn   : std_logic_vector(nbit-1 downto 0):=(others=>'0');
signal qsine_uns   : std_logic_vector(nbit-1 downto 0):=(others=>'0');
begin
clk  <= not clk after 1 ns; -- only for wave visualization on modelsim
p_sine_table : process(clk)
file test_vector                       : text open write_mode is "sin_table.dat";
variable row                           : line;
variable count                         : integer :=0;
variable v_sine        : real:=0.0;
variable v_tstep       : real:=0.0;
variable v_qsine_uns   : std_logic_vector(nbit-1 downto 0):=(others=>'0');
variable v_qsine_sgn   : std_logic_vector(nbit-1 downto 0):=(others=>'0');
begin
  if(rising_edge(clk)) then
    -- write table
    if(count<(2**nsamples)) then
      v_sine  := sin(MATH_2_PI*v_tstep);
      v_qsine_uns := quantization_uns(nbit, 1.0,v_sine);
      v_qsine_sgn := quantization_sgn(nbit, 1.0,v_sine);
      v_tstep := v_tstep + step;
      write(row,to_integer(unsigned(v_qsine_uns)), right, 5);
      write(row,',');
      count := count + 1;
      if((count mod 16)=0) then  
        writeline(test_vector,row); 
      end if;  -- write 16 values per line
      sine  <= v_sine ;
      qsine_uns <= v_qsine_uns;
      qsine_sgn <= v_qsine_sgn;
    else
      assert false
      report "Table Generated"
      severity failure;
    end if;
  end if;
end process p_sine_table;
end behav;