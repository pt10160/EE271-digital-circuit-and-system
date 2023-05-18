library verilog;
use verilog.vl_types.all;
entity victory is
    generic(
        zero            : vl_logic_vector(0 to 2) := (Hi0, Hi0, Hi0);
        seven           : vl_logic_vector(0 to 2) := (Hi1, Hi1, Hi1)
    );
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        leftest         : in     vl_logic;
        L               : in     vl_logic;
        rightest        : in     vl_logic;
        R               : in     vl_logic;
        resetField      : out    vl_logic;
        display         : out    vl_logic_vector(6 downto 0);
        displayCyber    : out    vl_logic_vector(6 downto 0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of zero : constant is 1;
    attribute mti_svvh_generic_type of seven : constant is 1;
end victory;
