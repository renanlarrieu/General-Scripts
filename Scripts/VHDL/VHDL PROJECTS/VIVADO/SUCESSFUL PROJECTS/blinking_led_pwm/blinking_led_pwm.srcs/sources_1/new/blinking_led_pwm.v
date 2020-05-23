`timescale 1ns / 1ps


module blinking_led_pwm(
        input GCLK,
        output LD0,
        output LD1,
        output LD2,
        output LD3,
        output LD4,
        output LD5,
        output LD6,
        output LD7
        
    );
    
//create a simple counter    
    
reg [31:0] counter = 0;

always@(posedge GCLK) begin
    if (counter <100) counter <= counter +1; //count until 100
    else counter <= 0; //reset counter

end

//create 10% duty cycle blink led

assign LD0 = (counter <10) ? 1:0; //assign led to 1 if counter value is less than 10

//create 20% duty cycle blink led

assign LD1 = (counter <20) ? 1:0; //assign led to 1 if counter value is less than 20

//create 30% duty cycle blink led

assign LD2 = (counter <30) ? 1:0; //assign led to 1 if counter value is less than 30

//create 40% duty cycle blink led

assign LD3 = (counter <40) ? 1:0; //assign led to 1 if counter value is less than 40

//create 50% duty cycle blink led

assign LD4 = (counter <50) ? 1:0; //assign led to 1 if counter value is less than 50

//create 60% duty cycle blink led

assign LD5 = (counter <60) ? 1:0; //assign led to 1 if counter value is less than 60

//create 70% duty cycle blink led

assign LD6 = (counter <70) ? 1:0; //assign led to 1 if counter value is less than 70

//create 80% duty cycle blink led

assign LD7 = (counter <80) ? 1:0; //assign led to 1 if counter value is less than 80



endmodule
