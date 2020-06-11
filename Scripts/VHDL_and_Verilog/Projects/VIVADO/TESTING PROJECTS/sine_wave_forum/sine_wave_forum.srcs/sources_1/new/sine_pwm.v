`timescale 1ns / 1ps

module sine_pwm(clk, reset, en, sine, cos);
   input clk, reset, en;
   output [7:0] sine,cos;
   reg [7:0] sine_r, cos_r;
   assign      sine = sine_r + {cos_r[7], cos_r[7], cos_r[7], cos_r[7:3]};
   assign      cos  = cos_r - {sine[7], sine[7], sine[7], sine[7:3]};
   always@(posedge clk or negedge reset)
     begin
         if (!reset) begin
             sine_r <= 0;
             cos_r <= 120;
         end else begin
             if (en) begin
                 sine_r <= sine;
                 cos_r <= cos;
             end
         end
     end
endmodule // sine_pwm