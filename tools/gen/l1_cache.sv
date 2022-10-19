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

assign valid = sram__rd_data[565];
assign hit = valid & (sram__rd_data[563:512] == S0__addr[63:12]);
assign dirty = sram__rd_data[564];
assign sram__addr = S0__addr[11:6];


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

assign S0__tag = S0__addr[63:12];
assign S0__index = S0__addr[11:6];
assign S0__offset = S0__addr[5:0];

assign cpu_to_l1__ready = S0__ready;

always_comb begin
    S0__rd_data = 64'h0;
    case (S0__size)
        2'h0:
            case (S0__addr[5:3])
                3'h0: S0__rd_data = sram__rd_data[63:0];
                3'h1: S0__rd_data = sram__rd_data[127:64];
                3'h2: S0__rd_data = sram__rd_data[191:128];
                3'h3: S0__rd_data = sram__rd_data[255:192];
                3'h4: S0__rd_data = sram__rd_data[319:256];
                3'h5: S0__rd_data = sram__rd_data[383:320];
                3'h6: S0__rd_data = sram__rd_data[447:384];
                3'h7: S0__rd_data = sram__rd_data[511:448];
            endcase
        2'h1:
            case (S0__addr[5:2])
                4'h0: S0__rd_data[31:0] = sram__rd_data[31:0];
                4'h1: S0__rd_data[31:0] = sram__rd_data[63:32];
                4'h2: S0__rd_data[31:0] = sram__rd_data[95:64];
                4'h3: S0__rd_data[31:0] = sram__rd_data[127:96];
                4'h4: S0__rd_data[31:0] = sram__rd_data[159:128];
                4'h5: S0__rd_data[31:0] = sram__rd_data[191:160];
                4'h6: S0__rd_data[31:0] = sram__rd_data[223:192];
                4'h7: S0__rd_data[31:0] = sram__rd_data[255:224];
                4'h8: S0__rd_data[31:0] = sram__rd_data[287:256];
                4'h9: S0__rd_data[31:0] = sram__rd_data[319:288];
                4'ha: S0__rd_data[31:0] = sram__rd_data[351:320];
                4'hb: S0__rd_data[31:0] = sram__rd_data[383:352];
                4'hc: S0__rd_data[31:0] = sram__rd_data[415:384];
                4'hd: S0__rd_data[31:0] = sram__rd_data[447:416];
                4'he: S0__rd_data[31:0] = sram__rd_data[479:448];
                4'hf: S0__rd_data[31:0] = sram__rd_data[511:480];
            endcase
        2'h2: 
            case (S0__addr[5:1])
                5'h0: S0__rd_data[16:0] = sram__rd_data[15:0];
                5'h1: S0__rd_data[16:0] = sram__rd_data[31:16];
                5'h2: S0__rd_data[16:0] = sram__rd_data[47:32];
                5'h3: S0__rd_data[16:0] = sram__rd_data[63:48];
                5'h4: S0__rd_data[16:0] = sram__rd_data[79:64];
                5'h5: S0__rd_data[16:0] = sram__rd_data[95:80];
                5'h6: S0__rd_data[16:0] = sram__rd_data[111:96];
                5'h7: S0__rd_data[16:0] = sram__rd_data[127:112];
                5'h8: S0__rd_data[16:0] = sram__rd_data[143:128];
                5'h9: S0__rd_data[16:0] = sram__rd_data[159:144];
                5'ha: S0__rd_data[16:0] = sram__rd_data[175:160];
                5'hb: S0__rd_data[16:0] = sram__rd_data[191:176];
                5'hc: S0__rd_data[16:0] = sram__rd_data[207:192];
                5'hd: S0__rd_data[16:0] = sram__rd_data[223:208];
                5'he: S0__rd_data[16:0] = sram__rd_data[239:224];
                5'hf: S0__rd_data[16:0] = sram__rd_data[255:240];
                5'h10: S0__rd_data[16:0] = sram__rd_data[271:256];
                5'h11: S0__rd_data[16:0] = sram__rd_data[287:272];
                5'h12: S0__rd_data[16:0] = sram__rd_data[303:288];
                5'h13: S0__rd_data[16:0] = sram__rd_data[319:304];
                5'h14: S0__rd_data[16:0] = sram__rd_data[335:320];
                5'h15: S0__rd_data[16:0] = sram__rd_data[351:336];
                5'h16: S0__rd_data[16:0] = sram__rd_data[367:352];
                5'h17: S0__rd_data[16:0] = sram__rd_data[383:368];
                5'h18: S0__rd_data[16:0] = sram__rd_data[399:384];
                5'h19: S0__rd_data[16:0] = sram__rd_data[415:400];
                5'h1a: S0__rd_data[16:0] = sram__rd_data[431:416];
                5'h1b: S0__rd_data[16:0] = sram__rd_data[447:432];
                5'h1c: S0__rd_data[16:0] = sram__rd_data[463:448];
                5'h1d: S0__rd_data[16:0] = sram__rd_data[479:464];
                5'h1e: S0__rd_data[16:0] = sram__rd_data[495:480];
                5'h1f: S0__rd_data[16:0] = sram__rd_data[511:496];
            endcase
        2'h3: 
            case (S0__addr[5:0])
                6'h0: S0__rd_data[8:0] = sram__rd_data[7:0];
                6'h1: S0__rd_data[8:0] = sram__rd_data[15:8];
                6'h2: S0__rd_data[8:0] = sram__rd_data[23:16];
                6'h3: S0__rd_data[8:0] = sram__rd_data[31:24];
                6'h4: S0__rd_data[8:0] = sram__rd_data[39:32];
                6'h5: S0__rd_data[8:0] = sram__rd_data[47:40];
                6'h6: S0__rd_data[8:0] = sram__rd_data[55:48];
                6'h7: S0__rd_data[8:0] = sram__rd_data[63:56];
                6'h8: S0__rd_data[8:0] = sram__rd_data[71:64];
                6'h9: S0__rd_data[8:0] = sram__rd_data[79:72];
                6'ha: S0__rd_data[8:0] = sram__rd_data[87:80];
                6'hb: S0__rd_data[8:0] = sram__rd_data[95:88];
                6'hc: S0__rd_data[8:0] = sram__rd_data[103:96];
                6'hd: S0__rd_data[8:0] = sram__rd_data[111:104];
                6'he: S0__rd_data[8:0] = sram__rd_data[119:112];
                6'hf: S0__rd_data[8:0] = sram__rd_data[127:120];
                6'h10: S0__rd_data[8:0] = sram__rd_data[135:128];
                6'h11: S0__rd_data[8:0] = sram__rd_data[143:136];
                6'h12: S0__rd_data[8:0] = sram__rd_data[151:144];
                6'h13: S0__rd_data[8:0] = sram__rd_data[159:152];
                6'h14: S0__rd_data[8:0] = sram__rd_data[167:160];
                6'h15: S0__rd_data[8:0] = sram__rd_data[175:168];
                6'h16: S0__rd_data[8:0] = sram__rd_data[183:176];
                6'h17: S0__rd_data[8:0] = sram__rd_data[191:184];
                6'h18: S0__rd_data[8:0] = sram__rd_data[199:192];
                6'h19: S0__rd_data[8:0] = sram__rd_data[207:200];
                6'h1a: S0__rd_data[8:0] = sram__rd_data[215:208];
                6'h1b: S0__rd_data[8:0] = sram__rd_data[223:216];
                6'h1c: S0__rd_data[8:0] = sram__rd_data[231:224];
                6'h1d: S0__rd_data[8:0] = sram__rd_data[239:232];
                6'h1e: S0__rd_data[8:0] = sram__rd_data[247:240];
                6'h1f: S0__rd_data[8:0] = sram__rd_data[255:248];
                6'h20: S0__rd_data[8:0] = sram__rd_data[263:256];
                6'h21: S0__rd_data[8:0] = sram__rd_data[271:264];
                6'h22: S0__rd_data[8:0] = sram__rd_data[279:272];
                6'h23: S0__rd_data[8:0] = sram__rd_data[287:280];
                6'h24: S0__rd_data[8:0] = sram__rd_data[295:288];
                6'h25: S0__rd_data[8:0] = sram__rd_data[303:296];
                6'h26: S0__rd_data[8:0] = sram__rd_data[311:304];
                6'h27: S0__rd_data[8:0] = sram__rd_data[319:312];
                6'h28: S0__rd_data[8:0] = sram__rd_data[327:320];
                6'h29: S0__rd_data[8:0] = sram__rd_data[335:328];
                6'h2a: S0__rd_data[8:0] = sram__rd_data[343:336];
                6'h2b: S0__rd_data[8:0] = sram__rd_data[351:344];
                6'h2c: S0__rd_data[8:0] = sram__rd_data[359:352];
                6'h2d: S0__rd_data[8:0] = sram__rd_data[367:360];
                6'h2e: S0__rd_data[8:0] = sram__rd_data[375:368];
                6'h2f: S0__rd_data[8:0] = sram__rd_data[383:376];
                6'h30: S0__rd_data[8:0] = sram__rd_data[391:384];
                6'h31: S0__rd_data[8:0] = sram__rd_data[399:392];
                6'h32: S0__rd_data[8:0] = sram__rd_data[407:400];
                6'h33: S0__rd_data[8:0] = sram__rd_data[415:408];
                6'h34: S0__rd_data[8:0] = sram__rd_data[423:416];
                6'h35: S0__rd_data[8:0] = sram__rd_data[431:424];
                6'h36: S0__rd_data[8:0] = sram__rd_data[439:432];
                6'h37: S0__rd_data[8:0] = sram__rd_data[447:440];
                6'h38: S0__rd_data[8:0] = sram__rd_data[455:448];
                6'h39: S0__rd_data[8:0] = sram__rd_data[463:456];
                6'h3a: S0__rd_data[8:0] = sram__rd_data[471:464];
                6'h3b: S0__rd_data[8:0] = sram__rd_data[479:472];
                6'h3c: S0__rd_data[8:0] = sram__rd_data[487:480];
                6'h3d: S0__rd_data[8:0] = sram__rd_data[495:488];
                6'h3e: S0__rd_data[8:0] = sram__rd_data[503:496];
                6'h3f: S0__rd_data[8:0] = sram__rd_data[511:504];
            endcase
    endcase
end

always_comb begin
    S0__sram_wr_data = sram__rd_data[511:0];
    case (S0__size)
        2'h0:
            case (S0__addr[5:3])
                3'h0: S0__sram_wr_data[63:0] = S0__wr_data;
                3'h1: S0__sram_wr_data[127:64] = S0__wr_data;
                3'h2: S0__sram_wr_data[191:128] = S0__wr_data;
                3'h3: S0__sram_wr_data[255:192] = S0__wr_data;
                3'h4: S0__sram_wr_data[319:256] = S0__wr_data;
                3'h5: S0__sram_wr_data[383:320] = S0__wr_data;
                3'h6: S0__sram_wr_data[447:384] = S0__wr_data;
                3'h7: S0__sram_wr_data[511:448] = S0__wr_data;
            endcase
        2'h1:
            case (S0__addr[5:2])
                4'h0: S0__sram_wr_data[31:0] = S0__wr_data;
                4'h1: S0__sram_wr_data[63:32] = S0__wr_data;
                4'h2: S0__sram_wr_data[95:64] = S0__wr_data;
                4'h3: S0__sram_wr_data[127:96] = S0__wr_data;
                4'h4: S0__sram_wr_data[159:128] = S0__wr_data;
                4'h5: S0__sram_wr_data[191:160] = S0__wr_data;
                4'h6: S0__sram_wr_data[223:192] = S0__wr_data;
                4'h7: S0__sram_wr_data[255:224] = S0__wr_data;
                4'h8: S0__sram_wr_data[287:256] = S0__wr_data;
                4'h9: S0__sram_wr_data[319:288] = S0__wr_data;
                4'ha: S0__sram_wr_data[351:320] = S0__wr_data;
                4'hb: S0__sram_wr_data[383:352] = S0__wr_data;
                4'hc: S0__sram_wr_data[415:384] = S0__wr_data;
                4'hd: S0__sram_wr_data[447:416] = S0__wr_data;
                4'he: S0__sram_wr_data[479:448] = S0__wr_data;
                4'hf: S0__sram_wr_data[511:480] = S0__wr_data;
            endcase
        2'h2: 
            case (S0__addr[5:1])
                5'h0: S0__sram_wr_data[15:0] = S0__wr_data;
                5'h1: S0__sram_wr_data[31:16] = S0__wr_data;
                5'h2: S0__sram_wr_data[47:32] = S0__wr_data;
                5'h3: S0__sram_wr_data[63:48] = S0__wr_data;
                5'h4: S0__sram_wr_data[79:64] = S0__wr_data;
                5'h5: S0__sram_wr_data[95:80] = S0__wr_data;
                5'h6: S0__sram_wr_data[111:96] = S0__wr_data;
                5'h7: S0__sram_wr_data[127:112] = S0__wr_data;
                5'h8: S0__sram_wr_data[143:128] = S0__wr_data;
                5'h9: S0__sram_wr_data[159:144] = S0__wr_data;
                5'ha: S0__sram_wr_data[175:160] = S0__wr_data;
                5'hb: S0__sram_wr_data[191:176] = S0__wr_data;
                5'hc: S0__sram_wr_data[207:192] = S0__wr_data;
                5'hd: S0__sram_wr_data[223:208] = S0__wr_data;
                5'he: S0__sram_wr_data[239:224] = S0__wr_data;
                5'hf: S0__sram_wr_data[255:240] = S0__wr_data;
                5'h10: S0__sram_wr_data[271:256] = S0__wr_data;
                5'h11: S0__sram_wr_data[287:272] = S0__wr_data;
                5'h12: S0__sram_wr_data[303:288] = S0__wr_data;
                5'h13: S0__sram_wr_data[319:304] = S0__wr_data;
                5'h14: S0__sram_wr_data[335:320] = S0__wr_data;
                5'h15: S0__sram_wr_data[351:336] = S0__wr_data;
                5'h16: S0__sram_wr_data[367:352] = S0__wr_data;
                5'h17: S0__sram_wr_data[383:368] = S0__wr_data;
                5'h18: S0__sram_wr_data[399:384] = S0__wr_data;
                5'h19: S0__sram_wr_data[415:400] = S0__wr_data;
                5'h1a: S0__sram_wr_data[431:416] = S0__wr_data;
                5'h1b: S0__sram_wr_data[447:432] = S0__wr_data;
                5'h1c: S0__sram_wr_data[463:448] = S0__wr_data;
                5'h1d: S0__sram_wr_data[479:464] = S0__wr_data;
                5'h1e: S0__sram_wr_data[495:480] = S0__wr_data;
                5'h1f: S0__sram_wr_data[511:496] = S0__wr_data;
            endcase
        2'h3: 
            case (S0__addr[5:0])
                6'h0: S0__sram_wr_data[7:0] = S0__wr_data;
                6'h1: S0__sram_wr_data[15:8] = S0__wr_data;
                6'h2: S0__sram_wr_data[23:16] = S0__wr_data;
                6'h3: S0__sram_wr_data[31:24] = S0__wr_data;
                6'h4: S0__sram_wr_data[39:32] = S0__wr_data;
                6'h5: S0__sram_wr_data[47:40] = S0__wr_data;
                6'h6: S0__sram_wr_data[55:48] = S0__wr_data;
                6'h7: S0__sram_wr_data[63:56] = S0__wr_data;
                6'h8: S0__sram_wr_data[71:64] = S0__wr_data;
                6'h9: S0__sram_wr_data[79:72] = S0__wr_data;
                6'ha: S0__sram_wr_data[87:80] = S0__wr_data;
                6'hb: S0__sram_wr_data[95:88] = S0__wr_data;
                6'hc: S0__sram_wr_data[103:96] = S0__wr_data;
                6'hd: S0__sram_wr_data[111:104] = S0__wr_data;
                6'he: S0__sram_wr_data[119:112] = S0__wr_data;
                6'hf: S0__sram_wr_data[127:120] = S0__wr_data;
                6'h10: S0__sram_wr_data[135:128] = S0__wr_data;
                6'h11: S0__sram_wr_data[143:136] = S0__wr_data;
                6'h12: S0__sram_wr_data[151:144] = S0__wr_data;
                6'h13: S0__sram_wr_data[159:152] = S0__wr_data;
                6'h14: S0__sram_wr_data[167:160] = S0__wr_data;
                6'h15: S0__sram_wr_data[175:168] = S0__wr_data;
                6'h16: S0__sram_wr_data[183:176] = S0__wr_data;
                6'h17: S0__sram_wr_data[191:184] = S0__wr_data;
                6'h18: S0__sram_wr_data[199:192] = S0__wr_data;
                6'h19: S0__sram_wr_data[207:200] = S0__wr_data;
                6'h1a: S0__sram_wr_data[215:208] = S0__wr_data;
                6'h1b: S0__sram_wr_data[223:216] = S0__wr_data;
                6'h1c: S0__sram_wr_data[231:224] = S0__wr_data;
                6'h1d: S0__sram_wr_data[239:232] = S0__wr_data;
                6'h1e: S0__sram_wr_data[247:240] = S0__wr_data;
                6'h1f: S0__sram_wr_data[255:248] = S0__wr_data;
                6'h20: S0__sram_wr_data[263:256] = S0__wr_data;
                6'h21: S0__sram_wr_data[271:264] = S0__wr_data;
                6'h22: S0__sram_wr_data[279:272] = S0__wr_data;
                6'h23: S0__sram_wr_data[287:280] = S0__wr_data;
                6'h24: S0__sram_wr_data[295:288] = S0__wr_data;
                6'h25: S0__sram_wr_data[303:296] = S0__wr_data;
                6'h26: S0__sram_wr_data[311:304] = S0__wr_data;
                6'h27: S0__sram_wr_data[319:312] = S0__wr_data;
                6'h28: S0__sram_wr_data[327:320] = S0__wr_data;
                6'h29: S0__sram_wr_data[335:328] = S0__wr_data;
                6'h2a: S0__sram_wr_data[343:336] = S0__wr_data;
                6'h2b: S0__sram_wr_data[351:344] = S0__wr_data;
                6'h2c: S0__sram_wr_data[359:352] = S0__wr_data;
                6'h2d: S0__sram_wr_data[367:360] = S0__wr_data;
                6'h2e: S0__sram_wr_data[375:368] = S0__wr_data;
                6'h2f: S0__sram_wr_data[383:376] = S0__wr_data;
                6'h30: S0__sram_wr_data[391:384] = S0__wr_data;
                6'h31: S0__sram_wr_data[399:392] = S0__wr_data;
                6'h32: S0__sram_wr_data[407:400] = S0__wr_data;
                6'h33: S0__sram_wr_data[415:408] = S0__wr_data;
                6'h34: S0__sram_wr_data[423:416] = S0__wr_data;
                6'h35: S0__sram_wr_data[431:424] = S0__wr_data;
                6'h36: S0__sram_wr_data[439:432] = S0__wr_data;
                6'h37: S0__sram_wr_data[447:440] = S0__wr_data;
                6'h38: S0__sram_wr_data[455:448] = S0__wr_data;
                6'h39: S0__sram_wr_data[463:456] = S0__wr_data;
                6'h3a: S0__sram_wr_data[471:464] = S0__wr_data;
                6'h3b: S0__sram_wr_data[479:472] = S0__wr_data;
                6'h3c: S0__sram_wr_data[487:480] = S0__wr_data;
                6'h3d: S0__sram_wr_data[495:488] = S0__wr_data;
                6'h3e: S0__sram_wr_data[503:496] = S0__wr_data;
                6'h3f: S0__sram_wr_data[511:504] = S0__wr_data;
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
                    sram__wr_data[565] = 1'b1;
                    sram__wr_data[564] = 1'b1;
                    sram__wr_data[563:512] = S0__tag;
                    sram__wr_data[511:0] = S0__sram_wr_data;
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
            l1_to_mem__addr_n = {sram__rd_data[563:512], S0__index, 6'h0};
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
            sram__wr_data[565] = 1'b1;
            sram__wr_data[564] = 1'b0;
            sram__wr_data[563:512] = S0__tag;
            sram__wr_data[511:0] = mem_data;
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

assign l1_to_mem__wr_data_n = sram__rd_data[511:0];


//==============================================
// SRAM Interface
//==============================================
logic [5:0] sram__addr;
logic sram__rw;
logic [565:0] sram__wr_data;
logic [565:0] sram__rd_data;

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
