//==============================================
// level_1_cache
//==============================================
module l0
(
    input clk,
    input rst,


    input cpu_req__valid,
    output logic cpu_req__ready,
    input cpu_req__rw,
    input [63:0] cpu_req__addr,
    input [63:0] cpu_req__data,

    output logic cpu_rtn__valid,
    input cpu_rtn__ready,
    output logic [63:0] cpu_rtn__data,

    output logic cache__index,
    output logic cache__rw,
    output logic cache__wr_data,
    input logic cache__rd_data,

    output logic mem_req__valid,
    input mem_req__ready,
    output logic mem_req__rw,
    output logic [63:0] mem_req__addr,
    output logic [63:0] mem_req__data,

    input mem_rtn__valid,
    output logic mem_rtn__ready,
    input [63:0] mem_rtn__data,

    output logic [] tag,
    output logic [] index,
    output logic [] offset,
    output logic wr_tag,
    output logic wr_valid
    output logic wr_dirty
    input [32:0] rd_tag,
    input rd_valid,
    input rd_dirty,
    output logic we,
    input [63:0] rd_data,
    output logic [63:0] wr_data
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
            3'h0: cache__wr_data[63:0] = wr_data;
            3'h1: cache__wr_data[127:64] = wr_data;
            3'h2: cache__wr_data[191:128] = wr_data;
            3'h3: cache__wr_data[255:192] = wr_data;
            3'h4: cache__wr_data[319:256] = wr_data;
            3'h5: cache__wr_data[383:320] = wr_data;
            3'h6: cache__wr_data[447:384] = wr_data;
            3'h7: cache__wr_data[511:448] = wr_data;
        endcase
    WORD:
        case (offset[5:2])
            4'h0: cache__wr_data[31:0] = wr_data;
            4'h1: cache__wr_data[63:32] = wr_data;
            4'h2: cache__wr_data[95:64] = wr_data;
            4'h3: cache__wr_data[127:96] = wr_data;
            4'h4: cache__wr_data[159:128] = wr_data;
            4'h5: cache__wr_data[191:160] = wr_data;
            4'h6: cache__wr_data[223:192] = wr_data;
            4'h7: cache__wr_data[255:224] = wr_data;
            4'h8: cache__wr_data[287:256] = wr_data;
            4'h9: cache__wr_data[319:288] = wr_data;
            4'ha: cache__wr_data[351:320] = wr_data;
            4'hb: cache__wr_data[383:352] = wr_data;
            4'hc: cache__wr_data[415:384] = wr_data;
            4'hd: cache__wr_data[447:416] = wr_data;
            4'he: cache__wr_data[479:448] = wr_data;
            4'hf: cache__wr_data[511:480] = wr_data;
        endcase
    HALF: 
        case (offset[5:1])
            5'h0: cache__wr_data[15:0] = wr_data;
            5'h1: cache__wr_data[31:16] = wr_data;
            5'h2: cache__wr_data[47:32] = wr_data;
            5'h3: cache__wr_data[63:48] = wr_data;
            5'h4: cache__wr_data[79:64] = wr_data;
            5'h5: cache__wr_data[95:80] = wr_data;
            5'h6: cache__wr_data[111:96] = wr_data;
            5'h7: cache__wr_data[127:112] = wr_data;
            5'h8: cache__wr_data[143:128] = wr_data;
            5'h9: cache__wr_data[159:144] = wr_data;
            5'ha: cache__wr_data[175:160] = wr_data;
            5'hb: cache__wr_data[191:176] = wr_data;
            5'hc: cache__wr_data[207:192] = wr_data;
            5'hd: cache__wr_data[223:208] = wr_data;
            5'he: cache__wr_data[239:224] = wr_data;
            5'hf: cache__wr_data[255:240] = wr_data;
            5'h10: cache__wr_data[271:256] = wr_data;
            5'h11: cache__wr_data[287:272] = wr_data;
            5'h12: cache__wr_data[303:288] = wr_data;
            5'h13: cache__wr_data[319:304] = wr_data;
            5'h14: cache__wr_data[335:320] = wr_data;
            5'h15: cache__wr_data[351:336] = wr_data;
            5'h16: cache__wr_data[367:352] = wr_data;
            5'h17: cache__wr_data[383:368] = wr_data;
            5'h18: cache__wr_data[399:384] = wr_data;
            5'h19: cache__wr_data[415:400] = wr_data;
            5'h1a: cache__wr_data[431:416] = wr_data;
            5'h1b: cache__wr_data[447:432] = wr_data;
            5'h1c: cache__wr_data[463:448] = wr_data;
            5'h1d: cache__wr_data[479:464] = wr_data;
            5'h1e: cache__wr_data[495:480] = wr_data;
            5'h1f: cache__wr_data[511:496] = wr_data;
        endcase
    BYTE: 
        case (offset[5:0])
            6'h0: cache__wr_data[7:0] = wr_data;
            6'h1: cache__wr_data[15:8] = wr_data;
            6'h2: cache__wr_data[23:16] = wr_data;
            6'h3: cache__wr_data[31:24] = wr_data;
            6'h4: cache__wr_data[39:32] = wr_data;
            6'h5: cache__wr_data[47:40] = wr_data;
            6'h6: cache__wr_data[55:48] = wr_data;
            6'h7: cache__wr_data[63:56] = wr_data;
            6'h8: cache__wr_data[71:64] = wr_data;
            6'h9: cache__wr_data[79:72] = wr_data;
            6'ha: cache__wr_data[87:80] = wr_data;
            6'hb: cache__wr_data[95:88] = wr_data;
            6'hc: cache__wr_data[103:96] = wr_data;
            6'hd: cache__wr_data[111:104] = wr_data;
            6'he: cache__wr_data[119:112] = wr_data;
            6'hf: cache__wr_data[127:120] = wr_data;
            6'h10: cache__wr_data[135:128] = wr_data;
            6'h11: cache__wr_data[143:136] = wr_data;
            6'h12: cache__wr_data[151:144] = wr_data;
            6'h13: cache__wr_data[159:152] = wr_data;
            6'h14: cache__wr_data[167:160] = wr_data;
            6'h15: cache__wr_data[175:168] = wr_data;
            6'h16: cache__wr_data[183:176] = wr_data;
            6'h17: cache__wr_data[191:184] = wr_data;
            6'h18: cache__wr_data[199:192] = wr_data;
            6'h19: cache__wr_data[207:200] = wr_data;
            6'h1a: cache__wr_data[215:208] = wr_data;
            6'h1b: cache__wr_data[223:216] = wr_data;
            6'h1c: cache__wr_data[231:224] = wr_data;
            6'h1d: cache__wr_data[239:232] = wr_data;
            6'h1e: cache__wr_data[247:240] = wr_data;
            6'h1f: cache__wr_data[255:248] = wr_data;
            6'h20: cache__wr_data[263:256] = wr_data;
            6'h21: cache__wr_data[271:264] = wr_data;
            6'h22: cache__wr_data[279:272] = wr_data;
            6'h23: cache__wr_data[287:280] = wr_data;
            6'h24: cache__wr_data[295:288] = wr_data;
            6'h25: cache__wr_data[303:296] = wr_data;
            6'h26: cache__wr_data[311:304] = wr_data;
            6'h27: cache__wr_data[319:312] = wr_data;
            6'h28: cache__wr_data[327:320] = wr_data;
            6'h29: cache__wr_data[335:328] = wr_data;
            6'h2a: cache__wr_data[343:336] = wr_data;
            6'h2b: cache__wr_data[351:344] = wr_data;
            6'h2c: cache__wr_data[359:352] = wr_data;
            6'h2d: cache__wr_data[367:360] = wr_data;
            6'h2e: cache__wr_data[375:368] = wr_data;
            6'h2f: cache__wr_data[383:376] = wr_data;
            6'h30: cache__wr_data[391:384] = wr_data;
            6'h31: cache__wr_data[399:392] = wr_data;
            6'h32: cache__wr_data[407:400] = wr_data;
            6'h33: cache__wr_data[415:408] = wr_data;
            6'h34: cache__wr_data[423:416] = wr_data;
            6'h35: cache__wr_data[431:424] = wr_data;
            6'h36: cache__wr_data[439:432] = wr_data;
            6'h37: cache__wr_data[447:440] = wr_data;
            6'h38: cache__wr_data[455:448] = wr_data;
            6'h39: cache__wr_data[463:456] = wr_data;
            6'h3a: cache__wr_data[471:464] = wr_data;
            6'h3b: cache__wr_data[479:472] = wr_data;
            6'h3c: cache__wr_data[487:480] = wr_data;
            6'h3d: cache__wr_data[495:488] = wr_data;
            6'h3e: cache__wr_data[503:496] = wr_data;
            6'h3f: cache__wr_data[511:504] = wr_data;
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
    case (state)
        READ_WRITE: 
        begin
            case (offset)
                cache__wr_data = {1'b1, 1'b1, tag, *cache__data + wr_data*}
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