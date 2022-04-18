//==============================================
// arithmetic_logic_unit
//==============================================
module arithmetic_logic_unit
(
    input clk,
    input rst,
    input [3:0] func,
    input [63:0] data_0,
    input [63:0] data_1,
    output logic [63:0] data_2,
    output logic eq,
    output logic ne,
    output logic lt,
    output logic ltu,
    output logic ge,
    output logic geu
);

// comparisons
assign eq = (data_0 == data_1);
assign ne = ~eq;
assign lt = (data_0[63] == data_1[63]) ? data_0 < data_1 : data_0[63];
assign ltu = data_0 < data_1;
assign ge = (data_0[63] == data_1[63]) ? data_0 >= data_1 : data_1[63];
assign geu = data_0 >= data_1;
    
// mathmatical/logical operations
always_comb begin
    case (func)
        FUNC__ADD: data_2 = data_0 + data_1;
        FUNC__ADDW: data_2 = {{32{data_0[31]}}, data_0[31:0]} + {{32{data_1[31]}}, data_1[31:0]};
        FUNC__SUB: data_2 = data_0 - data_1;
        FUNC__SUBW: data_2 = {{32{data_0[31]}}, data_0[31:0]} - {{32{data_1[31]}}, data_1[31:0]};
        FUNC__SLL: data_2 = data_0 << data_1[4:0];
        FUNC__SLLW: data_2 = {{32{data_0[31 - data_1[4:0]]}}, data_0[31:0] << data_1[4:0]};
        FUNC__SLT: data_2 = {63'h0, lt};
        FUNC__SLTU: data_2 = {63'h0, ltu};
        FUNC__XOR: data_2 = data_0 ^ data_1;
        FUNC__SRL: data_2 = data_0 >> data_1[4:0];
        FUNC__SRLW: data_2 = {32'h0, data_0[31:0] >> data_1[4:0]};
        FUNC__SRA:
        begin
            case (data_1[5:0])
                6'h00: data_2 = data_0;
                6'h01: data_2 = {{1{data_0[63]}}, data_0[63:1]};
                6'h02: data_2 = {{2{data_0[63]}}, data_0[63:2]};
                6'h03: data_2 = {{3{data_0[63]}}, data_0[63:3]};
                6'h04: data_2 = {{4{data_0[63]}}, data_0[63:4]};
                6'h05: data_2 = {{5{data_0[63]}}, data_0[63:5]};
                6'h06: data_2 = {{6{data_0[63]}}, data_0[63:6]};
                6'h07: data_2 = {{7{data_0[63]}}, data_0[63:7]};
                6'h08: data_2 = {{8{data_0[63]}}, data_0[63:8]};
                6'h09: data_2 = {{9{data_0[63]}}, data_0[63:9]};
                6'h0a: data_2 = {{10{data_0[63]}}, data_0[63:10]};
                6'h0b: data_2 = {{11{data_0[63]}}, data_0[63:11]};
                6'h0c: data_2 = {{12{data_0[63]}}, data_0[63:12]};
                6'h0d: data_2 = {{13{data_0[63]}}, data_0[63:13]};
                6'h0e: data_2 = {{14{data_0[63]}}, data_0[63:14]};
                6'h0f: data_2 = {{15{data_0[63]}}, data_0[63:15]};
                6'h10: data_2 = {{16{data_0[63]}}, data_0[63:16]};
                6'h11: data_2 = {{17{data_0[63]}}, data_0[63:17]};
                6'h12: data_2 = {{18{data_0[63]}}, data_0[63:18]};
                6'h13: data_2 = {{19{data_0[63]}}, data_0[63:19]};
                6'h14: data_2 = {{20{data_0[63]}}, data_0[63:20]};
                6'h15: data_2 = {{21{data_0[63]}}, data_0[63:21]};
                6'h16: data_2 = {{22{data_0[63]}}, data_0[63:22]};
                6'h17: data_2 = {{23{data_0[63]}}, data_0[63:23]};
                6'h18: data_2 = {{24{data_0[63]}}, data_0[63:24]};
                6'h19: data_2 = {{25{data_0[63]}}, data_0[63:25]};
                6'h1a: data_2 = {{26{data_0[63]}}, data_0[63:26]};
                6'h1b: data_2 = {{27{data_0[63]}}, data_0[63:27]};
                6'h1c: data_2 = {{28{data_0[63]}}, data_0[63:28]};
                6'h1d: data_2 = {{29{data_0[63]}}, data_0[63:29]};
                6'h1e: data_2 = {{30{data_0[63]}}, data_0[63:30]};
                6'h1f: data_2 = {{31{data_0[63]}}, data_0[63:31]};
                6'h20: data_2 = {{32{data_0[63]}}, data_0[63:32]};
                6'h21: data_2 = {{33{data_0[63]}}, data_0[63:33]};
                6'h22: data_2 = {{34{data_0[63]}}, data_0[63:34]};
                6'h23: data_2 = {{35{data_0[63]}}, data_0[63:35]};
                6'h24: data_2 = {{36{data_0[63]}}, data_0[63:36]};
                6'h25: data_2 = {{37{data_0[63]}}, data_0[63:37]};
                6'h26: data_2 = {{38{data_0[63]}}, data_0[63:38]};
                6'h27: data_2 = {{39{data_0[63]}}, data_0[63:39]};
                6'h28: data_2 = {{40{data_0[63]}}, data_0[63:40]};
                6'h29: data_2 = {{41{data_0[63]}}, data_0[63:41]};
                6'h2a: data_2 = {{42{data_0[63]}}, data_0[63:42]};
                6'h2b: data_2 = {{43{data_0[63]}}, data_0[63:43]};
                6'h2c: data_2 = {{44{data_0[63]}}, data_0[63:44]};
                6'h2d: data_2 = {{45{data_0[63]}}, data_0[63:45]};
                6'h2e: data_2 = {{46{data_0[63]}}, data_0[63:46]};
                6'h2f: data_2 = {{47{data_0[63]}}, data_0[63:47]};
                6'h30: data_2 = {{48{data_0[63]}}, data_0[63:48]};
                6'h31: data_2 = {{49{data_0[63]}}, data_0[63:49]};
                6'h32: data_2 = {{50{data_0[63]}}, data_0[63:50]};
                6'h33: data_2 = {{51{data_0[63]}}, data_0[63:51]};
                6'h34: data_2 = {{52{data_0[63]}}, data_0[63:52]};
                6'h35: data_2 = {{53{data_0[63]}}, data_0[63:53]};
                6'h36: data_2 = {{54{data_0[63]}}, data_0[63:54]};
                6'h37: data_2 = {{55{data_0[63]}}, data_0[63:55]};
                6'h38: data_2 = {{56{data_0[63]}}, data_0[63:56]};
                6'h39: data_2 = {{57{data_0[63]}}, data_0[63:57]};
                6'h3a: data_2 = {{58{data_0[63]}}, data_0[63:58]};
                6'h3b: data_2 = {{59{data_0[63]}}, data_0[63:59]};
                6'h3c: data_2 = {{60{data_0[63]}}, data_0[63:60]};
                6'h3d: data_2 = {{61{data_0[63]}}, data_0[63:61]};
                6'h3e: data_2 = {{62{data_0[63]}}, data_0[63:62]};
                6'h3f: data_2 = {64{data_0[63]}};
            endcase
        end
        FUNC__SRAW:
        begin
            case (data_1[4:0])
                5'h00: data_2 = data_0;
                5'h01: data_2 = {{33{data_0[31]}}, data_0[31:1]};
                5'h02: data_2 = {{34{data_0[31]}}, data_0[31:2]};
                5'h03: data_2 = {{35{data_0[31]}}, data_0[31:3]};
                5'h04: data_2 = {{36{data_0[31]}}, data_0[31:4]};
                5'h05: data_2 = {{37{data_0[31]}}, data_0[31:5]};
                5'h06: data_2 = {{38{data_0[31]}}, data_0[31:6]};
                5'h07: data_2 = {{39{data_0[31]}}, data_0[31:7]};
                5'h08: data_2 = {{40{data_0[31]}}, data_0[31:8]};
                5'h09: data_2 = {{41{data_0[31]}}, data_0[31:9]};
                5'h0a: data_2 = {{42{data_0[31]}}, data_0[31:10]};
                5'h0b: data_2 = {{43{data_0[31]}}, data_0[31:11]};
                5'h0c: data_2 = {{44{data_0[31]}}, data_0[31:12]};
                5'h0d: data_2 = {{45{data_0[31]}}, data_0[31:13]};
                5'h0e: data_2 = {{46{data_0[31]}}, data_0[31:14]};
                5'h0f: data_2 = {{47{data_0[31]}}, data_0[31:15]};
                5'h10: data_2 = {{48{data_0[31]}}, data_0[31:16]};
                5'h11: data_2 = {{49{data_0[31]}}, data_0[31:17]};
                5'h12: data_2 = {{50{data_0[31]}}, data_0[31:18]};
                5'h13: data_2 = {{51{data_0[31]}}, data_0[31:19]};
                5'h14: data_2 = {{52{data_0[31]}}, data_0[31:20]};
                5'h15: data_2 = {{53{data_0[31]}}, data_0[31:21]};
                5'h16: data_2 = {{54{data_0[31]}}, data_0[31:22]};
                5'h17: data_2 = {{55{data_0[31]}}, data_0[31:23]};
                5'h18: data_2 = {{56{data_0[31]}}, data_0[31:24]};
                5'h19: data_2 = {{57{data_0[31]}}, data_0[31:25]};
                5'h1a: data_2 = {{58{data_0[31]}}, data_0[31:26]};
                5'h1b: data_2 = {{59{data_0[31]}}, data_0[31:27]};
                5'h1c: data_2 = {{60{data_0[31]}}, data_0[31:28]};
                5'h1d: data_2 = {{61{data_0[31]}}, data_0[31:29]};
                5'h1e: data_2 = {{62{data_0[31]}}, data_0[31:30]};
                5'h1f: data_2 = {63{data_0[31]}};
            endcase
        end
        FUNC__OR: data_2 = data_0 | data_1;
        FUNC__AND: data_2 = data_0 & data_1;
    endcase
end

endmodule
