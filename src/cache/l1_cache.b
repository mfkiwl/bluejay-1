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
    input [63:0] l1_to_cpu__addr,
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

parameter IDLE = 3'h0;
parameter READ_WRITE = 3'h1;
parameter WRITE_BACK = 3'h2;
parameter ALLOCATE_REQ = 3'h3;
parameter ALLOCATE_WRITE = 3'h4;

logic [2:0] state;

logic [63:0] addr;
logic rw;
logic [63:0] wr_data;
logic [63:0] rd_data;
logic [1:0] size;
logic hit;

logic [5:0] sram__addr;
logic sram__rw;
logic [L1_CACHE__SRAM__FIELD] sram__wr_data;
logic [L1_CACHE__SRAM__FIELD] sram__rd_data;


assign hit = sram__rd_data[L1_CACHE__SRAM__VALID__FIELD] & (sram__rd_data[L1_CACHE__SRAM__TAG__FIELD] == addr[L1_CACHE__TAG__FIELD]);
assign sram__addr = addr[L1_CACHE__INDEX__FIELD];
assign l1_to_mem__data = sram__rd_data[L1_CACHE__SRAM__DATA__FIELD];
assign l1_to_mem__addr = {sram__rd_data[L1_CACHE__SRAM__TAG__FIELD], addr[L1_CACHE__INDEX__FIELD], 6'h0};
assign l1_to_cpu__data = rd_data;

always_ff @(posedge clk) begin
    if (cpu_to_l1__valid & cpu_to_l1__ready) begin
        addr <= cpu_to_l1__addr;
        rw <= cpu_to_l1__rw;
        wr_data <= cpu_to_l1__data;
        size <= cpu_to_l1__size;
    end
end

always_comb begin
    rd_data = 64'h0;
    case (size)
        SIZE__DOUBLE:
            case (addr[5:3])
                PYTHON(for i in range(8): print(f"3'h{i:x}: rd_data = sram__rd_data[{i*64 + 63}:{i*64}];"))
            endcase
        SIZE__WORD:
            case (addr[5:2])
                PYTHON(for i in range(16): print(f"4'h{i:x}: rd_data[31:0] = sram__rd_data[{i*32 + 31}:{i*32}];"))
            endcase
        SIZE__HALF: 
            case (addr[5:1])
                PYTHON(for i in range(32): print(f"5'h{i:x}: rd_data[16:0] = sram__rd_data[{i*16 + 15}:{i*16}];"))
            endcase
        SIZE__BYTE: 
            case (addr[5:0])
                PYTHON(for i in range(64): print(f"6'h{i:x}: rd_data[8:0] = sram__rd_data[{i*8 + 7}:{i*8}];"))
            endcase
    endcase
end


//==============================================
// FSM
//==============================================  
always_ff @(posedge clk) begin
    case (state)
        IDLE:
        begin
            state <= (cpu_to_l1__valid & cpu_to_l1__ready) ? READ_WRITE : IDLE;
        end
        READ_WRITE:
        begin
            if (hit) state <= (cpu_to_l1__valid & cpu_to_l1__ready) ? READ_WRITE : IDLE;
            else state <= sram__rd_data[L1_CACHE__SRAM__DIRTY__FIELD] ? WRITE_BACK : ALLOCATE_REQ;
        end
        WRITE_BACK:
        begin
            state <= (l1_to_mem__valid & l1_to_mem__ready) ? ALLOCATE_REQ : WRITE_BACK;
        end
        ALLOCATE_REQ:
        begin
            state <= (l1_to_mem__valid & l1_to_mem__ready) ? ALLOCATE_WRITE : ALLOCATE_REQ;
        end
        ALLOCATE_WRITE:
        begin
            state <= (mem_to_l1__valid & mem_to_l1__ready) ? READ_WRITE : ALLOCATE_WRITE;
        end
    endcase
end

always_comb begin
    cpu_to_l1__ready = 1'b0;
    l1_to_cpu__valid = 1'b0;
    l1_to_mem__valid = 1'b0;
    l1_to_mem__rw = 1'b0;
    mem_to_l1__ready = 1'b0;
    sram__rw = 1'b0;
    sram__wr_data = sram__rd_data;

    case (state)
        IDLE:
        begin
            cpu_to_l1__ready = ~rst;
        end
        READ_WRITE:
        begin
            cpu_to_l1__ready = hit & l1_to_cpu__ready;
            l1_to_cpu__valid = hit;
            sram__rw = hit & rw;
            case (size)
                SIZE__DOUBLE:
                    case (addr[5:3])
                        PYTHON(for i in range(8): print(f"3'h{i:x}: sram__wr_data[{i*64 + 63}:{i*64}] = wr_data;"))
                    endcase
                SIZE__WORD:
                    case (addr[5:2])
                        PYTHON(for i in range(16): print(f"4'h{i:x}: sram__wr_data[{i*32 + 31}:{i*32}] = wr_data;"))
                    endcase
                SIZE__HALF: 
                    case (addr[5:1])
                        PYTHON(for i in range(32): print(f"5'h{i:x}: sram__wr_data[{i*16 + 15}:{i*16}] = wr_data;"))
                    endcase
                SIZE__BYTE: 
                    case (addr[5:0])
                        PYTHON(for i in range(64): print(f"6'h{i:x}: sram__wr_data[{i*8+ 7}:{i*8}] = wr_data;"))
                    endcase
            endcase
        end
        WRITE_BACK:
        begin
            l1_to_mem__valid = 1'b1;
            l1_to_mem__rw = 1'b1;
        end
        ALLOCATE_REQ: 
        begin
            l1_to_mem__valid = 1'b1;
        end
        ALLOCATE_WRITE:
        begin
            mem_to_l1__ready;
            sram__rw = (mem_to_l1__valid & mem_to_l1__ready);
            sram__wr_data[L1_CACHE__SRAM__VALID__FIELD] = 1'b1;
            sram__wr_data[L1_CACHE__SRAM__DIRTY__FIELD] = 1'b0;
            sram__wr_data[L1_CACHE__SRAM__TAG__FIELD] = addr[L1_CACHE__TAG__FIELD];
            sram__wr_data[L1_CACHE__SRAM__DATA__FIELD] = mem_to_l1__data;
        end
    endcase
end

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
