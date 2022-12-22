

// //==============================================
// // l1
// //==============================================
// module l1
// (
//     input clk,
//     input rst,

//     input valid,
//     output logic ready,
//     input [39:0] addr,
//     input rw,
//     input [63:0] wr_data,
//     output logic [63:0] rd_data,
//     output logic hit,
//     input [2:0] dtype,

//     output logic l1_to_mem__valid,
//     input l1_to_mem__ready,
//     output logic [63:0] l1_to_mem__data,

//     input mem_to_l1__valid,
//     output logic mem_to_l1__ready,
//     input [63:0] mem_to_l1__data
// );

// logic [2:0] state;
// logic [2:0] state_n;
// logic [L1__BLOCK_OFFSET__WIDTH-1:0] offset;
// logic [L1__INDEX__WIDTH-1:0] index;
// logic [8:0] data_mem__addr;
// logic data_mem__rw;
// logic [63:0] data_mem__wr_data;
// logic [63:0] data_mem__rd_data;
// logic [5:0] tag_mem__addr;
// logic tag_mem__rw;
// logic [29:0] tag_mem__wr_data;
// logic [29:0] tag_mem__rd_data;
// logic inc_offset;
// logic inc_index;
   


// assign ready = ~valid || hit;      

// parameter STATE__RESET = 3'h0;
// parameter STATE__INIT = 3'h1;
// parameter STATE__READ_WRITE = 3'h2;
// parameter STATE__ALLOCATE__SEND_REQUEST= 3'h3;
// parameter STATE__ALLOCATE__WRITE_L1 = 3'h4;
// parameter STATE__WRITE_BACK__SEND_HEADER = 3'h5;
// parameter STATE__WRITE_BACK__SEND_DATA = 3'h6;


// // Control FSM.
// always_comb begin
//     state_n = state;
//     hit = 1'b0;

//     data_mem__rw = 1'b0;
//     data_mem__addr = {addr[L1__INDEX__FIELD], addr[L1__BLOCK_OFFSET__FIELD]};

//     tag_mem__rw = 1'b0;
//     tag_mem__wr_data = tag_mem__wr_data;
//     tag_mem__addr = addr[L1__INDEX__FIELD];

//     mem_to_l1__ready = 1'b0;

//     l1_to_mem__valid = 1'b0;

//     inc_offset = 1'b0;
//     inc_index = 1'b0;

    

//     case (state)
//         STATE__RESET:
//         begin
//             state_n = STATE__INIT;
//         end
//         STATE__INIT:
//         begin
//             inc_index = 1'b1;    
//             tag_mem__rw = 1'b1;
//             tag_mem__wr_data = 0;
//             tag_mem__addr = index;

//             if (&index) begin
//                 state_n = STATE__READ_WRITE;
//             end
//         end
//         STATE__READ_WRITE:
//         begin
//             if (valid) begin
//                 hit = (addr[L1__TAG__FIELD] == tag_mem__rd_data[L1__TAG_MEM__TAG__FIELD]) & tag_mem__rd_data[L1__TAG_MEM__VALID__FIELD];

//                 if (hit) begin
//                     if (rw) begin
//                         data_mem__rw = 1'b1;
//                         data_mem__wr_data = wr_data;
//                         tag_mem__rw = 1'b1;
//                         tag_mem__wr_data = tag_mem__rd_data;
//                         tag_mem__wr_data[L1__TAG_MEM__DIRTY__FIELD] = 1'b1;
//                         state_n = STATE__READ_WRITE;
//                     end
//                 end
//                 else begin
//                     if (tag_mem__rd_data[L1__TAG_MEM__DIRTY__FIELD]) begin
//                         state_n = STATE__WRITE_BACK__SEND_HEADER;
//                     end
//                     else begin
//                         state_n = STATE__ALLOCATE__SEND_REQUEST;
//                     end
//                 end
//             end
//         end
//         STATE__ALLOCATE__SEND_REQUEST:
//         begin
//             l1_to_mem__valid = 1'b1;
//             l1_to_mem__data = {1'b0, addr};

//             if (l1_to_mem__ready) begin
//                 state_n = STATE__ALLOCATE__WRITE_L1;
//             end       
//         end
//         STATE__ALLOCATE__WRITE_L1:
//         begin
//             mem_to_l1__ready = 1'b1;
//             data_mem__addr = {addr[L1__INDEX__FIELD], offset};

//             if (mem_to_l1__valid) begin
//                 data_mem__rw = 1'b1;
//                 data_mem__wr_data = mem_to_l1__data;
//                 tag_mem__rw = 1'b1;
//                 tag_mem__wr_data[L1__TAG_MEM__TAG__FIELD] = addr[L1__TAG__FIELD];
//                 tag_mem__wr_data[L1__TAG_MEM__VALID__FIELD] = 1'b1;
//                 tag_mem__wr_data[L1__TAG_MEM__DIRTY__FIELD] = 1'b0;
//                 inc_offset = 1'b1;

//                 if (&offset) begin
//                     state_n = STATE__READ_WRITE;
//                 end
//             end
//         end
//         STATE__WRITE_BACK__SEND_HEADER:
//         begin
//             l1_to_mem__valid = 1'b1;
//             l1_to_mem__data = {1'b1, addr};

//             if (l1_to_mem__ready) begin
//                 state_n = STATE__WRITE_BACK__SEND_DATA;
//             end 
//         end
//         STATE__WRITE_BACK__SEND_DATA:
//         begin
//             data_mem__addr = {addr[L1__INDEX__FIELD], offset};
//             l1_to_mem__valid = 1'b1;
//             l1_to_mem__data = data_mem__rd_data;

//             if (l1_to_mem__ready) begin
//                 inc_offset = 1'b1;

//                 if (&offset) begin
//                     state_n = STATE__ALLOCATE__SEND_REQUEST;
//                 end
//             end
//         end
//     endcase
// end

// always_ff @(posedge clk) begin
//     if (rst) begin
//         state <= STATE__RESET;
//     end
//     else begin
//         state <= state_n;
//     end
// end

// always_ff @(posedge clk) begin
//     if (rst) begin
//         index <= 0;
//     end
//     else begin
//         index <= inc_index ? index + 1 : index;
//     end
// end

// always_ff @(posedge clk) begin
//     if (rst) begin
//         offset <= 0;
//     end
//     else begin
//         offset <= inc_offset ? offset + 1 : offset;
//     end
// end


// // Format rd_data.
// always_comb begin
//     case (dtype)
//         DTYPE__DOUBLE_WORD:
//         begin
//             rd_data = data_mem__rd_data;
//         end
//         DTYPE__WORD:
//             case (addr[L1__BYTE_OFFSET__FIELD])
//                 PYTHON
//                 (
//                 size = 4
//                 for i in range(8):
//                     if (i % size) == 0:
//                         print(f"3'h{i:x}:")
//                         print(f"begin")
//                         print(f"    rd_data = {{{{{8*size}{{data_mem__rd_data[{8*i + 8*size - 1}]}}}}, data_mem__rd_data[{8*i + 8*size - 1}:{8*i}]}};")
//                         print(f"end")
//                 )
//             endcase
//         DTYPE__WORD_UNSIGNED:
//         begin
//             case (addr[L1__BYTE_OFFSET__FIELD])
//                 PYTHON
//                 (
//                 size = 4
//                 for i in range(8):
//                     if (i % size) == 0:
//                         print(f"3'h{i:x}:")
//                         print(f"begin")
//                         print(f"    rd_data = {{{{{8*size}{{1'b0}}}}, data_mem__rd_data[{8*i + 8*size - 1}:{8*i}]}};")
//                         print(f"end")
//                 )
//             endcase
//         end
//         DTYPE__HALF_WORD:
//         begin
//             case (addr[L1__BYTE_OFFSET__FIELD])
//                 PYTHON
//                 (
//                 size = 2
//                 for i in range(8):
//                     if (i % size) == 0:
//                         print(f"3'h{i:x}:")
//                         print(f"begin")
//                         print(f"    rd_data = {{{{{8*size}{{data_mem__rd_data[{8*i + 8*size - 1}]}}}}, data_mem__rd_data[{8*i + 8*size - 1}:{8*i}]}};")
//                         print(f"end")
//                 )
//             endcase
//         end
//         DTYPE__HALF_WORD_UNSIGNED:
//         begin
//             case (addr[L1__BYTE_OFFSET__FIELD])
//                 PYTHON
//                 (
//                 size = 2
//                 for i in range(8):
//                     if (i % size) == 0:
//                         print(f"3'h{i:x}:")
//                         print(f"begin")
//                         print(f"    rd_data = {{{{{8*size}{{1'b0}}}}, data_mem__rd_data[{8*i + 8*size - 1}:{8*i}]}};")
//                         print(f"end")
//                 )
//             endcase            
//         end
//         DTYPE__BYTE:
//         begin
//             case (addr[L1__BYTE_OFFSET__FIELD])
//                 PYTHON
//                 (
//                 size = 1
//                 for i in range(8):
//                     if (i % size) == 0:
//                         print(f"3'h{i:x}:")
//                         print(f"begin")
//                         print(f"    rd_data = {{{{{8*size}{{data_mem__rd_data[{8*i + 8*size - 1}]}}}}, data_mem__rd_data[{8*i + 8*size - 1}:{8*i}]}};")
//                         print(f"end")
//                 )  
//             endcase        
//         end
//         DTYPE__BYTE_UNSIGNED:
//         begin
//             case (addr[L1__BYTE_OFFSET__FIELD])
//                 PYTHON
//                 (
//                 size = 1
//                 for i in range(8):
//                     if (i % size) == 0:
//                         print(f"3'h{i:x}:")
//                         print(f"begin")
//                         print(f"    rd_data = {{{{{8*size}{{1'b0}}}}, data_mem__rd_data[{8*i + 8*size - 1}:{8*i}]}};")
//                         print(f"end")
//                 )
//             endcase              
//         end
//     endcase
// end



// //==============================
// // data_mem
// //==============================
// memory #(.WIDTH(64), .DEPTH(512), .DEPTH__LOG2(9)) data_mem
// (
//     .clk(clk),
//     .rst(rst),
//     .addr(data_mem__addr),
//     .rw(data_mem__rw),
//     .wr_data(data_mem__wr_data),
//     .rd_data(data_mem__rd_data)
// );

// //==============================
// // tag_mem
// //==============================
// memory #(.WIDTH(30), .DEPTH(64), .DEPTH__LOG2(6)) tag_mem
// (
//     .clk(clk),
//     .rst(rst),
//     .addr(tag_mem__addr),
//     .rw(tag_mem__rw),
//     .wr_data(tag_mem__wr_data),
//     .rd_data(tag_mem__rd_data)
// );


// endmodule



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
    input [1:0] cpu_to_l1__size,

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


//==============================================
// STAGE 0 (S0)
//==============================================
logic S0__valid;
logic S0__ready;
logic [63:0] S0__addr;
logic S0__rw;
logic [63:0] S0__wr_data;
logic [1:0] S0__size;
logic S0__s1_valid_n;
logic [63:0] S0__rd_data;
logic [511:0] S0__sram_wr_data;
logic [51:0] S0__tag;
logic [5:0] S0__index;
logic [5:0] S0__offset;


always_ff @(posedge clk) begin
    if (rst) {S0__valid} <= {1'b0};
    else begin
        if (S0__ready) {S0__valid, S0__addr, S0__rw, S0__wr_data, S0__size} <= {cpu_to_l1__valid, cpu_to_l1__addr, cpu_to_l1__rw, cpu_to_l1__data, cpu_to_l1__size};
    end
end

assign S0__tag = S0__addr[L1_CACHE__TAG__FIELD];
assign S0__index = S0__addr[L1_CACHE__INDEX__FIELD];
assign S0__offset = S0__addr[L1_CACHE__OFFSET__FIELD];

assign cpu_to_l1__ready = S0__ready;

always_comb begin
    S0__rd_data = 64'h0;
    case (S0__size)
        SIZE__DOUBLE:
            case (S0__addr[5:3])
                PYTHON(for i in range(8): print(f"3'h{i:x}: S0__rd_data = sram__rd_data[{i*64 + 63}:{i*64}];"))
            endcase
        SIZE__WORD:
            case (S0__addr[5:2])
                PYTHON(for i in range(16): print(f"4'h{i:x}: S0__rd_data[31:0] = sram__rd_data[{i*32 + 31}:{i*32}];"))
            endcase
        SIZE__HALF: 
            case (S0__addr[5:1])
                PYTHON(for i in range(32): print(f"5'h{i:x}: S0__rd_data[16:0] = sram__rd_data[{i*16 + 15}:{i*16}];"))
            endcase
        SIZE__BYTE: 
            case (S0__addr[5:0])
                PYTHON(for i in range(64): print(f"6'h{i:x}: S0__rd_data[8:0] = sram__rd_data[{i*8 + 7}:{i*8}];"))
            endcase
    endcase
end

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
logic S1__valid;
logic S1__ready;
logic [63:0] S1__addr;
logic [63:0] S1__rd_data;


always_ff @(posedge clk) begin
    if (rst) {S1__valid} <= {1'b0};
    else begin
        if (S1__ready) {S1__valid, S1__addr, S1__rd_data} <= {S0__s1_valid_n, S0__addr, S0__rd_data};
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
l1_sram l1_sram__0
(
    .clk(clk),
    .rst(rst),
    .addr(sram__addr),
    .rw(sram__rw),
    .wr_data(sram__wr_data),
    .rd_data(sram__rd_data)
);


endmodule
