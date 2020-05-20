// File: MUX2_1_B.v
// Generated by MyHDL 0.10
// Date: Sun Sep 23 18:20:53 2018


`timescale 1ns/10ps

module MUX2_1_B (
    x0,
    x1,
    s,
    y
);
// 2:1 Multiplexer written via behavioral if
// Input:
//     x0(bool): input channel 0
//     x1(bool): input channel 1
//     s(bool): channel selection input 
// Output:
//     y(bool): ouput

input x0;
input x1;
input s;
output y;
reg y;




always @(s, x0, x1) begin: MUX2_1_B_LOGIC
    if (s) begin
        y = x1;
    end
    else begin
        y = x0;
    end
end

endmodule
