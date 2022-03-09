//==============================================
// level_1_cache
//==============================================
module level_1_cache
(
    input clk,
    input rst,

    input cpu_to_l1__valid,
    output logic cpu_to_l1__ready,
    input cpu_to_l1__rw,
    input [63:0] cpu_to_l1__addr,
    input [63:0] cpu_to_l1__data,

    output logic l1_to_cpu__valid,
    input l1_to_cpu__ready,
    output logic [63:0] l1_to_cpu__data,

    output logic l1_to_mem__valid,
    input l1_to_mem__ready,
    output logic l1_to_mem__rw,
    output logic [63:0] l1_to_mem__addr,
    output logic [511:0] l1_to_mem__data,

    input mem_to_l1__valid,
    output logic mem_to_l1__ready,
    input [511:0] mem_to_l1__data
);


logic addr;
logic rw;
logic wr_data;
logic rd_data;
logic size;
logic tag;
logic index;
logic offset;
logic hit;

assign cache__valid = cache__rd_data[]
assign {cache__rd_byte_} = cache__rd_data[];


assign hit = cache__valid & (cache__tag == tag);


case (offset[5:3])
    3'h0:
    begin
        case (offset[2:0])
            3'h0:
            begin
                case (size)
                    DOUBLE:
                    WORD: 
                    HALF: 
                    BYTE:
                endcase
            end
        endcase
    end
endcase

case (size)
    DOUBLE: 
        case (offset[5:3])
            PYTHON(for i in range(8): print(f"3'h{i:x}: cache__wr_data[{i*64 + 63}:{i*64}] = wr_data;"))
        endcase
    WORD:
        case (offset[5:2])
            PYTHON(for i in range(16): print(f"4'h{i:x}: cache__wr_data[{i*32 + 31}:{i*32}] = wr_data;"))
        endcase
    HALF: 
        case (offset[5:1])
            PYTHON(for i in range(32): print(f"5'h{i:x}: cache__wr_data[{i*16 + 15}:{i*16}] = wr_data;"))
        endcase
    BYTE: 
        case (offset[5:0])
            PYTHON(for i in range(64): print(f"6'h{i:x}: cache__wr_data[{i*8+ 7}:{i*8}] = wr_data;"))
        endcase
endcase




always_ff @(posedge clk) begin
    if (rst) state <= IDLE;
    else begin
        case (state):
            IDLE: 
        endcase
    end
end

always_ff @(posedge clk) begin
    if (rst) state <= IDLE;
    else begin
        case (state):
            IDLE: 
        endcase
    end
end

always_comb begin
    cache__wr_data = cache__rd_data;
    case (state)
        READ_WRITE: 
        begin
            cpu_rtn__valid = hit;
            // write to cache only on write requests that hit
            cache__rw = rw & hit;
            // set dirty bit on write
            cache__wr_data[] = rw;

            case (size)
                DOUBLE:
                    case (offset[5:3])
                        PYTHON(for i in range(8): print(f"3'h{i:x}: cache__wr_data[{i*64 + 63}:{i*64}] = wr_data;"))
                    endcase
                WORD:
                    case (offset[5:2])
                        PYTHON(for i in range(16): print(f"4'h{i:x}: cache__wr_data[{i*32 + 31}:{i*32}] = wr_data;"))
                    endcase
                HALF: 
                    case (offset[5:1])
                        PYTHON(for i in range(32): print(f"5'h{i:x}: cache__wr_data[{i*16 + 15}:{i*16}] = wr_data;"))
                    endcase
                BYTE: 
                    case (offset[5:0])
                        PYTHON(for i in range(64): print(f"6'h{i:x}: cache__wr_data[{i*8+ 7}:{i*8}] = wr_data;"))
                    endcase
            endcase
        end
        WRITE_BACK:
        begin
            mem_req__valid = 1'b1;
            mem_req__rw = 1'b1;
            mem_req__addr = addr;
            mem_req__data = cache__rd_data;

        end
        ALLOCATE:
        begin
            cache__wr_data = {1'b1, 1'b0, mem_rtn__data};
        end
    endcase
end


logic [5:0] cpu_req__offset;
logic [5:0] cpu_req__index;
logic [51:0] cpu_req__tag;

assign cpu_req__offset = cpu_req__addr[5:0];
assign cpu_req__index = cpu_req__addr[11:6];
assign cpu_req__tag = cpu_req__addr[63:12];








logic [] state;
logic [] rw;
logic [63:0] addr;
logic [63:0] data;

assign tag = req__addr[47:15];
assign index = req__addr[14:6];


always_ff @(posedge clk) begin
    if (rst) state <= IDLE;
    else begin
        case (state)
            IDLE: state <= (cpu_req__valid & cpu_req__ready) ? COMPARE_TAG : state;
            ACTIVE: state <= hit ? ((cpu_rtn__valid & cpu_rtn__ready) ? ((cpu_req__valid & cpu_req__ready) ? state : IDLE) : state)
            ACTIVE: state <= hit ? ((cpu_rtn__valid & cpu_rtn__ready) ? ((cpu_req__valid & cpu_req__ready) ? ACTIVE : IDLE) : ACTIVE) : ()

            (cpu_req__valid & cpu_req__ready) ? ACITIVE : IDLE;
            COMPARE_TAG: state <= hit ? (rw ? WRITE : READ) : (dirty ? WRITE_BACK_0 : ALLOCATE);
            READ: state <= cpu_rtn__ready ? ((cpu_req__valid & cpu_req__ready) ? COMPARE_TAG : IDLE)
            READ: state <= cpu_rtn__ready ? ((cpu_req__valid & cpu_req__ready) ? COMPARE_TAG : IDLE) : state;
        endcase
    end
end

always_ff @(posedge clk) begin
    case (state)
        IDLE: state <= (cpu_req__valid & cpu_req__ready) ? COMPARE_TAG : state;
        COMPARE_TAG: state <= hit ? (rw ? WRITE : READ) : (dirty ? WRITE_BACK_0 : ALLOCATE);
        READ: state <= cpu_rtn__ready ? ((cpu_req__valid & cpu_req__ready) ? COMPARE_TAG : IDLE) : state;
        WRITE: state <= cpu_rtn__ready ? ((cpu_req__valid & cpu_req__ready) ? COMPARE_TAG : IDLE) : state;
        WRITE_BACK_0: state <= (mem_req__valid & mem_req__ready) ? WRITE_BACK_1 : state;
        WRITE_BACK_1: state <= (mem_req__valid & mem_req__ready) ? WRITE_BACK_2 : state;
        WRITE_BACK_2: state <= (mem_req__valid & mem_req__ready) ? WRITE_BACK_3 : state;
        WRITE_BACK_3: state <= (mem_req__valid & mem_req__ready) ? WRITE_BACK_4 : state;
        WRITE_BACK_4: state <= (mem_req__valid & mem_req__ready) ? WRITE_BACK_5 : state;
        WRITE_BACK_5: state <= (mem_req__valid & mem_req__ready) ? WRITE_BACK_6 : state;
        WRITE_BACK_6: state <= (mem_req__valid & mem_req__ready) ? WRITE_BACK_7 : state;
        WRITE_BACK_7: state <= (mem_req__valid & mem_req__ready) ? ALLOCATE_REQ_0 : state;
        ALLOCATE_REQ_0: state <= (mem_req__valid & mem_req__ready) ? ALLOCATE_RTN_0 : state;
        ALLOCATE_RTN_0: state <= (mem_rtn__valid & mem_rtn__ready) ? ALLOCATE_REQ_1 : state;
        ALLOCATE_REQ_1: state <= (mem_req__valid & mem_req__ready) ? ALLOCATE_RTN_1 : state;
        ALLOCATE_RTN_1: state <= (mem_rtn__valid & mem_rtn__ready) ? ALLOCATE_REQ_2 : state;
        ALLOCATE_REQ_2: state <= (mem_req__valid & mem_req__ready) ? ALLOCATE_RTN_2 : state;
        ALLOCATE_RTN_2: state <= (mem_rtn__valid & mem_rtn__ready) ? ALLOCATE_REQ_3 : state;
        ALLOCATE_REQ_3: state <= (mem_req__valid & mem_req__ready) ? ALLOCATE_RTN_3 : state;
        ALLOCATE_RTN_3: state <= (mem_rtn__valid & mem_rtn__ready) ? ALLOCATE_REQ_4 : state;
        ALLOCATE_REQ_4: state <= (mem_req__valid & mem_req__ready) ? ALLOCATE_RTN_4 : state;
        ALLOCATE_RTN_4: state <= (mem_rtn__valid & mem_rtn__ready) ? ALLOCATE_REQ_5 : state;
        ALLOCATE_REQ_5: state <= (mem_req__valid & mem_req__ready) ? ALLOCATE_RTN_5 : state;
        ALLOCATE_RTN_5: state <= (mem_rtn__valid & mem_rtn__ready) ? ALLOCATE_REQ_6 : state;
        ALLOCATE_REQ_6: state <= (mem_req__valid & mem_req__ready) ? ALLOCATE_RTN_6 : state;
        ALLOCATE_RTN_6: state <= (mem_rtn__valid & mem_rtn__ready) ? ALLOCATE_REQ_7 : state;
        ALLOCATE_REQ_7: state <= (mem_req__valid & mem_req__ready) ? ALLOCATE_RTN_7 : state;
        ALLOCATE_RTN_7: state <= (mem_rtn__valid & mem_rtn__ready) ? COMPARE_TAG : state;
    endcase
end

assign 
assign mem_req__addr = {addr[63:6], offset, 3'h0};

always_comb begin
    cpu_req__ready = 1'b0;
    cpu_rtn__valid = 1'b0;
    case (state)
        IDLE:
        begin
            cpu_req__ready = 1'b1;
        end
        READ: 
        begin
            cpu_req__ready = cpu_rtn__ready;
            cpu_rtn__valid = 1'b1;
        end
        WRITE:
        begin
            cpu_req__ready = cpu_rtn__ready;
            cpu_rtn__valid = 1'b1;
            we = 1'b1
        end
        WRITE_BACK_0:
        begin
            offset = 3'h0;
            mem_req__valid = 1'b1:
            mem_req__rw = 1'b1;
            mem_req__data = rd_data;
        end
        WRITE_BACK_1:
        begin
            offset = 3'h1;
            mem_req__valid = 1'b1:
            mem_req__rw = 1'b1;
            mem_req__data = rd_data;
        end
        WRITE_BACK_2:
        begin
            offset = 3'h2;
            mem_req__valid = 1'b1:
            mem_req__rw = 1'b1;
            mem_req__data = rd_data;
        end
        WRITE_BACK_3:
        begin
            offset = 3'h3;
            mem_req__valid = 1'b1:
            mem_req__rw = 1'b1;
            mem_req__data = rd_data;
        end
        WRITE_BACK_4:
        begin
            offset = 3'h4;
            mem_req__valid = 1'b1:
            mem_req__rw = 1'b1;
            mem_req__data = rd_data;
        end
        WRITE_BACK_5:
        begin
            offset = 3'h5;
            mem_req__valid = 1'b1:
            mem_req__rw = 1'b1;
            mem_req__data = rd_data;
        end
        WRITE_BACK_6:
        begin
            offset = 3'h6;
            mem_req__valid = 1'b1:
            mem_req__rw = 1'b1;
            mem_req__data = rd_data;
        end
        WRITE_BACK_7:
        begin
            offset = 3'h7;
            mem_req__valid = 1'b1:
            mem_req__rw = 1'b1;
            mem_req__data = rd_data;
        end
        ALLOCATE_REQ_0:
        begin
            offset = 3'h0;
            mem_req__valid = 1'b1;
        end
        ALLOCATE_RTN_0:
        begin
            offset = 3'h0;
            mem_rtn__ready = 1'b1;
            cache__we = mem_rtn__valid;
            cache__wr_data = mem_rtn__data;        
        end
        ALLOCATE_REQ_1:
        begin
            offset = 3'h1;
            mem_req__valid = 1'b1;
        end
        ALLOCATE_RTN_1:
        begin
            offset = 3'h1;
            mem_rtn__ready = 1'b1;
            cache__we = mem_rtn__valid;
            cache__wr_data = mem_rtn__data;        
        end
        ALLOCATE_REQ_2:
        begin
            offset = 3'h2;
            mem_req__valid = 1'b1;
        end
        ALLOCATE_RTN_2:
        begin
            offset = 3'h2;
            mem_rtn__ready = 1'b1;
            cache__we = mem_rtn__valid;
            cache__wr_data = mem_rtn__data;        
        end
        ALLOCATE_REQ_3:
        begin
            offset = 3'h3;
            mem_req__valid = 1'b1;
        end
        ALLOCATE_RTN_3:
        begin
            offset = 3'h3;
            mem_rtn__ready = 1'b1;
            cache__we = mem_rtn__valid;
            cache__wr_data = mem_rtn__data;        
        end
        ALLOCATE_REQ_4:
        begin
            offset = 3'h4;
            mem_req__valid = 1'b1;
        end
        ALLOCATE_RTN_4:
        begin
            offset = 3'h4;
            mem_rtn__ready = 1'b1;
            cache__we = mem_rtn__valid;
            cache__wr_data = mem_rtn__data;        
        end
        ALLOCATE_REQ_5:
        begin
            offset = 3'h5;
            mem_req__valid = 1'b1;
        end
        ALLOCATE_RTN_5:
        begin
            offset = 3'h5;
            mem_rtn__ready = 1'b1;
            cache__we = mem_rtn__valid;
            cache__wr_data = mem_rtn__data;        
        end
        ALLOCATE_REQ_6:
        begin
            offset = 3'h6;
            mem_req__valid = 1'b1;
        end
        ALLOCATE_RTN_6:
        begin
            offset = 3'h6;
            mem_rtn__ready = 1'b1;
            cache__we = mem_rtn__valid;
            cache__wr_data = mem_rtn__data;        
        end
        ALLOCATE_REQ_7:
        begin
            offset = 3'h7;
            mem_req__valid = 1'b1;
        end
        ALLOCATE_RTN_7:
        begin
            offset = 3'h7;
            mem_rtn__ready = 1'b1;
            cache__we = mem_rtn__valid;
            cache__wr_data = mem_rtn__data;        
        end
    endcase
end


always_comb begin
    case (addr[2:0])
        3'h0: cpu_rtn__data = rd_data;
        3'h1: cpu_rtn__data = rd_data >> 8;
        3'h2: cpu_rtn__data = rd_data >> 16;
        3'h3: cpu_rtn__data = rd_data >> 24;
        3'h4: cpu_rtn__data = rd_data >> 32;
        3'h5: cpu_rtn__data = rd_data >> 40;
        3'h6: cpu_rtn__data = rd_data >> 48;
        3'h7: cpu_rtn__data = rd_data >> 56;
    endcase
end


assign hit = (cache__tag == cache__rd_tag) & valid;

assign mem_req__addr = {addr[63:6], offset, 3'h0};
assign 


always_ff @(posedge clk) begin
    req__rw <= (cpu_req__valid & cpu_req__ready) ? cpu_req__rw : rw;
end

always_ff @(posedge clk) begin
    req__addr <= (cpu_req__valid & cpu_req__ready) ? cpu_req__addr : addr;
end

always_ff @(posedge clk) begin
    req__data <= (cpu_req__valid & cpu_req__ready & cpu_req__rw) ? cpu_req__data : wr_data;
end


endmodule


mem[][63:0]