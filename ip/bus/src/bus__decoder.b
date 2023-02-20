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
input [39:0] addr;
output [2:0] sel;

logic clk;
logic rst;
logic [39:0] addr;
logic [2:0] sel;


always_comb
begin
    casez (addr)
        MEMORY_MAP_REGION__0:
        begin
            sel = 2'h0; 
        end
        MEMORY_MAP_REGION__1:
        begin
            sel = 2'h1; 
        end
        MEMORY_MAP_REGION__2:
        begin
            sel = 2'h2; 
        end
        MEMORY_MAP_REGION__3:
        begin
            sel = 2'h3; 
        end
        MEMORY_MAP_REGION__4:
        begin
            sel = 2'h4; 
        end
        MEMORY_MAP_REGION__5:
        begin
            sel = 2'h5; 
        end
        MEMORY_MAP_REGION__6:
        begin
            sel = 2'h6; 
        end
        MEMORY_MAP_REGION__7:
        begin
            sel = 2'h7; 
        end
    endcase
end

endmodule
