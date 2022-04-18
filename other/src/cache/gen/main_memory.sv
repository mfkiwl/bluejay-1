//==============================================================
// main_memory 
//==============================================================
module main_memory 
(
    input clk,
    input rst,

    input valid,
    input [63:0] addr,
    input rw,
    input [511:0] wr_data,
    output logic [511:0] rd_data
);

parameter MEMORY__SIZE = 1024;

logic [7:0] memory [MEMORY__SIZE-1:0];

always_comb begin
    rd_data[7:0] = memory[addr + 0];
    rd_data[15:8] = memory[addr + 1];
    rd_data[23:16] = memory[addr + 2];
    rd_data[31:24] = memory[addr + 3];
    rd_data[39:32] = memory[addr + 4];
    rd_data[47:40] = memory[addr + 5];
    rd_data[55:48] = memory[addr + 6];
    rd_data[63:56] = memory[addr + 7];
    rd_data[71:64] = memory[addr + 8];
    rd_data[79:72] = memory[addr + 9];
    rd_data[87:80] = memory[addr + 10];
    rd_data[95:88] = memory[addr + 11];
    rd_data[103:96] = memory[addr + 12];
    rd_data[111:104] = memory[addr + 13];
    rd_data[119:112] = memory[addr + 14];
    rd_data[127:120] = memory[addr + 15];
    rd_data[135:128] = memory[addr + 16];
    rd_data[143:136] = memory[addr + 17];
    rd_data[151:144] = memory[addr + 18];
    rd_data[159:152] = memory[addr + 19];
    rd_data[167:160] = memory[addr + 20];
    rd_data[175:168] = memory[addr + 21];
    rd_data[183:176] = memory[addr + 22];
    rd_data[191:184] = memory[addr + 23];
    rd_data[199:192] = memory[addr + 24];
    rd_data[207:200] = memory[addr + 25];
    rd_data[215:208] = memory[addr + 26];
    rd_data[223:216] = memory[addr + 27];
    rd_data[231:224] = memory[addr + 28];
    rd_data[239:232] = memory[addr + 29];
    rd_data[247:240] = memory[addr + 30];
    rd_data[255:248] = memory[addr + 31];
    rd_data[263:256] = memory[addr + 32];
    rd_data[271:264] = memory[addr + 33];
    rd_data[279:272] = memory[addr + 34];
    rd_data[287:280] = memory[addr + 35];
    rd_data[295:288] = memory[addr + 36];
    rd_data[303:296] = memory[addr + 37];
    rd_data[311:304] = memory[addr + 38];
    rd_data[319:312] = memory[addr + 39];
    rd_data[327:320] = memory[addr + 40];
    rd_data[335:328] = memory[addr + 41];
    rd_data[343:336] = memory[addr + 42];
    rd_data[351:344] = memory[addr + 43];
    rd_data[359:352] = memory[addr + 44];
    rd_data[367:360] = memory[addr + 45];
    rd_data[375:368] = memory[addr + 46];
    rd_data[383:376] = memory[addr + 47];
    rd_data[391:384] = memory[addr + 48];
    rd_data[399:392] = memory[addr + 49];
    rd_data[407:400] = memory[addr + 50];
    rd_data[415:408] = memory[addr + 51];
    rd_data[423:416] = memory[addr + 52];
    rd_data[431:424] = memory[addr + 53];
    rd_data[439:432] = memory[addr + 54];
    rd_data[447:440] = memory[addr + 55];
    rd_data[455:448] = memory[addr + 56];
    rd_data[463:456] = memory[addr + 57];
    rd_data[471:464] = memory[addr + 58];
    rd_data[479:472] = memory[addr + 59];
    rd_data[487:480] = memory[addr + 60];
    rd_data[495:488] = memory[addr + 61];
    rd_data[503:496] = memory[addr + 62];
    rd_data[511:504] = memory[addr + 63];
end

always_ff @(posedge clk) begin
   memory[addr + 0] <= (valid & rw) ? wr_data[7:0];
   memory[addr + 1] <= (valid & rw) ? wr_data[15:8];
   memory[addr + 2] <= (valid & rw) ? wr_data[23:16];
   memory[addr + 3] <= (valid & rw) ? wr_data[31:24];
   memory[addr + 4] <= (valid & rw) ? wr_data[39:32];
   memory[addr + 5] <= (valid & rw) ? wr_data[47:40];
   memory[addr + 6] <= (valid & rw) ? wr_data[55:48];
   memory[addr + 7] <= (valid & rw) ? wr_data[63:56];
   memory[addr + 8] <= (valid & rw) ? wr_data[71:64];
   memory[addr + 9] <= (valid & rw) ? wr_data[79:72];
   memory[addr + 10] <= (valid & rw) ? wr_data[87:80];
   memory[addr + 11] <= (valid & rw) ? wr_data[95:88];
   memory[addr + 12] <= (valid & rw) ? wr_data[103:96];
   memory[addr + 13] <= (valid & rw) ? wr_data[111:104];
   memory[addr + 14] <= (valid & rw) ? wr_data[119:112];
   memory[addr + 15] <= (valid & rw) ? wr_data[127:120];
   memory[addr + 16] <= (valid & rw) ? wr_data[135:128];
   memory[addr + 17] <= (valid & rw) ? wr_data[143:136];
   memory[addr + 18] <= (valid & rw) ? wr_data[151:144];
   memory[addr + 19] <= (valid & rw) ? wr_data[159:152];
   memory[addr + 20] <= (valid & rw) ? wr_data[167:160];
   memory[addr + 21] <= (valid & rw) ? wr_data[175:168];
   memory[addr + 22] <= (valid & rw) ? wr_data[183:176];
   memory[addr + 23] <= (valid & rw) ? wr_data[191:184];
   memory[addr + 24] <= (valid & rw) ? wr_data[199:192];
   memory[addr + 25] <= (valid & rw) ? wr_data[207:200];
   memory[addr + 26] <= (valid & rw) ? wr_data[215:208];
   memory[addr + 27] <= (valid & rw) ? wr_data[223:216];
   memory[addr + 28] <= (valid & rw) ? wr_data[231:224];
   memory[addr + 29] <= (valid & rw) ? wr_data[239:232];
   memory[addr + 30] <= (valid & rw) ? wr_data[247:240];
   memory[addr + 31] <= (valid & rw) ? wr_data[255:248];
   memory[addr + 32] <= (valid & rw) ? wr_data[263:256];
   memory[addr + 33] <= (valid & rw) ? wr_data[271:264];
   memory[addr + 34] <= (valid & rw) ? wr_data[279:272];
   memory[addr + 35] <= (valid & rw) ? wr_data[287:280];
   memory[addr + 36] <= (valid & rw) ? wr_data[295:288];
   memory[addr + 37] <= (valid & rw) ? wr_data[303:296];
   memory[addr + 38] <= (valid & rw) ? wr_data[311:304];
   memory[addr + 39] <= (valid & rw) ? wr_data[319:312];
   memory[addr + 40] <= (valid & rw) ? wr_data[327:320];
   memory[addr + 41] <= (valid & rw) ? wr_data[335:328];
   memory[addr + 42] <= (valid & rw) ? wr_data[343:336];
   memory[addr + 43] <= (valid & rw) ? wr_data[351:344];
   memory[addr + 44] <= (valid & rw) ? wr_data[359:352];
   memory[addr + 45] <= (valid & rw) ? wr_data[367:360];
   memory[addr + 46] <= (valid & rw) ? wr_data[375:368];
   memory[addr + 47] <= (valid & rw) ? wr_data[383:376];
   memory[addr + 48] <= (valid & rw) ? wr_data[391:384];
   memory[addr + 49] <= (valid & rw) ? wr_data[399:392];
   memory[addr + 50] <= (valid & rw) ? wr_data[407:400];
   memory[addr + 51] <= (valid & rw) ? wr_data[415:408];
   memory[addr + 52] <= (valid & rw) ? wr_data[423:416];
   memory[addr + 53] <= (valid & rw) ? wr_data[431:424];
   memory[addr + 54] <= (valid & rw) ? wr_data[439:432];
   memory[addr + 55] <= (valid & rw) ? wr_data[447:440];
   memory[addr + 56] <= (valid & rw) ? wr_data[455:448];
   memory[addr + 57] <= (valid & rw) ? wr_data[463:456];
   memory[addr + 58] <= (valid & rw) ? wr_data[471:464];
   memory[addr + 59] <= (valid & rw) ? wr_data[479:472];
   memory[addr + 60] <= (valid & rw) ? wr_data[487:480];
   memory[addr + 61] <= (valid & rw) ? wr_data[495:488];
   memory[addr + 62] <= (valid & rw) ? wr_data[503:496];
   memory[addr + 63] <= (valid & rw) ? wr_data[511:504];
end


endmodule
