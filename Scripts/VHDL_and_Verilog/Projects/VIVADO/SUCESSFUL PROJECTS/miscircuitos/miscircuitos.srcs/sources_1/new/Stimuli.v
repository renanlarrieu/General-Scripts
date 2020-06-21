`timescale 1ns / 1ps
module Stimuli( A, B, clk);
output A;
output B;
output reg clk;
 
always 
begin
clk = 1'b1;
#5; 
clk = 1'b0; 
#5; // 10ns period

end
 
initial begin

begin
A =1'b0;
#10;
B=1'b1;
#10;
A=1'b1;
#10;
B=1'b0;
end

endmodule


//        A =  $urandom_range(0,1); //random value between 0 and 1
//        B = 1'b0;
//        #10; //wait 10 nanosecons
//        B = 1'b1;
//        #30;
//        A = 1'b0;
//        B = $urandom_range(0,1);
//        #50;


