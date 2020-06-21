`timescale 1ns / 1ps
//archive to call the function created

module function_top (d_in, d_out);

	input [7:0] d_in;
	output reg [3:0] d_out;
	
	
	
    `include "count_zero.v"
	
	always @(d_in)
		d_out = count_zero(d_in);
		
endmodule
