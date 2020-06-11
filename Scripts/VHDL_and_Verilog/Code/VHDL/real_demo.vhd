 library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.MATH_REAL.ALL;

entity real_demo is
end real_demo;

architecture Behavioral of real_demo is

--signals declared with the REAL data type.
--MATH_PI is a constant defined in the math_real package.
signal X : real := -MATH_PI/3.0; --A real variable X, initialized to pi/3(60 degreee).
signal sign_result,ceil_result,floor_result,round_result,trunc_result : real := 0.0;
signal max,min,root,cube,power1,power2,exp_result : real := 0.0;
signal log_result,log2_result,log10_result,log_result2,sine,cosine,tangent : real := 0.0;
signal sin_inv,cos_inv,tan_inv,sin_hyp,cos_hyp,tan_hyp : real := 0.0;
signal inv_sin_hyp,inv_cos_hyp,inv_tan_hyp : real := 0.0;

begin

process
begin

sign_result <= SIGN(X);  --sign of X
ceil_result <= CEIL(X); --smallest integer value not less than X
floor_result <= FLOOR(X); --largest integer value not greater than X
round_result <= ROUND(X); --round to the nearest integer.
trunc_result <= TRUNC(X); --truncation.
max <= REALMAX(4.5,4.6); --return the maximum
min <= REALMIN(2.3,3.2); --return the minimum
root <= SQRT(4.0);  --square root
cube <= CBRT(64.0); --cube root
power1 <= 2**3.0; --power of an integer
power2 <= 3.0**3.0; --power of a real
exp_result <= EXP(1.0); --returns e**X.
log_result <= LOG(2.73); --natural logarithm
log2_result <= LOG2(16.0); --log to the base 2.
log10_result <= LOG10(100.0); --log to the base 10.
log_result2 <= LOG(27.0,3.0); --log to the given base.
sine <= SIN(X); --sine of the given angle(in rad)
cosine <= COS(X);--cosine of the given angle(in rad)
tangent <= TAN(X);--tangent of the given angle(in rad)
sin_inv <= ARCSIN(SIN(X)); --sine inverse.
cos_inv <= ARCCOS(COS(X)); --cosine inverse.
tan_inv <= ARCTAN(TAN(X)); --tangent inverse.
sin_hyp <= SINH(X); --Hyperbolic sine
cos_hyp <= COSH(X); --Hyperbolic cosine.
tan_hyp <= TANH(X); --Hyperbolic tangent.
inv_sin_hyp <= ARCSINH(SINH(X)); --Inverse hyperbolic sine.
inv_cos_hyp <= ARCCOSH(COSH(X)); --Inverse hyperbolic cosine.
inv_tan_hyp <= ARCTANH(TANH(X)); --Inverse hyperbolic tangent.
wait;

end process;   

end Behavioral;