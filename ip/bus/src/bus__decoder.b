//==============================================
// bus__decoder
//==============================================
module bus__decoder
(
    clk,
    rst,
    addr,
    sel
);

input clk;
input rst;
input [63:0] addr;
output [2:0] sel;

logic clk;
logic rst;
logic [63:0] addr;
logic [2:0] sel;

always_comb
begin
    casez (addr)
        MEMORY_MAPPED_REGION__0:
        begin
            sel = 3'h0; 
        end
        MEMORY_MAPPED_REGION__1:
        begin
            sel = 3'h1; 
        end
        MEMORY_MAPPED_REGION__2:
        begin
            sel = 3'h2; 
        end
        MEMORY_MAPPED_REGION__3:
        begin
            sel = 3'h3; 
        end
        MEMORY_MAPPED_REGION__4:
        begin
            sel = 3'h4; 
        end
        MEMORY_MAPPED_REGION__5:
        begin
            sel = 3'h5; 
        end
        MEMORY_MAPPED_REGION__6:
        begin
            sel = 3'h6; 
        end
        default:
        begin
            sel = 3'h7; 
        end
    endcase
end

endmodule
