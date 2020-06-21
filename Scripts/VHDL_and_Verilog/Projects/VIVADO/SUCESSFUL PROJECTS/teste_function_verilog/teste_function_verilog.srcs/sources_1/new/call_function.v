`timescale 1ns / 1ps
//archive to call the function created

module call_function ();

	integer  a,b;
	reg clk;
	integer  soma;
	
	
	
    `include "function_test.v"
	
	always @(posedge clk)
	   begin
	    
            soma = function_test(a,b);
        
        end
		
endmodule
