library verilog;
use verilog.vl_types.all;
entity BBqM is
    port(
        Up              : in     vl_logic;
        Down            : in     vl_logic;
        CLK             : in     vl_logic;
        reset           : in     vl_logic;
        Tcount          : in     vl_logic_vector(1 downto 0);
        Empty_Flag      : out    vl_logic;
        Full_Flag       : out    vl_logic;
        Alarm_Flag      : out    vl_logic;
        led0_Pcount     : out    vl_logic_vector(6 downto 0);
        led1_Pcount     : out    vl_logic_vector(6 downto 0);
        led0_Wtime      : out    vl_logic_vector(6 downto 0);
        led1_Wtime      : out    vl_logic_vector(6 downto 0)
    );
end BBqM;
