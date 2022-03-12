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

parameter IDLE = 2'h0;
parameter READ_WRITE = 2'h1;
parameter WRITE_BACK = 2'h2;
parameter ALLOCATE = 2'h3;

logic [1:0] state;

logic [63:0] addr;
logic rw;
logic [63:0] wr_data;
logic [63:0] rd_data;
logic [1:0] size;
logic hit;

logic [5:0] sram__addr;
logic sram__rw;
logic [565:0] sram__wr_data;
logic [565:0] sram__rd_data;


assign hit = sram__rd_data[565] & (sram__rd_data[563:512] == addr[63:12]);
assign sram__addr = addr[11:6];
assign l1_to_mem__data = sram__rd_data[511:0];
assign l1_to_mem__addr = {sram__rd_data[563:512], addr[11:6], 6'h0};
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
        2'h0:
            case (addr[5:3])
                3'h0: rd_data = sram__rd_data[63:0];
                3'h1: rd_data = sram__rd_data[127:64];
                3'h2: rd_data = sram__rd_data[191:128];
                3'h3: rd_data = sram__rd_data[255:192];
                3'h4: rd_data = sram__rd_data[319:256];
                3'h5: rd_data = sram__rd_data[383:320];
                3'h6: rd_data = sram__rd_data[447:384];
                3'h7: rd_data = sram__rd_data[511:448];
            endcase
        2'h1:
            case (addr[5:2])
                4'h0: rd_data[31:0] = sram__rd_data[31:0];
                4'h1: rd_data[31:0] = sram__rd_data[63:32];
                4'h2: rd_data[31:0] = sram__rd_data[95:64];
                4'h3: rd_data[31:0] = sram__rd_data[127:96];
                4'h4: rd_data[31:0] = sram__rd_data[159:128];
                4'h5: rd_data[31:0] = sram__rd_data[191:160];
                4'h6: rd_data[31:0] = sram__rd_data[223:192];
                4'h7: rd_data[31:0] = sram__rd_data[255:224];
                4'h8: rd_data[31:0] = sram__rd_data[287:256];
                4'h9: rd_data[31:0] = sram__rd_data[319:288];
                4'ha: rd_data[31:0] = sram__rd_data[351:320];
                4'hb: rd_data[31:0] = sram__rd_data[383:352];
                4'hc: rd_data[31:0] = sram__rd_data[415:384];
                4'hd: rd_data[31:0] = sram__rd_data[447:416];
                4'he: rd_data[31:0] = sram__rd_data[479:448];
                4'hf: rd_data[31:0] = sram__rd_data[511:480];
            endcase
        2'h2: 
            case (addr[5:1])
                5'h0: rd_data[16:0] = sram__rd_data[15:0];
                5'h1: rd_data[16:0] = sram__rd_data[31:16];
                5'h2: rd_data[16:0] = sram__rd_data[47:32];
                5'h3: rd_data[16:0] = sram__rd_data[63:48];
                5'h4: rd_data[16:0] = sram__rd_data[79:64];
                5'h5: rd_data[16:0] = sram__rd_data[95:80];
                5'h6: rd_data[16:0] = sram__rd_data[111:96];
                5'h7: rd_data[16:0] = sram__rd_data[127:112];
                5'h8: rd_data[16:0] = sram__rd_data[143:128];
                5'h9: rd_data[16:0] = sram__rd_data[159:144];
                5'ha: rd_data[16:0] = sram__rd_data[175:160];
                5'hb: rd_data[16:0] = sram__rd_data[191:176];
                5'hc: rd_data[16:0] = sram__rd_data[207:192];
                5'hd: rd_data[16:0] = sram__rd_data[223:208];
                5'he: rd_data[16:0] = sram__rd_data[239:224];
                5'hf: rd_data[16:0] = sram__rd_data[255:240];
                5'h10: rd_data[16:0] = sram__rd_data[271:256];
                5'h11: rd_data[16:0] = sram__rd_data[287:272];
                5'h12: rd_data[16:0] = sram__rd_data[303:288];
                5'h13: rd_data[16:0] = sram__rd_data[319:304];
                5'h14: rd_data[16:0] = sram__rd_data[335:320];
                5'h15: rd_data[16:0] = sram__rd_data[351:336];
                5'h16: rd_data[16:0] = sram__rd_data[367:352];
                5'h17: rd_data[16:0] = sram__rd_data[383:368];
                5'h18: rd_data[16:0] = sram__rd_data[399:384];
                5'h19: rd_data[16:0] = sram__rd_data[415:400];
                5'h1a: rd_data[16:0] = sram__rd_data[431:416];
                5'h1b: rd_data[16:0] = sram__rd_data[447:432];
                5'h1c: rd_data[16:0] = sram__rd_data[463:448];
                5'h1d: rd_data[16:0] = sram__rd_data[479:464];
                5'h1e: rd_data[16:0] = sram__rd_data[495:480];
                5'h1f: rd_data[16:0] = sram__rd_data[511:496];
            endcase
        2'h3: 
            case (addr[5:0])
                6'h0: rd_data[8:0] = sram__rd_data[7:0];
                6'h1: rd_data[8:0] = sram__rd_data[15:8];
                6'h2: rd_data[8:0] = sram__rd_data[23:16];
                6'h3: rd_data[8:0] = sram__rd_data[31:24];
                6'h4: rd_data[8:0] = sram__rd_data[39:32];
                6'h5: rd_data[8:0] = sram__rd_data[47:40];
                6'h6: rd_data[8:0] = sram__rd_data[55:48];
                6'h7: rd_data[8:0] = sram__rd_data[63:56];
                6'h8: rd_data[8:0] = sram__rd_data[71:64];
                6'h9: rd_data[8:0] = sram__rd_data[79:72];
                6'ha: rd_data[8:0] = sram__rd_data[87:80];
                6'hb: rd_data[8:0] = sram__rd_data[95:88];
                6'hc: rd_data[8:0] = sram__rd_data[103:96];
                6'hd: rd_data[8:0] = sram__rd_data[111:104];
                6'he: rd_data[8:0] = sram__rd_data[119:112];
                6'hf: rd_data[8:0] = sram__rd_data[127:120];
                6'h10: rd_data[8:0] = sram__rd_data[135:128];
                6'h11: rd_data[8:0] = sram__rd_data[143:136];
                6'h12: rd_data[8:0] = sram__rd_data[151:144];
                6'h13: rd_data[8:0] = sram__rd_data[159:152];
                6'h14: rd_data[8:0] = sram__rd_data[167:160];
                6'h15: rd_data[8:0] = sram__rd_data[175:168];
                6'h16: rd_data[8:0] = sram__rd_data[183:176];
                6'h17: rd_data[8:0] = sram__rd_data[191:184];
                6'h18: rd_data[8:0] = sram__rd_data[199:192];
                6'h19: rd_data[8:0] = sram__rd_data[207:200];
                6'h1a: rd_data[8:0] = sram__rd_data[215:208];
                6'h1b: rd_data[8:0] = sram__rd_data[223:216];
                6'h1c: rd_data[8:0] = sram__rd_data[231:224];
                6'h1d: rd_data[8:0] = sram__rd_data[239:232];
                6'h1e: rd_data[8:0] = sram__rd_data[247:240];
                6'h1f: rd_data[8:0] = sram__rd_data[255:248];
                6'h20: rd_data[8:0] = sram__rd_data[263:256];
                6'h21: rd_data[8:0] = sram__rd_data[271:264];
                6'h22: rd_data[8:0] = sram__rd_data[279:272];
                6'h23: rd_data[8:0] = sram__rd_data[287:280];
                6'h24: rd_data[8:0] = sram__rd_data[295:288];
                6'h25: rd_data[8:0] = sram__rd_data[303:296];
                6'h26: rd_data[8:0] = sram__rd_data[311:304];
                6'h27: rd_data[8:0] = sram__rd_data[319:312];
                6'h28: rd_data[8:0] = sram__rd_data[327:320];
                6'h29: rd_data[8:0] = sram__rd_data[335:328];
                6'h2a: rd_data[8:0] = sram__rd_data[343:336];
                6'h2b: rd_data[8:0] = sram__rd_data[351:344];
                6'h2c: rd_data[8:0] = sram__rd_data[359:352];
                6'h2d: rd_data[8:0] = sram__rd_data[367:360];
                6'h2e: rd_data[8:0] = sram__rd_data[375:368];
                6'h2f: rd_data[8:0] = sram__rd_data[383:376];
                6'h30: rd_data[8:0] = sram__rd_data[391:384];
                6'h31: rd_data[8:0] = sram__rd_data[399:392];
                6'h32: rd_data[8:0] = sram__rd_data[407:400];
                6'h33: rd_data[8:0] = sram__rd_data[415:408];
                6'h34: rd_data[8:0] = sram__rd_data[423:416];
                6'h35: rd_data[8:0] = sram__rd_data[431:424];
                6'h36: rd_data[8:0] = sram__rd_data[439:432];
                6'h37: rd_data[8:0] = sram__rd_data[447:440];
                6'h38: rd_data[8:0] = sram__rd_data[455:448];
                6'h39: rd_data[8:0] = sram__rd_data[463:456];
                6'h3a: rd_data[8:0] = sram__rd_data[471:464];
                6'h3b: rd_data[8:0] = sram__rd_data[479:472];
                6'h3c: rd_data[8:0] = sram__rd_data[487:480];
                6'h3d: rd_data[8:0] = sram__rd_data[495:488];
                6'h3e: rd_data[8:0] = sram__rd_data[503:496];
                6'h3f: rd_data[8:0] = sram__rd_data[511:504];
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
            else state <= sram__rd_data[564] ? WRITE_BACK : ALLOCATE;
        end
        WRITE_BACK:
        begin
            state <= (l1_to_mem__valid & l1_to_mem__ready) ? ALLOCATE : WRITE_BACK;
        end
        ALLOCATE:
        begin
            state <= (mem_to_l1__valid & mem_to_l1__ready) ? READ_WRITE : ALLOCATE;
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
                2'h0:
                    case (addr[5:3])
                        3'h0: sram__wr_data[63:0] = wr_data;
                        3'h1: sram__wr_data[127:64] = wr_data;
                        3'h2: sram__wr_data[191:128] = wr_data;
                        3'h3: sram__wr_data[255:192] = wr_data;
                        3'h4: sram__wr_data[319:256] = wr_data;
                        3'h5: sram__wr_data[383:320] = wr_data;
                        3'h6: sram__wr_data[447:384] = wr_data;
                        3'h7: sram__wr_data[511:448] = wr_data;
                    endcase
                2'h1:
                    case (addr[5:2])
                        4'h0: sram__wr_data[31:0] = wr_data;
                        4'h1: sram__wr_data[63:32] = wr_data;
                        4'h2: sram__wr_data[95:64] = wr_data;
                        4'h3: sram__wr_data[127:96] = wr_data;
                        4'h4: sram__wr_data[159:128] = wr_data;
                        4'h5: sram__wr_data[191:160] = wr_data;
                        4'h6: sram__wr_data[223:192] = wr_data;
                        4'h7: sram__wr_data[255:224] = wr_data;
                        4'h8: sram__wr_data[287:256] = wr_data;
                        4'h9: sram__wr_data[319:288] = wr_data;
                        4'ha: sram__wr_data[351:320] = wr_data;
                        4'hb: sram__wr_data[383:352] = wr_data;
                        4'hc: sram__wr_data[415:384] = wr_data;
                        4'hd: sram__wr_data[447:416] = wr_data;
                        4'he: sram__wr_data[479:448] = wr_data;
                        4'hf: sram__wr_data[511:480] = wr_data;
                    endcase
                2'h2: 
                    case (addr[5:1])
                        5'h0: sram__wr_data[15:0] = wr_data;
                        5'h1: sram__wr_data[31:16] = wr_data;
                        5'h2: sram__wr_data[47:32] = wr_data;
                        5'h3: sram__wr_data[63:48] = wr_data;
                        5'h4: sram__wr_data[79:64] = wr_data;
                        5'h5: sram__wr_data[95:80] = wr_data;
                        5'h6: sram__wr_data[111:96] = wr_data;
                        5'h7: sram__wr_data[127:112] = wr_data;
                        5'h8: sram__wr_data[143:128] = wr_data;
                        5'h9: sram__wr_data[159:144] = wr_data;
                        5'ha: sram__wr_data[175:160] = wr_data;
                        5'hb: sram__wr_data[191:176] = wr_data;
                        5'hc: sram__wr_data[207:192] = wr_data;
                        5'hd: sram__wr_data[223:208] = wr_data;
                        5'he: sram__wr_data[239:224] = wr_data;
                        5'hf: sram__wr_data[255:240] = wr_data;
                        5'h10: sram__wr_data[271:256] = wr_data;
                        5'h11: sram__wr_data[287:272] = wr_data;
                        5'h12: sram__wr_data[303:288] = wr_data;
                        5'h13: sram__wr_data[319:304] = wr_data;
                        5'h14: sram__wr_data[335:320] = wr_data;
                        5'h15: sram__wr_data[351:336] = wr_data;
                        5'h16: sram__wr_data[367:352] = wr_data;
                        5'h17: sram__wr_data[383:368] = wr_data;
                        5'h18: sram__wr_data[399:384] = wr_data;
                        5'h19: sram__wr_data[415:400] = wr_data;
                        5'h1a: sram__wr_data[431:416] = wr_data;
                        5'h1b: sram__wr_data[447:432] = wr_data;
                        5'h1c: sram__wr_data[463:448] = wr_data;
                        5'h1d: sram__wr_data[479:464] = wr_data;
                        5'h1e: sram__wr_data[495:480] = wr_data;
                        5'h1f: sram__wr_data[511:496] = wr_data;
                    endcase
                2'h3: 
                    case (addr[5:0])
                        6'h0: sram__wr_data[7:0] = wr_data;
                        6'h1: sram__wr_data[15:8] = wr_data;
                        6'h2: sram__wr_data[23:16] = wr_data;
                        6'h3: sram__wr_data[31:24] = wr_data;
                        6'h4: sram__wr_data[39:32] = wr_data;
                        6'h5: sram__wr_data[47:40] = wr_data;
                        6'h6: sram__wr_data[55:48] = wr_data;
                        6'h7: sram__wr_data[63:56] = wr_data;
                        6'h8: sram__wr_data[71:64] = wr_data;
                        6'h9: sram__wr_data[79:72] = wr_data;
                        6'ha: sram__wr_data[87:80] = wr_data;
                        6'hb: sram__wr_data[95:88] = wr_data;
                        6'hc: sram__wr_data[103:96] = wr_data;
                        6'hd: sram__wr_data[111:104] = wr_data;
                        6'he: sram__wr_data[119:112] = wr_data;
                        6'hf: sram__wr_data[127:120] = wr_data;
                        6'h10: sram__wr_data[135:128] = wr_data;
                        6'h11: sram__wr_data[143:136] = wr_data;
                        6'h12: sram__wr_data[151:144] = wr_data;
                        6'h13: sram__wr_data[159:152] = wr_data;
                        6'h14: sram__wr_data[167:160] = wr_data;
                        6'h15: sram__wr_data[175:168] = wr_data;
                        6'h16: sram__wr_data[183:176] = wr_data;
                        6'h17: sram__wr_data[191:184] = wr_data;
                        6'h18: sram__wr_data[199:192] = wr_data;
                        6'h19: sram__wr_data[207:200] = wr_data;
                        6'h1a: sram__wr_data[215:208] = wr_data;
                        6'h1b: sram__wr_data[223:216] = wr_data;
                        6'h1c: sram__wr_data[231:224] = wr_data;
                        6'h1d: sram__wr_data[239:232] = wr_data;
                        6'h1e: sram__wr_data[247:240] = wr_data;
                        6'h1f: sram__wr_data[255:248] = wr_data;
                        6'h20: sram__wr_data[263:256] = wr_data;
                        6'h21: sram__wr_data[271:264] = wr_data;
                        6'h22: sram__wr_data[279:272] = wr_data;
                        6'h23: sram__wr_data[287:280] = wr_data;
                        6'h24: sram__wr_data[295:288] = wr_data;
                        6'h25: sram__wr_data[303:296] = wr_data;
                        6'h26: sram__wr_data[311:304] = wr_data;
                        6'h27: sram__wr_data[319:312] = wr_data;
                        6'h28: sram__wr_data[327:320] = wr_data;
                        6'h29: sram__wr_data[335:328] = wr_data;
                        6'h2a: sram__wr_data[343:336] = wr_data;
                        6'h2b: sram__wr_data[351:344] = wr_data;
                        6'h2c: sram__wr_data[359:352] = wr_data;
                        6'h2d: sram__wr_data[367:360] = wr_data;
                        6'h2e: sram__wr_data[375:368] = wr_data;
                        6'h2f: sram__wr_data[383:376] = wr_data;
                        6'h30: sram__wr_data[391:384] = wr_data;
                        6'h31: sram__wr_data[399:392] = wr_data;
                        6'h32: sram__wr_data[407:400] = wr_data;
                        6'h33: sram__wr_data[415:408] = wr_data;
                        6'h34: sram__wr_data[423:416] = wr_data;
                        6'h35: sram__wr_data[431:424] = wr_data;
                        6'h36: sram__wr_data[439:432] = wr_data;
                        6'h37: sram__wr_data[447:440] = wr_data;
                        6'h38: sram__wr_data[455:448] = wr_data;
                        6'h39: sram__wr_data[463:456] = wr_data;
                        6'h3a: sram__wr_data[471:464] = wr_data;
                        6'h3b: sram__wr_data[479:472] = wr_data;
                        6'h3c: sram__wr_data[487:480] = wr_data;
                        6'h3d: sram__wr_data[495:488] = wr_data;
                        6'h3e: sram__wr_data[503:496] = wr_data;
                        6'h3f: sram__wr_data[511:504] = wr_data;
                    endcase
            endcase
        end
        WRITE_BACK:
        begin
            l1_to_mem__valid = 1'b1;
            l1_to_mem__rw = 1'b1;
        end
        ALLOCATE: 
        begin
            l1_to_mem__valid = 1'b1;
            sram__rw = (mem_to_l1__valid & mem_to_l1__ready);
            sram__wr_data[565] = 1'b1;
            sram__wr_data[564] = 1'b0;
            sram__wr_data[563:512] = addr[63:12];
            sram__wr_data[511:0] = mem_to_l1__data;
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
