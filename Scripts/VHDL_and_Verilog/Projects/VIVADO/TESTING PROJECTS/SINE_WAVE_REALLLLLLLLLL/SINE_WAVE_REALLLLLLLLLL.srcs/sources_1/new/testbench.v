`timescale 1ns / 1ps


module testbench;

reg clk=0;
reg rst=1;
reg ena=1;

wire SinValue_out;

SinGenerator UUT (clk,rst,ena);

always #5 clk = ~clk; //define que o clock inverterá o sinal a cada 5 ns, portanto, o período de clock é 10ns
always #10 rst = ~rst;

endmodule
