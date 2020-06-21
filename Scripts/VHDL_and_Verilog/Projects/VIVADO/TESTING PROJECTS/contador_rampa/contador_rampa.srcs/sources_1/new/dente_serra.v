
`timescale 1ns / 1ps

module dente_serra(
        input CLK,
        output [1:0] JB
//        output [1:0] JA
               
    );
    
//create a simple counter    
    
integer counter = 0;

always@(posedge CLK) begin
    if (counter <628) counter <= counter +1; //count until 100
    if (counter == 628) counter <= 0;
    //else counter <= 0; //reset counter
    

end



assign JB[0] = (counter <50) ? 1:0;




 


endmodule


