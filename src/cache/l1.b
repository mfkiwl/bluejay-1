//==============================================================
// l1_cache
//==============================================================
module l1_cache
(
    input clk,
    input rst,

    input cpu_to_l1__valid,
    output logic cpu_to_l1__ready,
    input cpu_to_l1__rw,
    input [63:0] cpu_to_l1__addr,
    input [63:0] cpu_to_l1__data,
    input [1:0] cpu_to_l1__type,

    output logic l1_to_cpu__valid,
    input l1_to_cpu__ready,
    output logic [63:0] l1_to_cpu__addr,
    output logic [63:0] l1_to_cpu__data,

    output logic l1_to_mem__valid,
    // input l1_to_mem__ready,
    output logic l1_to_mem__rw,
    output logic [63:0] l1_to_mem__addr,
    output logic [511:0] l1_to_mem__wr_data,
    input logic [511:0] l1_to_mem__rd_data
);



logic hit;
logic valid;
logic dirty;
logic flop_l1_to_mem_out;
logic flop_l1_to_mem_in;
logic l1_to_mem__valid_n;
logic [63:0] l1_to_mem__addr_n;
logic l1_to_mem__rw_n;
logic [511:0] l1_to_mem__wr_data_n;
logic [511:0] mem_data;

assign valid = sram__rd_data[L1_CACHE__SRAM__VALID__FIELD];
assign hit = valid & (sram__rd_data[L1_CACHE__SRAM__TAG__FIELD] == S0__addr[L1_CACHE__TAG__FIELD]);
assign dirty = sram__rd_data[L1_CACHE__SRAM__DIRTY__FIELD];
assign sram__addr = S0__addr[L1_CACHE__INDEX__FIELD];

// S0
logic S0__valid;
logic S0__ready;
logic [63:0] S0__addr;
logic S0__rw;
logic [63:0] S0__wr_data;
logic [1:0] S0__type;
logic [63:0] S0__rd_data;
logic [L1__TAG__WIDTH-1:0] S0__tag;
logic [L1__INDEX__WIDTH-1:0] S0__index;
logic [L1__OFFSET__WIDTH-1:0] S0__offset;

// S1
logic S1__valid;
logic S1__ready;
logic [63:0] S1__addr;
logic [63:0] S1__rd_data;

//==============================================
// STAGE 0 (S0)
//==============================================
// S0 pipe stage (valid)
always_ff @(posedge clk) begin
    if (rst) begin
        S0__valid <= 1'b0;
    end
    else begin
        S0__valid <= S0__ready ? cpu_to_l1__valid : S0__valid;
    end
end

// S0 pipe stage (data).
always_ff @(posedge clk) begin
    if (cpu_to_l1__valid && S0__ready) begin
        S0__addr <= cpu_to_l1__addr;
        S0__rw <= cpu_to_l1__rw;
        S0__wr_data <= cpu_to_l1__wr_data;
        S0__type <= cpu_to_l1__type;
    end
end

assign S0__tag = S0__addr[L1_CACHE__TAG__FIELD];
assign S0__index = S0__addr[L1__INDEX__FIELD];
assign S0__offset = S0__addr[L1__TAG__FIELD];


always_comb begin
    S0__rd_data = 64'h0;

    case (S0__size)
        TYPE__D:
            case (S0__addr)
                PYTHON(for i in range(8): print(f"3'h{i:x}: S0__rd_data = sram__rd_data[{i*64 + 63}:{i*64}];"))
            endcase
        TYPE__W:
            case (S0__addr[5:2])
                PYTHON(for i in range(16): print(f"4'h{i:x}: S0__rd_data[31:0] = sram__rd_data[{i*32 + 31}:{i*32}];"))
            endcase
        TYPE__HALF: 
            case (S0__addr[5:1])
                PYTHON(for i in range(32): print(f"5'h{i:x}: S0__rd_data[16:0] = sram__rd_data[{i*16 + 15}:{i*16}];"))
            endcase
        TYPE__BYTE: 
            case (S0__addr[5:0])
                PYTHON(for i in range(64): print(f"6'h{i:x}: S0__rd_data[8:0] = sram__rd_data[{i*8 + 7}:{i*8}];"))
            endcase
    endcase
end





logic S0__s1_valid_n;
logic [63:0] S0__rd_data;
logic [511:0] S0__sram_wr_data;







assign cpu_to_l1__ready = S0__ready;


always_comb begin
    S0__sram_wr_data = sram__rd_data[L1_CACHE__SRAM__DATA__FIELD];
    case (S0__size)
        SIZE__DOUBLE:
            case (S0__addr[5:3])
                PYTHON(for i in range(8): print(f"3'h{i:x}: S0__sram_wr_data[{i*64 + 63}:{i*64}] = S0__wr_data;"))
            endcase
        SIZE__WORD:
            case (S0__addr[5:2])
                PYTHON(for i in range(16): print(f"4'h{i:x}: S0__sram_wr_data[{i*32 + 31}:{i*32}] = S0__wr_data;"))
            endcase
        SIZE__HALF: 
            case (S0__addr[5:1])
                PYTHON(for i in range(32): print(f"5'h{i:x}: S0__sram_wr_data[{i*16 + 15}:{i*16}] = S0__wr_data;"))
            endcase
        SIZE__BYTE: 
            case (S0__addr[5:0])
                PYTHON(for i in range(64): print(f"6'h{i:x}: S0__sram_wr_data[{i*8+ 7}:{i*8}] = S0__wr_data;"))
            endcase
    endcase
end

//==============================================
// STAGE 1 (S1)
//==============================================
// S1 pipe stage (valid)
always_ff @(posedge clk) begin
    if (rst) begin
        S1__valid <= 1'b0;
    end
    else begin
        S1__valid <= S1__ready ? S0__valid : S1__valid;
    end
end

// S1 pipe stage (data).
always_ff @(posedge clk) begin
    if (S0__valid && S1__ready) begin
        S1__addr <= S0__addr;
        S1__rd_data <= S0__rd_data;
    end
end






assign S1__ready = l1_to_cpu__ready;
assign l1_to_cpu__valid = S1__valid;
assign l1_to_cpu__addr = S1__addr;
assign l1_to_cpu__data  = S1__rd_data;

//==============================================
// FSM
//==============================================
// FSM state
logic [2:0] state;
logic [2:0] state_n;
parameter READ_WRITE = 3'h0;
parameter WRITE_BACK_0 = 3'h1;
parameter WRITE_BACK_1 = 3'h2;
parameter ALLOCATE_0 = 3'h3;
parameter ALLOCATE_1 = 3'h4;
parameter ALLOCATE_2 = 3'h5;


always_comb begin
    case (state)
        IDLE:
        begin
            state_n = 
        end
        READ_WRITE:
        begin

always_comb begin
    S0__ready = 1'b0;
    S0__s1_valid_n = 1'b0;
    l1_to_mem__valid_n = 1'b0;
    l1_to_mem__addr_n = {S0__tag, S0__index, 6'h0};
    flop_l1_to_mem_out = 1'b0;
    flop_l1_to_mem_in = 1'b0;
    sram__wr_data = sram__rd_data;
    sram__rw = 1'b0;

    case (state)
        READ_WRITE:
        begin
            if (S0__valid) begin
                if (hit) begin
                    S0__ready = S1__ready;
                    S0__s1_valid_n = 1'b1;
                    sram__wr_data[L1_CACHE__SRAM__VALID__FIELD] = 1'b1;
                    sram__wr_data[L1_CACHE__SRAM__DIRTY__FIELD] = 1'b1;
                    sram__wr_data[L1_CACHE__SRAM__TAG__FIELD] = S0__tag;
                    sram__wr_data[L1_CACHE__SRAM__DATA__FIELD] = S0__sram_wr_data;
                    sram__rw = S0__rw;
                    state_n = READ_WRITE;
                end
                else begin
                    S0__ready = 1'b0;
                    S0__s1_valid_n = 1'b0;
                    state_n = (valid & dirty) ? WRITE_BACK_0 : ALLOCATE_0;
                end
            end
            else begin
                S0__ready = S1__ready;
                S0__s1_valid_n = 1'b0;
                state_n = READ_WRITE;
            end
        end
        WRITE_BACK_0:
        begin
            l1_to_mem__valid_n = 1'b1;
            l1_to_mem__addr_n = {sram__rd_data[L1_CACHE__SRAM__TAG__FIELD], S0__index, 6'h0};
            l1_to_mem__rw_n = 1'b1;
            flop_l1_to_mem_out = 1'b1;
            state_n = WRITE_BACK_1;
        end
        WRITE_BACK_1:
        begin
            state_n = ALLOCATE_0;
        end
        ALLOCATE_0:
        begin
            l1_to_mem__valid_n = 1'b1;
            l1_to_mem__rw_n = 1'b0;
            state_n = ALLOCATE_1;
        end
        ALLOCATE_1:
        begin
            flop_l1_to_mem_in = 1'b1;
            state_n = ALLOCATE_2;
        end
        ALLOCATE_2:
        begin
            sram__wr_data[L1_CACHE__SRAM__VALID__FIELD] = 1'b1;
            sram__wr_data[L1_CACHE__SRAM__DIRTY__FIELD] = 1'b0;
            sram__wr_data[L1_CACHE__SRAM__TAG__FIELD] = S0__tag;
            sram__wr_data[L1_CACHE__SRAM__DATA__FIELD] = mem_data;
            sram__rw = 1'b1;
            state_n = READ_WRITE;
        end
    endcase
end

always_ff @(posedge clk) begin
    if (rst) state <= READ_WRITE;
    else state <= state_n;
end

//==============================================
// Memory Interface
//==============================================
always_ff @(posedge clk) begin
    if (rst) l1_to_mem__valid <= 1'b0;
    else l1_to_mem__valid <= l1_to_mem__valid_n;
end

always_ff @(posedge clk) begin
    if (flop_l1_to_mem_out) {l1_to_mem__addr, l1_to_mem__rw, l1_to_mem__wr_data} <= {l1_to_mem__addr_n, l1_to_mem__rw_n, l1_to_mem__wr_data_n};
end

always_ff @(posedge clk) begin
    if (flop_l1_to_mem_in) {mem_data} <= {l1_to_mem__rd_data};
end

assign l1_to_mem__wr_data_n = sram__rd_data[L1_CACHE__SRAM__DATA__FIELD];


//==============================================
// SRAM Interface
//==============================================
logic [5:0] sram__addr;
logic sram__rw;
logic [L1_CACHE__SRAM__FIELD] sram__wr_data;
logic [L1_CACHE__SRAM__FIELD] sram__rd_data;

//==============================
// l1_sram
//==============================
logic [63:0] memory [5:0];


endmodule
