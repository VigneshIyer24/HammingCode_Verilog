library verilog;
use verilog.vl_types.all;
entity hammingenc is
    port(
        clk             : in     vl_logic;
        d               : in     vl_logic_vector(3 downto 0);
        C               : out    vl_logic_vector(6 downto 0)
    );
end hammingenc;
