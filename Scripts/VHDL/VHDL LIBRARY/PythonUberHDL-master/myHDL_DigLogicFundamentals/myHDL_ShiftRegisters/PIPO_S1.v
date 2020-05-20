// File: PIPO_S1.v
// Generated by MyHDL 0.10
// Date: Wed Sep  5 07:50:34 2018


`timescale 1ns/10ps

module PIPO_S1 (
    DataIn,
    DataOut1,
    DataOut2,
    clk,
    rst
);
// one-in two-out PIPO typicaly found in the lititure
// lacking buffering
// 
// Inputs:
//     DataIn(bitVec): one-in Parallel data int
//     clk(bool): clock
//     rst(bool): reset
//     
// Ouputs:
//     DataOut1(bitVec): Parallel out 1
//     DataOut2(bitVec): Parallel out 1
//     

input [3:0] DataIn;
output [3:0] DataOut1;
reg [3:0] DataOut1;
output [3:0] DataOut2;
reg [3:0] DataOut2;
input clk;
input rst;




always @(posedge clk, negedge rst) begin: PIPO_S1_LOGIC
    if (rst) begin
        DataOut1 <= 0;
        DataOut2 <= 0;
    end
    else begin
        DataOut1 <= DataIn;
        DataOut2 <= DataIn;
    end
end

endmodule
