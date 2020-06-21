`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.06.2020 19:26:11
// Design Name: 
// Module Name: LOGIC_GATE
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


module LOGIC_GATE(
    output high_port,
    output low_port
    );
    
parameter alto = 1'b1;    
parameter baixo = 1'b0; 
//reg [1:0] parametro =10;   

assign high_port = alto;
assign low_port = baixo;

//assign high_port = parametro[1];
//assign low_port = parametro[0];
endmodule
