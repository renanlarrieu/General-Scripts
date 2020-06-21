
`timescale 1ns/10ps

module SinGenerator (
    SinValue_out,
    clk,
    rst,
    ena
);


output signed [30:0] SinValue_out;
wire signed [30:0] SinValue_out;
input clk;
input rst;
input ena;

reg signed [30:0] Reg_T1;
reg signed [30:0] Reg_T0;






assign SinValue_out = Reg_T1;


always @(posedge clk, negedge rst) begin: SINGENERATOR_LOGICCP
    if ((rst == 0)) begin
        Reg_T0 <= ((2 ** 29) - 1);
        Reg_T1 <= 478355485;
    end
    else begin
        if ((ena == 1)) begin
            Reg_T0 <= Reg_T1;
            Reg_T1 <= ($signed((478355485 * Reg_T1) >>> (29 - 1)) - Reg_T0);
        end
    end
end

endmodule