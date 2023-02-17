//==============================================
// advanced_high_performance_bus__decoder
//==============================================
module advanced_high_performance_bus__decoder
(
    clk,
    rst,
    addr,
    cs__0,
    cs__1,
    cs__2,
    cs__3
);

input clk;
input rst;

input [39:0] addr;

output cs__0;
output cs__1;
output cs__2;
output cs__3;

logic clk;
logic rst;

logic [39:0] addr;

logic cs__0;
logic cs__1;
logic cs__2;
logic cs__3;

always_comb
begin
    cs__0 = 1'b0;
    cs__1 = 1'b0;
    cs__2 = 1'b0;
    cs__3 = 1'b0;

    casez(haddr)
        MEMORY_MAP_REGION__0:
        begin
            cs__0 = 1'b1;
        end
        MEMORY_MAP_REGION__1:
        begin
            cs__1 = 1'b1;
        end
        MEMORY_MAP_REGION__2:
        begin
            cs__2 = 1'b1;
        end
        MEMORY_MAP_REGION__3:
        begin
            cs__3 = 1'b1;
        end
    endcase
end

endmodule
