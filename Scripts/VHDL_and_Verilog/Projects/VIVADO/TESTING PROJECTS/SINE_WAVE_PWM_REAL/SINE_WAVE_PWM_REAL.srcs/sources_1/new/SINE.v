`timescale 1ns / 1ps


module sine(
        input clk,
        output sine_out  
            );
    
//create a simple counter    
    
reg [31:0] counter = 0;
integer x = 0;



always@(posedge clk) begin
    if (counter <25) 
        x <= x + 1; //count until 100
        counter <= counter +1;
    if (25 <counter <50) 
        x <= x - 1; //count until 100
        counter <= counter +1;
    if (50 < counter < 75) 
        x <= x - 1; //count until 100
        counter <= counter +1;
    if (75 < counter <100)
         x <= x + 1; //count until 100
         //counter <= counter +1;
    else x <= 0; //reset counter

end



//assign sine_out = (counter <10) ? 1:0; //assign led to 1 if counter value is less than 10
assign sine_out = x; //assign led to 1 if counter value is less than 10





endmodule