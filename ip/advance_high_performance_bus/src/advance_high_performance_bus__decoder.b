//==============================================
// advance_high_performance_bus__decoder
//==============================================
module advance_high_performance_bus__decoder
(
    input hclk,
    input hresetn,
    input [39:0] haddr,
    output logic hsel__default,
    output logic hsel__0,
    output logic hsel__1,
    output logic hsel__2,
    output logic hsel__3,
);

always_comb
begin
    hsel__default = 1'b0;
    hsel__0 = 1'b0;
    hsel__1 = 1'b0;

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
