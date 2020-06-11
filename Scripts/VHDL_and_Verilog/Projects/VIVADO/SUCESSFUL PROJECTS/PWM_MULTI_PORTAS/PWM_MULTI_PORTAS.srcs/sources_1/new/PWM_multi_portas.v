
`timescale 1ns / 1ps

module PWM_multi_portas(
        input CLK,
        output [7:0] JB,
        output [1:0] JA
               
    );
    
//create a simple counter    
    
reg [31:0] counter = 0;

always@(posedge CLK) begin
    if (counter <100) counter <= counter +1; //count until 100
    else counter <= 0; //reset counter

end



assign JB[0] = (counter <10) ? 1:0;
assign JB[1] = (counter <20) ? 1:0;
assign JB[2] = (counter <30) ? 1:0;
assign JB[3] = (counter <40) ? 1:0;
assign JB[4] = (counter <50) ? 1:0;
assign JB[5] = (counter <60) ? 1:0;
assign JB[6] = (counter <70) ? 1:0;
assign JB[7] = (counter <80) ? 1:0;

assign JA[0] = (counter <90) ? 1:0;
assign JA[1] = (counter <100) ? 1:0;



 


endmodule


