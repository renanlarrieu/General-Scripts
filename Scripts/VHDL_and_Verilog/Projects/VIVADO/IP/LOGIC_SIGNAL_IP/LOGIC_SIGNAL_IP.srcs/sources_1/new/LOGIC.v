`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.06.2020 20:17:25
// Design Name: 
// Module Name: LOGIC
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module LOGIC(
    output HIGH,
    output LOW
    );


parameter high_signal = 1'b1;
parameter low_signal = 1'b0;

assign HIGH = high_signal;
assign LOW = low_signal;

endmodule