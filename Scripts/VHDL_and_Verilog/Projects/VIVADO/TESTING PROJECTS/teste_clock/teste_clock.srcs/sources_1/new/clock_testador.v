`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.05.2020 05:40:33
// Design Name: 
// Module Name: clock_testador
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


module clock_testador(
    input clk,
    output result
    );


reg [31:0] counter = 0;

always@(posedge clk) begin
    if (counter <100) counter <= counter +1; //count until 100
    else counter <= 0; //reset counter

end



assign result = (counter <80) ? 1:0; //assign led to 1 if counter value is less than 10


endmodule
