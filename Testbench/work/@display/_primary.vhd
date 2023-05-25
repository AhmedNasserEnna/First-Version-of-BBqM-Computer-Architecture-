library verilog;
use verilog.vl_types.all;
entity Display is
    port(
        Pcount          : in     vl_logic_vector(2 downto 0);
        Wtime           : in     vl_logic_vector(4 downto 0);
        led0_Pcount     : out    vl_logic_vector(6 downto 0);
        led1_Pcount     : out    vl_logic_vector(6 downto 0);
        led0_Wtime      : out    vl_logic_vector(6 downto 0);
        led1_Wtime      : out    vl_logic_vector(6 downto 0)
    );
end Display;
