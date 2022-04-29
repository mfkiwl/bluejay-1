//==============================================
// l1
//==============================================
module l1
(
    input clk,
    input rst,

    input cpu_to_l1__valid,
    output logic cpu_to_l1__ready,
    input [39:0] cpu_to_l1__addr,
    input cpu_to_l1__rw,
    input [63:0] cpu_to_l1__data,
    input [2:0] cpu_to_l1__dtype,

    output logic l1_to_cpu__valid,
    input l1_to_cpu__ready,
    output logic [63:0] l1_to_cpu__data,

    output logic l1_to_mem__valid,
    input l1_to_mem__ready,
    output logic [63:0] l1_to_mem__data,

    input mem_to_l1__valid,
    output logic mem_to_l1__ready,
    input [63:0] mem_to_l1__data
);

logic [2:0] state;
logic [2:0] state_n;
logic [L1__BLOCK_OFFSET__WIDTH-1:0] offset;
logic [L1__INDEX__WIDTH-1:0] index;
logic [8:0] data_mem__addr;
logic data_mem__rw;
logic [63:0] data_mem__wr_data;
logic [63:0] data_mem__rd_data;
logic [5:0] tag_mem__addr;
logic tag_mem__rw;
logic [29:0] tag_mem__wr_data;
logic [29:0] tag_mem__rd_data;
logic inc_offset;
logic inc_index;


logic S0__valid;
logic S0__ready;
logic [39:0] S0__addr;
logic S0__rw;
logic [2:0] S0__dtype;
logic [63:0] S0__wr_data;
logic [63:0] S0__rd_data;
logic S0__hit;


//==============================================
// Stage 0 (S0)
//==============================================
// S0 pipe stage (valid).
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
        S0__wr_data <= cpu_to_l1__data;
        S0__dtype <= cpu_to_l1__dtype;
    end
end

assign S0__ready = l1_to_cpu__ready & (~S0__valid || S0__hit); 
assign S0__hit = S0__valid & (S0__addr[L1__TAG__FIELD] == tag_mem__rd_data[L1__TAG_MEM__TAG__FIELD]) & tag_mem__rd_data[L1__TAG_MEM__VALID__FIELD] & (state == STATE__READ_WRITE);
assign cpu_to_l1__ready = S0__ready;
assign l1_to_cpu__valid = S0__valid & S0__hit;
assign l1_to_cpu__data = S0__rd_data;

// Format rd_data.
always_comb begin
    case (S0__dtype)
        DTYPE__D:
        begin
            S0__rd_data = data_mem__rd_data;
        end
        DTYPE__W:
            case (S0__addr[L1__BYTE_OFFSET__FIELD])
                PYTHON
                (
                size = 4
                for i in range(8):
                    if (i % size) == 0:
                        print(f"3'h{i:x}:")
                        print(f"begin")
                        print(f"    S0__rd_data = {{{{{8*size}{{data_mem__rd_data[{8*i + 8*size - 1}]}}}}, data_mem__rd_data[{8*i + 8*size - 1}:{8*i}]}};")
                        print(f"end")
                )
            endcase
        DTYPE__WU:
        begin
            case (S0__addr[L1__BYTE_OFFSET__FIELD])
                PYTHON
                (
                size = 4
                for i in range(8):
                    if (i % size) == 0:
                        print(f"3'h{i:x}:")
                        print(f"begin")
                        print(f"    S0__rd_data = {{{{{8*size}{{1'b0}}}}, data_mem__rd_data[{8*i + 8*size - 1}:{8*i}]}};")
                        print(f"end")
                )
            endcase
        end
        DTYPE__H:
        begin
            case (S0__addr[L1__BYTE_OFFSET__FIELD])
                PYTHON
                (
                size = 2
                for i in range(8):
                    if (i % size) == 0:
                        print(f"3'h{i:x}:")
                        print(f"begin")
                        print(f"    S0__rd_data = {{{{{8*size}{{data_mem__rd_data[{8*i + 8*size - 1}]}}}}, data_mem__rd_data[{8*i + 8*size - 1}:{8*i}]}};")
                        print(f"end")
                )
            endcase
        end
        DTYPE__HU:
        begin
            case (S0__addr[L1__BYTE_OFFSET__FIELD])
                PYTHON
                (
                size = 2
                for i in range(8):
                    if (i % size) == 0:
                        print(f"3'h{i:x}:")
                        print(f"begin")
                        print(f"    S0__rd_data = {{{{{8*size}{{1'b0}}}}, data_mem__rd_data[{8*i + 8*size - 1}:{8*i}]}};")
                        print(f"end")
                )
            endcase            
        end
        DTYPE__B:
        begin
            case (S0__addr[L1__BYTE_OFFSET__FIELD])
                PYTHON
                (
                size = 1
                for i in range(8):
                    if (i % size) == 0:
                        print(f"3'h{i:x}:")
                        print(f"begin")
                        print(f"    S0__rd_data = {{{{{8*size}{{data_mem__rd_data[{8*i + 8*size - 1}]}}}}, data_mem__rd_data[{8*i + 8*size - 1}:{8*i}]}};")
                        print(f"end")
                )  
            endcase        
        end
        DTYPE__BU:
        begin
            case (S0__addr[L1__BYTE_OFFSET__FIELD])
                PYTHON
                (
                size = 1
                for i in range(8):
                    if (i % size) == 0:
                        print(f"3'h{i:x}:")
                        print(f"begin")
                        print(f"    S0__rd_data = {{{{{8*size}{{1'b0}}}}, data_mem__rd_data[{8*i + 8*size - 1}:{8*i}]}};")
                        print(f"end")
                )
            endcase              
        end
    endcase
end



//==============================================
// Control FSM
//==============================================
parameter STATE__RESET = 3'h0;
parameter STATE__INIT = 3'h1;
parameter STATE__READ_WRITE = 3'h2;
parameter STATE__ALLOCATE__SEND_REQUEST= 3'h3;
parameter STATE__ALLOCATE__WRITE_L1 = 3'h4;
parameter STATE__WRITE_BACK__SEND_HEADER = 3'h5;
parameter STATE__WRITE_BACK__SEND_DATA = 3'h6;


always_comb begin
    state_n = state;
    data_mem__rw = 1'b0;
    data_mem__addr = {S0__addr[L1__INDEX__FIELD], S0__addr[L1__BLOCK_OFFSET__FIELD]};
    tag_mem__rw = 1'b0;
    tag_mem__wr_data = tag_mem__wr_data;
    tag_mem__addr = S0__addr[L1__INDEX__FIELD];
    mem_to_l1__ready = 1'b0;
    l1_to_mem__valid = 1'b0;
    inc_offset = 1'b0;
    inc_index = 1'b0;

    case (state)
        STATE__RESET:
        begin
            state_n = STATE__INIT;
        end
        STATE__INIT:
        begin
            inc_index = 1'b1;    
            tag_mem__rw = 1'b1;
            tag_mem__wr_data = 0;
            tag_mem__addr = index;

            if (&index) begin
                state_n = STATE__READ_WRITE;
            end
        end
        STATE__READ_WRITE:
        begin
            if (S0__valid) begin
                if (S0__hit) begin
                    if (S0__rw) begin
                        data_mem__rw = 1'b1;
                        data_mem__wr_data = S0__wr_data;
                        tag_mem__rw = 1'b1;
                        tag_mem__wr_data = tag_mem__rd_data;
                        tag_mem__wr_data[L1__TAG_MEM__DIRTY__FIELD] = 1'b1;
                        state_n = STATE__READ_WRITE;
                    end
                end
                else begin
                    if (tag_mem__rd_data[L1__TAG_MEM__DIRTY__FIELD]) begin
                        state_n = STATE__WRITE_BACK__SEND_HEADER;
                    end
                    else begin
                        state_n = STATE__ALLOCATE__SEND_REQUEST;
                    end
                end
            end
        end
        STATE__ALLOCATE__SEND_REQUEST:
        begin
            l1_to_mem__valid = 1'b1;
            l1_to_mem__data = {1'b0, S0__addr};

            if (l1_to_mem__ready) begin
                state_n = STATE__ALLOCATE__WRITE_L1;
            end       
        end
        STATE__ALLOCATE__WRITE_L1:
        begin
            mem_to_l1__ready = 1'b1;
            data_mem__addr = {S0__addr[L1__INDEX__FIELD], offset};

            if (mem_to_l1__valid) begin
                data_mem__rw = 1'b1;
                data_mem__wr_data = mem_to_l1__data;
                tag_mem__rw = 1'b1;
                tag_mem__wr_data[L1__TAG_MEM__TAG__FIELD] = S0__addr[L1__TAG__FIELD];
                tag_mem__wr_data[L1__TAG_MEM__VALID__FIELD] = 1'b1;
                tag_mem__wr_data[L1__TAG_MEM__DIRTY__FIELD] = 1'b0;
                inc_offset = 1'b1;

                if (&offset) begin
                    state_n = STATE__READ_WRITE;
                end
            end
        end
        STATE__WRITE_BACK__SEND_HEADER:
        begin
            l1_to_mem__valid = 1'b1;
            l1_to_mem__data = {1'b1, S0__addr};

            if (l1_to_mem__ready) begin
                state_n = STATE__WRITE_BACK__SEND_DATA;
            end 
        end
        STATE__WRITE_BACK__SEND_DATA:
        begin
            data_mem__addr = {S0__addr[L1__INDEX__FIELD], offset};
            l1_to_mem__valid = 1'b1;
            l1_to_mem__data = data_mem__rd_data;

            if (l1_to_mem__ready) begin
                inc_offset = 1'b1;

                if (&offset) begin
                    state_n = STATE__ALLOCATE__SEND_REQUEST;
                end
            end
        end
    endcase
end

always_ff @(posedge clk) begin
    if (rst) begin
        state <= STATE__RESET;
    end
    else begin
        state <= state_n;
    end
end

always_ff @(posedge clk) begin
    if (rst) begin
        index <= 0;
    end
    else begin
        index <= inc_index ? index + 1 : index;
    end
end

always_ff @(posedge clk) begin
    if (rst) begin
        offset <= 0;
    end
    else begin
        offset <= inc_offset ? offset + 1 : offset;
    end
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

//==============================
// tag_mem
//==============================
memory #(.WIDTH(30), .DEPTH(64), .DEPTH__LOG2(6)) tag_mem
(
    .clk(clk),
    .rst(rst),
    .addr(tag_mem__addr),
    .rw(tag_mem__rw),
    .wr_data(tag_mem__wr_data),
    .rd_data(tag_mem__rd_data)
);


endmodule

