library verilog;
use verilog.vl_types.all;
entity hammingdec is
    port(
        clk             : in     vl_logic;
        r               : in     vl_logic_vector(6 downto 0);
        s               : out    vl_logic_vector(2 downto 0);
        c               : out    vl_logic_vector(6 downto 0);
        d               : out    vl_logic_vector(3 downto 0);
        e               : out    vl_logic_vector(6 downto 0)
    );
end hammingdec;
