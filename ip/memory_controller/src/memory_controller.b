//==============================================
// memory_controller 
//==============================================
module memory_controller
(
    cs,
    we,
    addr,
    size,
    wr_data,
    ready,
    rd_data,
    ena,
    wea,
    wrbe,
    addra, 
    dina,
    douta
);

input cs;
input we;
input [39:0] addr;
input [1:0] size;
input [63:0] wr_data;
output ready;
output [63:0] rd_data;

output ena,
output wea,
output [7:0] wrbe,
output [11:0] addra, 
output [63:0] dina,
input [63:0] douta

logic cs;
logic we;
logic [39:0] addr;
logic [1:0] size;
logic [63:0] wr_data;
logic ready;
logic [63:0] rd_data;

logic ena,
logic wea,
logic [7:0] wrbe,
logic [11:0] addra, 
logic [63:0] dina,
logic [63:0] douta

logic [7:0] state;
logic [7:0] state__n;


always_comb begin
    ena = 1'b0;
    wea = 1'b0;
    wrbe = 8'hff; 
    ready = 1'b0;
        
    case (state)
        //==============================
        // STATE__IDLE
        //==============================
        STATE__IDLE:
        begin
            state__n = cs ? (size == SIZE__BYTE) STATE__READ__HALF_WORD : STATE__IDLE;
        end
endcase



endmodule
