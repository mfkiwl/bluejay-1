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
    output logic mem_to_cpu__error,
    output logic [63:0] mem_to_cpu__data
);

// parameters
parameter DEPTH = 2;
parameter DEPTH__LOG2 = 1;

// internal logic
logic [DEPTH__LOG2-1:0] addr;
logic [DEPTH__LOG2-1:0] addr__n;
logic [63:0] rd_data;
logic [63:0] wr_data;
logic [63:0] wr_data__n;
logic [2:0] dtype;
logic [2:0] dtype__n;
logic [7:0] memory [DEPTH-1:0];
logic we;
logic [1:0] state;
logic [1:0] state__n;
logic address_misaligned;



//==============================================
// Reads 
//==============================================
always_comb begin
    case (dtype)
        DTYPE__D:
        begin
            rd_data[7:0] = memory[addr];
            rd_data[15:8] = memory[addr + 1];
            rd_data[23:16] = memory[addr + 2];
            rd_data[31:24] = memory[addr + 3];
            rd_data[39:32] = memory[addr + 4];
            rd_data[47:40] = memory[addr + 5];
            rd_data[55:48] = memory[addr + 6];
            rd_data[63:56] = memory[addr + 7];
        end
        DTYPE__W:
        begin
            rd_data[7:0] = memory[addr];
            rd_data[15:8] = memory[addr + 1];
            rd_data[23:16] = memory[addr + 2];
            rd_data[31:24] = memory[addr + 3];
            rd_data[39:32] = {8{memory[addr + 3][7]}};
            rd_data[47:40] = {8{memory[addr + 3][7]}};
            rd_data[55:48] = {8{memory[addr + 3][7]}}; 
            rd_data[63:56] = {8{memory[addr + 3][7]}};
        end
        DTYPE__WU:
        begin
            rd_data[7:0] = memory[addr];
            rd_data[15:8] = memory[addr + 1];
            rd_data[23:16] = memory[addr + 2];
            rd_data[31:24] = memory[addr + 3];
            rd_data[39:32] = 8'h0;
            rd_data[47:40] = 8'h0;
            rd_data[55:48] = 8'h0; 
            rd_data[63:56] = 8'h0;
        end
        DTYPE__H:
        begin
            rd_data[7:0] = memory[addr];
            rd_data[15:8] = memory[addr + 1];
            rd_data[23:16] = {8{memory[addr + 1][7]}};
            rd_data[31:24] = {8{memory[addr + 1][7]}};
            rd_data[39:32] = {8{memory[addr + 1][7]}};
            rd_data[47:40] = {8{memory[addr + 1][7]}};
            rd_data[55:48] = {8{memory[addr + 1][7]}}; 
            rd_data[63:56] = {8{memory[addr + 1][7]}};
        end
        DTYPE__HU:
        begin
            rd_data[7:0] = memory[addr];
            rd_data[15:8] = memory[addr + 1];
            rd_data[23:16] = 8'h0;
            rd_data[31:24] = 8'h0;
            rd_data[39:32] = 8'h0;
            rd_data[47:40] = 8'h0;
            rd_data[55:48] = 8'h0; 
            rd_data[63:56] = 8'h0; 
        end
        DTYPE__B:
        begin
            rd_data[7:0] = memory[addr];
            rd_data[15:8] = {8{memory[addr][7]}};
            rd_data[23:16] = {8{memory[addr][7]}};
            rd_data[31:24] = {8{memory[addr][7]}};
            rd_data[39:32] = {8{memory[addr][7]}};
            rd_data[47:40] = {8{memory[addr][7]}};
            rd_data[55:48] = {8{memory[addr][7]}}; 
            rd_data[63:56] = {8{memory[addr][7]}};
        end
        DTYPE__BU:
        begin
            rd_data[7:0] = memory[addr];
            rd_data[15:8] = 8'h0;
            rd_data[23:16] = 8'h0;
            rd_data[31:24] = 8'h0;
            rd_data[39:32] = 8'h0;
            rd_data[47:40] = 8'h0;
            rd_data[55:48] = 8'h0; 
            rd_data[63:56] = 8'h0; 
        end
    endcase
end


//==============================================
// Writes 
//==============================================
always_ff @(posedge clk) begin
    if (we) begin
        case (dtype)
            DTYPE__D:
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
            DTYPE__W:
            begin
                memory[addr] <= wr_data[7:0];
                memory[addr + 1] <= wr_data[15:8];
                memory[addr + 2] <= wr_data[23:16];
                memory[addr + 3] <= wr_data[31:24];
            end
            DTYPE__WU:
            begin
                memory[addr] <= wr_data[7:0];
                memory[addr + 1] <= wr_data[15:8];
                memory[addr + 2] <= wr_data[23:16];
                memory[addr + 3] <= wr_data[31:24];
            end
            DTYPE__H:
            begin
                memory[addr] <= wr_data[7:0];
                memory[addr + 1] <= wr_data[15:8];
            end
            DTYPE__HU:
            begin
                memory[addr] <= wr_data[7:0];
                memory[addr + 1] <= wr_data[15:8];
            end
            DTYPE__B:
            begin
                memory[addr] <= wr_data[7:0];
            end
            DTYPE__BU:
            begin
                memory[addr] <= wr_data[7:0];
            end
        endcase
    end
end


always_comb begin
    case (dtype)
        DTYPE__D:
        begin
            address_misaligned = (addr[2:0] != 3'b0);
        end
        DTYPE__W:
        begin
            address_misaligned = (addr[1:0] != 2'b0);
        end
        DTYPE__WU:
        begin
            address_misaligned = (addr[1:0] != 2'b0);
        end
        DTYPE__H:
        begin
            address_misaligned = (addr[0] != 1'b0);
        end
        DTYPE__HU:
        begin
            address_misaligned = (addr[0] != 1'b0);
        end
        DTYPE__B:
        begin
            address_misaligned = 1'b0;
        end
        DTYPE__BU:
        begin
            address_misaligned = 1'b0;
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
    mem_to_cpu__error = 1'b0;
    mem_to_cpu__data = rd_data;
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
            if (address_misaligned) begin
                mem_to_cpu__error = 1'b1; 
                mem_to_cpu__data = ERRORCODE__MISALIGNED_ADDRESS;
            end
            else begin
                mem_to_cpu__data = rd_data;
            end
            state__n = STATE__READY;
        end

        //==============================
        // STATE__WRITE
        //==============================
        STATE__WRITE:
        begin
            mem_to_cpu__valid = 1'b1; 
            if (address_misaligned) begin
                mem_to_cpu__error = 1'b1; 
                mem_to_cpu__data = ERRORCODE__MISALIGNED_ADDRESS;
            end
            else begin
                we = 1'b1;
            end
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
