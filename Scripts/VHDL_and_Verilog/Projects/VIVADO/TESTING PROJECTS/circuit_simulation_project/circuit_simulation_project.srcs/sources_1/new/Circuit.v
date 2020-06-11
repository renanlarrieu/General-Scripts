`timescale 1ns / 1ps

module Circuit(
    input Sine_source,
    input clk,
    output integer I
    

    );
      
//1
integer baixa_amplitude;
integer registrador_corrente;
integer Condutancia =0.1;   

always@(posedge clk)
begin
    baixa_amplitude = Sine_source*0.0001;
    I = baixa_amplitude*Condutancia;
    
end    


    
    
    
    
    
endmodule
