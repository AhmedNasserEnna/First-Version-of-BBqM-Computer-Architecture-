library verilog;
use verilog.vl_types.all;
entity ROM is
    port(
        address         : in     vl_logic_vector(4 downto 0);
        Wtime           : out    vl_logic_vector(4 downto 0)
    );
end ROM;
