library verilog;
use verilog.vl_types.all;
entity my_and is
    port(
        a               : in     vl_logic;
        b               : in     vl_logic;
        o               : out    vl_logic
    );
end my_and;
