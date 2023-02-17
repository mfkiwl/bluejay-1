//==============================================
// advanced_high_performance_bus__decoder
//==============================================
module advanced_high_performance_bus__decoder
(
    hclk,
    hresetn,
    haddr,
    hsel__default,
    hsel__0,
    hsel__1,
    hsel__2,
    hsel__3
);

input hclk;
input hresetn;
input [39:0] haddr;
output hsel__default;
output hsel__0;
output hsel__1;
output hsel__2;
output hsel__3;

logic hclk;
logic hresetn;
logic [39:0] haddr;
logic hsel__default;
logic hsel__0;
logic hsel__1;
logic hsel__2;
logic hsel__3;

always_comb
begin
    hsel__default = 1'b0;
    hsel__0 = 1'b0;
    hsel__1 = 1'b0;
    hsel__2 = 1'b0;
    hsel__3 = 1'b0;

    casez(haddr)
        MEMORY_MAP_REGION__0:
        begin
            hsel__0 = 1'b1;
        end
        MEMORY_MAP_REGION__1:
        begin
            hsel__1 = 1'b1;
        end
        MEMORY_MAP_REGION__2:
        begin
            hsel__2 = 1'b1;
        end
        MEMORY_MAP_REGION__3:
        begin
            hsel__3 = 1'b1;
        end
        default:
        begin
            hsel__default = 1'b1;
        end
    endcase
end

endmodule
