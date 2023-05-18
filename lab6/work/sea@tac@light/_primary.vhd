library verilog;
use verilog.vl_types.all;
entity seaTacLight is
    generic(
        nil             : vl_logic_vector(2 downto 0) := (HiX, HiX, HiX);
        R               : vl_logic_vector(2 downto 0) := (Hi0, Hi0, Hi1);
        M               : vl_logic_vector(2 downto 0) := (Hi0, Hi1, Hi0);
        L               : vl_logic_vector(2 downto 0) := (Hi1, Hi0, Hi0)
    );
    port(
        clk             : in     vl_logic;
        SW              : in     vl_logic_vector(1 downto 0);
        inputLED        : out    vl_logic_vector(2 downto 0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of nil : constant is 2;
    attribute mti_svvh_generic_type of R : constant is 2;
    attribute mti_svvh_generic_type of M : constant is 2;
    attribute mti_svvh_generic_type of L : constant is 2;
end seaTacLight;
