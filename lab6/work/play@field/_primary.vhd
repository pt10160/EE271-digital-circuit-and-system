library verilog;
use verilog.vl_types.all;
entity playField is
    port(
        clk             : in     vl_logic;
        resetField      : in     vl_logic;
        reset           : in     vl_logic;
        L               : in     vl_logic;
        R               : in     vl_logic;
        LEDR            : out    vl_logic_vector(8 downto 0)
    );
end playField;
