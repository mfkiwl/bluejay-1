//==============================================================
// l1
//==============================================================
module l1
(
    input clk,
    input rst,

    input in__valid,
    output in__ready,
    input in__addr,
    input in__wr_data,
    input in__type,

    input [63:0] addr,
    input rw,
    input [63:0] wr_data,
    input [1:0] type,
    output logic [63:0] rd_data,
);

// S0
logic S0__valid;
logic S0__ready;
logic [63:0] S0__addr;
logic S0__rw;
logic [63:0] S0__wr_data;
logic [1:0] S0__type;
logic [63:0] S0__rd_data;
logic S0__hit;

// S1
logic S1__valid;
logic S1__ready;
logic [63:0] S1__rd_data;

//==============================================
// Stage 0 (S0)
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
    if (cpu_to_l1__valid & S0__ready) begin
        S0__addr <= cpu_to_l1__addr;
        S0__rw <= cpu_to_l1__rw;
        S0__wr_data <= cpu_to_l1__wr_data;
        S0__type <= cpu_to_l1__type;
    end
end

assign S0__ready = ~S0__valid | (S0__valid & S0__hit & S1__ready);

//==============================================
// Stage 1 (S1)
//==============================================
// S1 pipe stage (valid)
always_ff @(posedge clk) begin
    if (rst) begin
        S1__valid <= 1'b0;
    end
    else begin
        S1__valid <= S1__ready ? (S0__valid & S0__hit) : S1__valid;
    end
end

// S1 pipe stage (data).
always_ff @(posedge clk) begin
    if (S0__valid & S0__hit & S1__ready) begin
        S1__rd_data <= S0__rd_data;
    end
end


assign S1__ready = l1_to_cpu__ready;



//==============================================
// Format Read Data
//==============================================
always_comb begin
    case (S0__type)
        TYPE__D:
        begin
            S0__rd_data = data_mem__rd_data;
        end
        TYPE__W:
            case (S0__addr[L1__BYTE_OFFSET__FIELD])
                PYTHON
                (
                size = 4
                for i in range(8):
                    if (i % size) == 0:
                        print(f"3'h{i:x}:")
                        print(f"begin")
                        print(f"    S0__rd_data =  {{{{{8*size}{{data_mem__rd_data[{8*i + 8*size - 1}]}}}}, data_mem__rd_data[{8*i + 8*size - 1}:{8*i}]}}")
                        print(f"end")
                )
            endcase
        TYPE__WU:
        begin
            case (S0__addr[L1__BYTE_OFFSET__FIELD])
                PYTHON
                (
                size = 4
                for i in range(8):
                    if (i % size) == 0:
                        print(f"3'h{i:x}:")
                        print(f"begin")
                        print(f"    S0__rd_data =  {{{{{8*size}{{1'b0}}}}, data_mem__rd_data[{8*i + 8*size - 1}:{8*i}]}}")
                        print(f"end")
                )
            endcase
        end
        TYPE__H:
        begin
            case (S0__addr[L1__BYTE_OFFSET__FIELD])
                PYTHON
                (
                size = 2
                for i in range(8):
                    if (i % size) == 0:
                        print(f"3'h{i:x}:")
                        print(f"begin")
                        print(f"    S0__rd_data =  {{{{{8*size}{{data_mem__rd_data[{8*i + 8*size - 1}]}}}}, data_mem__rd_data[{8*i + 8*size - 1}:{8*i}]}}")
                        print(f"end")
                )
        end
        TYPE__HU:
        begin
            case (S0__addr[L1__BYTE_OFFSET__FIELD])
                PYTHON
                (
                size = 2
                for i in range(8):
                    if (i % size) == 0:
                        print(f"3'h{i:x}:")
                        print(f"begin")
                        print(f"    S0__rd_data =  {{{{{8*size}{{1'b0}}}}, data_mem__rd_data[{8*i + 8*size - 1}:{8*i}]}}")
                        print(f"end")
                )
            endcase            
        end
        TYPE__B:
        begin
            case (S0__addr[L1__BYTE_OFFSET__FIELD])
                PYTHON
                (
                size = 1
                for i in range(8):
                    if (i % size) == 0:
                        print(f"3'h{i:x}:")
                        print(f"begin")
                        print(f"    S0__rd_data =  {{{{{8*size}{{data_mem__rd_data[{8*i + 8*size - 1}]}}}}, data_mem__rd_data[{8*i + 8*size - 1}:{8*i}]}}")
                        print(f"end")
                )  
            endcase        
        end
        TYPE__BU:
        begin
            case (S0__addr[L1__BYTE_OFFSET__FIELD])
                PYTHON
                (
                size = 1
                for i in range(8):
                    if (i % size) == 0:
                        print(f"3'h{i:x}:")
                        print(f"begin")
                        print(f"    S0__rd_data =  {{{{{8*size}{{1'b0}}}}, data_mem__rd_data[{8*i + 8*size - 1}:{8*i}]}}")
                        print(f"end")
                )
            endcase              
        end
    endcase
end



//==============================
// data_mem
//==============================
memory #(.WIDTH(64), .DEPTH(512), .DEPTH__LOG2(9)) data_mem
(
    .clk(clk),
    .rst(rst),
    .addr(data_mem__addr),
    .rw(data_mem__rw),
    .wr_data(data_mem__wr_data),
    .rd_data(data_mem__rd_data)
);

logic [8:0] data_mem__addr;
logic data_mem__rw;
logic [63:0] data_mem__wr_data;
logic [64:0] data_mem__rd_data;

assign data_mem__addr = {S0__index, S0__block_offset};

//==============================
// tag_mem
//==============================
memory #(.WIDTH(54), .DEPTH(64), .DEPTH__LOG2(6)) tag_mem
(
    .clk(clk),
    .rst(rst),
    .addr(tag_mem__addr),
    .rw(tag_mem__rw),
    .wr_data(tag_mem__wr_data),
    .rd_data(tag_mem__rd_data)
);

logic [8:0] tag_mem__addr;
logic tag_mem__rw;
logic [63:0] tag_mem__wr_data;
logic [64:0] tag_mem__rd_data;

assign data_mem__addr = S0__index;


//==============================
// tx
//==============================
tx tx__l1_to_mem
(
    .clk(clk),
    .rst(rst),
    .valid(l1_to_mem__valid),
    .ready(l1_to_mem__ready),
    .data(l1_to_mem__data),
    .tx__valid(tx__l1_to_mem__valid),
    .tx__data(tx__l1_to_mem__ready),
    .tx__credit(tx__l1_to_mem__data)
);

logic l1_to_mem__valid;
logic l1_to_mem__ready;
logic [63:0] l1_to_mem__data;





















// Breakout addr.
assign tag = addr[L1__TAG__FIELD];
assign index = addr[L1__INDEX__FIELD];
assign block_offset = addr[L1__BLOCK_OFFSET__FIELD];
assign byte_offset = addr[L1__BYTE_OFFSET__FIELD];

assign hit = (S0__tag = tag_mem__rd_data[L1__TAG_MEM__TAG__FIELD]) & tag_mem__rd_data[L1__TAG_MEM__VALID__FIELD];



//==============================================
// FSM
//==============================================
// FSM state
logic [2:0] state;
logic [2:0] state_n;
// parameter READ_WRITE = 3'h0;
// parameter WRITE_BACK_0 = 3'h1;
// parameter WRITE_BACK_1 = 3'h2;
// parameter ALLOCATE_0 = 3'h3;
// parameter ALLOCATE_1 = 3'h4;
// parameter ALLOCATE_2 = 3'h5;


always_comb begin
    S0__hit = 1'b0;
    data_mem__rw = 1'b0;
    tag_mem__rw = 1'b0;

    case (state)
        STATE__READ_WRITE:
        begin
            if (S0__valid) begin
                S0__hit = (S0__addr[L1__TAG__FIELD] == tag_mem__rd_data[L1__TAG_MEM__TAG__FIELD]) & tag_mem__rd_data[L1__TAG_MEM__VALID__FIELD];

                if (S0__rw) begin
                    data_mem__rw = 1'b1;
                    tag_mem__rw = 1'b1;
                    tag_mem__wr_data = tag_mem__rd_data;
                    tag_mem__wr_data[L1__TAG_MEM__DIRTY__FIELD] = 1'b1;
                    state_n = S0__hit ? STATE__READ_WRITE : STATE__WRITE_BACK;
                end 
                else begin
                    state_n = S0__hit ? STATE__READ_WRITE : STATE__ALLOCATE__SEND_REQUEST;
                end
            end
        STATE__ALLOCATE__SEND_REQUEST:
        begin
            l1_to_mem__valid = 1'b1;
            l1_to_mem__data = {S0__addr, S0__rw};
            state_n = l1_to_mem__ready ? STATE__ALLOCATE__WAIT : STATE__ALLOCATE__SEND_REQUEST;
        end
        STATE__ALLOCATE__WAIT:
        begin
            mem_to_l1__ready = 1'b1;
            state_n = mem_to_l1__valid ? STATE__ALLOCATE__WRITE_L1 : STATE__ALLOCATE__WAIT;
        end
        STATE__ALLOCATE__WRITE_L1:
        begin
            mem_to_l1__ready = 1'b1;

            if (mem_to_l1__valid) begin
                rw_count += 1;
                
            end
        end








            

            if (S0__rw) begin
                data_mem__rw = S0__valid;
            end
            data_mem__rw = S0__rw & S0__valid;
            tag_mem__rw = S0__rw & S0__valid;
            tag_mem__wr_data[L1__TAG_MEM__DIRTY__FIELD] = 1'b1;
            state_n = (S1__ready & ) ? STATE__READ_WRITE;
            end
            else begin
                
            end
        end
    endcase
end





















//==============================================
// CPU to L1
//==============================================
always_ff @(posedge clk) begin
    if (cpu_to_l1__valid & cpu_to_l1__ready) begin
        addr <= cpu_to_l1__addr;
        rw <= cpu_to_l1__rw;
        wr_data <= cpu_to_l1__data;
        type <= cpu_to_l1__type;
    end
end

//==============================================
// L1 to CPU
//==============================================
always_ff @(posedge clk) begin
    if (cpu_to_l1__valid_n & cpu_to_l1__ready) begin
        l1_to_cpu__data <= data_mem__rd_data;
    end
end







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













assign S0__tag = S0__addr[L1__TAG__FIELD];
assign S0__index = S0__addr[L1__INDEX__FIELD];
assign S0__block_offset = S0__addr[L1__BLOCK_OFFSET__FIELD];
assign S0__byte_offset = S0__addr[L1__BYTE_OFFSET__FIELD];

assign S0__hit = (S0__tag = tag_mem__rd_data[L1__TAG_MEM__TAG__FIELD]) & tag_mem__rd_data[L1__TAG_MEM__VALID__FIELD];




//==============================================
// STAGE 1 (S1)
//==============================================
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
    if (S0__valid & S1__ready) begin
        S1__addr <= S0__addr;
        S1__rd_data <= S0__rd_data;
    end
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
    if (S0__valid & S1__ready) begin
        S1__addr <= S0__addr;
        S1__rd_data <= S0__rd_data;
    end
end







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
    S0__ready = 1'b0;
     = 1'b0;
    data_mem__rw = 1'b0;
    data_mem__wr_data = S0__wr_data;
    tag_mem__rw = 1'b0;
    tag_mem__wr_data = tag_mem__rd_data;

    case (state)
        STATE__IDLE:
        begin
            S0__ready = 1'b1;
            state_n = (cpu_to_l1__valid & S0__ready) ? STATE__READ_WRITE : STATE__IDLE;
        end
        STATE__READ_WRITE:
        begin
            if (S0__hit) begin
                S0__ready = 1'b1;
                data_mem__rw = S0__rw;
                tag_mem__rw = S0__rw;
                tag_mem__wr_data[L1__TAG_MEM__DIRTY__FIELD] = 1'b1;
                state_n = cpu_to_l1__valid ? STATE__READ_WRITE;
            end
            else begin
                
            end
        end
    endcase
end

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
