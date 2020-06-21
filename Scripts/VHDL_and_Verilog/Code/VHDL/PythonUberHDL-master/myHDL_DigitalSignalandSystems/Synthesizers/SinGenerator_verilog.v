//a
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

//reg signed [30:0] Reg_T1;
//reg signed [30:0] Reg_T0;

integer x=0;
//real seno=0;
integer contador=0;
//real n=10;
//real pi=3.1415;

assign SinValue_out = 5;


//always @(posedge clk, negedge rst) begin: SINGENERATOR_LOGICCP
//    if ((rst == 0)) begin
//        Reg_T0 <= ((2 ** 29) - 1);
//        x <= 478355485;
//    end
//    else begin
//        if ((ena == 1)) begin
//            Reg_T0 <= x;
//            x <= ($signed((478355485 * x) >>> (29 - 1)) - Reg_T0);
//        end
//    end
//end
always @(posedge clk) begin: SINGENERATOR_LOGICCP
    if ((contador<100)) begin
        x <=($signed( 0.01*2));
        contador <= contador +1;
        
//        seno<=x-((x**3)*(0.16666666))+((x**5)*(0.00833333))-((x**7)*(0.0001984126))+((x**9)*(0.000002755));
    end
//    else if ((100<contador<200)) begin
//        x <= x - 0.01*pi;
//        contador <= contador +1;
//    end
//    else begin
//        seno<=0; 
//        x <= 0;
//        contador <= 0;
//    end

    
    
    
    
end

endmodule