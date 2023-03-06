//==============================================
// arithmetic_logic_unit
//==============================================
module arithmetic_logic_unit
(
    input clk,
    input rst,
    input [4:0] func,
    input [63:0] a,
    input [63:0] b,
    output logic [63:0] c
);

logic [63:0] x;

// Mathmatical/logical operations.
always_comb begin
    case (func)
        5'h0: 
        begin 
            c = a + b;
        end
        5'h1:
        begin
            x = a + b;
            c = {{32{x[31]}}, x[31:0]};
        end
        5'h2:
        begin
            c = a - b;
        end
        5'h3:
        begin
            x = a - b;
            c = {{32{x[31]}}, x[31:0]};
        end
        5'h4:
        begin 
            c = a << b[5:0];
        end
        5'h5:
        begin
            x = a << b[4:0];
            c = {{32{x[31]}}, x[31:0]};
        end
        5'h6:
        begin
            c = {63'h0, ((a[63] == b[63]) ? a < b : a[63])};
        end
        5'h7:
        begin
            c = {63'h0, a < b};
        end
        5'h8:
        begin
            c = a ^ b;
        end
        5'h9:
        begin
            c = a >> b[5:0];
        end
        5'ha:
        begin
            case (b[4:0])
                5'h0: c = {{32{a[31]}}, a[31:0]};
                5'h1: c = {{33{1'b0}}, a[31:1]};
                5'h2: c = {{34{1'b0}}, a[31:2]};
                5'h3: c = {{35{1'b0}}, a[31:3]};
                5'h4: c = {{36{1'b0}}, a[31:4]};
                5'h5: c = {{37{1'b0}}, a[31:5]};
                5'h6: c = {{38{1'b0}}, a[31:6]};
                5'h7: c = {{39{1'b0}}, a[31:7]};
                5'h8: c = {{40{1'b0}}, a[31:8]};
                5'h9: c = {{41{1'b0}}, a[31:9]};
                5'ha: c = {{42{1'b0}}, a[31:10]};
                5'hb: c = {{43{1'b0}}, a[31:11]};
                5'hc: c = {{44{1'b0}}, a[31:12]};
                5'hd: c = {{45{1'b0}}, a[31:13]};
                5'he: c = {{46{1'b0}}, a[31:14]};
                5'hf: c = {{47{1'b0}}, a[31:15]};
                5'h10: c = {{48{1'b0}}, a[31:16]};
                5'h11: c = {{49{1'b0}}, a[31:17]};
                5'h12: c = {{50{1'b0}}, a[31:18]};
                5'h13: c = {{51{1'b0}}, a[31:19]};
                5'h14: c = {{52{1'b0}}, a[31:20]};
                5'h15: c = {{53{1'b0}}, a[31:21]};
                5'h16: c = {{54{1'b0}}, a[31:22]};
                5'h17: c = {{55{1'b0}}, a[31:23]};
                5'h18: c = {{56{1'b0}}, a[31:24]};
                5'h19: c = {{57{1'b0}}, a[31:25]};
                5'h1a: c = {{58{1'b0}}, a[31:26]};
                5'h1b: c = {{59{1'b0}}, a[31:27]};
                5'h1c: c = {{60{1'b0}}, a[31:28]};
                5'h1d: c = {{61{1'b0}}, a[31:29]};
                5'h1e: c = {{62{1'b0}}, a[31:30]};
                5'h1f: c = {{63{1'b0}}, a[31:31]};
            endcase
        end
        5'hb:
        begin
            case (b[5:0])
                6'h0: c = {{0{a[63]}}, a[63:0]};
                6'h1: c = {{1{a[63]}}, a[63:1]};
                6'h2: c = {{2{a[63]}}, a[63:2]};
                6'h3: c = {{3{a[63]}}, a[63:3]};
                6'h4: c = {{4{a[63]}}, a[63:4]};
                6'h5: c = {{5{a[63]}}, a[63:5]};
                6'h6: c = {{6{a[63]}}, a[63:6]};
                6'h7: c = {{7{a[63]}}, a[63:7]};
                6'h8: c = {{8{a[63]}}, a[63:8]};
                6'h9: c = {{9{a[63]}}, a[63:9]};
                6'ha: c = {{10{a[63]}}, a[63:10]};
                6'hb: c = {{11{a[63]}}, a[63:11]};
                6'hc: c = {{12{a[63]}}, a[63:12]};
                6'hd: c = {{13{a[63]}}, a[63:13]};
                6'he: c = {{14{a[63]}}, a[63:14]};
                6'hf: c = {{15{a[63]}}, a[63:15]};
                6'h10: c = {{16{a[63]}}, a[63:16]};
                6'h11: c = {{17{a[63]}}, a[63:17]};
                6'h12: c = {{18{a[63]}}, a[63:18]};
                6'h13: c = {{19{a[63]}}, a[63:19]};
                6'h14: c = {{20{a[63]}}, a[63:20]};
                6'h15: c = {{21{a[63]}}, a[63:21]};
                6'h16: c = {{22{a[63]}}, a[63:22]};
                6'h17: c = {{23{a[63]}}, a[63:23]};
                6'h18: c = {{24{a[63]}}, a[63:24]};
                6'h19: c = {{25{a[63]}}, a[63:25]};
                6'h1a: c = {{26{a[63]}}, a[63:26]};
                6'h1b: c = {{27{a[63]}}, a[63:27]};
                6'h1c: c = {{28{a[63]}}, a[63:28]};
                6'h1d: c = {{29{a[63]}}, a[63:29]};
                6'h1e: c = {{30{a[63]}}, a[63:30]};
                6'h1f: c = {{31{a[63]}}, a[63:31]};
                6'h20: c = {{32{a[63]}}, a[63:32]};
                6'h21: c = {{33{a[63]}}, a[63:33]};
                6'h22: c = {{34{a[63]}}, a[63:34]};
                6'h23: c = {{35{a[63]}}, a[63:35]};
                6'h24: c = {{36{a[63]}}, a[63:36]};
                6'h25: c = {{37{a[63]}}, a[63:37]};
                6'h26: c = {{38{a[63]}}, a[63:38]};
                6'h27: c = {{39{a[63]}}, a[63:39]};
                6'h28: c = {{40{a[63]}}, a[63:40]};
                6'h29: c = {{41{a[63]}}, a[63:41]};
                6'h2a: c = {{42{a[63]}}, a[63:42]};
                6'h2b: c = {{43{a[63]}}, a[63:43]};
                6'h2c: c = {{44{a[63]}}, a[63:44]};
                6'h2d: c = {{45{a[63]}}, a[63:45]};
                6'h2e: c = {{46{a[63]}}, a[63:46]};
                6'h2f: c = {{47{a[63]}}, a[63:47]};
                6'h30: c = {{48{a[63]}}, a[63:48]};
                6'h31: c = {{49{a[63]}}, a[63:49]};
                6'h32: c = {{50{a[63]}}, a[63:50]};
                6'h33: c = {{51{a[63]}}, a[63:51]};
                6'h34: c = {{52{a[63]}}, a[63:52]};
                6'h35: c = {{53{a[63]}}, a[63:53]};
                6'h36: c = {{54{a[63]}}, a[63:54]};
                6'h37: c = {{55{a[63]}}, a[63:55]};
                6'h38: c = {{56{a[63]}}, a[63:56]};
                6'h39: c = {{57{a[63]}}, a[63:57]};
                6'h3a: c = {{58{a[63]}}, a[63:58]};
                6'h3b: c = {{59{a[63]}}, a[63:59]};
                6'h3c: c = {{60{a[63]}}, a[63:60]};
                6'h3d: c = {{61{a[63]}}, a[63:61]};
                6'h3e: c = {{62{a[63]}}, a[63:62]};
                6'h3f: c = {{63{a[63]}}, a[63:63]};
            endcase
        end
        5'hc:
        begin
            case (b[4:0])
                5'h0: c = {{32{a[31]}}, a[31:0]};
                5'h1: c = {{33{a[31]}}, a[31:1]};
                5'h2: c = {{34{a[31]}}, a[31:2]};
                5'h3: c = {{35{a[31]}}, a[31:3]};
                5'h4: c = {{36{a[31]}}, a[31:4]};
                5'h5: c = {{37{a[31]}}, a[31:5]};
                5'h6: c = {{38{a[31]}}, a[31:6]};
                5'h7: c = {{39{a[31]}}, a[31:7]};
                5'h8: c = {{40{a[31]}}, a[31:8]};
                5'h9: c = {{41{a[31]}}, a[31:9]};
                5'ha: c = {{42{a[31]}}, a[31:10]};
                5'hb: c = {{43{a[31]}}, a[31:11]};
                5'hc: c = {{44{a[31]}}, a[31:12]};
                5'hd: c = {{45{a[31]}}, a[31:13]};
                5'he: c = {{46{a[31]}}, a[31:14]};
                5'hf: c = {{47{a[31]}}, a[31:15]};
                5'h10: c = {{48{a[31]}}, a[31:16]};
                5'h11: c = {{49{a[31]}}, a[31:17]};
                5'h12: c = {{50{a[31]}}, a[31:18]};
                5'h13: c = {{51{a[31]}}, a[31:19]};
                5'h14: c = {{52{a[31]}}, a[31:20]};
                5'h15: c = {{53{a[31]}}, a[31:21]};
                5'h16: c = {{54{a[31]}}, a[31:22]};
                5'h17: c = {{55{a[31]}}, a[31:23]};
                5'h18: c = {{56{a[31]}}, a[31:24]};
                5'h19: c = {{57{a[31]}}, a[31:25]};
                5'h1a: c = {{58{a[31]}}, a[31:26]};
                5'h1b: c = {{59{a[31]}}, a[31:27]};
                5'h1c: c = {{60{a[31]}}, a[31:28]};
                5'h1d: c = {{61{a[31]}}, a[31:29]};
                5'h1e: c = {{62{a[31]}}, a[31:30]};
                5'h1f: c = {{63{a[31]}}, a[31:31]};
            endcase
        end
        5'hd:
        begin
            c = a | b;
        end
        5'he:
        begin
            c = a & b;
        end
        5'hf:
        begin
            c = ~a & b;
        end
        5'h10:
        begin
            c = a;
        end
        5'h11:
        begin
            c = b;
        end
    endcase
end

endmodule
//==============================================
// central_processing_unit
//==============================================
module central_processing_unit
(
    clk,
    rst,
    cs,
    we,
    addr,
    size,
    wr_data,
    ready,
    resp,
    rd_data,
    eip,
    tip
);


input clk;
input rst;
output cs;
output we;
output [63:0] addr;
output [1:0] size;
output [63:0] wr_data;
input ready;
input resp;
input [63:0] rd_data;
input eip;
input tip;

// Clock, Reset
logic clk;
logic rst;

// Program Counter/Instruction Register
logic [63:0] pc;
logic [63:0] pc__n;
logic [31:0] ir;
logic [31:0] ir__n;

// Decoder.
logic [5:0] op;
logic [4:0] rs1;
logic [4:0] rs2;
logic [4:0] rd;
logic [63:0] imm;
logic [63:0] uimm;

// Register File
logic rf__cs;
logic rf__we;
logic [4:0] rf__addr;
logic [63:0] rf__rd_data;
logic [63:0] rf__wr_data;

// ALU
logic [4:0] func;
logic [63:0] a;
logic [63:0] a__n;
logic [63:0] b;
logic [63:0] b__n;
logic [63:0] c;

// Comparator
logic eq;
logic ne;
logic lt;
logic ge;
logic ltu;
logic geu;

// Control and Status Registers
logic csr__cs;
logic csr__we;
logic [11:0] csr__addr;
logic [63:0] csr__wr_data;
logic [63:0] csr__rd_data;
logic mstatus__mie;
logic mie__meie;
logic mie__msie;
logic mie__mtie;
logic mip__meip;
logic mip__msip;
logic mip__mtip;

// CPU to Memory Interface
logic cs;
logic we;
logic [63:0] addr;
logic [1:0] size;
logic [63:0] wr_data;
logic ready;
logic resp;
logic [63:0] rd_data;

// Interrupt Signals
logic eip;
logic tip;

// CSR logic
logic instret;

// FSM
logic [7:0] state;
logic [7:0] state__n;


//==============================
// decoder__0
//==============================
decoder decoder__0
(
    .clk(clk),
    .rst(rst),
    .ir(ir),
    .op(op),
    .rs1(rs1),
    .rs2(rs2),
    .rd(rd),
    .imm(imm),
    .uimm(uimm)
);


//==============================
// register_file__0
//==============================
register_file register_file__0
(
    .clk(clk),
    .rst(rst),
    .cs(rf__cs),
    .we(rf__we),
    .addr(rf__addr),
    .rd_data(rf__rd_data),
    .wr_data(rf__wr_data)
);

//==============================
// arithmetic_logic_unit__0
//==============================
arithmetic_logic_unit arithmetic_logic_unit__0
(
    .clk(clk),
    .rst(rst),
    .func(func),
    .a(a),
    .b(b),
    .c(c)
);

//==============================
// comparator__0
//==============================
comparator comparator__0
(
    .clk(clk),
    .rst(rst),
    .a(a),
    .b(b),
    .eq(eq),
    .ne(ne),
    .lt(lt),
    .ltu(ltu),
    .ge(ge),
    .geu(geu)
);

//==============================
// control_and_status_registers__0
//==============================
control_and_status_registers control_and_status_registers__0
(
    .clk(clk),
    .rst(rst),
    .cs(csr__cs),
    .we(csr__we),
    .addr(csr__addr),
    .rd_data(csr__rd_data),
    .wr_data(csr__wr_data),
    .eip(eip),
    .tip(tip),
    .instret(instret),
    .mstatus__mie(mstatus__mie),
    .mie__meie(mie__meie),
    .mie__msie(mie__msie),
    .mie__mtie(mie__mtie),
    .mip__meip(mip__meip),
    .mip__msip(mip__msip),
    .mip__mtip(mip__mtip)
);

//==============================================
// Finite State Machine
//==============================================
localparam STATE__RESET = 8'h0;
localparam STATE__FETCH__0 = 8'h1;
localparam STATE__FETCH__1 = 8'h2;
localparam STATE__DECODE = 8'h3;
localparam STATE__LB__0 = 8'h4;
localparam STATE__LB__1 = 8'h5;
localparam STATE__LB__2 = 8'h6;
localparam STATE__LB__3 = 8'h7;
localparam STATE__LH__0 = 8'h8;
localparam STATE__LH__1 = 8'h9;
localparam STATE__LH__2 = 8'ha;
localparam STATE__LH__3 = 8'hb;
localparam STATE__LW__0 = 8'hc;
localparam STATE__LW__1 = 8'hd;
localparam STATE__LW__2 = 8'he;
localparam STATE__LW__3 = 8'hf;
localparam STATE__LD__0 = 8'h10;
localparam STATE__LD__1 = 8'h11;
localparam STATE__LD__2 = 8'h12;
localparam STATE__LD__3 = 8'h13;
localparam STATE__LBU__0 = 8'h14;
localparam STATE__LBU__1 = 8'h15;
localparam STATE__LBU__2 = 8'h16;
localparam STATE__LBU__3 = 8'h17;
localparam STATE__LHU__0 = 8'h18;
localparam STATE__LHU__1 = 8'h19;
localparam STATE__LHU__2 = 8'h1a;
localparam STATE__LHU__3 = 8'h1b;
localparam STATE__LWU__0 = 8'h1c;
localparam STATE__LWU__1 = 8'h1d;
localparam STATE__LWU__2 = 8'h1e;
localparam STATE__LWU__3 = 8'h1f;
localparam STATE__SB__0 = 8'h20;
localparam STATE__SB__1 = 8'h21;
localparam STATE__SB__2 = 8'h22;
localparam STATE__SB__3 = 8'h23;
localparam STATE__SH__0 = 8'h24;
localparam STATE__SH__1 = 8'h25;
localparam STATE__SH__2 = 8'h26;
localparam STATE__SH__3 = 8'h27;
localparam STATE__SW__0 = 8'h28;
localparam STATE__SW__1 = 8'h29;
localparam STATE__SW__2 = 8'h2a;
localparam STATE__SW__3 = 8'h2b;
localparam STATE__SD__0 = 8'h2c;
localparam STATE__SD__1 = 8'h2d;
localparam STATE__SD__2 = 8'h2e;
localparam STATE__SD__3 = 8'h2f;
localparam STATE__ADD__0 = 8'h30;
localparam STATE__ADD__1 = 8'h31;
localparam STATE__ADD__2 = 8'h32;
localparam STATE__SUB__0 = 8'h33;
localparam STATE__SUB__1 = 8'h34;
localparam STATE__SUB__2 = 8'h35;
localparam STATE__SLL__0 = 8'h36;
localparam STATE__SLL__1 = 8'h37;
localparam STATE__SLL__2 = 8'h38;
localparam STATE__SLT__0 = 8'h39;
localparam STATE__SLT__1 = 8'h3a;
localparam STATE__SLT__2 = 8'h3b;
localparam STATE__SLTU__0 = 8'h3c;
localparam STATE__SLTU__1 = 8'h3d;
localparam STATE__SLTU__2 = 8'h3e;
localparam STATE__XOR__0 = 8'h3f;
localparam STATE__XOR__1 = 8'h40;
localparam STATE__XOR__2 = 8'h41;
localparam STATE__SRL__0 = 8'h42;
localparam STATE__SRL__1 = 8'h43;
localparam STATE__SRL__2 = 8'h44;
localparam STATE__SRA__0 = 8'h45;
localparam STATE__SRA__1 = 8'h46;
localparam STATE__SRA__2 = 8'h47;
localparam STATE__OR__0 = 8'h48;
localparam STATE__OR__1 = 8'h49;
localparam STATE__OR__2 = 8'h4a;
localparam STATE__AND__0 = 8'h4b;
localparam STATE__AND__1 = 8'h4c;
localparam STATE__AND__2 = 8'h4d;
localparam STATE__LUI = 8'h4e;
localparam STATE__ADDW__0 = 8'h4f;
localparam STATE__ADDW__1 = 8'h50;
localparam STATE__ADDW__2 = 8'h51;
localparam STATE__SUBW__0 = 8'h52;
localparam STATE__SUBW__1 = 8'h53;
localparam STATE__SUBW__2 = 8'h54;
localparam STATE__SLLW__0 = 8'h55;
localparam STATE__SLLW__1 = 8'h56;
localparam STATE__SLLW__2 = 8'h57;
localparam STATE__SRLW__0 = 8'h58;
localparam STATE__SRLW__1 = 8'h59;
localparam STATE__SRLW__2 = 8'h5a;
localparam STATE__SRAW__0 = 8'h5b;
localparam STATE__SRAW__1 = 8'h5c;
localparam STATE__SRAW__2 = 8'h5d;
localparam STATE__ADDI__0 = 8'h5e;
localparam STATE__ADDI__1 = 8'h5f;
localparam STATE__SLLI__0 = 8'h60;
localparam STATE__SLLI__1 = 8'h61;
localparam STATE__SLTI__0 = 8'h62;
localparam STATE__SLTI__1 = 8'h63;
localparam STATE__SLTIU__0 = 8'h64;
localparam STATE__SLTIU__1 = 8'h65;
localparam STATE__XORI__0 = 8'h66;
localparam STATE__XORI__1 = 8'h67;
localparam STATE__SRLI__0 = 8'h68;
localparam STATE__SRLI__1 = 8'h69;
localparam STATE__SRAI__0 = 8'h6a;
localparam STATE__SRAI__1 = 8'h6b;
localparam STATE__ORI__0 = 8'h6c;
localparam STATE__ORI__1 = 8'h6d;
localparam STATE__ANDI__0 = 8'h6e;
localparam STATE__ANDI__1 = 8'h6f;
localparam STATE__ADDIW__0 = 8'h70;
localparam STATE__ADDIW__1 = 8'h71;
localparam STATE__SLLIW__0 = 8'h72;
localparam STATE__SLLIW__1 = 8'h73;
localparam STATE__SRLIW__0 = 8'h74;
localparam STATE__SRLIW__1 = 8'h75;
localparam STATE__SRAIW__0 = 8'h76;
localparam STATE__SRAIW__1 = 8'h77;
localparam STATE__AUIPC__0 = 8'h78;
localparam STATE__AUIPC__1 = 8'h79;
localparam STATE__JALR__0 = 8'h7a;
localparam STATE__JALR__1 = 8'h7b;
localparam STATE__JAL__0 = 8'h7c;
localparam STATE__JAL__1 = 8'h7d;
localparam STATE__BEQ__0 = 8'h7e;
localparam STATE__BEQ__1 = 8'h7f;
localparam STATE__BEQ__2 = 8'h80;
localparam STATE__BEQ__3 = 8'h81;
localparam STATE__BEQ__4 = 8'h82;
localparam STATE__BEQ__5 = 8'h83;
localparam STATE__BNE__0 = 8'h84;
localparam STATE__BNE__1 = 8'h85;
localparam STATE__BNE__2 = 8'h86;
localparam STATE__BNE__3 = 8'h87;
localparam STATE__BNE__4 = 8'h88;
localparam STATE__BNE__5 = 8'h89;
localparam STATE__BLT__0 = 8'h8a;
localparam STATE__BLT__1 = 8'h8b;
localparam STATE__BLT__2 = 8'h8c;
localparam STATE__BLT__3 = 8'h8d;
localparam STATE__BLT__4 = 8'h8e;
localparam STATE__BLT__5 = 8'h8f;
localparam STATE__BGE__0 = 8'h90;
localparam STATE__BGE__1 = 8'h91;
localparam STATE__BGE__2 = 8'h92;
localparam STATE__BGE__3 = 8'h93;
localparam STATE__BGE__4 = 8'h94;
localparam STATE__BGE__5 = 8'h95;
localparam STATE__BLTU__0 = 8'h96;
localparam STATE__BLTU__1 = 8'h97;
localparam STATE__BLTU__2 = 8'h98;
localparam STATE__BLTU__3 = 8'h99;
localparam STATE__BLTU__4 = 8'h9a;
localparam STATE__BLTU__5 = 8'h9b;
localparam STATE__BGEU__0 = 8'h9c;
localparam STATE__BGEU__1 = 8'h9d;
localparam STATE__BGEU__2 = 8'h9e;
localparam STATE__BGEU__3 = 8'h9f;
localparam STATE__BGEU__4 = 8'ha0;
localparam STATE__BGEU__5 = 8'ha1;
localparam STATE__ECALL = 8'ha2;
localparam STATE__EBREAK = 8'ha3;
localparam STATE__WFI = 8'ha4;
localparam STATE__FENCE = 8'ha5;
localparam STATE__FENCE_I = 8'ha6;
localparam STATE__CSRRW__0 = 8'ha7;
localparam STATE__CSRRW__1 = 8'ha8;
localparam STATE__CSRRW__2 = 8'ha9;
localparam STATE__CSRRS__0 = 8'haa;
localparam STATE__CSRRS__1 = 8'hab;
localparam STATE__CSRRS__2 = 8'hac;
localparam STATE__CSRRC__0 = 8'had;
localparam STATE__CSRRC__1 = 8'hae;
localparam STATE__CSRRC__2 = 8'haf;
localparam STATE__CSRRWI__0 = 8'hb0;
localparam STATE__CSRRWI__1 = 8'hb1;
localparam STATE__CSRRWI__2 = 8'hb2;
localparam STATE__CSRRSI__0 = 8'hb3;
localparam STATE__CSRRSI__1 = 8'hb4;
localparam STATE__CSRRSI__2 = 8'hb5;
localparam STATE__CSRRCI__0 = 8'hb6;
localparam STATE__CSRRCI__1 = 8'hb7;
localparam STATE__CSRRCI__2 = 8'hb8;
localparam STATE__MRET__0 = 8'hb9;
localparam STATE__MRET__1 = 8'hba;
localparam STATE__TRAP__0 = 8'hbb;
localparam STATE__TRAP__1 = 8'hbc;
localparam STATE__TRAP__2 = 8'hbd;
localparam STATE__EXCEPTION__INSTRUCTION_ADDRESS_MISALIGNED__0 = 8'hbe;
localparam STATE__EXCEPTION__INSTRUCTION_ADDRESS_MISALIGNED__0__JALR = 8'hbf;
localparam STATE__EXCEPTION__INSTRUCTION_ADDRESS_MISALIGNED__1 = 8'hc0;
localparam STATE__EXCEPTION__INSTRUCTION_ACCESS_FAULT__0 = 8'hc1;
localparam STATE__EXCEPTION__INSTRUCTION_ACCESS_FAULT__1 = 8'hc2;
localparam STATE__EXCEPTION__ILLEGAL_INSTRUCTION = 8'hc3;
localparam STATE__EXCEPTION__LOAD_ADDRESS_MISALIGNED__0 = 8'hc4;
localparam STATE__EXCEPTION__LOAD_ADDRESS_MISALIGNED__1 = 8'hc5;
localparam STATE__EXCEPTION__LOAD_ACCESS_FAULT__0 = 8'hc6;
localparam STATE__EXCEPTION__LOAD_ACCESS_FAULT__1 = 8'hc7;
localparam STATE__EXCEPTION__STORE_ADDRESS_MISALIGNED__0 = 8'hc8;
localparam STATE__EXCEPTION__STORE_ADDRESS_MISALIGNED__1 = 8'hc9;
localparam STATE__EXCEPTION__STORE_ACCESS_FAULT__0 = 8'hca;
localparam STATE__EXCEPTION__STORE_ACCESS_FAULT__1 = 8'hcb;
localparam STATE__INTERRUPT__SOFTWARE = 8'hcc;
localparam STATE__INTERRUPT__TIMER = 8'hcd;
localparam STATE__INTERRUPT__EXTERNAL = 8'hce;
localparam STATE__FATAL = 8'hcf;


always_comb begin
    state__n = state;
    ir__n = ir;
    pc__n = pc;
    a__n = a;
    b__n = b;
    func = 5'h0;
    rf__cs = 1'b0;
    rf__we = 1'b0;
    rf__addr = rd;
    rf__wr_data = c;
    cs = 1'b0;
    we = 1'b0;
    size = 2'h1;
    wr_data = rf__rd_data;
    csr__cs = 1'b0;
    csr__we = 1'b0;
    csr__addr = imm[11:0];
    csr__wr_data = c;
    instret = 1'b0;

    case (state)
        //==============================
        // STATE__RESET
        //==============================
        STATE__RESET:
        begin
            state__n = STATE__FETCH__0;
        end
        
        //==============================
        // STATE__FETCH__0
        //==============================
        STATE__FETCH__0:
        begin
            state__n = (mstatus__mie & mie__meie & mip__meip) ? STATE__INTERRUPT__EXTERNAL : (mstatus__mie & mie__msie & mip__msip) ? STATE__INTERRUPT__SOFTWARE : (mstatus__mie & mie__mtie & mip__mtip) ? STATE__INTERRUPT__TIMER : STATE__FETCH__1;
            state__n = STATE__FETCH__1;
        end

        //==============================
        // STATE__FETCH__1
        //==============================
        STATE__FETCH__1:
        begin
            cs = 1'b1;
            addr = pc;
            size = 2'h1;
            ir__n = rd_data[31:0];
            state__n = (ready & ~resp) ? STATE__DECODE : (ready & resp & (rd_data == 64'h0)) ? STATE__EXCEPTION__INSTRUCTION_ACCESS_FAULT__0 : STATE__FETCH__1;
        end

        //==============================
        // STATE__DECODE
        //==============================
        STATE__DECODE:
        begin
            case (op)
                6'h1:
                begin
                    state__n = STATE__LB__0;
                end
                6'h2:
                begin
                    state__n = STATE__LH__0;
                end
                6'h3:
                begin
                    state__n = STATE__LW__0;
                end
                6'h4:
                begin
                    state__n = STATE__LD__0;
                end
                6'h5:
                begin
                    state__n = STATE__LBU__0;
                end
                6'h6:
                begin
                    state__n = STATE__LHU__0;
                end
                6'h7:
                begin
                    state__n = STATE__LWU__0;
                end
                6'h8:
                begin
                    state__n = STATE__FENCE;
                end
                6'h9:
                begin
                    state__n = STATE__FENCE_I;
                end
                6'ha:
                begin
                    state__n = STATE__ADDI__0;
                end
                6'hb:
                begin
                    state__n = STATE__SLLI__0;
                end
                6'hc:
                begin
                    state__n = STATE__SLTI__0;
                end
                6'hd:
                begin
                    state__n = STATE__SLTIU__0;
                end
                6'he:
                begin
                    state__n = STATE__XORI__0;
                end
                6'hf:
                begin
                    state__n = STATE__SRLI__0;
                end
                6'h10:
                begin
                    state__n = STATE__SRAI__0;
                end
                6'h11:
                begin
                    state__n = STATE__ORI__0;
                end
                6'h12:
                begin
                    state__n = STATE__ANDI__0;
                end
                6'h13:
                begin
                    state__n = STATE__AUIPC__0;
                end
                6'h14:
                begin
                    state__n = STATE__ADDIW__0;
                end
                6'h15:
                begin
                    state__n = STATE__SLLIW__0;
                end
                6'h16:
                begin
                    state__n = STATE__SRLIW__0;
                end
                6'h17:
                begin
                    state__n = STATE__SRAIW__0;
                end
                6'h18:
                begin
                    state__n = STATE__SB__0;
                end
                6'h19:
                begin
                    state__n = STATE__SH__0;
                end
                6'h1a:
                begin
                    state__n = STATE__SW__0;
                end
                6'h1b:
                begin
                    state__n = STATE__SD__0;
                end
                6'h1c:
                begin
                    state__n = STATE__ADD__0;
                end
                6'h1d:
                begin
                    state__n = STATE__SUB__0;
                end
                6'h1e:
                begin
                    state__n = STATE__SLL__0;
                end
                6'h1f:
                begin
                    state__n = STATE__SLT__0;
                end
                6'h20:
                begin
                    state__n = STATE__SLTU__0;
                end
                6'h21:
                begin
                    state__n = STATE__XOR__0;
                end
                6'h22:
                begin
                    state__n = STATE__SRL__0;
                end
                6'h23:
                begin
                    state__n = STATE__SRA__0;
                end
                6'h24:
                begin
                    state__n = STATE__OR__0;
                end
                6'h25:
                begin
                    state__n = STATE__AND__0;
                end
                6'h26:
                begin
                    state__n = STATE__LUI;
                end
                6'h27:
                begin
                    state__n = STATE__ADDW__0;
                end
                6'h28:
                begin
                    state__n = STATE__SUBW__0;
                end
                6'h29:
                begin
                    state__n = STATE__SLLW__0;
                end
                6'h2a:
                begin
                    state__n = STATE__SRLW__0;
                end
                6'h2b:
                begin
                    state__n = STATE__SRAW__0;
                end
                6'h2c:
                begin
                    state__n = STATE__BEQ__0;
                end
                6'h2d:
                begin
                    state__n = STATE__BNE__0;
                end
                6'h2e:
                begin
                    state__n = STATE__BLT__0;
                end
                6'h2f:
                begin
                    state__n = STATE__BGE__0;
                end
                6'h30:
                begin
                    state__n = STATE__BLTU__0;
                end
                6'h31:
                begin
                    state__n = STATE__BGEU__0;
                end
                6'h32:
                begin
                    state__n = STATE__JALR__0;
                end
                6'h33:
                begin
                    state__n = STATE__JAL__0;
                end
                6'h34:
                begin
                    state__n = STATE__ECALL;
                end
                6'h35:
                begin
                    state__n = STATE__EBREAK;
                end
                6'h3d:
                begin
                    state__n = STATE__WFI;
                end
                6'h36:
                begin
                    state__n = STATE__CSRRW__0;
                end
                6'h37:
                begin
                    state__n = STATE__CSRRS__0;
                end
                6'h38:
                begin
                    state__n = STATE__CSRRC__0;
                end
                6'h39:
                begin
                    state__n = STATE__CSRRWI__0;
                end
                6'h3a:
                begin
                    state__n = STATE__CSRRSI__0;
                end
                6'h3b:
                begin
                    state__n = STATE__CSRRCI__0;
                end
                6'h3c:
                begin
                    state__n = STATE__MRET__0;
                end
                default:
                begin
                    state__n = STATE__EXCEPTION__ILLEGAL_INSTRUCTION;
                end
            endcase
        end

        //==============================
        // STATE__ADD__0
        //==============================
        STATE__ADD__0:
        begin
            rf__cs = 1'b1;
            rf__addr = rs1;
            a__n = rf__rd_data;
            state__n = STATE__ADD__1;
        end

        //==============================
        // STATE__ADD__1
        //==============================
        STATE__ADD__1:
        begin
            rf__cs = 1'b1;
            rf__addr = rs2;
            b__n = rf__rd_data;
            state__n = STATE__ADD__2;
        end

        //==============================
        // STATE__ADD__2
        //==============================
        STATE__ADD__2:
        begin
            func = 5'h0;
            rf__cs = 1'b1;
            rf__addr = rd;
            rf__we = 1'b1;
            rf__wr_data = c;
            pc__n = pc + 4;
            instret = 1'b1;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__SUB__0
        //==============================
        STATE__SUB__0:
        begin
            rf__cs = 1'b1;
            rf__addr = rs1;
            a__n = rf__rd_data;
            state__n = STATE__SUB__1;
        end

        //==============================
        // STATE__SUB__1
        //==============================
        STATE__SUB__1:
        begin
            rf__cs = 1'b1;
            rf__addr = rs2;
            b__n = rf__rd_data;
            state__n = STATE__SUB__2;
        end

        //==============================
        // STATE__SUB__2
        //==============================
        STATE__SUB__2:
        begin
            func = 5'h2;
            rf__cs = 1'b1;
            rf__addr = rd;
            rf__we = 1'b1;
            rf__wr_data = c;
            pc__n = pc + 4;
            instret = 1'b1;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__SLL__0
        //==============================
        STATE__SLL__0:
        begin
            rf__cs = 1'b1;
            rf__addr = rs1;
            a__n = rf__rd_data;
            state__n = STATE__SLL__1;
        end

        //==============================
        // STATE__SLL__1
        //==============================
        STATE__SLL__1:
        begin
            rf__cs = 1'b1;
            rf__addr = rs2;
            b__n = rf__rd_data;
            state__n = STATE__SLL__2;
        end

        //==============================
        // STATE__SLL__2
        //==============================
        STATE__SLL__2:
        begin
            func = 5'h4;
            rf__cs = 1'b1;
            rf__addr = rd;
            rf__we = 1'b1;
            rf__wr_data = c;
            pc__n = pc + 4;
            instret = 1'b1;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__SLT__0
        //==============================
        STATE__SLT__0:
        begin
            rf__cs = 1'b1;
            rf__addr = rs1;
            a__n = rf__rd_data;
            state__n = STATE__SLT__1;
        end

        //==============================
        // STATE__SLT__1
        //==============================
        STATE__SLT__1:
        begin
            rf__cs = 1'b1;
            rf__addr = rs2;
            b__n = rf__rd_data;
            state__n = STATE__SLT__2;
        end

        //==============================
        // STATE__SLT__2
        //==============================
        STATE__SLT__2:
        begin
            func = 5'h6;
            rf__cs = 1'b1;
            rf__addr = rd;
            rf__we = 1'b1;
            rf__wr_data = c;
            pc__n = pc + 4;
            instret = 1'b1;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__SLTU__0
        //==============================
        STATE__SLTU__0:
        begin
            rf__cs = 1'b1;
            rf__addr = rs1;
            a__n = rf__rd_data;
            state__n = STATE__SLTU__1;
        end

        //==============================
        // STATE__SLTU__1
        //==============================
        STATE__SLTU__1:
        begin
            rf__cs = 1'b1;
            rf__addr = rs2;
            b__n = rf__rd_data;
            state__n = STATE__SLTU__2;
        end

        //==============================
        // STATE__SLTU__2
        //==============================
        STATE__SLTU__2:
        begin
            func = 5'h7;
            rf__cs = 1'b1;
            rf__addr = rd;
            rf__we = 1'b1;
            rf__wr_data = c;
            pc__n = pc + 4;
            instret = 1'b1;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__XOR__0
        //==============================
        STATE__XOR__0:
        begin
            rf__cs = 1'b1;
            rf__addr = rs1;
            a__n = rf__rd_data;
            state__n = STATE__XOR__1;
        end

        //==============================
        // STATE__XOR__1
        //==============================
        STATE__XOR__1:
        begin
            rf__cs = 1'b1;
            rf__addr = rs2;
            b__n = rf__rd_data;
            state__n = STATE__XOR__2;
        end

        //==============================
        // STATE__XOR__2
        //==============================
        STATE__XOR__2:
        begin
            func = 5'h8;
            rf__cs = 1'b1;
            rf__addr = rd;
            rf__we = 1'b1;
            rf__wr_data = c;
            pc__n = pc + 4;
            instret = 1'b1;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__SRL__0
        //==============================
        STATE__SRL__0:
        begin
            rf__cs = 1'b1;
            rf__addr = rs1;
            a__n = rf__rd_data;
            state__n = STATE__SRL__1;
        end

        //==============================
        // STATE__SRL__1
        //==============================
        STATE__SRL__1:
        begin
            rf__cs = 1'b1;
            rf__addr = rs2;
            b__n = rf__rd_data;
            state__n = STATE__SRL__2;
        end

        //==============================
        // STATE__SRL__2
        //==============================
        STATE__SRL__2:
        begin
            func = 5'h9;
            rf__cs = 1'b1;
            rf__addr = rd;
            rf__we = 1'b1;
            rf__wr_data = c;
            pc__n = pc + 4;
            instret = 1'b1;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__SRA__0
        //==============================
        STATE__SRA__0:
        begin
            rf__cs = 1'b1;
            rf__addr = rs1;
            a__n = rf__rd_data;
            state__n = STATE__SRA__1;
        end

        //==============================
        // STATE__SRA__1
        //==============================
        STATE__SRA__1:
        begin
            rf__cs = 1'b1;
            rf__addr = rs2;
            b__n = rf__rd_data;
            state__n = STATE__SRA__2;
        end

        //==============================
        // STATE__SRA__2
        //==============================
        STATE__SRA__2:
        begin
            func = 5'hb;
            rf__cs = 1'b1;
            rf__addr = rd;
            rf__we = 1'b1;
            rf__wr_data = c;
            pc__n = pc + 4;
            instret = 1'b1;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__OR__0
        //==============================
        STATE__OR__0:
        begin
            rf__cs = 1'b1;
            rf__addr = rs1;
            a__n = rf__rd_data;
            state__n = STATE__OR__1;
        end

        //==============================
        // STATE__OR__1
        //==============================
        STATE__OR__1:
        begin
            rf__cs = 1'b1;
            rf__addr = rs2;
            b__n = rf__rd_data;
            state__n = STATE__OR__2;
        end

        //==============================
        // STATE__OR__2
        //==============================
        STATE__OR__2:
        begin
            func = 5'hd;
            rf__cs = 1'b1;
            rf__addr = rd;
            rf__we = 1'b1;
            rf__wr_data = c;
            pc__n = pc + 4;
            instret = 1'b1;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__AND__0
        //==============================
        STATE__AND__0:
        begin
            rf__cs = 1'b1;
            rf__addr = rs1;
            a__n = rf__rd_data;
            state__n = STATE__AND__1;
        end

        //==============================
        // STATE__AND__1
        //==============================
        STATE__AND__1:
        begin
            rf__cs = 1'b1;
            rf__addr = rs2;
            b__n = rf__rd_data;
            state__n = STATE__AND__2;
        end

        //==============================
        // STATE__AND__2
        //==============================
        STATE__AND__2:
        begin
            func = 5'he;
            rf__cs = 1'b1;
            rf__addr = rd;
            rf__we = 1'b1;
            rf__wr_data = c;
            pc__n = pc + 4;
            instret = 1'b1;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__ADDW__0
        //==============================
        STATE__ADDW__0:
        begin
            rf__cs = 1'b1;
            rf__addr = rs1;
            a__n = rf__rd_data;
            state__n = STATE__ADDW__1;
        end

        //==============================
        // STATE__ADDW__1
        //==============================
        STATE__ADDW__1:
        begin
            rf__cs = 1'b1;
            rf__addr = rs2;
            b__n = rf__rd_data;
            state__n = STATE__ADDW__2;
        end

        //==============================
        // STATE__ADDW__2
        //==============================
        STATE__ADDW__2:
        begin
            func = 5'h1;
            rf__cs = 1'b1;
            rf__addr = rd;
            rf__we = 1'b1;
            rf__wr_data = c;
            pc__n = pc + 4;
            instret = 1'b1;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__SUBW__0
        //==============================
        STATE__SUBW__0:
        begin
            rf__cs = 1'b1;
            rf__addr = rs1;
            a__n = rf__rd_data;
            state__n = STATE__SUBW__1;
        end

        //==============================
        // STATE__SUBW__1
        //==============================
        STATE__SUBW__1:
        begin
            rf__cs = 1'b1;
            rf__addr = rs2;
            b__n = rf__rd_data;
            state__n = STATE__SUBW__2;
        end

        //==============================
        // STATE__SUBW__2
        //==============================
        STATE__SUBW__2:
        begin
            func = 5'h3;
            rf__cs = 1'b1;
            rf__addr = rd;
            rf__we = 1'b1;
            rf__wr_data = c;
            pc__n = pc + 4;
            instret = 1'b1;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__SLLW__0
        //==============================
        STATE__SLLW__0:
        begin
            rf__cs = 1'b1;
            rf__addr = rs1;
            a__n = rf__rd_data;
            state__n = STATE__SLLW__1;
        end

        //==============================
        // STATE__SLLW__1
        //==============================
        STATE__SLLW__1:
        begin
            rf__cs = 1'b1;
            rf__addr = rs2;
            b__n = rf__rd_data;
            state__n = STATE__SLLW__2;
        end

        //==============================
        // STATE__SLLW__2
        //==============================
        STATE__SLLW__2:
        begin
            func = 5'h5;
            rf__cs = 1'b1;
            rf__addr = rd;
            rf__we = 1'b1;
            rf__wr_data = c;
            pc__n = pc + 4;
            instret = 1'b1;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__SRLW__0
        //==============================
        STATE__SRLW__0:
        begin
            rf__cs = 1'b1;
            rf__addr = rs1;
            a__n = rf__rd_data;
            state__n = STATE__SRLW__1;
        end

        //==============================
        // STATE__SRLW__1
        //==============================
        STATE__SRLW__1:
        begin
            rf__cs = 1'b1;
            rf__addr = rs2;
            b__n = rf__rd_data;
            state__n = STATE__SRLW__2;
        end

        //==============================
        // STATE__SRLW__2
        //==============================
        STATE__SRLW__2:
        begin
            func = 5'ha;
            rf__cs = 1'b1;
            rf__addr = rd;
            rf__we = 1'b1;
            rf__wr_data = c;
            pc__n = pc + 4;
            instret = 1'b1;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__SRAW__0
        //==============================
        STATE__SRAW__0:
        begin
            rf__cs = 1'b1;
            rf__addr = rs1;
            a__n = rf__rd_data;
            state__n = STATE__SRAW__1;
        end

        //==============================
        // STATE__SRAW__1
        //==============================
        STATE__SRAW__1:
        begin
            rf__cs = 1'b1;
            rf__addr = rs2;
            b__n = rf__rd_data;
            state__n = STATE__SRAW__2;
        end

        //==============================
        // STATE__SRAW__2
        //==============================
        STATE__SRAW__2:
        begin
            func = 5'hc;
            rf__cs = 1'b1;
            rf__addr = rd;
            rf__we = 1'b1;
            rf__wr_data = c;
            pc__n = pc + 4;
            instret = 1'b1;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__ADDI__0
        //==============================
        STATE__ADDI__0:
        begin
            rf__cs = 1'b1;
            rf__addr = rs1;
            a__n = rf__rd_data;
            b__n = imm;
            state__n = STATE__ADDI__1;
        end

        //==============================
        // STATE__ADDI__1
        //==============================
        STATE__ADDI__1:
        begin
            func = 5'h0;
            rf__cs = 1'b1;
            rf__addr = rd;
            rf__we = 1'b1;
            rf__wr_data = c;
            pc__n = pc + 4;
            instret = 1'b1;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__SLLI__0
        //==============================
        STATE__SLLI__0:
        begin
            rf__cs = 1'b1;
            rf__addr = rs1;
            a__n = rf__rd_data;
            b__n = imm;
            state__n = STATE__SLLI__1;
        end

        //==============================
        // STATE__SLLI__1
        //==============================
        STATE__SLLI__1:
        begin
            func = 5'h4;
            rf__cs = 1'b1;
            rf__addr = rd;
            rf__we = 1'b1;
            rf__wr_data = c;
            pc__n = pc + 4;
            instret = 1'b1;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__SLTI__0
        //==============================
        STATE__SLTI__0:
        begin
            rf__cs = 1'b1;
            rf__addr = rs1;
            a__n = rf__rd_data;
            b__n = imm;
            state__n = STATE__SLTI__1;
        end

        //==============================
        // STATE__SLTI__1
        //==============================
        STATE__SLTI__1:
        begin
            func = 5'h6;
            rf__cs = 1'b1;
            rf__addr = rd;
            rf__we = 1'b1;
            rf__wr_data = c;
            pc__n = pc + 4;
            instret = 1'b1;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__SLTIU__0
        //==============================
        STATE__SLTIU__0:
        begin
            rf__cs = 1'b1;
            rf__addr = rs1;
            a__n = rf__rd_data;
            b__n = imm;
            state__n = STATE__SLTIU__1;
        end

        //==============================
        // STATE__SLTIU__1
        //==============================
        STATE__SLTIU__1:
        begin
            func = 5'h7;
            rf__cs = 1'b1;
            rf__addr = rd;
            rf__we = 1'b1;
            rf__wr_data = c;
            pc__n = pc + 4;
            instret = 1'b1;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__XORI__0
        //==============================
        STATE__XORI__0:
        begin
            rf__cs = 1'b1;
            rf__addr = rs1;
            a__n = rf__rd_data;
            b__n = imm;
            state__n = STATE__XORI__1;
        end

        //==============================
        // STATE__XORI__1
        //==============================
        STATE__XORI__1:
        begin
            func = 5'h8;
            rf__cs = 1'b1;
            rf__addr = rd;
            rf__we = 1'b1;
            rf__wr_data = c;
            pc__n = pc + 4;
            instret = 1'b1;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__SRLI__0
        //==============================
        STATE__SRLI__0:
        begin
            rf__cs = 1'b1;
            rf__addr = rs1;
            a__n = rf__rd_data;
            b__n = imm;
            state__n = STATE__SRLI__1;
        end

        //==============================
        // STATE__SRLI__1
        //==============================
        STATE__SRLI__1:
        begin
            func = 5'h9;
            rf__cs = 1'b1;
            rf__addr = rd;
            rf__we = 1'b1;
            rf__wr_data = c;
            pc__n = pc + 4;
            instret = 1'b1;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__SRAI__0
        //==============================
        STATE__SRAI__0:
        begin
            rf__cs = 1'b1;
            rf__addr = rs1;
            a__n = rf__rd_data;
            b__n = imm;
            state__n = STATE__SRAI__1;
        end

        //==============================
        // STATE__SRAI__1
        //==============================
        STATE__SRAI__1:
        begin
            func = 5'hb;
            rf__cs = 1'b1;
            rf__addr = rd;
            rf__we = 1'b1;
            rf__wr_data = c;
            pc__n = pc + 4;
            instret = 1'b1;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__ORI__0
        //==============================
        STATE__ORI__0:
        begin
            rf__cs = 1'b1;
            rf__addr = rs1;
            a__n = rf__rd_data;
            b__n = imm;
            state__n = STATE__ORI__1;
        end

        //==============================
        // STATE__ORI__1
        //==============================
        STATE__ORI__1:
        begin
            func = 5'hd;
            rf__cs = 1'b1;
            rf__addr = rd;
            rf__we = 1'b1;
            rf__wr_data = c;
            pc__n = pc + 4;
            instret = 1'b1;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__ANDI__0
        //==============================
        STATE__ANDI__0:
        begin
            rf__cs = 1'b1;
            rf__addr = rs1;
            a__n = rf__rd_data;
            b__n = imm;
            state__n = STATE__ANDI__1;
        end

        //==============================
        // STATE__ANDI__1
        //==============================
        STATE__ANDI__1:
        begin
            func = 5'he;
            rf__cs = 1'b1;
            rf__addr = rd;
            rf__we = 1'b1;
            rf__wr_data = c;
            pc__n = pc + 4;
            instret = 1'b1;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__ADDIW__0
        //==============================
        STATE__ADDIW__0:
        begin
            rf__cs = 1'b1;
            rf__addr = rs1;
            a__n = rf__rd_data;
            b__n = imm;
            state__n = STATE__ADDIW__1;
        end

        //==============================
        // STATE__ADDIW__1
        //==============================
        STATE__ADDIW__1:
        begin
            func = 5'h1;
            rf__cs = 1'b1;
            rf__addr = rd;
            rf__we = 1'b1;
            rf__wr_data = c;
            pc__n = pc + 4;
            instret = 1'b1;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__SLLIW__0
        //==============================
        STATE__SLLIW__0:
        begin
            rf__cs = 1'b1;
            rf__addr = rs1;
            a__n = rf__rd_data;
            b__n = imm;
            state__n = STATE__SLLIW__1;
        end

        //==============================
        // STATE__SLLIW__1
        //==============================
        STATE__SLLIW__1:
        begin
            func = 5'h5;
            rf__cs = 1'b1;
            rf__addr = rd;
            rf__we = 1'b1;
            rf__wr_data = c;
            pc__n = pc + 4;
            instret = 1'b1;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__SRLIW__0
        //==============================
        STATE__SRLIW__0:
        begin
            rf__cs = 1'b1;
            rf__addr = rs1;
            a__n = rf__rd_data;
            b__n = imm;
            state__n = STATE__SRLIW__1;
        end

        //==============================
        // STATE__SRLIW__1
        //==============================
        STATE__SRLIW__1:
        begin
            func = 5'ha;
            rf__cs = 1'b1;
            rf__addr = rd;
            rf__we = 1'b1;
            rf__wr_data = c;
            pc__n = pc + 4;
            instret = 1'b1;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__SRAIW__0
        //==============================
        STATE__SRAIW__0:
        begin
            rf__cs = 1'b1;
            rf__addr = rs1;
            a__n = rf__rd_data;
            b__n = imm;
            state__n = STATE__SRAIW__1;
        end

        //==============================
        // STATE__SRAIW__1
        //==============================
        STATE__SRAIW__1:
        begin
            func = 5'hc;
            rf__cs = 1'b1;
            rf__addr = rd;
            rf__we = 1'b1;
            rf__wr_data = c;
            pc__n = pc + 4;
            instret = 1'b1;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__LB__0
        //==============================
        STATE__LB__0:
        begin
            rf__cs = 1'b1;
            rf__addr = rs1;
            a__n = rf__rd_data;
            b__n = imm;
            state__n = STATE__LB__1;
        end

        //==============================
        // STATE__LB__1
        //==============================
        STATE__LB__1:
        begin
            func = 5'h0;
            cs = 1'b1;
            addr = c;
            size = 2'h3;
            rf__cs = 1'b1;
            rf__addr = rd;
            rf__we = ready & ~resp;
            rf__wr_data = {{56{rd_data[7]}}, rd_data[7:0]};
            state__n = (ready & ~resp) ? STATE__LB__2 : (ready & resp & (rd_data == 64'h0)) ? STATE__EXCEPTION__LOAD_ACCESS_FAULT__0 : (ready & resp & (rd_data == 64'h1)) ? STATE__EXCEPTION__LOAD_ADDRESS_MISALIGNED__0 : STATE__LB__1;
        end

        //==============================
        // STATE__LB__2
        //==============================
        STATE__LB__2:
        begin
            pc__n = pc + 4;
            instret = 1'b1;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__LH__0
        //==============================
        STATE__LH__0:
        begin
            rf__cs = 1'b1;
            rf__addr = rs1;
            a__n = rf__rd_data;
            b__n = imm;
            state__n = STATE__LH__1;
        end

        //==============================
        // STATE__LH__1
        //==============================
        STATE__LH__1:
        begin
            func = 5'h0;
            cs = 1'b1;
            addr = c;
            size = 2'h2;
            rf__cs = 1'b1;
            rf__addr = rd;
            rf__we = ready & ~resp;
            rf__wr_data = {{48{rd_data[15]}}, rd_data[15:0]};
            state__n = (ready & ~resp) ? STATE__LH__2 : (ready & resp & (rd_data == 64'h0)) ? STATE__EXCEPTION__LOAD_ACCESS_FAULT__0 : (ready & resp & (rd_data == 64'h1)) ? STATE__EXCEPTION__LOAD_ADDRESS_MISALIGNED__0 : STATE__LH__1;
        end

        //==============================
        // STATE__LH__2
        //==============================
        STATE__LH__2:
        begin
            pc__n = pc + 4;
            instret = 1'b1;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__LW__0
        //==============================
        STATE__LW__0:
        begin
            rf__cs = 1'b1;
            rf__addr = rs1;
            a__n = rf__rd_data;
            b__n = imm;
            state__n = STATE__LW__1;
        end

        //==============================
        // STATE__LW__1
        //==============================
        STATE__LW__1:
        begin
            func = 5'h0;
            cs = 1'b1;
            addr = c;
            size = 2'h1;
            rf__cs = 1'b1;
            rf__addr = rd;
            rf__we = ready & ~resp;
            rf__wr_data = {{32{rd_data[31]}}, rd_data[31:0]};
            state__n = (ready & ~resp) ? STATE__LW__2 : (ready & resp & (rd_data == 64'h0)) ? STATE__EXCEPTION__LOAD_ACCESS_FAULT__0 : (ready & resp & (rd_data == 64'h1)) ? STATE__EXCEPTION__LOAD_ADDRESS_MISALIGNED__0 : STATE__LW__1;
        end

        //==============================
        // STATE__LW__2
        //==============================
        STATE__LW__2:
        begin
            pc__n = pc + 4;
            instret = 1'b1;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__LD__0
        //==============================
        STATE__LD__0:
        begin
            rf__cs = 1'b1;
            rf__addr = rs1;
            a__n = rf__rd_data;
            b__n = imm;
            state__n = STATE__LD__1;
        end

        //==============================
        // STATE__LD__1
        //==============================
        STATE__LD__1:
        begin
            func = 5'h0;
            cs = 1'b1;
            addr = c;
            size = 2'h0;
            rf__cs = 1'b1;
            rf__addr = rd;
            rf__we = ready & ~resp;
            rf__wr_data = rd_data;
            state__n = (ready & ~resp) ? STATE__LD__2 : (ready & resp & (rd_data == 64'h0)) ? STATE__EXCEPTION__LOAD_ACCESS_FAULT__0 : (ready & resp & (rd_data == 64'h1)) ? STATE__EXCEPTION__LOAD_ADDRESS_MISALIGNED__0 : STATE__LD__1;
        end

        //==============================
        // STATE__LD__2
        //==============================
        STATE__LD__2:
        begin
            pc__n = pc + 4;
            instret = 1'b1;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__LBU__0
        //==============================
        STATE__LBU__0:
        begin
            rf__cs = 1'b1;
            rf__addr = rs1;
            a__n = rf__rd_data;
            b__n = imm;
            state__n = STATE__LBU__1;
        end

        //==============================
        // STATE__LBU__1
        //==============================
        STATE__LBU__1:
        begin
            func = 5'h0;
            cs = 1'b1;
            addr = c;
            size = 2'h3;
            rf__cs = 1'b1;
            rf__addr = rd;
            rf__we = ready & ~resp;
            rf__wr_data = {56'h0, rd_data[7:0]};
            state__n = (ready & ~resp) ? STATE__LBU__2 : (ready & resp & (rd_data == 64'h0)) ? STATE__EXCEPTION__LOAD_ACCESS_FAULT__0 : (ready & resp & (rd_data == 64'h1)) ? STATE__EXCEPTION__LOAD_ADDRESS_MISALIGNED__0 : STATE__LBU__1;
        end

        //==============================
        // STATE__LBU__2
        //==============================
        STATE__LBU__2:
        begin
            pc__n = pc + 4;
            instret = 1'b1;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__LHU__0
        //==============================
        STATE__LHU__0:
        begin
            rf__cs = 1'b1;
            rf__addr = rs1;
            a__n = rf__rd_data;
            b__n = imm;
            state__n = STATE__LHU__1;
        end

        //==============================
        // STATE__LHU__1
        //==============================
        STATE__LHU__1:
        begin
            func = 5'h0;
            cs = 1'b1;
            addr = c;
            size = 2'h2;
            rf__cs = 1'b1;
            rf__addr = rd;
            rf__we = ready & ~resp;
            rf__wr_data = {48'h0, rd_data[15:0]};
            state__n = (ready & ~resp) ? STATE__LHU__2 : (ready & resp & (rd_data == 64'h0)) ? STATE__EXCEPTION__LOAD_ACCESS_FAULT__0 : (ready & resp & (rd_data == 64'h1)) ? STATE__EXCEPTION__LOAD_ADDRESS_MISALIGNED__0 : STATE__LHU__1;
        end

        //==============================
        // STATE__LHU__2
        //==============================
        STATE__LHU__2:
        begin
            pc__n = pc + 4;
            instret = 1'b1;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__LWU__0
        //==============================
        STATE__LWU__0:
        begin
            rf__cs = 1'b1;
            rf__addr = rs1;
            a__n = rf__rd_data;
            b__n = imm;
            state__n = STATE__LWU__1;
        end

        //==============================
        // STATE__LWU__1
        //==============================
        STATE__LWU__1:
        begin
            func = 5'h0;
            cs = 1'b1;
            addr = c;
            size = 2'h1;
            rf__cs = 1'b1;
            rf__addr = rd;
            rf__we = ready & ~resp;
            rf__wr_data = {32'h0, rd_data[31:0]};
            state__n = (ready & ~resp) ? STATE__LWU__2 : (ready & resp & (rd_data == 64'h0)) ? STATE__EXCEPTION__LOAD_ACCESS_FAULT__0 : (ready & resp & (rd_data == 64'h1)) ? STATE__EXCEPTION__LOAD_ADDRESS_MISALIGNED__0 : STATE__LWU__1;
        end

        //==============================
        // STATE__LWU__2
        //==============================
        STATE__LWU__2:
        begin
            pc__n = pc + 4;
            instret = 1'b1;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__SB__0
        //==============================
        STATE__SB__0:
        begin
            rf__cs = 1'b1;
            rf__addr = rs1;
            a__n = rf__rd_data;
            b__n = imm;
            state__n = STATE__SB__1;
        end

        //==============================
        // STATE__SB__1
        //==============================
        STATE__SB__1:
        begin
            func = 5'h0;
            rf__cs = 1'b1;
            rf__addr = rs2;
            cs = 1'b1;
            we = 1'b1;
            addr = c;
            size = 2'h3;
            wr_data = rf__rd_data;
            state__n = (ready & ~resp) ? STATE__SB__2 : (ready & resp & (rd_data == 64'h0)) ? STATE__EXCEPTION__STORE_ACCESS_FAULT__0 : (ready & resp & (rd_data == 64'h1)) ? STATE__EXCEPTION__STORE_ADDRESS_MISALIGNED__0 : STATE__SB__1;
        end


        //==============================
        // STATE__SB__2
        //==============================
        STATE__SB__2:
        begin
            pc__n = pc + 4;
            instret = 1'b1;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__SH__0
        //==============================
        STATE__SH__0:
        begin
            rf__cs = 1'b1;
            rf__addr = rs1;
            a__n = rf__rd_data;
            b__n = imm;
            state__n = STATE__SH__1;
        end

        //==============================
        // STATE__SH__1
        //==============================
        STATE__SH__1:
        begin
            func = 5'h0;
            rf__cs = 1'b1;
            rf__addr = rs2;
            cs = 1'b1;
            we = 1'b1;
            addr = c;
            size = 2'h2;
            wr_data = rf__rd_data;
            state__n = (ready & ~resp) ? STATE__SH__2 : (ready & resp & (rd_data == 64'h0)) ? STATE__EXCEPTION__STORE_ACCESS_FAULT__0 : (ready & resp & (rd_data == 64'h1)) ? STATE__EXCEPTION__STORE_ADDRESS_MISALIGNED__0 : STATE__SH__1;
        end

        //==============================
        // STATE__SH__2
        //==============================
        STATE__SH__2:
        begin
            pc__n = pc + 4;
            instret = 1'b1;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__SW__0
        //==============================
        STATE__SW__0:
        begin
            rf__cs = 1'b1;
            rf__addr = rs1;
            a__n = rf__rd_data;
            b__n = imm;
            state__n = STATE__SW__1;
        end

        //==============================
        // STATE__SW__1
        //==============================
        STATE__SW__1:
        begin
            func = 5'h0;
            rf__cs = 1'b1;
            rf__addr = rs2;
            cs = 1'b1;
            we = 1'b1;
            addr = c;
            size = 2'h1;
            wr_data = rf__rd_data;
            state__n = (ready & ~resp) ? STATE__SW__2 : (ready & resp & (rd_data == 64'h0)) ? STATE__EXCEPTION__STORE_ACCESS_FAULT__0 : (ready & resp & (rd_data == 64'h1)) ? STATE__EXCEPTION__STORE_ADDRESS_MISALIGNED__0 : STATE__SW__1;
        end

        //==============================
        // STATE__SW__2
        //==============================
        STATE__SW__2:
        begin
            pc__n = pc + 4;
            instret = 1'b1;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__SD__0
        //==============================
        STATE__SD__0:
        begin
            rf__cs = 1'b1;
            rf__addr = rs1;
            a__n = rf__rd_data;
            b__n = imm;
            state__n = STATE__SD__1;
        end

        //==============================
        // STATE__SD__1
        //==============================
        STATE__SD__1:
        begin
            func = 5'h0;
            rf__cs = 1'b1;
            rf__addr = rs2;
            cs = 1'b1;
            we = 1'b1;
            addr = c;
            size = 2'h0;
            wr_data = rf__rd_data;
            state__n = (ready & ~resp) ? STATE__SD__2 : (ready & resp & (rd_data == 64'h0)) ? STATE__EXCEPTION__STORE_ACCESS_FAULT__0 : (ready & resp & (rd_data == 64'h1)) ? STATE__EXCEPTION__STORE_ADDRESS_MISALIGNED__0 : STATE__SD__1;
        end

        //==============================
        // STATE__SD__2
        //==============================
        STATE__SD__2:
        begin
            pc__n = pc + 4;
            instret = 1'b1;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__AUIPC__0
        //==============================
        STATE__AUIPC__0:
        begin
            a__n = pc;
            b__n = imm;
            state__n = STATE__AUIPC__1;
        end

        //==============================
        // STATE__AUIPC__1
        //==============================
        STATE__AUIPC__1:
        begin
            func = 5'h0;
            rf__cs = 1'b1;
            rf__addr = rd;
            rf__we = 1'b1;
            rf__wr_data = c;
            pc__n = pc + 4;
            instret = 1'b1;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__JALR__0
        //==============================
        STATE__JALR__0:
        begin
            rf__cs = 1'b1;
            rf__addr = rs1;
            a__n = rf__rd_data;  
            b__n = imm;  
            //state__n = ((rf__rd_data[1:0] == 2'b00) && (imm[1:0] == 2'b10)) || ((rf__rd_data[1:0] == 2'b00) && (imm[1:0] == 2'b11)) || ((rf__rd_data[1:0] == 2'b01) && (imm[1:0] == 2'b01)) || ((rf__rd_data[1:0] == 2'b01) && (imm[1:0] == 2'b10)) ||((rf__rd_data[1:0] == 2'b10) && (imm[1:0] == 2'b00)) ||((rf__rd_data[1:0] == 2'b10) && (imm[1:0] == 2'b01)) || ((rf__rd_data[1:0] == 2'b11) && (imm[1:0] == 2'b00)) || ((rf__rd_data[1:0] == 2'b11) && (imm[1:0] == 2'b11)) ? STATE__EXCEPTION__INSTRUCTION_ADDRESS_MISALIGNED__0__JALR : STATE__JALR__1;
            state__n = (rf__rd_data[1:0] + imm[1:0] == 2'b10) || (rf__rd_data[1:0] + imm[1:0] == 2'b11) ? STATE__EXCEPTION__INSTRUCTION_ADDRESS_MISALIGNED__0__JALR : STATE__JALR__1;
        end

        //==============================
        // STATE__JALR__1
        //==============================
        STATE__JALR__1:
        begin
            func = 5'h0;
            rf__cs = 1'b1;
            rf__addr = rd;
            rf__we = 1'b1;     
            rf__wr_data = pc + 4;
            pc__n = {c[63:1], 1'b0};
            instret = 1'b1;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__JAL__0
        //==============================
        STATE__JAL__0:
        begin
            a__n = pc;
            b__n = imm;
            state__n = (imm[1:0] != 2'h0) ? STATE__EXCEPTION__INSTRUCTION_ADDRESS_MISALIGNED__0 : STATE__JAL__1;
        end

        //==============================
        // STATE__JAL__1
        //==============================
        STATE__JAL__1:
        begin
            func = 5'h0;
            rf__cs = 1'b1;
            rf__addr = rd;
            rf__we = 1'b1;     
            rf__wr_data = pc + 4;
            pc__n = c;
            instret = 1'b1;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__BEQ__0
        //==============================
        STATE__BEQ__0:
        begin
            rf__cs = 1'b1;
            rf__addr = rs1;
            a__n = rf__rd_data;
            state__n = STATE__BEQ__1;
        end

        //==============================
        // STATE__BEQ__1
        //==============================
        STATE__BEQ__1:
        begin
            rf__cs = 1'b1;
            rf__addr = rs2;
            b__n = rf__rd_data;
            state__n = STATE__BEQ__2;
        end

        //==============================
        // STATE__BEQ__2
        //==============================
        STATE__BEQ__2:
        begin
            state__n = eq ? STATE__BEQ__4 : STATE__BEQ__3; 
        end

        //==============================
        // STATE__BEQ__3
        //==============================
        STATE__BEQ__3:
        begin
            pc__n = pc + 4;  
            instret = 1'b1;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__BEQ__4
        //==============================
        STATE__BEQ__4:
        begin
            a__n = pc;
            b__n = imm;
            state__n = (imm[1:0] != 2'h0) ? STATE__EXCEPTION__INSTRUCTION_ADDRESS_MISALIGNED__0 : STATE__BEQ__5;
        end

        //==============================
        // STATE__BEQ__5
        //==============================
        STATE__BEQ__5:
        begin
            func = 5'h0;
            pc__n = c;
            instret = 1'b1;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__BNE__0
        //==============================
        STATE__BNE__0:
        begin
            rf__cs = 1'b1;
            rf__addr = rs1;
            a__n = rf__rd_data;
            state__n = STATE__BNE__1;
        end

        //==============================
        // STATE__BNE__1
        //==============================
        STATE__BNE__1:
        begin
            rf__cs = 1'b1;
            rf__addr = rs2;
            b__n = rf__rd_data;
            state__n = STATE__BNE__2;
        end

        //==============================
        // STATE__BNE__2
        //==============================
        STATE__BNE__2:
        begin
            state__n = ne ? STATE__BNE__4 : STATE__BNE__3; 
        end

        //==============================
        // STATE__BNE__3
        //==============================
        STATE__BNE__3:
        begin
            pc__n = pc + 4;  
            instret = 1'b1;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__BNE__4
        //==============================
        STATE__BNE__4:
        begin
            a__n = pc;
            b__n = imm;
            state__n = (imm[1:0] != 2'h0) ? STATE__EXCEPTION__INSTRUCTION_ADDRESS_MISALIGNED__0 : STATE__BNE__5;
        end

        //==============================
        // STATE__BNE__5
        //==============================
        STATE__BNE__5:
        begin
            func = 5'h0;
            pc__n = c;
            instret = 1'b1;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__BLT__0
        //==============================
        STATE__BLT__0:
        begin
            rf__cs = 1'b1;
            rf__addr = rs1;
            a__n = rf__rd_data;
            state__n = STATE__BLT__1;
        end

        //==============================
        // STATE__BLT__1
        //==============================
        STATE__BLT__1:
        begin
            rf__cs = 1'b1;
            rf__addr = rs2;
            b__n = rf__rd_data;
            state__n = STATE__BLT__2;
        end

        //==============================
        // STATE__BLT__2
        //==============================
        STATE__BLT__2:
        begin
            state__n = lt ? STATE__BLT__4 : STATE__BLT__3; 
        end

        //==============================
        // STATE__BLT__3
        //==============================
        STATE__BLT__3:
        begin
            pc__n = pc + 4;  
            instret = 1'b1;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__BLT__4
        //==============================
        STATE__BLT__4:
        begin
            a__n = pc;
            b__n = imm;
            state__n = (imm[1:0] != 2'h0) ? STATE__EXCEPTION__INSTRUCTION_ADDRESS_MISALIGNED__0 : STATE__BLT__5;
        end

        //==============================
        // STATE__BLT__5
        //==============================
        STATE__BLT__5:
        begin
            func = 5'h0;
            pc__n = c;
            instret = 1'b1;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__BGE__0
        //==============================
        STATE__BGE__0:
        begin
            rf__cs = 1'b1;
            rf__addr = rs1;
            a__n = rf__rd_data;
            state__n = STATE__BGE__1;
        end

        //==============================
        // STATE__BGE__1
        //==============================
        STATE__BGE__1:
        begin
            rf__cs = 1'b1;
            rf__addr = rs2;
            b__n = rf__rd_data;
            state__n = STATE__BGE__2;
        end

        //==============================
        // STATE__BGE__2
        //==============================
        STATE__BGE__2:
        begin
            state__n = ge ? STATE__BGE__4 : STATE__BGE__3; 
        end

        //==============================
        // STATE__BGE__3
        //==============================
        STATE__BGE__3:
        begin
            pc__n = pc + 4;  
            instret = 1'b1;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__BGE__4
        //==============================
        STATE__BGE__4:
        begin
            a__n = pc;
            b__n = imm;
            state__n = (imm[1:0] != 2'h0) ? STATE__EXCEPTION__INSTRUCTION_ADDRESS_MISALIGNED__0 : STATE__BGE__5;
        end

        //==============================
        // STATE__BGE__5
        //==============================
        STATE__BGE__5:
        begin
            func = 5'h0;
            pc__n = c;
            instret = 1'b1;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__BLTU__0
        //==============================
        STATE__BLTU__0:
        begin
            rf__cs = 1'b1;
            rf__addr = rs1;
            a__n = rf__rd_data;
            state__n = STATE__BLTU__1;
        end

        //==============================
        // STATE__BLTU__1
        //==============================
        STATE__BLTU__1:
        begin
            rf__cs = 1'b1;
            rf__addr = rs2;
            b__n = rf__rd_data;
            state__n = STATE__BLTU__2;
        end

        //==============================
        // STATE__BLTU__2
        //==============================
        STATE__BLTU__2:
        begin
            state__n = ltu ? STATE__BLTU__4 : STATE__BLTU__3; 
        end

        //==============================
        // STATE__BLTU__3
        //==============================
        STATE__BLTU__3:
        begin
            pc__n = pc + 4;  
            instret = 1'b1;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__BLTU__4
        //==============================
        STATE__BLTU__4:
        begin
            a__n = pc;
            b__n = imm;
            state__n = (imm[1:0] != 2'h0) ? STATE__EXCEPTION__INSTRUCTION_ADDRESS_MISALIGNED__0 : STATE__BLTU__5;
        end

        //==============================
        // STATE__BLTU__5
        //==============================
        STATE__BLTU__5:
        begin
            func = 5'h0;
            pc__n = c;
            instret = 1'b1;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__BGEU__0
        //==============================
        STATE__BGEU__0:
        begin
            rf__cs = 1'b1;
            rf__addr = rs1;
            a__n = rf__rd_data;
            state__n = STATE__BGEU__1;
        end

        //==============================
        // STATE__BGEU__1
        //==============================
        STATE__BGEU__1:
        begin
            rf__cs = 1'b1;
            rf__addr = rs2;
            b__n = rf__rd_data;
            state__n = STATE__BGEU__2;
        end

        //==============================
        // STATE__BGEU__2
        //==============================
        STATE__BGEU__2:
        begin
            state__n = geu ? STATE__BGEU__4 : STATE__BGEU__3; 
        end

        //==============================
        // STATE__BGEU__3
        //==============================
        STATE__BGEU__3:
        begin
            pc__n = pc + 4;  
            instret = 1'b1;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__BGEU__4
        //==============================
        STATE__BGEU__4:
        begin
            a__n = pc;
            b__n = imm;
            state__n = (imm[1:0] != 2'h0) ? STATE__EXCEPTION__INSTRUCTION_ADDRESS_MISALIGNED__0 : STATE__BGEU__5;
        end

        //==============================
        // STATE__BGEU__5
        //==============================
        STATE__BGEU__5:
        begin
            func = 5'h0;
            pc__n = c;
            instret = 1'b1;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__ECALL
        //==============================
        STATE__ECALL:
        begin
            csr__cs = 1'b1;
            csr__addr = 12'h342;
            csr__we = 1'b1;
            csr__wr_data = csr__rd_data;
            csr__wr_data[62:0] = 63'hb;
            csr__wr_data[63] = 1'b0;
            state__n = STATE__TRAP__0;
        end

        //==============================
        // STATE__EBREAK
        //==============================
        STATE__EBREAK:
        begin
            csr__cs = 1'b1;
            csr__addr = 12'h342;
            csr__we = 1'b1;
            csr__wr_data = csr__rd_data;
            csr__wr_data[62:0] = 63'h3;
            csr__wr_data[63] = 1'b0;
            state__n = STATE__TRAP__0;
        end

        //==============================
        // STATE__WFI
        //==============================
        STATE__WFI:
        begin
            pc__n = pc + 4;
            instret = 1'b1;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__FENCE
        //==============================
        STATE__FENCE:
        begin
            pc__n = pc + 4;
            instret = 1'b1;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__FENCE_I
        //==============================
        STATE__FENCE_I:
        begin
            pc__n = pc + 4;
            instret = 1'b1;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__LUI
        //==============================
        STATE__LUI:
        begin
            rf__cs = 1'b1;
            rf__addr = rd;
            rf__we = 1'b1;
            rf__wr_data = imm;
            pc__n = pc + 4;
            instret = 1'b1;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__CSRRW__0
        //==============================
        STATE__CSRRW__0:
        begin
            rf__cs = 1'b1;
            rf__addr = rs1;
            a__n = rf__rd_data;
            csr__cs = 1'b1;
            csr__addr = imm[11:0];
            b__n = csr__rd_data;
            state__n = (imm[11:10] == 2'h3) ? STATE__EXCEPTION__ILLEGAL_INSTRUCTION : (rd == 5'h0) ? STATE__CSRRW__2 : STATE__CSRRW__1; 
        end

        //==============================
        // STATE__CSRRW__1
        //==============================
        STATE__CSRRW__1:
        begin
            func = 5'h11;
            rf__cs = 1'b1;
            rf__addr = rd;
            rf__we = 1'b1;
            rf__wr_data = c;
            state__n = STATE__CSRRW__2;
        end

        //==============================
        // STATE__CSRRW__2
        //==============================
        STATE__CSRRW__2:
        begin
            func = 5'h10;
            csr__cs = 1'b1;
            csr__addr = imm[11:0];
            csr__we = 1'b1;
            csr__wr_data = c;
            pc__n = pc + 4;
            instret = 1'b1;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__CSRRS__0
        //==============================
        STATE__CSRRS__0:
        begin
            rf__cs = 1'b1;
            rf__addr = rs1;
            a__n = rf__rd_data;
            csr__cs = 1'b1;
            csr__addr = imm[11:0];
            b__n = csr__rd_data;
            state__n = (rs1 == 5'h0) ? STATE__CSRRS__2 : (imm[11:10] == 2'h3) ? STATE__EXCEPTION__ILLEGAL_INSTRUCTION : STATE__CSRRS__1; 
        end

        //==============================
        // STATE__CSRRS__1
        //==============================
        STATE__CSRRS__1:
        begin
            func = 5'hd;
            csr__cs = 1'b1;
            csr__addr = imm[11:0];
            csr__we = 1'b1;
            csr__wr_data = c;
            state__n = STATE__CSRRS__2;
        end

        //==============================
        // STATE__CSRRS__2
        //==============================
        STATE__CSRRS__2:
        begin
            func = 5'h11;
            rf__cs = 1'b1;
            rf__addr = rd;
            rf__we = 1'b1;
            rf__wr_data = c;
            pc__n = pc + 4;
            instret = 1'b1;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__CSRRC__0
        //==============================
        STATE__CSRRC__0:
        begin
            rf__cs = 1'b1;
            rf__addr = rs1;
            a__n = rf__rd_data;
            csr__cs = 1'b1;
            csr__addr = imm[11:0];
            b__n = csr__rd_data;
            state__n = (rs1 == 5'h0) ? STATE__CSRRC__2 : (imm[11:10] == 2'h3) ? STATE__EXCEPTION__ILLEGAL_INSTRUCTION : STATE__CSRRC__1; 
        end

        //==============================
        // STATE__CSRRC__1
        //==============================
        STATE__CSRRC__1:
        begin
            func = 5'hf;
            csr__cs = 1'b1;
            csr__we = 1'b1;
            csr__addr = imm[11:0];
            csr__wr_data = c;
            state__n = STATE__CSRRC__2;
        end

        //==============================
        // STATE__CSRRC__2
        //==============================
        STATE__CSRRC__2:
        begin
            func = 5'h11;
            rf__cs = 1'b1;
            rf__addr = rd;
            rf__we = 1'b1;
            rf__wr_data = c;
            pc__n = pc + 4;
            instret = 1'b1;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__CSRRWI__0
        //==============================
        STATE__CSRRWI__0:
        begin
            a__n = uimm;
            csr__cs = 1'b1;
            csr__addr = imm[11:0];
            b__n = csr__rd_data;
            state__n = (imm[11:10] == 2'h3) ? STATE__EXCEPTION__ILLEGAL_INSTRUCTION : (rd == 5'h0) ? STATE__CSRRWI__2 : STATE__CSRRWI__1; 
        end

        //==============================
        // STATE__CSRRWI__1
        //==============================
        STATE__CSRRWI__1:
        begin
            func = 5'h11;
            rf__cs = 1'b1;
            rf__addr = rd;
            rf__we = 1'b1;
            rf__wr_data = c;
            state__n = STATE__CSRRWI__2;
        end

        //==============================
        // STATE__CSRRWI__2
        //==============================
        STATE__CSRRWI__2:
        begin
            func = 5'h10;
            csr__cs = 1'b1;
            csr__we = 1'b1;
            csr__addr = imm[11:0];
            csr__wr_data = c;
            pc__n = pc + 4;
            instret = 1'b1;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__CSRRSI__0
        //==============================
        STATE__CSRRSI__0:
        begin
            a__n = uimm;
            csr__cs = 1'b1;
            csr__addr = imm[11:0];
            b__n = csr__rd_data;
            state__n = (uimm[4:0] == 5'h0) ? STATE__CSRRSI__2 : (imm[11:10] == 2'h3) ? STATE__EXCEPTION__ILLEGAL_INSTRUCTION : STATE__CSRRSI__1; 
        end

        //==============================
        // STATE__CSRRSI__1
        //==============================
        STATE__CSRRSI__1:
        begin
            func = 5'hd;
            csr__cs = 1'b1;
            csr__we = 1'b1;
            csr__addr = imm[11:0];
            csr__wr_data = c;
            state__n = STATE__CSRRSI__2;
        end

        //==============================
        // STATE__CSRRSI__2
        //==============================
        STATE__CSRRSI__2:
        begin
            func = 5'h11;
            rf__cs = 1'b1;
            rf__addr = rd;
            rf__we = 1'b1;
            rf__wr_data = c;
            pc__n = pc + 4;
            instret = 1'b1;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__CSRRCI__0
        //==============================
        STATE__CSRRCI__0:
        begin
            a__n = uimm;
            csr__cs = 1'b1;
            csr__addr = imm[11:0];
            b__n = csr__rd_data;
            state__n = (uimm[4:0] == 5'h0) ? STATE__CSRRCI__2 : (imm[11:10] == 2'h3) ? STATE__EXCEPTION__ILLEGAL_INSTRUCTION : STATE__CSRRCI__1; 
        end

        //==============================
        // STATE__CSRRCI__1
        //==============================
        STATE__CSRRCI__1:
        begin
            func = 5'hf;
            csr__cs = 1'b1;
            csr__we = 1'b1;
            csr__addr = imm[11:0];
            csr__wr_data = c;
            state__n = STATE__CSRRCI__2;
        end

        //==============================
        // STATE__CSRRCI__2
        //==============================
        STATE__CSRRCI__2:
        begin
            func = 5'h11;
            rf__cs = 1'b1;
            rf__addr = rd;
            rf__we = 1'b1;
            rf__wr_data = c;
            pc__n = pc + 4;
            instret = 1'b1;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__MRET__0
        //==============================
        STATE__MRET__0:
        begin
            csr__cs = 1'b1;
            csr__we = 1'b1;
            csr__addr = 12'h300;
            csr__wr_data = csr__rd_data;
            csr__wr_data[3] <= csr__rd_data[7];
            csr__wr_data[7] <= 1'b1;
            state__n = STATE__MRET__1;
        end

        //==============================
        // STATE__MRET__1
        //==============================
        STATE__MRET__1:
        begin
            csr__cs = 1'b1;
            csr__addr = 12'h341;
            pc__n = csr__rd_data;
            instret = 1'b1;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__EXCEPTION__ILLEGAL_INSTRUCTION
        //==============================
        STATE__EXCEPTION__ILLEGAL_INSTRUCTION:
        begin
            csr__cs = 1'b1;
            csr__we = 1'b1;
            csr__addr = 12'h342;
            csr__wr_data = csr__rd_data;
            csr__wr_data[62:0] = 63'h2;
            csr__wr_data[63] = 1'b0;
            state__n = STATE__TRAP__0;
        end

        //==============================
        // STATE__EXCEPTION__INSTRUCTION_ACCESS_FAULT__0
        //==============================
        STATE__EXCEPTION__INSTRUCTION_ACCESS_FAULT__0:
        begin
            func = 5'h0; 
            csr__cs = 1'b1;
            csr__we = 1'b1;
            csr__addr = 12'h343;
            csr__wr_data = csr__rd_data;
            csr__wr_data[63:0] = pc;
            state__n = STATE__EXCEPTION__INSTRUCTION_ACCESS_FAULT__1;
        end

        //==============================
        // STATE__EXCEPTION__INSTRUCTION_ACCESS_FAULT__1
        //==============================
        STATE__EXCEPTION__INSTRUCTION_ACCESS_FAULT__1:
        begin
            csr__cs = 1'b1;
            csr__we = 1'b1;
            csr__addr = 12'h342;
            csr__wr_data = csr__rd_data;
            csr__wr_data[62:0] = 63'h1;
            csr__wr_data[63] = 1'b0;
            state__n = STATE__TRAP__0;
        end

        //==============================
        // STATE__EXCEPTION__INSTRUCTION_ADDRESS_MISALIGNED__0
        //==============================
        STATE__EXCEPTION__INSTRUCTION_ADDRESS_MISALIGNED__0:
        begin
            func = 5'h0; 
            csr__cs = 1'b1;
            csr__we = 1'b1;
            csr__addr = 12'h343;
            csr__wr_data = csr__rd_data;
            csr__wr_data[63:0] = c;
            state__n = STATE__EXCEPTION__INSTRUCTION_ADDRESS_MISALIGNED__1;
        end

        //==============================
        // STATE__EXCEPTION__INSTRUCTION_ADDRESS_MISALIGNED__0__JALR
        //==============================
        STATE__EXCEPTION__INSTRUCTION_ADDRESS_MISALIGNED__0__JALR:
        begin
            func = 5'h0; 
            csr__cs = 1'b1;
            csr__we = 1'b1;
            csr__addr = 12'h343;
            csr__wr_data = csr__rd_data;
            csr__wr_data[63:0] = {c[63:1], 1'b0};
            state__n = STATE__EXCEPTION__INSTRUCTION_ADDRESS_MISALIGNED__1;
        end

        //==============================
        // STATE__EXCEPTION__INSTRUCTION_ADDRESS_MISALIGNED__1
        //==============================
        STATE__EXCEPTION__INSTRUCTION_ADDRESS_MISALIGNED__1:
        begin
            csr__cs = 1'b1;
            csr__we = 1'b1;
            csr__addr = 12'h342;
            csr__wr_data = csr__rd_data;
            csr__wr_data[62:0] = 63'h0;
            csr__wr_data[63] = 1'b0;
            state__n = STATE__TRAP__0;
        end

        //==============================
        // STATE__EXCEPTION__LOAD_ACCESS_FAULT__0
        //==============================
        STATE__EXCEPTION__LOAD_ACCESS_FAULT__0:
        begin
            func = 5'h0; 
            csr__cs = 1'b1;
            csr__we = 1'b1;
            csr__addr = 12'h343;
            csr__wr_data = csr__rd_data;
            csr__wr_data[63:0] = c;
            state__n = STATE__EXCEPTION__LOAD_ACCESS_FAULT__1;
        end

        //==============================
        // STATE__EXCEPTION__LOAD_ACCESS_FAULT__1
        //==============================
        STATE__EXCEPTION__LOAD_ACCESS_FAULT__1:
        begin
            csr__cs = 1'b1;
            csr__we = 1'b1;
            csr__addr = 12'h342;
            csr__wr_data = csr__rd_data;
            csr__wr_data[62:0] = 63'h5;
            csr__wr_data[63] = 1'b0;
            state__n = STATE__TRAP__0;
        end

        //==============================
        // STATE__EXCEPTION__LOAD_ADDRESS_MISALIGNED__0
        //==============================
        STATE__EXCEPTION__LOAD_ADDRESS_MISALIGNED__0:
        begin
            func = 5'h0; 
            csr__cs = 1'b1;
            csr__we = 1'b1;
            csr__addr = 12'h343;
            csr__wr_data = csr__rd_data;
            csr__wr_data[63:0] = c;
            state__n = STATE__EXCEPTION__LOAD_ADDRESS_MISALIGNED__1;
        end

        //==============================
        // STATE__EXCEPTION__LOAD_ADDRESS_MISALIGNED__1
        //==============================
        STATE__EXCEPTION__LOAD_ADDRESS_MISALIGNED__1:
        begin
            csr__cs = 1'b1;
            csr__we = 1'b1;
            csr__addr = 12'h342;
            csr__wr_data = csr__rd_data;
            csr__wr_data[62:0] = 63'h4;
            csr__wr_data[63] = 1'b0;
            state__n = STATE__TRAP__0;
        end

        //==============================
        // STATE__EXCEPTION__STORE_ACCESS_FAULT__0
        //==============================
        STATE__EXCEPTION__STORE_ACCESS_FAULT__0:
        begin
            func = 5'h0; 
            csr__cs = 1'b1;
            csr__we = 1'b1;
            csr__addr = 12'h343;
            csr__wr_data = csr__rd_data;
            csr__wr_data[63:0] = c;
            state__n = STATE__EXCEPTION__STORE_ACCESS_FAULT__1;
        end

        //==============================
        // STATE__EXCEPTION__STORE_ACCESS_FAULT__1
        //==============================
        STATE__EXCEPTION__STORE_ACCESS_FAULT__1:
        begin
            csr__cs = 1'b1;
            csr__we = 1'b1;
            csr__addr = 12'h342;
            csr__wr_data = csr__rd_data;
            csr__wr_data[62:0] = 63'h7;
            csr__wr_data[63] = 1'b0;
            state__n = STATE__TRAP__0;
        end

        //==============================
        // STATE__EXCEPTION__STORE_ADDRESS_MISALIGNED__0
        //==============================
        STATE__EXCEPTION__STORE_ADDRESS_MISALIGNED__0:
        begin
            func = 5'h0; 
            csr__cs = 1'b1;
            csr__we = 1'b1;
            csr__addr = 12'h343;
            csr__wr_data = csr__rd_data;
            csr__wr_data[63:0] = c;
            state__n = STATE__EXCEPTION__STORE_ADDRESS_MISALIGNED__1;
        end

        //==============================
        // STATE__EXCEPTION__STORE_ADDRESS_MISALIGNED__1
        //==============================
        STATE__EXCEPTION__STORE_ADDRESS_MISALIGNED__1:
        begin
            csr__cs = 1'b1;
            csr__we = 1'b1;
            csr__addr = 12'h342;
            csr__wr_data = csr__rd_data;
            csr__wr_data[62:0] = 63'h6;
            csr__wr_data[63] = 1'b0;
            state__n = STATE__TRAP__0;
        end

        //==============================
        // STATE__INTERRUPT__SOFTWARE
        //==============================
        STATE__INTERRUPT__SOFTWARE:
        begin
            csr__cs = 1'b1;
            csr__we = 1'b1;
            csr__addr = 12'h342;
            csr__wr_data[62:0] = 63'h3;
            csr__wr_data[63] = 1'b1;
            state__n = STATE__TRAP__0;
        end

        //==============================
        // STATE__INTERRUPT__TIMER
        //==============================
        STATE__INTERRUPT__TIMER:
        begin
            csr__cs = 1'b1;
            csr__we = 1'b1;
            csr__addr = 12'h342;
            csr__wr_data[62:0] = 63'h7;
            csr__wr_data[63] = 1'b1;
            state__n = STATE__TRAP__0;
        end

        //==============================
        // STATE__INTERRUPT__EXTERNAL
        //==============================
        STATE__INTERRUPT__EXTERNAL:
        begin
            csr__cs = 1'b1;
            csr__we = 1'b1;
            csr__addr = 12'h342;
            csr__wr_data[62:0] = 63'hb;
            csr__wr_data[63] = 1'b1;
            state__n = STATE__TRAP__0;
        end


        //==============================
        // STATE__TRAP__0
        //==============================
        STATE__TRAP__0:
        begin
            csr__cs = 1'b1;
            csr__we = 1'b1;
            csr__addr = 12'h300;
            csr__wr_data = csr__rd_data;
            csr__wr_data[3] <= 1'b0;
            csr__wr_data[7] <= csr__rd_data[3];
            state__n = STATE__TRAP__1;
        end

        //==============================
        // STATE__TRAP__1
        //==============================
        STATE__TRAP__1:
        begin
            csr__cs = 1'b1;
            csr__we = 1'b1;
            csr__addr = 12'h341;
            csr__wr_data = csr__rd_data;
            csr__wr_data[63:0] = pc;
            state__n = STATE__TRAP__2;
        end

        //==============================
        // STATE__TRAP__2
        //==============================
        STATE__TRAP__2:
        begin
            csr__cs = 1'b1;
            csr__addr = 12'h305;
            pc__n = csr__rd_data; 
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__FATAL
        //==============================
        STATE__FATAL:
        begin
            state__n = STATE__FATAL;
        end
        
    endcase
end

//==============================
// d_flip_flop__state
//==============================
d_flip_flop #(.WIDTH(8), .RESET_VALUE(STATE__RESET)) d_flip_flop__state
(
    .clk(clk),
    .rst(rst),
    .en(1'b1),
    .d(state__n),
    .q(state)
);

//==============================
// d_flip_flop__pc
//==============================
d_flip_flop #(.WIDTH(64), .RESET_VALUE(64'h80000000)) d_flip_flop__pc
(
    .clk(clk),
    .rst(rst),
    .en(1'b1),
    .d(pc__n),
    .q(pc)
);

//==============================
// d_flip_flop__ir
//==============================
d_flip_flop #(.WIDTH(32)) d_flip_flop__ir
(
    .clk(clk),
    .rst(1'b0),
    .en(1'b1),
    .d(ir__n),
    .q(ir)
);

//==============================
// d_flip_flop__a
//==============================
d_flip_flop #(.WIDTH(64)) d_flip_flop__a
(
    .clk(clk),
    .rst(1'b0),
    .en(1'b1),
    .d(a__n),
    .q(a)
);

//==============================
// d_flip_flop__b
//==============================
d_flip_flop #(.WIDTH(64)) d_flip_flop__b
(
    .clk(clk),
    .rst(1'b0),
    .en(1'b1),
    .d(b__n),
    .q(b)
);


endmodule

//==============================================
// comparator
//==============================================
module comparator
(
    input clk,
    input rst,
    input [63:0] a,
    input [63:0] b,
    output logic eq,
    output logic ne,
    output logic lt,
    output logic ltu,
    output logic ge,
    output geu
);

// Comparison operations.
assign eq = (a == b);
assign ne = ~eq;
assign lt = (a[63] == b[63]) ? a < b : a[63];
assign ltu = a < b;
assign ge = (a[63] == b[63]) ? a >= b : b[63];
assign geu = a >= b;

endmodule
//==============================================
// control_and_status_registers 
//==============================================
module control_and_status_registers
(
    clk,
    rst,
    cs,
    we,
    addr,
    rd_data,
    wr_data,
    eip,
    tip,
    instret,
    mstatus__mie,
    mie__meie,
    mie__msie,
    mie__mtie,
    mip__meip,
    mip__msip,
    mip__mtip
);

input clk;
input rst;
input cs;
input we;
input [11:0] addr;
output [63:0] rd_data;
input [63:0] wr_data;
input eip;
input tip;
input instret;

output mstatus__mie;
output mie__meie;
output mie__msie;
output mie__mtie;
output mip__meip;
output mip__msip;
output mip__mtip;

logic clk;
logic rst;

logic cs;
logic we;
logic [11:0] addr;
logic [63:0] rd_data;
logic [63:0] wr_data;

logic eip;
logic tip;

logic instret;

// Machine ISA Register (misa)
logic [63:0] misa;
logic [25:0] misa__extensions;
logic [35:0] misa__wiri__0;
logic [1:0] misa__base;
logic we__misa;
logic en__misa;

// Machine Vendor ID Register (mvendorid)
logic [63:0] mvendorid;
logic [63:0] mvendorid__vendor;
logic we__mvendorid;
logic en__mvendorid;

// Machine Architecture ID Register (marchid)
logic [63:0] marchid;
logic [63:0] marchid__architecture_id;
logic we__marchid;
logic en__marchid;

// Machine Implementation ID Register (mimpid)
logic [63:0] mimpid;
logic [63:0] mimpid__implementation;
logic we__mimpid;
logic en__mimpid;

// Hart ID Register (mhartid) 
logic [63:0] mhartid;
logic [63:0] mhartid__hart_id;
logic we__mhartid;
logic en__mhartid;

// Machine Status Register (mstatus) 
logic [63:0] mstatus;
logic [0:0] mstatus__uie;
logic [0:0] mstatus__sie;
logic [0:0] mstatus__hie;
logic [0:0] mstatus__mie;
logic [0:0] mstatus__upie;
logic [0:0] mstatus__spie;
logic [0:0] mstatus__hpie;
logic [0:0] mstatus__mpie;
logic [0:0] mstatus__spp;
logic [1:0] mstatus__hpp;
logic [1:0] mstatus__mpp;
logic [1:0] mstatus__fs;
logic [1:0] mstatus__xs;
logic [0:0] mstatus__mprv;
logic [0:0] mstatus__pum;
logic [0:0] mstatus__mxr;
logic [4:0] mstatus__vm;
logic [0:0] mstatus__sd;
logic we__mstatus;
logic en__mstatus;

// Machine Trap-Vector Base-Address Register (mtvec)
logic [63:0] mtvec;
logic [1:0] mtvec__offset;
logic [61:0] mtvec__trap_vector_base_address;
logic we__mtvec;
logic en__mtvec;

// Machine Exception Delegation Register (medeleg) 
logic [63:0] medeleg;
logic [63:0] medeleg__synchronous_exceptions;
logic we__medeleg;
logic en__medeleg;

// Machine Interrupt Delegation Register (mideleg) 
logic [63:0] mideleg;
logic [63:0] mideleg__interrupts;
logic we__mideleg;
logic en__mideleg;

// Machine Interrupt-Pending Register (mip) 
logic [63:0] mip;
logic [0:0] mip__usip;
logic [0:0] mip__ssip;
logic [0:0] mip__hsip;
logic [0:0] mip__msip;
logic [0:0] mip__utip;
logic [0:0] mip__stip;
logic [0:0] mip__htip;
logic [0:0] mip__mtip;
logic [0:0] mip__ueip;
logic [0:0] mip__seip;
logic [0:0] mip__heip;
logic [0:0] mip__meip;
logic [51:0] mip__wiri__0;
logic we__mip;
logic en__mip;

// Machine Interrupt-Enable Register (mie) 
logic [63:0] mie;
logic [0:0] mie__usie;
logic [0:0] mie__ssie;
logic [0:0] mie__hsie;
logic [0:0] mie__msie;
logic [0:0] mie__utie;
logic [0:0] mie__stie;
logic [0:0] mie__htie;
logic [0:0] mie__mtie;
logic [0:0] mie__ueie;
logic [0:0] mie__seie;
logic [0:0] mie__heie;
logic [0:0] mie__meie;
logic [51:0] mie__wpri__0;
logic we__mie;
logic en__mie;

// Machine Cycle Register (mcycle) 
logic [63:0] mcycle;
logic [63:0] mcycle__mcycle;
logic [63:0] mcycle__mcycle__n;
logic we__mcycle;
logic en__mcycle;

// Machine Instruction Retire Register (minstret) 
logic [63:0] minstret;
logic [63:0] minstret__minstret;
logic [63:0] minstret__minstret__n;
logic we__minstret;
logic en__minstret;
logic minstret__write_occurred;
logic state__minstret;
logic state__minstret__n;

// Machine Hardware Performance Monitor Counter 3 (mhpmcounter3)
logic [63:0] mhpmcounter3;
logic [63:0] mhpmcounter3__mhpmcounter3;
logic we__mhpmcounter3;
logic en__mhpmcounter3;

// Machine Hardware Performance Monitor Event 3 (mhpmevent3)
logic [63:0] mhpmevent3;
logic [63:0] mhpmevent3__mhpmevent3;
logic we__mhpmevent3;
logic en__mhpmevent3;

// Machine Scratch Register (mscratch) 
logic [63:0] mscratch;
logic [63:0] mscratch__mscratch;
logic we__mscratch;
logic en__mscratch;

// Machine Exception Program Counter (mepc) 
logic [63:0] mepc;
logic [63:0] mepc__mepc;
logic we__mepc;
logic en__mepc;

// Machine Cause Register (mcause) 
logic [63:0] mcause;
logic [62:0] mcause__exception_code;
logic [0:0] mcause__interrupt;
logic we__mcause;
logic en__mcause;

// Machine Trap Value Register (mtval) 
logic [63:0] mtval;
logic [63:0] mtval__mtval;
logic we__mtval;
logic en__mtval;


always_comb begin
    we__misa = 1'b0;
    we__mvendorid = 1'b0;
    we__marchid = 1'b0;
    we__mimpid = 1'b0;
    we__mhartid = 1'b0;
    we__mstatus = 1'b0;
    we__mtvec = 1'b0;
    we__medeleg = 1'b0;
    we__mideleg = 1'b0;
    we__mip = 1'b0;
    we__mie = 1'b0;
    we__mcycle = 1'b0;
    we__minstret = 1'b0;
    we__mhpmcounter3 = 1'b0;
    we__mhpmevent3 = 1'b0;
    we__mscratch = 1'b0;
    we__mepc = 1'b0;
    we__mcause = 1'b0;
    we__mtval = 1'b0;

    case (addr)
        12'h301:
        begin
            rd_data = misa;
            we__misa = we;
        end
        12'hf11:
        begin
            rd_data = mvendorid;
            we__mvendorid = we;
        end
        12'hf12:
        begin
            rd_data = marchid;
            we__marchid = we;
        end
        12'hf13:
        begin
            rd_data = mimpid;
            we__mimpid = we;
        end
        12'hf14:
        begin
            rd_data = mhartid;
            we__mhartid = we;
        end
        12'h300:
        begin
            rd_data = mstatus;
            we__mstatus = we;
        end
        12'h305:
        begin
            rd_data = mtvec;
            we__mtvec = we;
        end
        12'h302:
        begin
            rd_data = medeleg;
            we__medeleg = we;
        end
        12'h303:
        begin
            rd_data = mideleg;
            we__mideleg = we;
        end
        12'h344:
        begin
            rd_data = mip;
            we__mip = we;
        end
        12'h304:
        begin
            rd_data = mie;
            we__mie = we;
        end
        12'hb00:
        begin
            rd_data = mcycle;
            we__mcycle = we;
        end
        12'hb02:
        begin
            rd_data = minstret;
            we__minstret = we;
        end
        12'hb03:
        begin
            rd_data = mhpmcounter3;
            we__mhpmcounter3 = we;
        end
        12'h323:
        begin
            rd_data = mhpmevent3;
            we__mhpmevent3 = we;
        end
        12'h340:
        begin
            rd_data = mscratch; 
            we__mscratch = we;
        end
        12'h341:
        begin
            rd_data = mepc;
            we__mepc = we;
        end
        12'h342:
        begin
            rd_data = mcause;
            we__mcause = we;
        end
        12'h343:
        begin
            rd_data = mtval;
            we__mtval = we;
        end
    endcase
end

//==============================================
// Machine ISA Register (misa)
//==============================================
assign misa[25:0] = misa__extensions;
assign misa[61:26] = misa__wiri__0;
assign misa[63:62] = misa__base;

assign misa__extensions = 26'h0_00_01_00;
assign misa__wiri__0 = 36'h0;
assign misa__base = 2'h2;


//==============================================
// Machine Vendor ID Register (mvendorid)
//==============================================
assign mvendorid[63:0] = mvendorid__vendor;

assign mvendorid__vendor = 64'h0;


//==============================================
// Machine Architecture ID Register (marchid)
//==============================================
assign marchid[63:0] = marchid__architecture_id;

assign marchid__architecture_id = 64'h0;


//==============================================
// Machine Implementation ID Register (mimpid)
//==============================================
assign mimpid[63:0] = mimpid__implementation;

assign mimpid__implementation = 64'h0;


//==============================================
// Hart ID Register (mhartid) 
//==============================================
assign mhartid[63:0] = mhartid__hart_id;

assign mhartid__hart_id = 64'h0;


//============================================== 
// Machine Status Register (mstatus) 
//==============================================
assign mstatus[0] = mstatus__uie;
assign mstatus[1] = mstatus__sie;
assign mstatus[2] = mstatus__hie;
assign mstatus[3] = mstatus__mie;
assign mstatus[4] = mstatus__upie;
assign mstatus[5] = mstatus__spie;
assign mstatus[6] = mstatus__hpie;
assign mstatus[7] = mstatus__mpie;
assign mstatus[8] = mstatus__spp;
assign mstatus[10:9] = mstatus__hpp;
assign mstatus[12:11] = mstatus__mpp;
assign mstatus[14:13] = mstatus__fs;
assign mstatus[16:15] = mstatus__xs;
assign mstatus[17] = mstatus__mprv;
assign mstatus[18] = mstatus__pum;
assign mstatus[19] = mstatus__mxr;
assign mstatus[28:24] = mstatus__vm;
assign mstatus[63] = mstatus__sd;

assign mstatus__uie = 1'b0;
assign mstatus__sie = 1'b0;
assign mstatus__hie = 1'b0;
assign mstatus__upie = 1'b0;
assign mstatus___spie = 1'b0;
assign mstatus__hpie = 1'b0;
assign mstatus__spp = 1'b0;
assign mstatus__hpp = 2'h0;
assign mstatus__mpp = 2'h3;
assign mstatus__fs = 2'h0;
assign mstatus__xs = 2'h0;
assign mstatus__mprv = 1'b0;
assign mstatus__pum = 1'b0;
assign mstatus__mxr = 1'b0;
assign mstatus__vm = 5'h0;
assign mstatus__sd = 1'b0;

assign en__mstatus = cs & we__mstatus;

//==============================
// d_flip_flop__mstatus__mie
//==============================
d_flip_flop #(.WIDTH(1), .RESET_VALUE(1'b0)) d_flip_flop__mstatus__mie
(
    .clk(clk),
    .rst(rst),
    .en(en__mstatus),
    .d(wr_data[3]),
    .q(mstatus__mie)
);


//============================================== 
// Machine Trap-Vector Base-Address Register (mtvec)
//==============================================
assign mtvec[1:0] = mtvec__offset;
assign mtvec[63:2] = mtvec__trap_vector_base_address;

assign mtvec__offset = 2'h0;

assign en__mtvec = cs & we__mtvec;

//==============================
// d_flip_flop__mtvec__trap_vector_base_address
//==============================
d_flip_flop #(.WIDTH(62), .RESET_VALUE(62'h0)) d_flip_flop__mtvec__trap_vector_base_address
(
    .clk(clk),
    .rst(rst),
    .en(en__mtvec),
    .d(wr_data[63:2]),
    .q(mtvec__trap_vector_base_address)
);


//============================================== 
// Machine Exception Delegation Register (medeleg) 
//==============================================
assign medeleg[63:0] = medeleg__synchronous_exceptions;

assign medeleg__synchronous_exceptions = 64'h0;


//============================================== 
// Machine Interrupt Delegation Register (mideleg) 
//==============================================
assign mideleg[63:0] = mideleg__interrupts;

assign mideleg__interrupts = 64'h0;


//============================================== 
// Machine Interrupt-Pending Register (mip) 
//==============================================
assign mip[0] = mip__usip;
assign mip[1] = mip__ssip;
assign mip[2] = mip__hsip;
assign mip[3] = mip__msip;
assign mip[4] = mip__utip;
assign mip[5] = mip__stip;
assign mip[6] = mip__htip;
assign mip[7] = mip__mtip;
assign mip[8] = mip__ueip;
assign mip[9] = mip__seip;
assign mip[10] = mip__heip;
assign mip[11] = mip__meip;
assign mip[63:12] = mip__wiri__0;

assign mip__usip = 1'b0;
assign mip__ssip = 1'b0;
assign mip__hsip = 1'b0;
assign mip__utip = 1'b0;
assign mip__stip = 1'b0;
assign mip__htip = 1'b0;
assign mip__ueip = 1'b0;
assign mip__seip = 1'b0;
assign mip__heip = 1'b0;
assign mip__wiri__0 = 52'h0;

assign en__mip = cs & we__mip;

//==============================
// d_flip_flop__mip__msip
//==============================
d_flip_flop #(.WIDTH(1), .RESET_VALUE(1'b0)) d_flip_flop__mip__msip
(
    .clk(clk),
    .rst(rst),
    .en(en__mip),
    .d(wr_data[3]),
    .q(mip__msip)
);

// FIXME: The tip/eip bit will (likely) be retimed from the PLIC. Make sure the is no issues with X propagation upon reset. 
//==============================
// d_flip_flop__mip__mtip
//==============================
d_flip_flop #(.WIDTH(1), .RESET_VALUE()) d_flip_flop__mip__mtip
(
    .clk(clk),
    .rst(1'b0),
    .en(en__mip),
    .d(wr_data[7]),
    .q(mip__mtip)
);

//==============================
// d_flip_flop__mip__meip
//==============================
d_flip_flop #(.WIDTH(1), .RESET_VALUE()) d_flip_flop__mip__meip
(
    .clk(clk),
    .rst(1'b0),
    .en(en__mip),
    .d(wr_data[11]),
    .q(mip__meip)
);


//============================================== 
// Machine Interrupt-Enable Register (mie) 
//==============================================
assign mie[0] = mie__usie;
assign mie[1] = mie__ssie;
assign mie[2] = mie__hsie;
assign mie[3] = mie__msie;
assign mie[4] = mie__utie;
assign mie[5] = mie__stie;
assign mie[6] = mie__htie;
assign mie[7] = mie__mtie;
assign mie[8] = mie__ueie;
assign mie[9] = mie__seie;
assign mie[10] = mie__heie;
assign mie[11] = mie__meie;
assign mie[63:12] = mie__wpri__0;

assign mie__usie = 1'b0;
assign mie__ssie = 1'b0;
assign mie__hsie = 1'b0;
assign mie__utie = 1'b0;
assign mie__stie = 1'b0;
assign mie__htie = 1'b0;
assign mie__ueie = 1'b0;
assign mie__seie = 1'b0;
assign mie__heie = 1'b0;
assign mie__wpri__0 = 52'h0;

assign en__mie = cs & we__mie;

//==============================
// d_flip_flop__mie__msie
//==============================
d_flip_flop #(.WIDTH(1), .RESET_VALUE(1'b0)) d_flip_flop__mie__msie
(
    .clk(clk),
    .rst(rst),
    .en(en__mie),
    .d(wr_data[3]),
    .q(mie__msie)
);

//==============================
// d_flip_flop__mie__mtie
//==============================
d_flip_flop #(.WIDTH(1), .RESET_VALUE(1'b0)) d_flip_flop__mie__mtie
(
    .clk(clk),
    .rst(rst),
    .en(en__mie),
    .d(wr_data[7]),
    .q(mie__mtie)
);

//==============================
// d_flip_flop__mie__meie
//==============================
d_flip_flop #(.WIDTH(1), .RESET_VALUE(1'b0)) d_flip_flop__mie__meie
(
    .clk(clk),
    .rst(rst),
    .en(en__mie),
    .d(wr_data[11]),
    .q(mie__meie)
);


//============================================== 
// Machine Cycle Register (mcycle) 
//==============================================
assign mcycle[63:0] = mcycle__mcycle;
assign mcycle[63:0] = mcycle__mcycle__n;

assign en__mcycle = 1'b1;

always_comb
begin
    case (en__mcycle & we__mcycle)
        1'b0:
        begin
            mcycle__mcycle__n = mcycle__mcycle + 1;
        end
        1'b1:
        begin
            mcycle__mcycle__n = wr_data[63:0];
        end
    endcase
end

//==============================
// d_flip_flop__mcycle__mcycle
//==============================
d_flip_flop #(.WIDTH(64), .RESET_VALUE(64'h0)) d_flip_flop__mcycle__mcycle
(
    .clk(clk),
    .rst(rst),
    .en(en__mcycle),
    .d(mcycle__mcycle__n),
    .q(mcycle__mcycle)
);


//============================================== 
// Machine Instruction Retire Register (minstret) 
//==============================================
assign minstret[63:0] = minstret__minstret;

assign en__minstret = 1'b1;

always_comb
begin
    case (en__minstret & we__minstret)
        1'b0:
        begin
            case (instret & ~minstret__write_occurred)
                1'b0:
                begin
                    minstret__minstret__n = minstret__minstret;
                end
                1'b1:
                begin
                    minstret__minstret__n = minstret__minstret + 1;
                end
            endcase
        end
        1'b1:
        begin
            minstret__minstret__n = wr_data[63:0];
        end
    endcase
end

//==============================
// d_flip_flop__minstret__minstret
//==============================
d_flip_flop #(.WIDTH(64), .RESET_VALUE(64'h0)) d_flip_flop__minstret__minstret
(
    .clk(clk),
    .rst(rst),
    .en(en__minstret),
    .d(minstret__minstret__n),
    .q(minstret__minstret)
);

parameter STATE__MINSTRET__NORMAL = 1'b0;
parameter STATE__MINSTRET__WRITE_OCCURED = 1'b1;

always_comb
begin
    case (state__minstret)
        //==============================
        // STATE__MINSTRET__NORMAL
        //==============================
        STATE__MINSTRET__NORMAL:
        begin
            minstret__write_occurred = 1'b0; 
            state__minstret__n = en__minstret & we__minstret & ~instret ? STATE__MINSTRET__WRITE_OCCURED : STATE__MINSTRET__NORMAL;
        end

        //==============================
        // STATE__MINSTRET__WRITE_OCCURED
        //==============================
        STATE__MINSTRET__WRITE_OCCURED:
        begin
            minstret__write_occurred = 1'b1; 
            state__minstret__n = instret ? STATE__MINSTRET__NORMAL : STATE__MINSTRET__WRITE_OCCURED;
        end
    endcase
end

//==============================
// d_flip_flop__state__minstret
//==============================
d_flip_flop #(.WIDTH(1), .RESET_VALUE(STATE__MINSTRET__NORMAL)) d_flip_flop__state__minstret
(
    .clk(clk),
    .rst(rst),
    .en(1'b1),
    .d(state__minstret__n),
    .q(state__minstret)
);


//============================================== 
// Machine Hardware Performance Monitor Counter 3 (mhpmcounter3)
//==============================================
assign mhpmcounter3[63:0] = mhpmcounter3__mhpmcounter3;

assign mhpmcounter3__mhpmcounter3 = 64'h0;


//============================================== 
// Machine Hardware Performance Monitor Event 3 (mhpmevent3)
//==============================================
assign mhpmevent3[63:0] = mhpmevent3__mhpmevent3;

assign mhpmevent3__mhpmevent3 = 64'h0;


//============================================== 
// Machine Scratch Register (mscratch) 
//==============================================
assign mscratch[63:0] = mscratch__mscratch;

assign en__scratch = cs & we__mscratch;

//==============================
// d_flip_flop__mscratch__mscratch
//==============================
d_flip_flop #(.WIDTH(64), .RESET_VALUE(64'h0)) d_flip_flop__mscratch__mscratch
(
    .clk(clk),
    .rst(rst),
    .en(en__mscratch),
    .d(wr_data[63:0]),
    .q(mscratch__mscratch)
);


//============================================== 
// Machine Exception Program Counter (mepc) 
//==============================================
assign mepc[63:0] = mepc__mepc;

assign en__mepc = cs & we__mepc;

//==============================
// d_flip_flop__mepc__mepc
//==============================
d_flip_flop #(.WIDTH(64), .RESET_VALUE(64'h0)) d_flip_flop__mepc__mepc
(
    .clk(clk),
    .rst(rst),
    .en(en__mepc),
    .d(wr_data[63:0]),
    .q(mepc__mepc)
);


//============================================== 
// Machine Cause Register (mcause) 
//==============================================
assign mcause[62:0] = mcause__exception_code;
assign mcause[63] = mcause__interrupt;

assign en__mcause = cs & we__mcause;

//==============================
// d_flip_flop__mcause__exception_code
//==============================
d_flip_flop #(.WIDTH(63), .RESET_VALUE(63'h0)) d_flip_flop__mcause__exception_code
(
    .clk(clk),
    .rst(rst),
    .en(en__mcause),
    .d(wr_data[62:0]),
    .q(mcause__exception_code)
);

//==============================
// d_flip_flop__mcause__interrupt
//==============================
d_flip_flop #(.WIDTH(1), .RESET_VALUE(1'b0)) d_flip_flop__mcause__interrupt
(
    .clk(clk),
    .rst(rst),
    .en(en__mcause),
    .d(wr_data[63]),
    .q(mcause__interrupt)
);


//============================================== 
// Machine Trap Value Register (mtval) 
//==============================================
assign mtval[63:0] = mtval__mtval;

assign en__mtval = cs & we__mtval;

//==============================
// d_flip_flop__mtval__mtval
//==============================
d_flip_flop #(.WIDTH(64), .RESET_VALUE(64'h0)) d_flip_flop__mtval__mtval
(
    .clk(clk),
    .rst(rst),
    .en(en__mtval),
    .d(wr_data[63:0]),
    .q(mtval__mtval)
);


endmodule

//==============================================
// decoder
//==============================================
module decoder
(
    input clk,
    input rst,
    input [31:0] ir,
    output logic [5:0] op,
    output logic [4:0] rs1,
    output logic [4:0] rs2,
    output logic [4:0] rd,
    output logic [63:0] imm,
    output logic [63:0] uimm
);


logic [6:0] opcode;
logic [2:0] funct3;
logic [6:0] funct7;
logic [11:0] funct12;
logic [2:0] format;

// Breakout instruction fields.
assign opcode = ir[6:0];
assign rs1 = ir[19:15];
assign rs2 = ir[24:20];
assign rd = ir[11:7];
assign funct3 = ir[14:12];
assign funct7 = ir[31:25];
assign funct12 = ir[31:20];
assign uimm = {{59{1'b0}}, ir[19:15]};

// Generate immediate.
always_comb begin
    case (format)
        3'h0: imm = 0;
        3'h1: imm = {{53{ir[31]}}, ir[30:25], ir[24:21], ir[20]};
        3'h2: imm = {{53{ir[31]}}, ir[30:25], ir[11:8], ir[7]};
        3'h3: imm = {{52{ir[31]}}, ir[7], ir[30:25], ir[11:8], 1'b0};
        3'h4: imm = {{33{ir[31]}}, ir[30:20], ir[19:12], 12'h0};
        3'h5: imm = {{44{ir[31]}}, ir[19:12], ir[20], ir[30:25], ir[24:21], 1'b0};
    endcase
end

// Decode instruction.
always_comb begin
    case (opcode)
        7'h03:
        begin
            case (funct3)
                3'h0:
                begin
                    op = 6'h1;
                end
                3'h1:
                begin
                    op = 6'h2;
                end
                3'h2:
                begin
                    op = 6'h3;
                end
                3'h3:
                begin
                    op = 6'h4;
                end
                3'h4:
                begin
                    op = 6'h5;
                end
                3'h5:
                begin
                    op = 6'h6;
                end
                3'h6:
                begin
                    op = 6'h7;
                end
            endcase
        end
        7'h0f:
        begin
            case (funct3)
                3'h0:
                begin
                    op = 6'h8;
                end
                3'h1:
                begin
                    op = 6'h9;
                end
            endcase
        end
        7'h13:
        begin
            case (funct3)
                3'h0:
                begin
                    op = 6'ha;
                end
                3'h1:
                begin
                    case (funct7)
                        7'h00:
                        begin
                            op = 6'hb;
                        end
                        7'h01:
                        begin
                            op = 6'hb;
                        end
                    endcase
                end
                3'h2:
                begin
                    op = 6'hc;
                end
                3'h3:
                begin
                    op = 6'hd;
                end
                3'h4:
                begin
                    op = 6'he;
                end
                3'h5:
                begin
                    case (funct7)
                        7'h00:
                        begin
                            op = 6'hf;
                        end
                        7'h01:
                        begin
                            op = 6'hf;
                        end
                        7'h20:
                        begin
                            op = 6'h10;
                        end
                        7'h21:
                        begin
                            op = 6'h10;
                        end
                    endcase
                end
                3'h6:
                begin
                    op = 6'h11;
                end
                3'h7:
                begin
                    op = 6'h12;
                end
            endcase
        end
        7'h17:
        begin
            op = 6'h13;
        end
        7'h1b:
        begin
            case (funct3)
                3'h0:
                begin
                    op = 6'h14;
                end
                3'h1:
                begin
                    case (funct7)
                        7'h00:
                        begin
                            op = 6'h15;
                        end
                    endcase
                end
                3'h5:
                begin
                    case (funct7)
                        7'h00:
                        begin
                            op = 6'h16;
                        end
                        7'h20:
                        begin
                            op = 6'h17;
                        end
                    endcase
                end
            endcase
        end
        7'h23:
        begin
            case (funct3)
                3'h0:
                begin
                    op = 6'h18;
                end
                3'h1:
                begin
                    op = 6'h19;
                end
                3'h2:
                begin
                    op = 6'h1a;
                end
                3'h3:
                begin
                    op = 6'h1b;
                end
            endcase
        end
        7'h33:
        begin
            case (funct3)
                3'h0:
                begin
                    case (funct7)
                        7'h00:
                        begin
                            op = 6'h1c;
                        end
                        7'h20:
                        begin
                            op = 6'h1d;
                        end
                    endcase
                end
                3'h1:
                begin
                    case (funct7)
                        7'h00:
                        begin
                            op = 6'h1e;
                        end
                    endcase
                end
                3'h2:
                begin
                    case (funct7)
                        7'h00:
                        begin
                            op = 6'h1f;
                        end
                    endcase
                end
                3'h3:
                begin
                    case (funct7)
                        7'h00:
                        begin
                            op = 6'h20;
                        end
                    endcase
                end
                3'h4:
                begin
                    case (funct7)
                        7'h00:
                        begin
                            op = 6'h21;
                        end
                    endcase
                end
                3'h5:
                begin
                    case (funct7)
                        7'h00:
                        begin
                            op = 6'h22;
                        end
                        7'h20:
                        begin
                            op = 6'h23;
                        end
                    endcase
                end
                3'h6:
                begin
                    case (funct7)
                        7'h00:
                        begin
                            op = 6'h24;
                        end
                    endcase
                end
                3'h7:
                begin
                    case (funct7)
                        7'h00:
                        begin
                            op = 6'h25;
                        end
                    endcase
                end
            endcase
        end
        7'h37:
        begin
            op = 6'h26;
        end
        7'h3b:
        begin
            case (funct3)
                3'h0:
                begin
                    case (funct7)
                        7'h00:
                        begin
                            op = 6'h27;
                        end
                        7'h20:
                        begin
                            op = 6'h28;
                        end
                    endcase
                end
                3'h1:
                begin
                    case (funct7)
                        7'h00:
                        begin
                            op = 6'h29;
                        end
                    endcase
                end
                3'h5:
                begin
                    case (funct7)
                        7'h00:
                        begin
                            op = 6'h2a;
                        end
                        7'h20:
                        begin
                           op = 6'h2b;
                        end
                    endcase
                end
            endcase
        end
        7'h63:
        begin
            case (funct3)
                3'h0:
                begin
                    op = 6'h2c;
                end
                3'h1:
                begin
                    op = 6'h2d;
                end
                3'h4:
                begin
                    op = 6'h2e;
                end
                3'h5:
                begin
                    op = 6'h2f;
                end
                3'h6:
                begin
                    op = 6'h30;
                end
                3'h7:
                begin
                    op = 6'h31;
                end
            endcase
        end
        7'h67:
        begin
            case (funct3)
                3'h0:
                begin
                    op = 6'h32;
                end
            endcase
        end
        7'h6f:
        begin
            op = 6'h33;
        end
        7'h73:
        begin
            case (funct3)
                3'h0:
                begin
                    case (funct12)
                        12'h000:
                        begin
                            op = 6'h34;
                        end
                        12'h001:
                        begin
                            op = 6'h35;
                        end
                        12'h105:
                        begin
                            op = 6'h3d;
                        end
                        12'h302:
                        begin
                            op = 6'h3c;
                        end
                    endcase
                end
                3'h1:
                begin
                    op = 6'h36;
                end
                3'h2:
                begin
                    op = 6'h37;
                end
                3'h3:
                begin
                    op = 6'h38;
                end
                3'h5:
                begin
                    op = 6'h39;
                end
                3'h6:
                begin
                    op = 6'h3a;
                end
                3'h7:
                begin
                    op = 6'h3b;
                end
            endcase
        end
    endcase
end

// Set control signals.
always_comb begin
    format = 3'h1;

    case (op)
        6'h1:
        begin
            format = 3'h1;
        end
        6'h2:
        begin
            format = 3'h1;
        end
        6'h3:
        begin
            format = 3'h1;
        end
        6'h4:
        begin
            format = 3'h1;
        end
        6'h5:
        begin
            format = 3'h1;
        end
        6'h6:
        begin
            format = 3'h1;
        end
        6'h7:
        begin
            format = 3'h1;
        end
        6'h8:
        begin
        end
        6'h9:
        begin
        end
        6'ha:
        begin
            format = 3'h1;
        end
        6'hb:
        begin
            format = 3'h1;
        end
        6'hc:
        begin
            format = 3'h1;
        end
        6'hd:
        begin
            format = 3'h1;
        end
        6'he:
        begin
            format = 3'h1;
        end
        6'hf:
        begin
            format = 3'h1;
        end
        6'h10:
        begin
            format = 3'h1;
        end
        6'h11:
        begin
            format = 3'h1;
        end
        6'h12:
        begin
            format = 3'h1;
        end
        6'h13:
        begin
            format = 3'h4;
        end
        6'h14:
        begin
            format = 3'h1;
        end
        6'h15:
        begin
            format = 3'h1;
        end
        6'h16:
        begin
            format = 3'h1;
        end
        6'h17:
        begin
            format = 3'h1;
        end
        6'h18:
        begin
            format = 3'h2;
        end
        6'h19:
        begin
            format = 3'h2;
        end
        6'h1a:
        begin
            format = 3'h2;
        end
        6'h1b:
        begin
            format = 3'h2;
        end
        6'h1c:
        begin
            format = 3'h0;
        end
        6'h1d:
        begin
            format = 3'h0;
        end
        6'h1e:
        begin
            format = 3'h0;
        end
        6'h1f:
        begin
            format = 3'h0;
        end
        6'h20:
        begin
            format = 3'h0;
        end
        6'h21:
        begin
            format = 3'h0;
        end
        6'h22:
        begin
            format = 3'h0;
        end
        6'h23:
        begin
            format = 3'h0;
        end
        6'h24:
        begin
            format = 3'h0;
        end
        6'h25:
        begin
            format = 3'h0;
        end
        6'h26:
        begin
            format = 3'h4;
        end
        6'h27:
        begin
            format = 3'h0;
        end
        6'h28:
        begin
            format = 3'h0;
        end
        6'h29:
        begin
            format = 3'h0;
        end
        6'h2a:
        begin
            format = 3'h0;
        end
        6'h2b:
        begin
            format = 3'h0;
        end
        6'h2c:
        begin
            format = 3'h3;
        end
        6'h2d:
        begin
            format = 3'h3;
        end
        6'h2e:
        begin
            format = 3'h3;
        end
        6'h2f:
        begin
            format = 3'h3;
        end
        6'h30:
        begin
            format = 3'h3;
        end
        6'h31:
        begin
            format = 3'h3;
        end
        6'h32:
        begin
            format = 3'h1;
        end
        6'h33:
        begin
            format = 3'h5;
        end
        6'h34:
        begin
            format = 3'h1;
        end
        6'h35:
        begin
            format = 3'h1;
        end
        6'h36:
        begin
            format = 3'h1;
        end
        6'h37:
        begin
            format = 3'h1;
        end
        6'h38:
        begin
            format = 3'h1;
        end
        6'h39:
        begin
            format = 3'h1;
        end
        6'h3a:
        begin
            format = 3'h1;
        end
        6'h3b:
        begin
            format = 3'h1;
        end
    endcase
end 

endmodule
//==============================================
// register_file
//==============================================
module register_file
(
    input clk,
    input rst,
    input cs,
    input we,
    input [4:0] addr,
    output logic [63:0] rd_data,
    input [63:0] wr_data
);

logic [63:0] x__0;
logic [63:0] x__1;
logic [63:0] x__2;
logic [63:0] x__3;
logic [63:0] x__4;
logic [63:0] x__5;
logic [63:0] x__6;
logic [63:0] x__7;
logic [63:0] x__8;
logic [63:0] x__9;
logic [63:0] x__10;
logic [63:0] x__11;
logic [63:0] x__12;
logic [63:0] x__13;
logic [63:0] x__14;
logic [63:0] x__15;
logic [63:0] x__16;
logic [63:0] x__17;
logic [63:0] x__18;
logic [63:0] x__19;
logic [63:0] x__20;
logic [63:0] x__21;
logic [63:0] x__22;
logic [63:0] x__23;
logic [63:0] x__24;
logic [63:0] x__25;
logic [63:0] x__26;
logic [63:0] x__27;
logic [63:0] x__28;
logic [63:0] x__29;
logic [63:0] x__30;
logic [63:0] x__31;

logic we__x__0;
logic we__x__1;
logic we__x__2;
logic we__x__3;
logic we__x__4;
logic we__x__5;
logic we__x__6;
logic we__x__7;
logic we__x__8;
logic we__x__9;
logic we__x__10;
logic we__x__11;
logic we__x__12;
logic we__x__13;
logic we__x__14;
logic we__x__15;
logic we__x__16;
logic we__x__17;
logic we__x__18;
logic we__x__19;
logic we__x__20;
logic we__x__21;
logic we__x__22;
logic we__x__23;
logic we__x__24;
logic we__x__25;
logic we__x__26;
logic we__x__27;
logic we__x__28;
logic we__x__29;
logic we__x__30;
logic we__x__31;

logic en__x__0;
logic en__x__1;
logic en__x__2;
logic en__x__3;
logic en__x__4;
logic en__x__5;
logic en__x__6;
logic en__x__7;
logic en__x__8;
logic en__x__9;
logic en__x__10;
logic en__x__11;
logic en__x__12;
logic en__x__13;
logic en__x__14;
logic en__x__15;
logic en__x__16;
logic en__x__17;
logic en__x__18;
logic en__x__19;
logic en__x__20;
logic en__x__21;
logic en__x__22;
logic en__x__23;
logic en__x__24;
logic en__x__25;
logic en__x__26;
logic en__x__27;
logic en__x__28;
logic en__x__29;
logic en__x__30;
logic en__x__31;

always_comb
begin
    we__x__0 = 1'b0;
    we__x__1 = 1'b0;
    we__x__2 = 1'b0;
    we__x__3 = 1'b0;
    we__x__4 = 1'b0;
    we__x__5 = 1'b0;
    we__x__6 = 1'b0;
    we__x__7 = 1'b0;
    we__x__8 = 1'b0;
    we__x__9 = 1'b0;
    we__x__10 = 1'b0;
    we__x__11 = 1'b0;
    we__x__12 = 1'b0;
    we__x__13 = 1'b0;
    we__x__14 = 1'b0;
    we__x__15 = 1'b0;
    we__x__16 = 1'b0;
    we__x__17 = 1'b0;
    we__x__18 = 1'b0;
    we__x__19 = 1'b0;
    we__x__20 = 1'b0;
    we__x__21 = 1'b0;
    we__x__22 = 1'b0;
    we__x__23 = 1'b0;
    we__x__24 = 1'b0;
    we__x__25 = 1'b0;
    we__x__26 = 1'b0;
    we__x__27 = 1'b0;
    we__x__28 = 1'b0;
    we__x__29 = 1'b0;
    we__x__30 = 1'b0;
    we__x__31 = 1'b0;

    case (addr)
        5'h0:
        begin
            rd_data = x__0;
            we__x__0 = we;
        end
        5'h1:
        begin
            rd_data = x__1;
            we__x__1 = we;
        end
        5'h2:
        begin
            rd_data = x__2;
            we__x__2 = we;
        end
        5'h3:
        begin
            rd_data = x__3;
            we__x__3 = we;
        end
        5'h4:
        begin
            rd_data = x__4;
            we__x__4 = we;
        end
        5'h5:
        begin
            rd_data = x__5;
            we__x__5 = we;
        end
        5'h6:
        begin
            rd_data = x__6;
            we__x__6 = we;
        end
        5'h7:
        begin
            rd_data = x__7;
            we__x__7 = we;
        end
        5'h8:
        begin
            rd_data = x__8;
            we__x__8 = we;
        end
        5'h9:
        begin
            rd_data = x__9;
            we__x__9 = we;
        end
        5'ha:
        begin
            rd_data = x__10;
            we__x__10 = we;
        end
        5'hb:
        begin
            rd_data = x__11;
            we__x__11 = we;
        end
        5'hc:
        begin
            rd_data = x__12;
            we__x__12 = we;
        end
        5'hd:
        begin
            rd_data = x__13;
            we__x__13 = we;
        end
        5'he:
        begin
            rd_data = x__14;
            we__x__14 = we;
        end
        5'hf:
        begin
            rd_data = x__15;
            we__x__15 = we;
        end
        5'h10:
        begin
            rd_data = x__16;
            we__x__16 = we;
        end
        5'h11:
        begin
            rd_data = x__17;
            we__x__17 = we;
        end
        5'h12:
        begin
            rd_data = x__18;
            we__x__18 = we;
        end
        5'h13:
        begin
            rd_data = x__19;
            we__x__19 = we;
        end
        5'h14:
        begin
            rd_data = x__20;
            we__x__20 = we;
        end
        5'h15:
        begin
            rd_data = x__21;
            we__x__21 = we;
        end
        5'h16:
        begin
            rd_data = x__22;
            we__x__22 = we;
        end
        5'h17:
        begin
            rd_data = x__23;
            we__x__23 = we;
        end
        5'h18:
        begin
            rd_data = x__24;
            we__x__24 = we;
        end
        5'h19:
        begin
            rd_data = x__25;
            we__x__25 = we;
        end
        5'h1a:
        begin
            rd_data = x__26;
            we__x__26 = we;
        end
        5'h1b:
        begin
            rd_data = x__27;
            we__x__27 = we;
        end
        5'h1c:
        begin
            rd_data = x__28;
            we__x__28 = we;
        end
        5'h1d:
        begin
            rd_data = x__29;
            we__x__29 = we;
        end
        5'h1e:
        begin
            rd_data = x__30;
            we__x__30 = we;
        end
        5'h1f:
        begin
            rd_data = x__31;
            we__x__31 = we;
        end
    endcase
end

assign en__x__0 = cs & we__x__0;
assign en__x__1 = cs & we__x__1;
assign en__x__2 = cs & we__x__2;
assign en__x__3 = cs & we__x__3;
assign en__x__4 = cs & we__x__4;
assign en__x__5 = cs & we__x__5;
assign en__x__6 = cs & we__x__6;
assign en__x__7 = cs & we__x__7;
assign en__x__8 = cs & we__x__8;
assign en__x__9 = cs & we__x__9;
assign en__x__10 = cs & we__x__10;
assign en__x__11 = cs & we__x__11;
assign en__x__12 = cs & we__x__12;
assign en__x__13 = cs & we__x__13;
assign en__x__14 = cs & we__x__14;
assign en__x__15 = cs & we__x__15;
assign en__x__16 = cs & we__x__16;
assign en__x__17 = cs & we__x__17;
assign en__x__18 = cs & we__x__18;
assign en__x__19 = cs & we__x__19;
assign en__x__20 = cs & we__x__20;
assign en__x__21 = cs & we__x__21;
assign en__x__22 = cs & we__x__22;
assign en__x__23 = cs & we__x__23;
assign en__x__24 = cs & we__x__24;
assign en__x__25 = cs & we__x__25;
assign en__x__26 = cs & we__x__26;
assign en__x__27 = cs & we__x__27;
assign en__x__28 = cs & we__x__28;
assign en__x__29 = cs & we__x__29;
assign en__x__30 = cs & we__x__30;
assign en__x__31 = cs & we__x__31;

assign x__0 = 64'h0;

//==============================
// d_flip_flop__x__1
//==============================
d_flip_flop #(.WIDTH(64)) d_flip_flop__x__1
(
    .clk(clk),
    .rst(1'b0),
    .en(en__x__1),
    .d(wr_data),
    .q(x__1)
);


//==============================
// d_flip_flop__x__2
//==============================
d_flip_flop #(.WIDTH(64)) d_flip_flop__x__2
(
    .clk(clk),
    .rst(1'b0),
    .en(en__x__2),
    .d(wr_data),
    .q(x__2)
);


//==============================
// d_flip_flop__x__3
//==============================
d_flip_flop #(.WIDTH(64)) d_flip_flop__x__3
(
    .clk(clk),
    .rst(1'b0),
    .en(en__x__3),
    .d(wr_data),
    .q(x__3)
);


//==============================
// d_flip_flop__x__4
//==============================
d_flip_flop #(.WIDTH(64)) d_flip_flop__x__4
(
    .clk(clk),
    .rst(1'b0),
    .en(en__x__4),
    .d(wr_data),
    .q(x__4)
);


//==============================
// d_flip_flop__x__5
//==============================
d_flip_flop #(.WIDTH(64)) d_flip_flop__x__5
(
    .clk(clk),
    .rst(1'b0),
    .en(en__x__5),
    .d(wr_data),
    .q(x__5)
);


//==============================
// d_flip_flop__x__6
//==============================
d_flip_flop #(.WIDTH(64)) d_flip_flop__x__6
(
    .clk(clk),
    .rst(1'b0),
    .en(en__x__6),
    .d(wr_data),
    .q(x__6)
);


//==============================
// d_flip_flop__x__7
//==============================
d_flip_flop #(.WIDTH(64)) d_flip_flop__x__7
(
    .clk(clk),
    .rst(1'b0),
    .en(en__x__7),
    .d(wr_data),
    .q(x__7)
);


//==============================
// d_flip_flop__x__8
//==============================
d_flip_flop #(.WIDTH(64)) d_flip_flop__x__8
(
    .clk(clk),
    .rst(1'b0),
    .en(en__x__8),
    .d(wr_data),
    .q(x__8)
);


//==============================
// d_flip_flop__x__9
//==============================
d_flip_flop #(.WIDTH(64)) d_flip_flop__x__9
(
    .clk(clk),
    .rst(1'b0),
    .en(en__x__9),
    .d(wr_data),
    .q(x__9)
);


//==============================
// d_flip_flop__x__10
//==============================
d_flip_flop #(.WIDTH(64)) d_flip_flop__x__10
(
    .clk(clk),
    .rst(1'b0),
    .en(en__x__10),
    .d(wr_data),
    .q(x__10)
);


//==============================
// d_flip_flop__x__11
//==============================
d_flip_flop #(.WIDTH(64)) d_flip_flop__x__11
(
    .clk(clk),
    .rst(1'b0),
    .en(en__x__11),
    .d(wr_data),
    .q(x__11)
);


//==============================
// d_flip_flop__x__12
//==============================
d_flip_flop #(.WIDTH(64)) d_flip_flop__x__12
(
    .clk(clk),
    .rst(1'b0),
    .en(en__x__12),
    .d(wr_data),
    .q(x__12)
);


//==============================
// d_flip_flop__x__13
//==============================
d_flip_flop #(.WIDTH(64)) d_flip_flop__x__13
(
    .clk(clk),
    .rst(1'b0),
    .en(en__x__13),
    .d(wr_data),
    .q(x__13)
);


//==============================
// d_flip_flop__x__14
//==============================
d_flip_flop #(.WIDTH(64)) d_flip_flop__x__14
(
    .clk(clk),
    .rst(1'b0),
    .en(en__x__14),
    .d(wr_data),
    .q(x__14)
);


//==============================
// d_flip_flop__x__15
//==============================
d_flip_flop #(.WIDTH(64)) d_flip_flop__x__15
(
    .clk(clk),
    .rst(1'b0),
    .en(en__x__15),
    .d(wr_data),
    .q(x__15)
);


//==============================
// d_flip_flop__x__16
//==============================
d_flip_flop #(.WIDTH(64)) d_flip_flop__x__16
(
    .clk(clk),
    .rst(1'b0),
    .en(en__x__16),
    .d(wr_data),
    .q(x__16)
);


//==============================
// d_flip_flop__x__17
//==============================
d_flip_flop #(.WIDTH(64)) d_flip_flop__x__17
(
    .clk(clk),
    .rst(1'b0),
    .en(en__x__17),
    .d(wr_data),
    .q(x__17)
);


//==============================
// d_flip_flop__x__18
//==============================
d_flip_flop #(.WIDTH(64)) d_flip_flop__x__18
(
    .clk(clk),
    .rst(1'b0),
    .en(en__x__18),
    .d(wr_data),
    .q(x__18)
);


//==============================
// d_flip_flop__x__19
//==============================
d_flip_flop #(.WIDTH(64)) d_flip_flop__x__19
(
    .clk(clk),
    .rst(1'b0),
    .en(en__x__19),
    .d(wr_data),
    .q(x__19)
);


//==============================
// d_flip_flop__x__20
//==============================
d_flip_flop #(.WIDTH(64)) d_flip_flop__x__20
(
    .clk(clk),
    .rst(1'b0),
    .en(en__x__20),
    .d(wr_data),
    .q(x__20)
);


//==============================
// d_flip_flop__x__21
//==============================
d_flip_flop #(.WIDTH(64)) d_flip_flop__x__21
(
    .clk(clk),
    .rst(1'b0),
    .en(en__x__21),
    .d(wr_data),
    .q(x__21)
);


//==============================
// d_flip_flop__x__22
//==============================
d_flip_flop #(.WIDTH(64)) d_flip_flop__x__22
(
    .clk(clk),
    .rst(1'b0),
    .en(en__x__22),
    .d(wr_data),
    .q(x__22)
);


//==============================
// d_flip_flop__x__23
//==============================
d_flip_flop #(.WIDTH(64)) d_flip_flop__x__23
(
    .clk(clk),
    .rst(1'b0),
    .en(en__x__23),
    .d(wr_data),
    .q(x__23)
);


//==============================
// d_flip_flop__x__24
//==============================
d_flip_flop #(.WIDTH(64)) d_flip_flop__x__24
(
    .clk(clk),
    .rst(1'b0),
    .en(en__x__24),
    .d(wr_data),
    .q(x__24)
);


//==============================
// d_flip_flop__x__25
//==============================
d_flip_flop #(.WIDTH(64)) d_flip_flop__x__25
(
    .clk(clk),
    .rst(1'b0),
    .en(en__x__25),
    .d(wr_data),
    .q(x__25)
);


//==============================
// d_flip_flop__x__26
//==============================
d_flip_flop #(.WIDTH(64)) d_flip_flop__x__26
(
    .clk(clk),
    .rst(1'b0),
    .en(en__x__26),
    .d(wr_data),
    .q(x__26)
);


//==============================
// d_flip_flop__x__27
//==============================
d_flip_flop #(.WIDTH(64)) d_flip_flop__x__27
(
    .clk(clk),
    .rst(1'b0),
    .en(en__x__27),
    .d(wr_data),
    .q(x__27)
);


//==============================
// d_flip_flop__x__28
//==============================
d_flip_flop #(.WIDTH(64)) d_flip_flop__x__28
(
    .clk(clk),
    .rst(1'b0),
    .en(en__x__28),
    .d(wr_data),
    .q(x__28)
);


//==============================
// d_flip_flop__x__29
//==============================
d_flip_flop #(.WIDTH(64)) d_flip_flop__x__29
(
    .clk(clk),
    .rst(1'b0),
    .en(en__x__29),
    .d(wr_data),
    .q(x__29)
);


//==============================
// d_flip_flop__x__30
//==============================
d_flip_flop #(.WIDTH(64)) d_flip_flop__x__30
(
    .clk(clk),
    .rst(1'b0),
    .en(en__x__30),
    .d(wr_data),
    .q(x__30)
);


//==============================
// d_flip_flop__x__31
//==============================
d_flip_flop #(.WIDTH(64)) d_flip_flop__x__31
(
    .clk(clk),
    .rst(1'b0),
    .en(en__x__31),
    .d(wr_data),
    .q(x__31)
);




endmodule
//==============================================
// d_flip_flop 
//==============================================
module d_flip_flop 
#(parameter WIDTH = 1, parameter RESET_VALUE = 0)
(
    input clk,
    input rst,
    input en,
    input [WIDTH-1:0] d,
    output logic [WIDTH-1:0] q
);

always_ff @(posedge clk)
begin
    q <= rst ? RESET_VALUE : en ? d : q; 
end

endmodule
//==============================================
// sr_flip_flop 
//==============================================
module sr_flip_flop 
(
    input clk,
    input s,
    input r,
    output logic q
);

always_ff @(posedge clk)
begin
    q <= r ? 1'b0 : s ? 1'b1 : q;
end

endmodule
