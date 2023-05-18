library verilog;
use verilog.vl_types.all;
entity button is
    generic(
        \on\            : vl_logic := Hi1;
        off             : vl_logic := Hi0
    );
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        button          : in     vl_logic;
        \out\           : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of \on\ : constant is 1;
    attribute mti_svvh_generic_type of off : constant is 1;
end button;
