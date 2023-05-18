library verilog;
use verilog.vl_types.all;
entity clock_divider is
    port(
        clock           : in     vl_logic;
        divided_closcks : out    vl_logic_vector(31 downto 0)
    );
end clock_divider;
