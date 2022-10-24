//==============================================================
// tb_mem
//==============================================================
module tb_mem 
(
    input clk,
    input rst,
    input cpu_to_mem__valid,
    input cpu_to_mem__we,
    input [63:0] cpu_to_mem__addr,
    input [2:0] cpu_to_mem__dtype,
    input [63:0] cpu_to_mem__data,
    output logic mem_to_cpu__valid,
    output logic mem_to_cpu__access_fault,
    output logic mem_to_cpu__address_misaligned,
    output logic [63:0] mem_to_cpu__data
);

// parameters
parameter DEPTH = 2;
parameter DEPTH__LOG2 = 1;

// internal logic
logic [DEPTH__LOG2-1:0] addr;
logic [DEPTH__LOG2-1:0] addr__n;
logic [63:0] wr_data;
logic [63:0] wr_data__n;
logic [2:0] dtype;
logic [2:0] dtype__n;
logic [7:0] memory [DEPTH-1:0];
logic we;
logic [1:0] state;
logic [1:0] state__n;



//==============================================
// Reads 
//==============================================
always_comb begin
    case (dtype)
        3'h0:
        begin
            mem_to_cpu__data[7:0] = memory[addr];
            mem_to_cpu__data[15:8] = memory[addr + 1];
            mem_to_cpu__data[23:16] = memory[addr + 2];
            mem_to_cpu__data[31:24] = memory[addr + 3];
            mem_to_cpu__data[39:32] = memory[addr + 4];
            mem_to_cpu__data[47:40] = memory[addr + 5];
            mem_to_cpu__data[55:48] = memory[addr + 6];
            mem_to_cpu__data[63:56] = memory[addr + 7];
        end
        3'h1:
        begin
            mem_to_cpu__data[7:0] = memory[addr];
            mem_to_cpu__data[15:8] = memory[addr + 1];
            mem_to_cpu__data[23:16] = memory[addr + 2];
            mem_to_cpu__data[31:24] = memory[addr + 3];
            mem_to_cpu__data[39:32] = {8{memory[addr + 3][7]}};
            mem_to_cpu__data[47:40] = {8{memory[addr + 3][7]}};
            mem_to_cpu__data[55:48] = {8{memory[addr + 3][7]}}; 
            mem_to_cpu__data[63:56] = {8{memory[addr + 3][7]}};
        end
        3'h2:
        begin
            mem_to_cpu__data[7:0] = memory[addr];
            mem_to_cpu__data[15:8] = memory[addr + 1];
            mem_to_cpu__data[23:16] = memory[addr + 2];
            mem_to_cpu__data[31:24] = memory[addr + 3];
            mem_to_cpu__data[39:32] = 8'h0;
            mem_to_cpu__data[47:40] = 8'h0;
            mem_to_cpu__data[55:48] = 8'h0; 
            mem_to_cpu__data[63:56] = 8'h0;
        end
        3'h3:
        begin
            mem_to_cpu__data[7:0] = memory[addr];
            mem_to_cpu__data[15:8] = memory[addr + 1];
            mem_to_cpu__data[23:16] = {8{memory[addr + 1][7]}};
            mem_to_cpu__data[31:24] = {8{memory[addr + 1][7]}};
            mem_to_cpu__data[39:32] = {8{memory[addr + 1][7]}};
            mem_to_cpu__data[47:40] = {8{memory[addr + 1][7]}};
            mem_to_cpu__data[55:48] = {8{memory[addr + 1][7]}}; 
            mem_to_cpu__data[63:56] = {8{memory[addr + 1][7]}};
        end
        3'h4:
        begin
            mem_to_cpu__data[7:0] = memory[addr];
            mem_to_cpu__data[15:8] = memory[addr + 1];
            mem_to_cpu__data[23:16] = 8'h0;
            mem_to_cpu__data[31:24] = 8'h0;
            mem_to_cpu__data[39:32] = 8'h0;
            mem_to_cpu__data[47:40] = 8'h0;
            mem_to_cpu__data[55:48] = 8'h0; 
            mem_to_cpu__data[63:56] = 8'h0; 
        end
        3'h5:
        begin
            mem_to_cpu__data[7:0] = memory[addr];
            mem_to_cpu__data[15:8] = {8{memory[addr][7]}};
            mem_to_cpu__data[23:16] = {8{memory[addr][7]}};
            mem_to_cpu__data[31:24] = {8{memory[addr][7]}};
            mem_to_cpu__data[39:32] = {8{memory[addr][7]}};
            mem_to_cpu__data[47:40] = {8{memory[addr][7]}};
            mem_to_cpu__data[55:48] = {8{memory[addr][7]}}; 
            mem_to_cpu__data[63:56] = {8{memory[addr][7]}};
        end
        3'h6:
        begin
            mem_to_cpu__data[7:0] = memory[addr];
            mem_to_cpu__data[15:8] = 8'h0;
            mem_to_cpu__data[23:16] = 8'h0;
            mem_to_cpu__data[31:24] = 8'h0;
            mem_to_cpu__data[39:32] = 8'h0;
            mem_to_cpu__data[47:40] = 8'h0;
            mem_to_cpu__data[55:48] = 8'h0; 
            mem_to_cpu__data[63:56] = 8'h0; 
        end
    endcase
end


//==============================================
// Writes 
//==============================================
always_ff @(posedge clk) begin
    if (we) begin
        case (dtype)
            3'h0:
            begin
                memory[addr] <= wr_data[7:0];
                memory[addr + 1] <= wr_data[15:8];
                memory[addr + 2] <= wr_data[23:16];
                memory[addr + 3] <= wr_data[31:24];
                memory[addr + 4] <= wr_data[39:32];
                memory[addr + 5] <= wr_data[47:40];
                memory[addr + 6] <= wr_data[55:48];
                memory[addr + 7] <= wr_data[63:56];
            end
            3'h1:
            begin
                memory[addr] <= wr_data[7:0];
                memory[addr + 1] <= wr_data[15:8];
                memory[addr + 2] <= wr_data[23:16];
                memory[addr + 3] <= wr_data[31:24];
            end
            3'h2:
            begin
                memory[addr] <= wr_data[7:0];
                memory[addr + 1] <= wr_data[15:8];
                memory[addr + 2] <= wr_data[23:16];
                memory[addr + 3] <= wr_data[31:24];
            end
            3'h3:
            begin
                memory[addr] <= wr_data[7:0];
                memory[addr + 1] <= wr_data[15:8];
            end
            3'h4:
            begin
                memory[addr] <= wr_data[7:0];
                memory[addr + 1] <= wr_data[15:8];
            end
            3'h5:
            begin
                memory[addr] <= wr_data[7:0];
            end
            3'h6:
            begin
                memory[addr] <= wr_data[7:0];
            end
        endcase
    end
end


always_comb begin
    case (dtype)
        3'h0:
        begin
            mem_to_cpu__address_misaligned = (addr[2:0] != 3'b0);
        end
        3'h1:
        begin
            mem_to_cpu__address_misaligned = (addr[1:0] != 2'b0);
        end
        3'h2:
        begin
            mem_to_cpu__address_misaligned = (addr[1:0] != 2'b0);
        end
        3'h3:
        begin
            mem_to_cpu__address_misaligned = (addr[0] != 1'b0);
        end
        3'h4:
        begin
            mem_to_cpu__address_misaligned = (addr[0] != 1'b0);
        end
        3'h5:
        begin
            mem_to_cpu__address_misaligned = 1'b0;
        end
        3'h6:
        begin
            mem_to_cpu__address_misaligned = 1'b0;
        end
    endcase
end

//==============================================
// Finite State Machine
//==============================================
localparam STATE__READY = 2'h0;
localparam STATE__READ = 2'h1;
localparam STATE__WRITE = 2'h2;

always_comb begin
    state__n = state;
    addr__n = addr;
    dtype__n = dtype;
    wr_data__n = wr_data;
    mem_to_cpu__valid = 1'b0;
    mem_to_cpu__access_fault = 1'b0;
    we = 1'b0;

    case (state)
        //==============================
        // STATE__READY
        //==============================
        STATE__READY:
        begin
            if (cpu_to_mem__valid) begin
                addr__n = cpu_to_mem__addr[DEPTH__LOG2-1:0];
                dtype__n = cpu_to_mem__dtype;
                wr_data__n = cpu_to_mem__data;
                state__n = cpu_to_mem__we ? STATE__WRITE : STATE__READ;
            end
        end

        //==============================
        // STATE__READ
        //==============================
        STATE__READ:
        begin
            mem_to_cpu__valid = 1'b1; 
            state__n = STATE__READY;
        end

        //==============================
        // STATE__WRITE
        //==============================
        STATE__WRITE:
        begin
            we = !(mem_to_cpu__access_fault || mem_to_cpu__address_misaligned);
            mem_to_cpu__valid = 1'b1;  
            state__n = STATE__READY;
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

always_ff @(posedge clk) begin
    addr <= addr__n;
end

always_ff @(posedge clk) begin
    dtype <= dtype__n;
end

always_ff @(posedge clk) begin
    wr_data <= wr_data__n;
end


endmodule
