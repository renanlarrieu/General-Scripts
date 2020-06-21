`timescale 1ns / 1ps

module porta_digital_pwm(
        input CLK,
        output JB1
        
        
    );
    
//create a simple counter    
    
reg [31:0] counter = 0;

always@(posedge CLK) begin
    if (counter <100) counter <= counter +1; //count until 100
    else counter <= 0; //reset counter

end



assign JB1 = (counter <80) ? 1:0; //assign led to 1 if counter value is less than 10


endmodule
