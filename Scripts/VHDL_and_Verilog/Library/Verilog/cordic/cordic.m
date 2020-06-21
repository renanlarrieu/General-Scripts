% Initialization arctan table
Bitwidth=16; 
cordic_precision=Bitwidth-1; 
ScalingFactor = (2^(cordic_precision-1)); 
K=1.0; 
for i=1:cordic_precision 
cordic_atan_table(i) = round(atan(K)*ScalingFactor); 
K=0.5*K; 
end; 
atan_dec=reshape(cordic_atan_table,cordic_precision,1); 
atan_hex=dec2hex(atan_dec) 

% x0 calculation 
an=1.0; 
for n=0:cordic_precision-1 
an=an*(sqrt(1 + 2^(-2*n))); 
end; 

x0=dec2hex(round(ScalingFactor*(1/an))) 


% Test angles 
Angles = [pi/2, pi/4, pi/8, 0.0]; 
testAngles=dec2hex(round(Angles*ScalingFactor)) 

% Results from Matlab 
cos_results=dec2hex(round(ScalingFactor*cos(Angles))) 
sin_results=dec2hex(round(ScalingFactor*sin(Angles)))


