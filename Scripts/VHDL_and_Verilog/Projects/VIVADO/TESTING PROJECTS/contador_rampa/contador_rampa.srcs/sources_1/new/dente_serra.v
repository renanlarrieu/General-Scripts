
`timescale 1ns / 1ps

module dente_serra(
        input clk,
        output tensao_teste,
        output tensao_meio_ciclo

               
    );
    
//create a simple counter    
 //tensao = vp*sin(wt+phi)   
integer counter = 0;
integer R=10;
integer Vp=5;
integer tensao = 0;
always@(posedge clk) begin
    if (counter <628) counter <= counter +1;
        tensao=Vp*counter;
    if (counter == 628) counter <= 0;
    
    //else counter <= 0; //reset counter
    

end


assign tensao_teste = counter;
assign tensao_meio_ciclo = (counter <314) ? 1:0;




 


endmodule


