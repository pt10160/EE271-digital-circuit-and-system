library verilog;
use verilog.vl_types.all;
entity normalLight is
    generic(
        \on\            : vl_logic := Hi1;
        off             : vl_logic := Hi0
    );
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        L               : in     vl_logic;
        R               : in     vl_logic;
        NL              : in     vl_logic;
        NR              : in     vl_logic;
        lightOn         : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of \on\ : constant is 1;
    attribute mti_svvh_generic_type of off : constant is 1;
end normalLight;
