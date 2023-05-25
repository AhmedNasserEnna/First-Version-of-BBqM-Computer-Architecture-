library verilog;
use verilog.vl_types.all;
entity sevenSegments is
    port(
        bcd             : in     vl_logic_vector(3 downto 0);
        dec             : out    vl_logic_vector(6 downto 0)
    );
end sevenSegments;
