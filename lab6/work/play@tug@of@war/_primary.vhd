library verilog;
use verilog.vl_types.all;
entity playTugOfWar is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        L               : in     vl_logic;
        R               : in     vl_logic;
        LEDR            : out    vl_logic_vector(8 downto 0);
        display         : out    vl_logic_vector(6 downto 0);
        displayCyber    : out    vl_logic_vector(6 downto 0)
    );
end playTugOfWar;
