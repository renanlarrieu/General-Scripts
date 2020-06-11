library verilog;
use verilog.vl_types.all;
entity circuito_combinacional is
    port(
        A               : in     vl_logic;
        B               : in     vl_logic;
        C               : in     vl_logic;
        O               : out    vl_logic
    );
end circuito_combinacional;
