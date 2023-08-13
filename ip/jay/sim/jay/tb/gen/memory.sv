//==============================================================
// tb_mem
//==============================================================
module tb_mem 
(
    clk,
    rst,
    cs,
    we,
    addr,
    size,
    wr_data,
    ready,
    resp,
    rd_data
);

// parameters
parameter DEPTH = 2;
parameter DEPTH__LOG2 = 1;

input clk;
input rst;
input cs;
input we;
input [15:0] addr;
input [1:0] size;
input [63:0] wr_data;
output ready;
output resp;
output [63:0] rd_data; 

logic clk;
logic rst;
logic cs;
logic we;
logic [15:0] addr;
logic [1:0] size;
logic [63:0] wr_data;
logic ready;
logic resp;
logic [63:0] rd_data; 

logic state;
logic state__n;


logic [7:0] en;

logic [7:0] memory [DEPTH-1:0];

localparam STATE__IDLE = 8'h0;
localparam STATE__SB__0 = 8'h1;
localparam STATE__SB__1 = 8'h2;
localparam STATE__SH__0 = 8'h3;
localparam STATE__SH__1 = 8'h4;
localparam STATE__SW__0 = 8'h5;
localparam STATE__SW__1 = 8'h6;
localparam STATE__SD__0 = 8'h7;
localparam STATE__SD__1 = 8'h8;
localparam STATE__LB__0 = 8'h9;
localparam STATE__LB__1 = 8'ha;
localparam STATE__LH__0 = 8'hb;
localparam STATE__LH__1 = 8'hc;
localparam STATE__LW__0 = 8'hd;
localparam STATE__LW__1 = 8'he;
localparam STATE__LD__0 = 8'hf;
localparam STATE__LD__1 = 8'h10;
localparam STATE__MISALIGNED_ADDRESS = 8'h11;


always_comb 
begin
    ready = 1'b0;
    resp = 1'b0;
    rd_data = {64{1'bx}};
    en = 8'h0;
                    
    case (state)
        //==============================
        // STATE__IDLE
        //==============================
        STATE__IDLE:
        begin
            state__n = (cs & we & (size == 2'h0)) ? STATE__SB__0 : (cs & ~we & (size == 2'h0)) ? STATE__LB__0 : (cs & we & (size == 2'h1)) ? STATE__SH__0 : (cs & ~we & (size == 2'h1)) ? STATE__LH__0 : (cs & we & (size == 2'h2)) ? STATE__SW__0 : (cs & ~we & (size == 2'h2)) ? STATE__LW__0 : (cs & we & (size == 2'h3)) ? STATE__SD__0 : (cs & ~we & (size == 2'h3)) ? STATE__LD__0 : STATE__IDLE;
        end

        //==============================
        // STATE__SB__0
        //==============================
        STATE__SB__0:
        begin
            state__n = STATE__SB__1; 
        end

        //==============================
        // STATE__SB__1
        //==============================
        STATE__SB__1:
        begin
            ready = 1'b1;
            en = 8'h1;
            state__n = STATE__IDLE; 
        end

        //==============================
        // STATE__SH__0
        //==============================
        STATE__SH__0:
        begin
            state__n = (addr[0] != 1'b0) ? STATE__MISALIGNED_ADDRESS : STATE__SH__1; 
        end

        //==============================
        // STATE__SH__1
        //==============================
        STATE__SH__1:
        begin
            ready = 1'b1;
            en = 8'h3;
            state__n = STATE__IDLE; 
        end

        //==============================
        // STATE__SW__0
        //==============================
        STATE__SW__0:
        begin
            state__n = (addr[1:0] != 2'b0) ? STATE__MISALIGNED_ADDRESS : STATE__SW__1; 
        end

        //==============================
        // STATE__SW__1
        //==============================
        STATE__SW__1:
        begin
            ready = 1'b1;
            en = 8'hf;
            state__n = STATE__IDLE; 
        end

        //==============================
        // STATE__SD__0
        //==============================
        STATE__SD__0:
        begin
            state__n = (addr[2:0] != 3'b0) ? STATE__MISALIGNED_ADDRESS : STATE__SD__1; 
        end

        //==============================
        // STATE__SD__1
        //==============================
        STATE__SD__1:
        begin
            ready = 1'b1;
            en = 8'hff;
            state__n = STATE__IDLE; 
        end

        //==============================
        // STATE__LB__0
        //==============================
        STATE__LB__0:
        begin
            state__n = STATE__LB__1; 
        end

        //==============================
        // STATE__LB__1
        //==============================
        STATE__LB__1:
        begin
            ready = 1'b1;
            rd_data[7:0] = memory[addr];
            state__n = STATE__IDLE; 
        end

        //==============================
        // STATE__LH__0
        //==============================
        STATE__LH__0:
        begin
            state__n = (addr[0] != 1'b0) ? STATE__MISALIGNED_ADDRESS : STATE__LH__1; 
        end

        //==============================
        // STATE__LH__1
        //==============================
        STATE__LH__1:
        begin
            ready = 1'b1;
            rd_data[7:0] = memory[addr];
            rd_data[15:8] = memory[addr + 1];
            state__n = STATE__IDLE; 
        end

        //==============================
        // STATE__LW__0
        //==============================
        STATE__LW__0:
        begin
            state__n = (addr[1:0] != 2'b0) ? STATE__MISALIGNED_ADDRESS : STATE__LW__1; 
        end

        //==============================
        // STATE__LW__1
        //==============================
        STATE__LW__1:
        begin
            ready = 1'b1;
            rd_data[7:0] = memory[addr];
            rd_data[15:8] = memory[addr + 1];
            rd_data[23:16] = memory[addr + 2];
            rd_data[31:24] = memory[addr + 3];
            state__n = STATE__IDLE; 
        end

        //==============================
        // STATE__LD__0
        //==============================
        STATE__LD__0:
        begin
            state__n = (addr[2:0] != 2'b0) ? STATE__MISALIGNED_ADDRESS : STATE__LD__1; 
        end

        //==============================
        // STATE__LD__1
        //==============================
        STATE__LD__1:
        begin
            ready = 1'b1;
            rd_data[7:0] = memory[addr];
            rd_data[15:8] = memory[addr + 1];
            rd_data[23:16] = memory[addr + 2];
            rd_data[31:24] = memory[addr + 3];
            rd_data[39:32] = memory[addr + 4];
            rd_data[47:40] = memory[addr + 5];
            rd_data[55:48] = memory[addr + 6];
            rd_data[63:56] = memory[addr + 7];
            state__n = STATE__IDLE; 
        end

        //==============================
        // STATE__MISALIGNED_ADDRESS
        //==============================
        STATE__MISALIGNED_ADDRESS:
        begin
            ready = 1'b1;
            resp = 1'b1;
            rd_data = 64'h1;
            state__n = STATE__IDLE;
        end

    endcase
end


always_ff @(posedge clk)
begin
    memory[addr + 0] <= en[0] ? wr_data[7:0] : memory[addr];
    memory[addr + 1] <= en[1] ? wr_data[15:8] : memory[addr + 1];
    memory[addr + 2] <= en[2] ? wr_data[23:16] : memory[addr + 2];
    memory[addr + 3] <= en[3] ? wr_data[31:24] : memory[addr + 3];
    memory[addr + 4] <= en[4] ? wr_data[39:32] : memory[addr + 4];
    memory[addr + 5] <= en[5] ? wr_data[47:40] : memory[addr + 5];
    memory[addr + 6] <= en[6] ? wr_data[55:48] : memory[addr + 6];
    memory[addr + 7] <= en[7] ? wr_data[63:56] : memory[addr + 7];
end


//==============================
// d_flip_flop__state
//==============================
d_flip_flop #(.WIDTH(8), .RESET_VALUE(STATE__IDLE)) d_flip_flop__state
(
    .clk(clk),
    .rst(rst),
    .en(1'b1),
    .d(state__n),
    .q(state)
);

endmodule
