	
`timescale 1ns / 1ps
module myModule(A, B, result);
input A;
input B;
output result;

assign result = A & B;
 
endmodule