library verilog;
use verilog.vl_types.all;
entity LSDR is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        \out\           : out    vl_logic_vector(8 downto 0)
    );
end LSDR;
