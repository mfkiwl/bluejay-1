//==============================================================
// l1 
//==============================================================
module l1 
(
    input clk,
    input rst,
    input cpu_to_l1__valid,
    output logic cpu_to_l1__ready,
    input logic cpu_to_l1__we,
    input [63:0] cpu_to_l1__addr,
    input [2:0] cpu_to_l1__dtype,
    input [63:0] cpu_to_l1__data,
    output logic l1_to_cpu__valid,
    input l1_to_cpu__ready,
    output logic [63:0] l1_to_cpu__data
);

parameter DEPTH = 2;
parameter DEPTH__LOG2 = 1;


logic [DEPTH__LOG2-1:0] addr;
assign addr = cpu_to_l1__addr[DEPTH__LOG2-1:0];
logic [7:0] memory [DEPTH-1:0];


//==============================================
// Writes 
//==============================================
always_ff @(posedge clk) begin
    if (cpu_to_l1__valid && cpu_to_l1__ready && cpu_to_l1__we) begin
        case (cpu_to_l1__dtype)
            3'h0:
            begin
                memory[addr] <= cpu_to_l1__data[7:0];
                memory[addr + 1] <= cpu_to_l1__data[15:8];
                memory[addr + 2] <= cpu_to_l1__data[23:16];
                memory[addr + 3] <= cpu_to_l1__data[31:24];
                memory[addr + 4] <= cpu_to_l1__data[39:32];
                memory[addr + 5] <= cpu_to_l1__data[47:40];
                memory[addr + 6] <= cpu_to_l1__data[55:48];
                memory[addr + 7] <= cpu_to_l1__data[63:56];
            end
            3'h1:
            begin
                memory[addr] <= cpu_to_l1__data[7:0];
                memory[addr + 1] <= cpu_to_l1__data[15:8];
                memory[addr + 2] <= cpu_to_l1__data[23:16];
                memory[addr + 3] <= cpu_to_l1__data[31:24];
            end
            3'h2:
            begin
                memory[addr] <= cpu_to_l1__data[7:0];
                memory[addr + 1] <= cpu_to_l1__data[15:8];
                memory[addr + 2] <= cpu_to_l1__data[23:16];
                memory[addr + 3] <= cpu_to_l1__data[31:24];
            end
            3'h3:
            begin
                memory[addr] <= cpu_to_l1__data[7:0];
                memory[addr + 1] <= cpu_to_l1__data[15:8];
            end
            3'h4:
            begin
                memory[addr] <= cpu_to_l1__data[7:0];
                memory[addr + 1] <= cpu_to_l1__data[15:8];
            end
            3'h5:
            begin
                memory[addr] <= cpu_to_l1__data[7:0];
            end
            3'h6:
            begin
                memory[addr] <= cpu_to_l1__data[7:0];
            end
        endcase
    end
end

//==============================================
// Reads 
//==============================================
always_ff @(posedge clk) begin
    if (cpu_to_l1__valid && cpu_to_l1__ready && ~cpu_to_l1__we) begin
        case (cpu_to_l1__dtype)
            3'h0:
            begin
                l1_to_cpu__data[7:0] <= memory[addr];
                l1_to_cpu__data[15:8] <= memory[addr + 1];
                l1_to_cpu__data[23:16] <= memory[addr + 2];
                l1_to_cpu__data[31:24] <= memory[addr + 3];
                l1_to_cpu__data[39:32] <= memory[addr + 4];
                l1_to_cpu__data[47:40] <= memory[addr + 5];
                l1_to_cpu__data[55:48] <= memory[addr + 6];
                l1_to_cpu__data[63:56] <= memory[addr + 7];
            end
            3'h1:
            begin
                l1_to_cpu__data[7:0] <= memory[addr];
                l1_to_cpu__data[15:8] <= memory[addr + 1];
                l1_to_cpu__data[23:16] <= memory[addr + 2];
                l1_to_cpu__data[31:24] <= memory[addr + 3];
                l1_to_cpu__data[39:32] <= {8{memory[addr + 3][7]}};
                l1_to_cpu__data[47:40] <= {8{memory[addr + 3][7]}};
                l1_to_cpu__data[55:48] <= {8{memory[addr + 3][7]}}; 
                l1_to_cpu__data[63:56] <= {8{memory[addr + 3][7]}};
            end
            3'h2:
            begin
                l1_to_cpu__data[7:0] <= memory[addr];
                l1_to_cpu__data[15:8] <= memory[addr + 1];
                l1_to_cpu__data[23:16] <= memory[addr + 2];
                l1_to_cpu__data[31:24] <= memory[addr + 3];
                l1_to_cpu__data[39:32] <= 8'h0;
                l1_to_cpu__data[47:40] <= 8'h0;
                l1_to_cpu__data[55:48] <= 8'h0; 
                l1_to_cpu__data[63:56] <= 8'h0;
            end
            3'h3:
            begin
                l1_to_cpu__data[7:0] <= memory[addr];
                l1_to_cpu__data[15:8] <= memory[addr + 1];
                l1_to_cpu__data[23:16] <= {8{memory[addr + 1][7]}};
                l1_to_cpu__data[31:24] <= {8{memory[addr + 1][7]}};
                l1_to_cpu__data[39:32] <= {8{memory[addr + 1][7]}};
                l1_to_cpu__data[47:40] <= {8{memory[addr + 1][7]}};
                l1_to_cpu__data[55:48] <= {8{memory[addr + 1][7]}}; 
                l1_to_cpu__data[63:56] <= {8{memory[addr + 1][7]}};
            end
            3'h4:
            begin
                l1_to_cpu__data[7:0] <= memory[addr];
                l1_to_cpu__data[15:8] <= memory[addr + 1];
                l1_to_cpu__data[23:16] <= 8'h0;
                l1_to_cpu__data[31:24] <= 8'h0;
                l1_to_cpu__data[39:32] <= 8'h0;
                l1_to_cpu__data[47:40] <= 8'h0;
                l1_to_cpu__data[55:48] <= 8'h0; 
                l1_to_cpu__data[63:56] <= 8'h0; 
            end
            3'h5:
            begin
                l1_to_cpu__data[7:0] <= memory[addr];
                l1_to_cpu__data[15:8] <= {8{memory[addr][7]}};
                l1_to_cpu__data[23:16] <= {8{memory[addr][7]}};
                l1_to_cpu__data[31:24] <= {8{memory[addr][7]}};
                l1_to_cpu__data[39:32] <= {8{memory[addr][7]}};
                l1_to_cpu__data[47:40] <= {8{memory[addr][7]}};
                l1_to_cpu__data[55:48] <= {8{memory[addr][7]}}; 
                l1_to_cpu__data[63:56] <= {8{memory[addr][7]}};
            end
            3'h6:
            begin
                l1_to_cpu__data[7:0] <= memory[addr];
                l1_to_cpu__data[15:8] <= 8'h0;
                l1_to_cpu__data[23:16] <= 8'h0;
                l1_to_cpu__data[31:24] <= 8'h0;
                l1_to_cpu__data[39:32] <= 8'h0;
                l1_to_cpu__data[47:40] <= 8'h0;
                l1_to_cpu__data[55:48] <= 8'h0; 
                l1_to_cpu__data[63:56] <= 8'h0; 
            end
        endcase
    end
end


//==============================================
// Finite State Machine
//==============================================
logic state;
logic state__n;

localparam STATE__READY = 1'b0;
localparam STATE__RESP = 1'b1;

always_comb begin
    state__n = state;
    cpu_to_l1__ready = 1'b0;
    l1_to_cpu__valid = 1'b0;

    case (state)
        STATE__READY:
        begin
            cpu_to_l1__ready = 1'b1;

            if (cpu_to_l1__valid && ~cpu_to_l1__we) begin
                state__n = STATE__RESP;
            end
        end
        STATE__RESP:
        begin
            l1_to_cpu__valid = 1'b1;

            if (l1_to_cpu__ready) begin
                state__n = STATE__READY;
            end
        end
    endcase
end

always_ff @(posedge clk) begin
    if (rst) begin
        state <= STATE__READY;
    end
    else begin
        state <= state__n;
    end
end

endmodule
