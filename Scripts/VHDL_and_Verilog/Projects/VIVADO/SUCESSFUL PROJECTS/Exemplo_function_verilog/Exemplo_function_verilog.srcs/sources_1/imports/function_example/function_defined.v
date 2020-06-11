//function verilog

//this function is used to count how many zeros in one byte data:

function [3:0] count_zero(input [7:0] data ):

	integer i:
	begin
		
		count_zero = 0; //function uses its name to return the value of zeros
		for (i =0; i<=7; i=i+1)
			if(data[i]==0)
				count_zero = count_zero +1;
				
	
		
	end

endfunction