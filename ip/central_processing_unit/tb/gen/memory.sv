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


logic en;
logic address_misaligned;

logic [7:0] memory [DEPTH-1:0];

localparam STATE__READY = 1'b0;
localparam STATE__NOT_READY = 1'b1;


logic test;

always_comb 
begin
    case (state)
        //==============================
        // STATE__READY
        //==============================
        STATE__READY:
        begin
            if (cs)
            begin
                if (address_misaligned)
                begin
                    en = 1'b0;
                    ready = 1'b1;
                    resp = 1'b1;
                    rd_data = 64'h1;
                end
                else
                begin
                    en = we;
                    ready = 1'b1;
                    resp = 1'b0;
                    rd_data[7:0] = memory[addr];
                    rd_data[15:8] = ((size == 2'h2) || (size == 2'h1) || (size == 2'h0)) ? memory[addr + 1] : {8{1'bx}};
                    rd_data[23:16] = ((size == 2'h1) || (size == 2'h0)) ? memory[addr + 2] : {8{1'bx}};
                    rd_data[31:24] = ((size == 2'h1) || (size == 2'h0)) ? memory[addr + 3] : {8{1'bx}};
                    rd_data[39:32] = (size == 2'h0) ? memory[addr + 4] : {8{1'bx}};
                    rd_data[47:40] = (size == 2'h0) ? memory[addr + 5] : {8{1'bx}};
                    rd_data[55:48] = (size == 2'h0) ? memory[addr + 6] : {8{1'bx}};
                    rd_data[63:56] = (size == 2'h0) ? memory[addr + 7] : {8{1'bx}};
                end
            end
            state__n = STATE__NOT_READY;
        end

        //==============================
        // STATE__NOT_READY
        //==============================
        STATE__NOT_READY:
        begin
            ready = 1'b0;
            resp = 1'b0;
            en = 1'b0;
            state__n = STATE__READY;
        end
    endcase
end


always_comb begin
    case (size)
        2'h0:
        begin
            address_misaligned = (addr[2:0] != 3'b0);
        end
        2'h1:
        begin
            address_misaligned = (addr[1:0] != 2'b0);
        end
        2'h2:
        begin
            address_misaligned = (addr[0] != 1'b0);
        end
        2'h3:
        begin
            address_misaligned = 1'b0;
        end
    endcase
end

always_ff @(posedge clk)
begin
    memory[addr] <= en ? wr_data[7:0] : memory[addr];
    memory[addr + 1] <= en & ((size == 2'h2) || (size == 2'h1) || (size == 2'h0)) ? wr_data[15:8] : memory[addr + 1];
    memory[addr + 2] <= en & ((size == 2'h1) || (size == 2'h0)) ? wr_data[23:16] : memory[addr + 2];
    memory[addr + 3] <= en & ((size == 2'h1) || (size == 2'h0)) ? wr_data[31:24] : memory[addr + 3];
    memory[addr + 4] <= en & (size == 2'h0) ? wr_data[39:32] : memory[addr + 4];
    memory[addr + 5] <= en & (size == 2'h0) ? wr_data[47:40] : memory[addr + 5];
    memory[addr + 6] <= en & (size == 2'h0) ? wr_data[55:48] : memory[addr + 6];
    memory[addr + 7] <= en & (size == 2'h0) ? wr_data[63:56] : memory[addr + 7];
end



always_ff @(posedge clk)
begin
    if (rst) begin
        state <= STATE__READY;
    end
    else begin
        state <= state__n;
    end
end

endmodule
