`timescale 1ns / 1ps

	
module sinus_gen(
    input clk ,
    output reg [31:0] sinus
    );
    
 
parameter SIZE = 10;    
reg [31:0] rom_memory [SIZE-1:0];
//trocar variáveis para integer caso queira sintetizar para placa
integer i;

integer tensao;
integer corrente;
integer R =10;
initial begin
    $readmemh("sine.mem", rom_memory); //File with the signal
    i = 0;
end    
//At every positive edge of the clock, output a sine wave sample.
always@(posedge clk)
begin
    sinus = rom_memory[i];
    tensao = sinus;
    corrente = tensao*0.1;
    i = i+ 1;
    if(i == SIZE)
        i = 0;
end
endmodule