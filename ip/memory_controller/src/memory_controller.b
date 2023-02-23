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
input [11:0] addr;
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
logic [11:0] addr;
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


assign addra = addr;
assign dina = wr_data;

always_comb begin
    ena = 1'b0;
    wea = 1'b0;
    wrbe = 8'hff; 
    ready = 1'b0;
    rd_data = douta;
        
    case (state)
        //==============================
        // STATE__IDLE
        //==============================
        STATE__IDLE:
        begin
            state__n = cs ? (we ? ((size == SIZE__DOUBLE_WORD) ? STATE__WRITE__DOUBLE_WORD : (size == SIZE__WORD) ? STATE__WRITE__WORD : (size == SIZE__HALF_WORD) ? STATE__WRITE__HALF_WORD : STATE__WRITE__BYTE) : STATE__READ__0) : STATE__IDLE; 
            state__n = (cs & we) ? STATE__WRTE : (cs & ~we) ? STATE__READ__0 : STATE__IDLE; 
        end

        //==============================
        // STATE__READ__0
        //==============================
        STATE__READ__0:
        begin
            ena = 1'b1;
            state__n = STATE__READ__BYTE__1; 
        end

        //==============================
        // STATE__READ__1
        //==============================
        STATE__READ__1:
        begin
            ena = 1'b1;
            state__n = STATE__READ__BYTE__2; 
        end

        //==============================
        // STATE__READ__2
        //==============================
        STATE__READ__2:
        begin
            ena = 1'b1;
            ready = 1'b1;
            rd_data = douta >> addr[2:0]; 
            state__n = STATE__IDLE; 
        end

        //==============================
        // STATE__WRITE
        //==============================
        STATE__WRITE:
        begin
            ena = 1'b1;
            wea = 1'b1;
            wrbe = (size == SIZE__BYTE) : 8'b0000_0001 << addr[2:0] : ...
            ready = 1'b1;
            state__n = STATE__IDLE; 
        end
endcase


endmodule
