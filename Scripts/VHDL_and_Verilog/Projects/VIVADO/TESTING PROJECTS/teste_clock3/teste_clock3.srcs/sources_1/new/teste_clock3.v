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


module teste_clock3(
    input clk,
    output sine
    );


integer x = 0;
integer seno;


always@(posedge clk) begin
    

      if (0 < x < 157) x <= x+1;
        seno <="primeiro quadrante";  
      if (157 < x < 314) x <= x+1;
        seno <="segundo quadrante";
      if (314 < x < 471) x <= x+1;
        seno <="terceiro quadrante";
      if (471 < x < 628) x <=x+1;
        seno <="quarto quadrante";



end


assign sine = x;
//assign sine = (x <80) ? 1:0; //assign led to 1 if x value is less than 10


endmodule
