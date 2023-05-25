library verilog;
use verilog.vl_types.all;
entity Counter is
    port(
        Up              : in     vl_logic;
        Down            : in     vl_logic;
        CLK             : in     vl_logic;
        reset           : in     vl_logic;
        Pcount          : out    vl_logic_vector(2 downto 0);
        Empty_Flag      : out    vl_logic;
        Full_Flag       : out    vl_logic;
        Alarm_Flag      : out    vl_logic
    );
end Counter;
