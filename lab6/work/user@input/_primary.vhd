library verilog;
use verilog.vl_types.all;
entity userInput is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        leftButton      : in     vl_logic;
        rightButton     : in     vl_logic;
        L               : out    vl_logic;
        R               : out    vl_logic
    );
end userInput;
