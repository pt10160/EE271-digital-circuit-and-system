library verilog;
use verilog.vl_types.all;
entity decoder is
    generic(
        zero            : vl_logic_vector(0 to 2) := (Hi0, Hi0, Hi0);
        one             : vl_logic_vector(0 to 2) := (Hi0, Hi0, Hi1);
        two             : vl_logic_vector(0 to 2) := (Hi0, Hi1, Hi0);
        three           : vl_logic_vector(0 to 2) := (Hi0, Hi1, Hi1);
        four            : vl_logic_vector(0 to 2) := (Hi1, Hi0, Hi0);
        five            : vl_logic_vector(0 to 2) := (Hi1, Hi0, Hi1);
        six             : vl_logic_vector(0 to 2) := (Hi1, Hi1, Hi0);
        seven           : vl_logic_vector(0 to 2) := (Hi1, Hi1, Hi1)
    );
    port(
        state           : in     vl_logic_vector(2 downto 0);
        display         : out    vl_logic_vector(6 downto 0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of zero : constant is 1;
    attribute mti_svvh_generic_type of one : constant is 1;
    attribute mti_svvh_generic_type of two : constant is 1;
    attribute mti_svvh_generic_type of three : constant is 1;
    attribute mti_svvh_generic_type of four : constant is 1;
    attribute mti_svvh_generic_type of five : constant is 1;
    attribute mti_svvh_generic_type of six : constant is 1;
    attribute mti_svvh_generic_type of seven : constant is 1;
end decoder;
