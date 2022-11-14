//==============================================
// top
//==============================================
module top
(
    input clk_100mhz,
    input [15:0] sw,
    input btnc,
    input btnu,
    input btnl,
    input btnr,
    input btnd,
    output logic [15:0] led,
    output logic led16_b,
    output logic led16_g,
    output logic led16_r,
    output logic led17_b,
    output logic led17_g,
    output logic led17_r,
    output logic [7:0] an,
    output logic ca, 
    output logic cb, 
    output logic cc, 
    output logic cd, 
    output logic ce, 
    output logic cf, 
    output logic cg
);

logic btnc__clean;
logic btnu__clean;
logic btnd__clean;
logic btnl__clean;
logic btnr__clean;
logic [15:0] sw__clean;


logic [7:0] port__0;


assign clk = clk_100mhz;
//assign rst = btnc__clean;
assign rst = btnc;
assign led16_b = port__0[0]; 
assign led16_g = 1'b0; 
assign led16_r = 1'b0; 
assign led17_b = 1'b0; 
assign led17_g = 1'b0; 
assign led17_r = 1'b0; 
assign led = 16'h0;
assign an = 8'hff;
assign ca = 1'b0;
assign cb = 1'b0;
assign cc = 1'b0;
assign cc = 1'b0;
assign ce = 1'b0;
assign cf = 1'b0;
assign cg = 1'b0;


//==============================
// jay__0
//==============================
jay jay__0
(
    .clk(clk),
    .rst(rst),
    .port__0(port__0)
);


//==============================
// debouncer__btnc
//==============================
debouncer debouncer__btnc
(
    .clk(clk),
    .rst(rst),
    .in(btnc),
    .out(btnc__clean)
);

//==============================
// debouncer__btnu
//==============================
debouncer debouncer__btnu
(
    .clk(clk),
    .rst(rst),
    .in(btnu),
    .out(btnu__clean)
);

//==============================
// debouncer__btnd
//==============================
debouncer debouncer__btnd
(
    .clk(clk),
    .rst(rst),
    .in(btnd),
    .out(btnd__clean)
);

//==============================
// debouncer__btnl
//==============================
debouncer debouncer__btnl
(
    .clk(clk),
    .rst(rst),
    .in(btnl),
    .out(btnl__clean)
);

//==============================
// debouncer__btnr
//==============================
debouncer debouncer__btnr
(
    .clk(clk),
    .rst(rst),
    .in(btnr),
    .out(btnr__clean)
);

//==============================
// debouncer__sw__0
//==============================
debouncer debouncer__sw__0
(
    .clk(clk),
    .rst(rst),
    .in(sw[0]),
    .out(sw__clean[0])
);

//==============================
// debouncer__sw__1
//==============================
debouncer debouncer__sw__1
(
    .clk(clk),
    .rst(rst),
    .in(sw[1]),
    .out(sw__clean[1])
);

//==============================
// debouncer__sw__2
//==============================
debouncer debouncer__sw__2
(
    .clk(clk),
    .rst(rst),
    .in(sw[2]),
    .out(sw__clean[2])
);

//==============================
// debouncer__sw__3
//==============================
debouncer debouncer__sw__3
(
    .clk(clk),
    .rst(rst),
    .in(sw[3]),
    .out(sw__clean[3])
);

//==============================
// debouncer__sw__4
//==============================
debouncer debouncer__sw__4
(
    .clk(clk),
    .rst(rst),
    .in(sw[4]),
    .out(sw__clean[4])
);

//==============================
// debouncer__sw__5
//==============================
debouncer debouncer__sw__5
(
    .clk(clk),
    .rst(rst),
    .in(sw[5]),
    .out(sw__clean[5])
);

//==============================
// debouncer__sw__6
//==============================
debouncer debouncer__sw__6
(
    .clk(clk),
    .rst(rst),
    .in(sw[6]),
    .out(sw__clean[6])
);

//==============================
// debouncer__sw__7
//==============================
debouncer debouncer__sw__7
(
    .clk(clk),
    .rst(rst),
    .in(sw[7]),
    .out(sw__clean[7])
);

//==============================
// debouncer__sw__8
//==============================
debouncer debouncer__sw__8
(
    .clk(clk),
    .rst(rst),
    .in(sw[8]),
    .out(sw__clean[8])
);

//==============================
// debouncer__sw__9
//==============================
debouncer debouncer__sw__9
(
    .clk(clk),
    .rst(rst),
    .in(sw[9]),
    .out(sw__clean[9])
);

//==============================
// debouncer__sw__10
//==============================
debouncer debouncer__sw__10
(
    .clk(clk),
    .rst(rst),
    .in(sw[10]),
    .out(sw__clean[10])
);

//==============================
// debouncer__sw__11
//==============================
debouncer debouncer__sw__11
(
    .clk(clk),
    .rst(rst),
    .in(sw[11]),
    .out(sw__clean[11])
);

//==============================
// debouncer__sw__12
//==============================
debouncer debouncer__sw__12
(
    .clk(clk),
    .rst(rst),
    .in(sw[12]),
    .out(sw__clean[12])
);

//==============================
// debouncer__sw__13
//==============================
debouncer debouncer__sw__13
(
    .clk(clk),
    .rst(rst),
    .in(sw[13]),
    .out(sw__clean[13])
);

//==============================
// debouncer__sw__14
//==============================
debouncer debouncer__sw__14
(
    .clk(clk),
    .rst(rst),
    .in(sw[14]),
    .out(sw__clean[14])
);

//==============================
// debouncer__sw__15
//==============================
debouncer debouncer__sw__15
(
    .clk(clk),
    .rst(rst),
    .in(sw[15]),
    .out(sw__clean[15])
);

endmodule
//==============================================
// jay
//==============================================
module jay
(
    input clk,
    input rst,
    output logic [7:0] port__0
);


//==============================================
// Logic 
//==============================================
logic clk;
logic rst;

logic cpu_to_mem__valid;
logic cpu_to_mem__ready;
logic cpu_to_mem__we;
logic [63:0] cpu_to_mem__addr;
logic [2:0] cpu_to_mem__dtype;
logic [63:0] cpu_to_mem__data;
logic mem_to_cpu__valid;
logic mem_to_cpu__ready;
logic mem_to_cpu__error;
logic [63:0] mem_to_cpu__data;


//==============================
// cpu 
//==============================
central_processing_unit cpu 
(
    .clk(clk),
    .rst(rst),
    .cpu_to_mem__valid(cpu_to_mem__valid),
    .cpu_to_mem__ready(cpu_to_mem__ready),
    .cpu_to_mem__we(cpu_to_mem__we),
    .cpu_to_mem__addr(cpu_to_mem__addr),
    .cpu_to_mem__dtype(cpu_to_mem__dtype),
    .cpu_to_mem__data(cpu_to_mem__data),
    .mem_to_cpu__valid(mem_to_cpu__valid),
    .mem_to_cpu__ready(mem_to_cpu__ready),
    .mem_to_cpu__error(mem_to_cpu__error),
    .mem_to_cpu__data(mem_to_cpu__data)
);

//==============================
// memory_management_unit 
//==============================
memory_management_unit mmu
(
    .clk(clk),
    .rst(rst),
    .cpu_to_mem__valid(cpu_to_mem__valid),
    .cpu_to_mem__ready(cpu_to_mem__ready),
    .cpu_to_mem__we(cpu_to_mem__we),
    .cpu_to_mem__addr(cpu_to_mem__addr),
    .cpu_to_mem__dtype(cpu_to_mem__dtype),
    .cpu_to_mem__data(cpu_to_mem__data),
    .mem_to_cpu__valid(mem_to_cpu__valid),
    .mem_to_cpu__ready(mem_to_cpu__ready),
    .mem_to_cpu__error(mem_to_cpu__error),
    .mem_to_cpu__data(mem_to_cpu__data),
    .port__0(port__0)
);

endmodule
//==============================================
// central_processing_unit
//==============================================
module central_processing_unit
(
    input clk,
    input rst,
    output logic cpu_to_mem__valid,
    input cpu_to_mem__ready,
    output logic cpu_to_mem__we,
    output logic [63:0] cpu_to_mem__addr,
    output logic [2:0] cpu_to_mem__dtype,
    output logic [63:0] cpu_to_mem__data,
    input mem_to_cpu__valid,
    output logic mem_to_cpu__ready,
    input mem_to_cpu__error,
    input [63:0] mem_to_cpu__data
);


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
logic we;
logic [4:0] addr;
logic [63:0] rd_data;
logic [63:0] wr_data;

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
logic csr__we;
logic [11:0] csr__addr;
logic [63:0] csr__wr_data;
logic [63:0] csr__rd_data;
logic [63:0] mstatus;
logic [63:0] mie;
logic [63:0] mip;

// Memory Interface
//logic cpu_to_mem__valid;
//logic cpu_to_mem__ready;
//logic cpu_to_mem__we;
//logic [63:0] cpu_to_mem__addr;
//logic [2:0] cpu_to_mem__dtype;
//logic [63:0] cpu_to_mem__wr_data;
//logic cpu_to_mem__done;
//logic [63:0] cpu_to_mem__rd_data;
//logic cpu_to_mem__access_fault;
//logic cpu_to_mem__address_misaligned_fault;

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
    .we(we),
    .addr(addr),
    .rd_data(rd_data),
    .wr_data(wr_data)
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
    .we(csr__we),
    .addr(csr__addr),
    .rd_data(csr__rd_data),
    .wr_data(csr__wr_data),
    .mstatus(mstatus),
    .mie(mie),
    .mip(mip)
);



//==============================================
// Finite State Machine
//==============================================
localparam STATE__RESET = 8'h0;
localparam STATE__FETCH__0 = 8'h1;
localparam STATE__FETCH__1 = 8'h2;
localparam STATE__FETCH__2 = 8'h3;
localparam STATE__FETCH__3 = 8'h4;
localparam STATE__FETCH__4 = 8'h5;
localparam STATE__DECODE = 8'h6;
localparam STATE__LB__0 = 8'h7;
localparam STATE__LB__1 = 8'h8;
localparam STATE__LB__2 = 8'h9;
localparam STATE__LB__3 = 8'ha;
localparam STATE__LB__4 = 8'hb;
localparam STATE__LH__0 = 8'hc;
localparam STATE__LH__1 = 8'hd;
localparam STATE__LH__2 = 8'he;
localparam STATE__LH__3 = 8'hf;
localparam STATE__LH__4 = 8'h10;
localparam STATE__LW__0 = 8'h11;
localparam STATE__LW__1 = 8'h12;
localparam STATE__LW__2 = 8'h13;
localparam STATE__LW__3 = 8'h14;
localparam STATE__LW__4 = 8'h15;
localparam STATE__LD__0 = 8'h16;
localparam STATE__LD__1 = 8'h17;
localparam STATE__LD__2 = 8'h18;
localparam STATE__LD__3 = 8'h19;
localparam STATE__LD__4 = 8'h1a;
localparam STATE__LBU__0 = 8'h1b;
localparam STATE__LBU__1 = 8'h1c;
localparam STATE__LBU__2 = 8'h1d;
localparam STATE__LBU__3 = 8'h1e;
localparam STATE__LBU__4 = 8'h1f;
localparam STATE__LHU__0 = 8'h20;
localparam STATE__LHU__1 = 8'h21;
localparam STATE__LHU__2 = 8'h22;
localparam STATE__LHU__3 = 8'h23;
localparam STATE__LHU__4 = 8'h24;
localparam STATE__LWU__0 = 8'h25;
localparam STATE__LWU__1 = 8'h26;
localparam STATE__LWU__2 = 8'h27;
localparam STATE__LWU__3 = 8'h28;
localparam STATE__LWU__4 = 8'h29;
localparam STATE__SB__0 = 8'h2a;
localparam STATE__SB__1 = 8'h2b;
localparam STATE__SB__2 = 8'h2c;
localparam STATE__SB__3 = 8'h2d;
localparam STATE__SB__4 = 8'h2e;
localparam STATE__SH__0 = 8'h2f;
localparam STATE__SH__1 = 8'h30;
localparam STATE__SH__2 = 8'h31;
localparam STATE__SH__3 = 8'h32;
localparam STATE__SH__4 = 8'h33;
localparam STATE__SW__0 = 8'h34;
localparam STATE__SW__1 = 8'h35;
localparam STATE__SW__2 = 8'h36;
localparam STATE__SW__3 = 8'h37;
localparam STATE__SW__4 = 8'h38;
localparam STATE__SD__0 = 8'h39;
localparam STATE__SD__1 = 8'h3a;
localparam STATE__SD__2 = 8'h3b;
localparam STATE__SD__3 = 8'h3c;
localparam STATE__SD__4 = 8'h3d;
localparam STATE__ADD__0 = 8'h3e;
localparam STATE__ADD__1 = 8'h3f;
localparam STATE__ADD__2 = 8'h40;
localparam STATE__SUB__0 = 8'h41;
localparam STATE__SUB__1 = 8'h42;
localparam STATE__SUB__2 = 8'h43;
localparam STATE__SLL__0 = 8'h44;
localparam STATE__SLL__1 = 8'h45;
localparam STATE__SLL__2 = 8'h46;
localparam STATE__SLT__0 = 8'h47;
localparam STATE__SLT__1 = 8'h48;
localparam STATE__SLT__2 = 8'h49;
localparam STATE__SLTU__0 = 8'h4a;
localparam STATE__SLTU__1 = 8'h4b;
localparam STATE__SLTU__2 = 8'h4c;
localparam STATE__XOR__0 = 8'h4d;
localparam STATE__XOR__1 = 8'h4e;
localparam STATE__XOR__2 = 8'h4f;
localparam STATE__SRL__0 = 8'h50;
localparam STATE__SRL__1 = 8'h51;
localparam STATE__SRL__2 = 8'h52;
localparam STATE__SRA__0 = 8'h53;
localparam STATE__SRA__1 = 8'h54;
localparam STATE__SRA__2 = 8'h55;
localparam STATE__OR__0 = 8'h56;
localparam STATE__OR__1 = 8'h57;
localparam STATE__OR__2 = 8'h58;
localparam STATE__AND__0 = 8'h59;
localparam STATE__AND__1 = 8'h5a;
localparam STATE__AND__2 = 8'h5b;
localparam STATE__LUI = 8'h5c;
localparam STATE__ADDW__0 = 8'h5d;
localparam STATE__ADDW__1 = 8'h5e;
localparam STATE__ADDW__2 = 8'h5f;
localparam STATE__SUBW__0 = 8'h60;
localparam STATE__SUBW__1 = 8'h61;
localparam STATE__SUBW__2 = 8'h62;
localparam STATE__SLLW__0 = 8'h63;
localparam STATE__SLLW__1 = 8'h64;
localparam STATE__SLLW__2 = 8'h65;
localparam STATE__SRLW__0 = 8'h66;
localparam STATE__SRLW__1 = 8'h67;
localparam STATE__SRLW__2 = 8'h68;
localparam STATE__SRAW__0 = 8'h69;
localparam STATE__SRAW__1 = 8'h6a;
localparam STATE__SRAW__2 = 8'h6b;
localparam STATE__ADDI__0 = 8'h6c;
localparam STATE__ADDI__1 = 8'h6d;
localparam STATE__SLLI__0 = 8'h6e;
localparam STATE__SLLI__1 = 8'h6f;
localparam STATE__SLTI__0 = 8'h70;
localparam STATE__SLTI__1 = 8'h71;
localparam STATE__SLTIU__0 = 8'h72;
localparam STATE__SLTIU__1 = 8'h73;
localparam STATE__XORI__0 = 8'h74;
localparam STATE__XORI__1 = 8'h75;
localparam STATE__SRLI__0 = 8'h76;
localparam STATE__SRLI__1 = 8'h77;
localparam STATE__SRAI__0 = 8'h78;
localparam STATE__SRAI__1 = 8'h79;
localparam STATE__ORI__0 = 8'h7a;
localparam STATE__ORI__1 = 8'h7b;
localparam STATE__ANDI__0 = 8'h7c;
localparam STATE__ANDI__1 = 8'h7d;
localparam STATE__ADDIW__0 = 8'h7e;
localparam STATE__ADDIW__1 = 8'h7f;
localparam STATE__SLLIW__0 = 8'h80;
localparam STATE__SLLIW__1 = 8'h81;
localparam STATE__SRLIW__0 = 8'h82;
localparam STATE__SRLIW__1 = 8'h83;
localparam STATE__SRAIW__0 = 8'h84;
localparam STATE__SRAIW__1 = 8'h85;
localparam STATE__AUIPC__0 = 8'h86;
localparam STATE__AUIPC__1 = 8'h87;
localparam STATE__JALR__0 = 8'h88;
localparam STATE__JALR__1 = 8'h89;
localparam STATE__JAL__0 = 8'h8a;
localparam STATE__JAL__1 = 8'h8b;
localparam STATE__BEQ__0 = 8'h8c;
localparam STATE__BEQ__1 = 8'h8d;
localparam STATE__BEQ__2 = 8'h8e;
localparam STATE__BEQ__3 = 8'h8f;
localparam STATE__BEQ__4 = 8'h90;
localparam STATE__BEQ__5 = 8'h91;
localparam STATE__BNE__0 = 8'h92;
localparam STATE__BNE__1 = 8'h93;
localparam STATE__BNE__2 = 8'h94;
localparam STATE__BNE__3 = 8'h95;
localparam STATE__BNE__4 = 8'h96;
localparam STATE__BNE__5 = 8'h97;
localparam STATE__BLT__0 = 8'h98;
localparam STATE__BLT__1 = 8'h99;
localparam STATE__BLT__2 = 8'h9a;
localparam STATE__BLT__3 = 8'h9b;
localparam STATE__BLT__4 = 8'h9c;
localparam STATE__BLT__5 = 8'h9d;
localparam STATE__BGE__0 = 8'h9e;
localparam STATE__BGE__1 = 8'h9f;
localparam STATE__BGE__2 = 8'ha0;
localparam STATE__BGE__3 = 8'ha1;
localparam STATE__BGE__4 = 8'ha2;
localparam STATE__BGE__5 = 8'ha3;
localparam STATE__BLTU__0 = 8'ha4;
localparam STATE__BLTU__1 = 8'ha5;
localparam STATE__BLTU__2 = 8'ha6;
localparam STATE__BLTU__3 = 8'ha7;
localparam STATE__BLTU__4 = 8'ha8;
localparam STATE__BLTU__5 = 8'ha9;
localparam STATE__BGEU__0 = 8'haa;
localparam STATE__BGEU__1 = 8'hab;
localparam STATE__BGEU__2 = 8'hac;
localparam STATE__BGEU__3 = 8'had;
localparam STATE__BGEU__4 = 8'hae;
localparam STATE__BGEU__5 = 8'haf;
localparam STATE__ECALL = 8'hb0;
localparam STATE__EBREAK = 8'hb1;
localparam STATE__WFI = 8'hb2;
localparam STATE__FENCE = 8'hb3;
localparam STATE__FENCE_I = 8'hb4;
localparam STATE__CSRRW__0 = 8'hb5;
localparam STATE__CSRRW__1 = 8'hb6;
localparam STATE__CSRRW__2 = 8'hb7;
localparam STATE__CSRRS__0 = 8'hb8;
localparam STATE__CSRRS__1 = 8'hb9;
localparam STATE__CSRRS__2 = 8'hba;
localparam STATE__CSRRC__0 = 8'hbb;
localparam STATE__CSRRC__1 = 8'hbc;
localparam STATE__CSRRC__2 = 8'hbd;
localparam STATE__CSRRWI__0 = 8'hbe;
localparam STATE__CSRRWI__1 = 8'hbf;
localparam STATE__CSRRWI__2 = 8'hc0;
localparam STATE__CSRRSI__0 = 8'hc1;
localparam STATE__CSRRSI__1 = 8'hc2;
localparam STATE__CSRRSI__2 = 8'hc3;
localparam STATE__CSRRCI__0 = 8'hc4;
localparam STATE__CSRRCI__1 = 8'hc5;
localparam STATE__CSRRCI__2 = 8'hc6;
localparam STATE__MRET__0 = 8'hc7;
localparam STATE__MRET__1 = 8'hc8;
localparam STATE__TRAP__0 = 8'hc9;
localparam STATE__TRAP__1 = 8'hca;
localparam STATE__TRAP__2 = 8'hcb;
localparam STATE__EXCEPTION__INSTRUCTION_ADDRESS_MISALIGNED__0 = 8'hcc;
localparam STATE__EXCEPTION__INSTRUCTION_ADDRESS_MISALIGNED__0__JALR = 8'hcd;
localparam STATE__EXCEPTION__INSTRUCTION_ADDRESS_MISALIGNED__1 = 8'hce;
localparam STATE__EXCEPTION__INSTRUCTION_ACCESS_FAULT__0 = 8'hcf;
localparam STATE__EXCEPTION__INSTRUCTION_ACCESS_FAULT__1 = 8'hd0;
localparam STATE__EXCEPTION__ILLEGAL_INSTRUCTION = 8'hd1;
localparam STATE__EXCEPTION__LOAD_ADDRESS_MISALIGNED__0 = 8'hd2;
localparam STATE__EXCEPTION__LOAD_ADDRESS_MISALIGNED__1 = 8'hd3;
localparam STATE__EXCEPTION__LOAD_ACCESS_FAULT__0 = 8'hd4;
localparam STATE__EXCEPTION__LOAD_ACCESS_FAULT__1 = 8'hd5;
localparam STATE__EXCEPTION__STORE_ADDRESS_MISALIGNED__0 = 8'hd6;
localparam STATE__EXCEPTION__STORE_ADDRESS_MISALIGNED__1 = 8'hd7;
localparam STATE__EXCEPTION__STORE_ACCESS_FAULT__0 = 8'hd8;
localparam STATE__EXCEPTION__STORE_ACCESS_FAULT__1 = 8'hd9;
localparam STATE__INTERRUPT__SOFTWARE = 8'hda;
localparam STATE__INTERRUPT__TIMER = 8'hdb;
localparam STATE__INTERRUPT__EXTERNAL = 8'hdc;
localparam STATE__FATAL = 8'hdd;


always_comb begin
    state__n = state;
    ir__n = ir;
    pc__n = pc;
    a__n = a;
    b__n = b;
    func = 5'h0;
    addr = rd;
    we = 1'b0;
    wr_data = c;
    cpu_to_mem__valid = 1'b0;
    cpu_to_mem__we = 1'b0;
    cpu_to_mem__dtype = 3'h1;
    cpu_to_mem__data = rd_data;
    mem_to_cpu__ready = 1'b0;
    csr__addr = imm[11:0];
    csr__we = 1'b0;
    csr__wr_data = c;

    case (state)
        //==============================
        // STATE__RESET
        //==============================
        STATE__RESET:
        begin
            state__n = STATE__FETCH__0;
        end
        
//        //==============================
//        // STATE__FETCH
//        //==============================
//        STATE__FETCH:
//        begin
//            cpu_to_mem__valid = 1'b1;
//            cpu_to_mem__addr = pc;
//            cpu_to_mem__dtype = 3'h1;
//            
//            if (mstatus[3] && mip[11] && mie[11]) begin
//                state__n = STATE__INTERRUPT__EXTERNAL;
//            end
//            else if (mstatus[3] && mip[3] && mie[3]) begin
//                state__n = STATE__INTERRUPT__SOFTWARE;
//            end
//            else if (mstatus[3] && mip[7] && mie[7]) begin
//                state__n = STATE__INTERRUPT__TIMER;
//            end
//            else begin
//                if (cpu_to_mem__hit) begin
//                    ir__n = cpu_to_mem__rd_data[31:0];
//                    state__n = STATE__DECODE;
//                end
//            end
//        end

        //==============================
        // STATE__FETCH__0
        //==============================
        STATE__FETCH__0:
        begin
            state__n = (mstatus[3] && mip[11] && mie[11]) ? STATE__INTERRUPT__EXTERNAL : (mstatus[3] && mip[3] && mie[3]) ? STATE__INTERRUPT__SOFTWARE : (mstatus[3] && mip[7] && mie[7]) ? STATE__INTERRUPT__TIMER : STATE__FETCH__1;
            state__n = STATE__FETCH__1;
        end

        //==============================
        // STATE__FETCH__1
        //==============================
        STATE__FETCH__1:
        begin
            cpu_to_mem__valid = 1'b1;
            cpu_to_mem__addr = pc;
            cpu_to_mem__dtype = 3'h1;
            state__n = cpu_to_mem__ready ? STATE__FETCH__2 : STATE__FETCH__1;
        end

        //==============================
        // STATE__FETCH__2
        //==============================
        STATE__FETCH__2:
        begin
            state__n = mem_to_cpu__valid ? (mem_to_cpu__error ? STATE__FETCH__4 : STATE__FETCH__3) : STATE__FETCH__2;
        end

        //==============================
        // STATE__FETCH__3
        //==============================
        STATE__FETCH__3:
        begin
            ir__n = mem_to_cpu__data[31:0];
            mem_to_cpu__ready = 1'b1;
            state__n = STATE__DECODE;
        end

        //==============================
        // STATE__FETCH__4
        //==============================
        STATE__FETCH__4:
        begin
            mem_to_cpu__ready = 1'b1;
            state__n = (mem_to_cpu__data == 64'h0) ? STATE__EXCEPTION__INSTRUCTION_ACCESS_FAULT__0 : STATE__FATAL;
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
            addr = rs1;
            a__n = rd_data;
            state__n = STATE__ADD__1;
        end

        //==============================
        // STATE__ADD__1
        //==============================
        STATE__ADD__1:
        begin
            addr = rs2;
            b__n = rd_data;
            state__n = STATE__ADD__2;
        end

        //==============================
        // STATE__ADD__2
        //==============================
        STATE__ADD__2:
        begin
            func = 5'h0;
            addr = rd;
            we = 1'b1;
            wr_data = c;
            pc__n = pc + 4;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__SUB__0
        //==============================
        STATE__SUB__0:
        begin
            addr = rs1;
            a__n = rd_data;
            state__n = STATE__SUB__1;
        end

        //==============================
        // STATE__SUB__1
        //==============================
        STATE__SUB__1:
        begin
            addr = rs2;
            b__n = rd_data;
            state__n = STATE__SUB__2;
        end

        //==============================
        // STATE__SUB__2
        //==============================
        STATE__SUB__2:
        begin
            func = 5'h2;
            addr = rd;
            we = 1'b1;
            wr_data = c;
            pc__n = pc + 4;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__SLL__0
        //==============================
        STATE__SLL__0:
        begin
            addr = rs1;
            a__n = rd_data;
            state__n = STATE__SLL__1;
        end

        //==============================
        // STATE__SLL__1
        //==============================
        STATE__SLL__1:
        begin
            addr = rs2;
            b__n = rd_data;
            state__n = STATE__SLL__2;
        end

        //==============================
        // STATE__SLL__2
        //==============================
        STATE__SLL__2:
        begin
            func = 5'h4;
            addr = rd;
            we = 1'b1;
            wr_data = c;
            pc__n = pc + 4;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__SLT__0
        //==============================
        STATE__SLT__0:
        begin
            addr = rs1;
            a__n = rd_data;
            state__n = STATE__SLT__1;
        end

        //==============================
        // STATE__SLT__1
        //==============================
        STATE__SLT__1:
        begin
            addr = rs2;
            b__n = rd_data;
            state__n = STATE__SLT__2;
        end

        //==============================
        // STATE__SLT__2
        //==============================
        STATE__SLT__2:
        begin
            func = 5'h6;
            addr = rd;
            we = 1'b1;
            wr_data = c;
            pc__n = pc + 4;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__SLTU__0
        //==============================
        STATE__SLTU__0:
        begin
            addr = rs1;
            a__n = rd_data;
            state__n = STATE__SLTU__1;
        end

        //==============================
        // STATE__SLTU__1
        //==============================
        STATE__SLTU__1:
        begin
            addr = rs2;
            b__n = rd_data;
            state__n = STATE__SLTU__2;
        end

        //==============================
        // STATE__SLTU__2
        //==============================
        STATE__SLTU__2:
        begin
            func = 5'h7;
            addr = rd;
            we = 1'b1;
            wr_data = c;
            pc__n = pc + 4;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__XOR__0
        //==============================
        STATE__XOR__0:
        begin
            addr = rs1;
            a__n = rd_data;
            state__n = STATE__XOR__1;
        end

        //==============================
        // STATE__XOR__1
        //==============================
        STATE__XOR__1:
        begin
            addr = rs2;
            b__n = rd_data;
            state__n = STATE__XOR__2;
        end

        //==============================
        // STATE__XOR__2
        //==============================
        STATE__XOR__2:
        begin
            func = 5'h8;
            addr = rd;
            we = 1'b1;
            wr_data = c;
            pc__n = pc + 4;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__SRL__0
        //==============================
        STATE__SRL__0:
        begin
            addr = rs1;
            a__n = rd_data;
            state__n = STATE__SRL__1;
        end

        //==============================
        // STATE__SRL__1
        //==============================
        STATE__SRL__1:
        begin
            addr = rs2;
            b__n = rd_data;
            state__n = STATE__SRL__2;
        end

        //==============================
        // STATE__SRL__2
        //==============================
        STATE__SRL__2:
        begin
            func = 5'h9;
            addr = rd;
            we = 1'b1;
            wr_data = c;
            pc__n = pc + 4;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__SRA__0
        //==============================
        STATE__SRA__0:
        begin
            addr = rs1;
            a__n = rd_data;
            state__n = STATE__SRA__1;
        end

        //==============================
        // STATE__SRA__1
        //==============================
        STATE__SRA__1:
        begin
            addr = rs2;
            b__n = rd_data;
            state__n = STATE__SRA__2;
        end

        //==============================
        // STATE__SRA__2
        //==============================
        STATE__SRA__2:
        begin
            func = 5'hb;
            addr = rd;
            we = 1'b1;
            wr_data = c;
            pc__n = pc + 4;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__OR__0
        //==============================
        STATE__OR__0:
        begin
            addr = rs1;
            a__n = rd_data;
            state__n = STATE__OR__1;
        end

        //==============================
        // STATE__OR__1
        //==============================
        STATE__OR__1:
        begin
            addr = rs2;
            b__n = rd_data;
            state__n = STATE__OR__2;
        end

        //==============================
        // STATE__OR__2
        //==============================
        STATE__OR__2:
        begin
            func = 5'hd;
            addr = rd;
            we = 1'b1;
            wr_data = c;
            pc__n = pc + 4;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__AND__0
        //==============================
        STATE__AND__0:
        begin
            addr = rs1;
            a__n = rd_data;
            state__n = STATE__AND__1;
        end

        //==============================
        // STATE__AND__1
        //==============================
        STATE__AND__1:
        begin
            addr = rs2;
            b__n = rd_data;
            state__n = STATE__AND__2;
        end

        //==============================
        // STATE__AND__2
        //==============================
        STATE__AND__2:
        begin
            func = 5'he;
            addr = rd;
            we = 1'b1;
            wr_data = c;
            pc__n = pc + 4;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__ADDW__0
        //==============================
        STATE__ADDW__0:
        begin
            addr = rs1;
            a__n = rd_data;
            state__n = STATE__ADDW__1;
        end

        //==============================
        // STATE__ADDW__1
        //==============================
        STATE__ADDW__1:
        begin
            addr = rs2;
            b__n = rd_data;
            state__n = STATE__ADDW__2;
        end

        //==============================
        // STATE__ADDW__2
        //==============================
        STATE__ADDW__2:
        begin
            func = 5'h1;
            addr = rd;
            we = 1'b1;
            wr_data = c;
            pc__n = pc + 4;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__SUBW__0
        //==============================
        STATE__SUBW__0:
        begin
            addr = rs1;
            a__n = rd_data;
            state__n = STATE__SUBW__1;
        end

        //==============================
        // STATE__SUBW__1
        //==============================
        STATE__SUBW__1:
        begin
            addr = rs2;
            b__n = rd_data;
            state__n = STATE__SUBW__2;
        end

        //==============================
        // STATE__SUBW__2
        //==============================
        STATE__SUBW__2:
        begin
            func = 5'h3;
            addr = rd;
            we = 1'b1;
            wr_data = c;
            pc__n = pc + 4;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__SLLW__0
        //==============================
        STATE__SLLW__0:
        begin
            addr = rs1;
            a__n = rd_data;
            state__n = STATE__SLLW__1;
        end

        //==============================
        // STATE__SLLW__1
        //==============================
        STATE__SLLW__1:
        begin
            addr = rs2;
            b__n = rd_data;
            state__n = STATE__SLLW__2;
        end

        //==============================
        // STATE__SLLW__2
        //==============================
        STATE__SLLW__2:
        begin
            func = 5'h5;
            addr = rd;
            we = 1'b1;
            wr_data = c;
            pc__n = pc + 4;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__SRLW__0
        //==============================
        STATE__SRLW__0:
        begin
            addr = rs1;
            a__n = rd_data;
            state__n = STATE__SRLW__1;
        end

        //==============================
        // STATE__SRLW__1
        //==============================
        STATE__SRLW__1:
        begin
            addr = rs2;
            b__n = rd_data;
            state__n = STATE__SRLW__2;
        end

        //==============================
        // STATE__SRLW__2
        //==============================
        STATE__SRLW__2:
        begin
            func = 5'ha;
            addr = rd;
            we = 1'b1;
            wr_data = c;
            pc__n = pc + 4;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__SRAW__0
        //==============================
        STATE__SRAW__0:
        begin
            addr = rs1;
            a__n = rd_data;
            state__n = STATE__SRAW__1;
        end

        //==============================
        // STATE__SRAW__1
        //==============================
        STATE__SRAW__1:
        begin
            addr = rs2;
            b__n = rd_data;
            state__n = STATE__SRAW__2;
        end

        //==============================
        // STATE__SRAW__2
        //==============================
        STATE__SRAW__2:
        begin
            func = 5'hc;
            addr = rd;
            we = 1'b1;
            wr_data = c;
            pc__n = pc + 4;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__ADDI__0
        //==============================
        STATE__ADDI__0:
        begin
            addr = rs1;
            a__n = rd_data;
            b__n = imm;
            state__n = STATE__ADDI__1;
        end

        //==============================
        // STATE__ADDI__1
        //==============================
        STATE__ADDI__1:
        begin
            func = 5'h0;
            addr = rd;
            we = 1'b1;
            wr_data = c;
            pc__n = pc + 4;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__SLLI__0
        //==============================
        STATE__SLLI__0:
        begin
            addr = rs1;
            a__n = rd_data;
            b__n = imm;
            state__n = STATE__SLLI__1;
        end

        //==============================
        // STATE__SLLI__1
        //==============================
        STATE__SLLI__1:
        begin
            func = 5'h4;
            addr = rd;
            we = 1'b1;
            wr_data = c;
            pc__n = pc + 4;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__SLTI__0
        //==============================
        STATE__SLTI__0:
        begin
            addr = rs1;
            a__n = rd_data;
            b__n = imm;
            state__n = STATE__SLTI__1;
        end

        //==============================
        // STATE__SLTI__1
        //==============================
        STATE__SLTI__1:
        begin
            func = 5'h6;
            addr = rd;
            we = 1'b1;
            wr_data = c;
            pc__n = pc + 4;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__SLTIU__0
        //==============================
        STATE__SLTIU__0:
        begin
            addr = rs1;
            a__n = rd_data;
            b__n = imm;
            state__n = STATE__SLTIU__1;
        end

        //==============================
        // STATE__SLTIU__1
        //==============================
        STATE__SLTIU__1:
        begin
            func = 5'h7;
            addr = rd;
            we = 1'b1;
            wr_data = c;
            pc__n = pc + 4;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__XORI__0
        //==============================
        STATE__XORI__0:
        begin
            addr = rs1;
            a__n = rd_data;
            b__n = imm;
            state__n = STATE__XORI__1;
        end

        //==============================
        // STATE__XORI__1
        //==============================
        STATE__XORI__1:
        begin
            func = 5'h8;
            addr = rd;
            we = 1'b1;
            wr_data = c;
            pc__n = pc + 4;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__SRLI__0
        //==============================
        STATE__SRLI__0:
        begin
            addr = rs1;
            a__n = rd_data;
            b__n = imm;
            state__n = STATE__SRLI__1;
        end

        //==============================
        // STATE__SRLI__1
        //==============================
        STATE__SRLI__1:
        begin
            func = 5'h9;
            addr = rd;
            we = 1'b1;
            wr_data = c;
            pc__n = pc + 4;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__SRAI__0
        //==============================
        STATE__SRAI__0:
        begin
            addr = rs1;
            a__n = rd_data;
            b__n = imm;
            state__n = STATE__SRAI__1;
        end

        //==============================
        // STATE__SRAI__1
        //==============================
        STATE__SRAI__1:
        begin
            func = 5'hb;
            addr = rd;
            we = 1'b1;
            wr_data = c;
            pc__n = pc + 4;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__ORI__0
        //==============================
        STATE__ORI__0:
        begin
            addr = rs1;
            a__n = rd_data;
            b__n = imm;
            state__n = STATE__ORI__1;
        end

        //==============================
        // STATE__ORI__1
        //==============================
        STATE__ORI__1:
        begin
            func = 5'hd;
            addr = rd;
            we = 1'b1;
            wr_data = c;
            pc__n = pc + 4;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__ANDI__0
        //==============================
        STATE__ANDI__0:
        begin
            addr = rs1;
            a__n = rd_data;
            b__n = imm;
            state__n = STATE__ANDI__1;
        end

        //==============================
        // STATE__ANDI__1
        //==============================
        STATE__ANDI__1:
        begin
            func = 5'he;
            addr = rd;
            we = 1'b1;
            wr_data = c;
            pc__n = pc + 4;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__ADDIW__0
        //==============================
        STATE__ADDIW__0:
        begin
            addr = rs1;
            a__n = rd_data;
            b__n = imm;
            state__n = STATE__ADDIW__1;
        end

        //==============================
        // STATE__ADDIW__1
        //==============================
        STATE__ADDIW__1:
        begin
            func = 5'h1;
            addr = rd;
            we = 1'b1;
            wr_data = c;
            pc__n = pc + 4;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__SLLIW__0
        //==============================
        STATE__SLLIW__0:
        begin
            addr = rs1;
            a__n = rd_data;
            b__n = imm;
            state__n = STATE__SLLIW__1;
        end

        //==============================
        // STATE__SLLIW__1
        //==============================
        STATE__SLLIW__1:
        begin
            func = 5'h5;
            addr = rd;
            we = 1'b1;
            wr_data = c;
            pc__n = pc + 4;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__SRLIW__0
        //==============================
        STATE__SRLIW__0:
        begin
            addr = rs1;
            a__n = rd_data;
            b__n = imm;
            state__n = STATE__SRLIW__1;
        end

        //==============================
        // STATE__SRLIW__1
        //==============================
        STATE__SRLIW__1:
        begin
            func = 5'ha;
            addr = rd;
            we = 1'b1;
            wr_data = c;
            pc__n = pc + 4;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__SRAIW__0
        //==============================
        STATE__SRAIW__0:
        begin
            addr = rs1;
            a__n = rd_data;
            b__n = imm;
            state__n = STATE__SRAIW__1;
        end

        //==============================
        // STATE__SRAIW__1
        //==============================
        STATE__SRAIW__1:
        begin
            func = 5'hc;
            addr = rd;
            we = 1'b1;
            wr_data = c;
            pc__n = pc + 4;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__LB__0
        //==============================
        STATE__LB__0:
        begin
            addr = rs1;
            a__n = rd_data;
            b__n = imm;
            state__n = STATE__LB__1;
        end

        //==============================
        // STATE__LB__1
        //==============================
        STATE__LB__1:
        begin
            func = 5'h0;
            cpu_to_mem__valid = 1'b1;
            cpu_to_mem__addr = c;
            cpu_to_mem__dtype = 3'h5;
            state__n = cpu_to_mem__ready ? STATE__LB__2 : STATE__LB__1;
        end

        //==============================
        // STATE__LB__2
        //==============================
        STATE__LB__2:
        begin
            state__n = mem_to_cpu__valid ? (mem_to_cpu__error ? STATE__LB__4 : STATE__LB__3) : STATE__LB__2;
        end

        //==============================
        // STATE__LB__3
        //==============================
        STATE__LB__3:
        begin
            addr = rd;
            we = 1'b1;
            wr_data = mem_to_cpu__data;
            mem_to_cpu__ready = 1'b1;
            pc__n = pc + 4;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__LB__4
        //==============================
        STATE__LB__4:
        begin
            mem_to_cpu__ready = 1'b1;
            state__n = (mem_to_cpu__data == 64'h0) ? STATE__EXCEPTION__LOAD_ACCESS_FAULT__0 : (mem_to_cpu__data == 64'h1) ? STATE__EXCEPTION__LOAD_ADDRESS_MISALIGNED__0 : STATE__FATAL;
        end

        //==============================
        // STATE__LH__0
        //==============================
        STATE__LH__0:
        begin
            addr = rs1;
            a__n = rd_data;
            b__n = imm;
            state__n = STATE__LH__1;
        end

        //==============================
        // STATE__LH__1
        //==============================
        STATE__LH__1:
        begin
            func = 5'h0;
            cpu_to_mem__valid = 1'b1;
            cpu_to_mem__addr = c;
            cpu_to_mem__dtype = 3'h3;
            state__n = cpu_to_mem__ready ? STATE__LH__2 : STATE__LH__1;
        end

        //==============================
        // STATE__LH__2
        //==============================
        STATE__LH__2:
        begin
            state__n = mem_to_cpu__valid ? (mem_to_cpu__error ? STATE__LH__4 : STATE__LH__3) : STATE__LH__2;
        end

        //==============================
        // STATE__LH__3
        //==============================
        STATE__LH__3:
        begin
            addr = rd;
            we = 1'b1;
            wr_data = mem_to_cpu__data;
            mem_to_cpu__ready = 1'b1;
            pc__n = pc + 4;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__LH__4
        //==============================
        STATE__LH__4:
        begin
            mem_to_cpu__ready = 1'b1;
            state__n = (mem_to_cpu__data == 64'h0) ? STATE__EXCEPTION__LOAD_ACCESS_FAULT__0 : (mem_to_cpu__data == 64'h1) ? STATE__EXCEPTION__LOAD_ADDRESS_MISALIGNED__0 : STATE__FATAL;
        end

        //==============================
        // STATE__LW__0
        //==============================
        STATE__LW__0:
        begin
            addr = rs1;
            a__n = rd_data;
            b__n = imm;
            state__n = STATE__LW__1;
        end

        //==============================
        // STATE__LW__1
        //==============================
        STATE__LW__1:
        begin
            func = 5'h0;
            cpu_to_mem__valid = 1'b1;
            cpu_to_mem__addr = c;
            cpu_to_mem__dtype = 3'h1;
            state__n = cpu_to_mem__ready ? STATE__LW__2 : STATE__LW__1;
        end

        //==============================
        // STATE__LW__2
        //==============================
        STATE__LW__2:
        begin
            state__n = mem_to_cpu__valid ? (mem_to_cpu__error ? STATE__LW__4 : STATE__LW__3) : STATE__LW__2;
        end

        //==============================
        // STATE__LW__3
        //==============================
        STATE__LW__3:
        begin
            addr = rd;
            we = 1'b1;
            wr_data = mem_to_cpu__data;
            mem_to_cpu__ready = 1'b1;
            pc__n = pc + 4;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__LW__4
        //==============================
        STATE__LW__4:
        begin
            mem_to_cpu__ready = 1'b1;
            state__n = (mem_to_cpu__data == 64'h0) ? STATE__EXCEPTION__LOAD_ACCESS_FAULT__0 : (mem_to_cpu__data == 64'h1) ? STATE__EXCEPTION__LOAD_ADDRESS_MISALIGNED__0 : STATE__FATAL;
        end

        //==============================
        // STATE__LD__0
        //==============================
        STATE__LD__0:
        begin
            addr = rs1;
            a__n = rd_data;
            b__n = imm;
            state__n = STATE__LD__1;
        end

        //==============================
        // STATE__LD__1
        //==============================
        STATE__LD__1:
        begin
            func = 5'h0;
            cpu_to_mem__valid = 1'b1;
            cpu_to_mem__addr = c;
            cpu_to_mem__dtype = 3'h0;
            state__n = cpu_to_mem__ready ? STATE__LD__2 : STATE__LD__1;
        end

        //==============================
        // STATE__LD__2
        //==============================
        STATE__LD__2:
        begin
            state__n = mem_to_cpu__valid ? (mem_to_cpu__error ? STATE__LD__4 : STATE__LD__3) : STATE__LD__2;
        end

        //==============================
        // STATE__LD__3
        //==============================
        STATE__LD__3:
        begin
            addr = rd;
            we = 1'b1;
            wr_data = mem_to_cpu__data;
            mem_to_cpu__ready = 1'b1;
            pc__n = pc + 4;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__LD__4
        //==============================
        STATE__LD__4:
        begin
            mem_to_cpu__ready = 1'b1;
            state__n = (mem_to_cpu__data == 64'h0) ? STATE__EXCEPTION__LOAD_ACCESS_FAULT__0 : (mem_to_cpu__data == 64'h1) ? STATE__EXCEPTION__LOAD_ADDRESS_MISALIGNED__0 : STATE__FATAL;
        end

        //==============================
        // STATE__LBU__0
        //==============================
        STATE__LBU__0:
        begin
            addr = rs1;
            a__n = rd_data;
            b__n = imm;
            state__n = STATE__LBU__1;
        end

        //==============================
        // STATE__LBU__1
        //==============================
        STATE__LBU__1:
        begin
            func = 5'h0;
            cpu_to_mem__valid = 1'b1;
            cpu_to_mem__addr = c;
            cpu_to_mem__dtype = 3'h6;
            state__n = cpu_to_mem__ready ? STATE__LBU__2 : STATE__LBU__1;
        end

        //==============================
        // STATE__LBU__2
        //==============================
        STATE__LBU__2:
        begin
            state__n = mem_to_cpu__valid ? (mem_to_cpu__error ? STATE__LBU__4 : STATE__LBU__3) : STATE__LBU__2;
        end

        //==============================
        // STATE__LBU__3
        //==============================
        STATE__LBU__3:
        begin
            addr = rd;
            we = 1'b1;
            wr_data = mem_to_cpu__data;
            mem_to_cpu__ready = 1'b1;
            pc__n = pc + 4;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__LBU__4
        //==============================
        STATE__LBU__4:
        begin
            mem_to_cpu__ready = 1'b1;
            state__n = (mem_to_cpu__data == 64'h0) ? STATE__EXCEPTION__LOAD_ACCESS_FAULT__0 : (mem_to_cpu__data == 64'h1) ? STATE__EXCEPTION__LOAD_ADDRESS_MISALIGNED__0 : STATE__FATAL;
        end

        //==============================
        // STATE__LHU__0
        //==============================
        STATE__LHU__0:
        begin
            addr = rs1;
            a__n = rd_data;
            b__n = imm;
            state__n = STATE__LHU__1;
        end

        //==============================
        // STATE__LHU__1
        //==============================
        STATE__LHU__1:
        begin
            func = 5'h0;
            cpu_to_mem__valid = 1'b1;
            cpu_to_mem__addr = c;
            cpu_to_mem__dtype = 3'h4;
            state__n = cpu_to_mem__ready ? STATE__LHU__2 : STATE__LHU__1;
        end

        //==============================
        // STATE__LHU__2
        //==============================
        STATE__LHU__2:
        begin
            state__n = mem_to_cpu__valid ? (mem_to_cpu__error ? STATE__LHU__4 : STATE__LHU__3) : STATE__LHU__2;
        end

        //==============================
        // STATE__LHU__3
        //==============================
        STATE__LHU__3:
        begin
            addr = rd;
            we = 1'b1;
            wr_data = mem_to_cpu__data;
            mem_to_cpu__ready = 1'b1;
            pc__n = pc + 4;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__LHU__4
        //==============================
        STATE__LHU__4:
        begin
            mem_to_cpu__ready = 1'b1;
            state__n = (mem_to_cpu__data == 64'h0) ? STATE__EXCEPTION__LOAD_ACCESS_FAULT__0 : (mem_to_cpu__data == 64'h1) ? STATE__EXCEPTION__LOAD_ADDRESS_MISALIGNED__0 : STATE__FATAL;
        end


        //==============================
        // STATE__LWU__0
        //==============================
        STATE__LWU__0:
        begin
            addr = rs1;
            a__n = rd_data;
            b__n = imm;
            state__n = STATE__LWU__1;
        end

        //==============================
        // STATE__LWU__1
        //==============================
        STATE__LWU__1:
        begin
            func = 5'h0;
            cpu_to_mem__valid = 1'b1;
            cpu_to_mem__addr = c;
            cpu_to_mem__dtype = 3'h2;
            state__n = cpu_to_mem__ready ? STATE__LWU__2 : STATE__LWU__1;
        end

        //==============================
        // STATE__LWU__2
        //==============================
        STATE__LWU__2:
        begin
            state__n = mem_to_cpu__valid ? (mem_to_cpu__error ? STATE__LWU__4 : STATE__LWU__3) : STATE__LWU__2;
        end

        //==============================
        // STATE__LWU__3
        //==============================
        STATE__LWU__3:
        begin
            addr = rd;
            we = 1'b1;
            wr_data = mem_to_cpu__data;
            mem_to_cpu__ready = 1'b1;
            pc__n = pc + 4;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__LWU__4
        //==============================
        STATE__LWU__4:
        begin
            mem_to_cpu__ready = 1'b1;
            state__n = (mem_to_cpu__data == 64'h0) ? STATE__EXCEPTION__LOAD_ACCESS_FAULT__0 : (mem_to_cpu__data == 64'h1) ? STATE__EXCEPTION__LOAD_ADDRESS_MISALIGNED__0 : STATE__FATAL;
        end

        //==============================
        // STATE__SB__0
        //==============================
        STATE__SB__0:
        begin
            addr = rs1;
            a__n = rd_data;
            b__n = imm;
            state__n = STATE__SB__1;
        end

        //==============================
        // STATE__SB__1
        //==============================
        STATE__SB__1:
        begin
            func = 5'h0;
            addr = rs2;
            cpu_to_mem__valid = 1'b1;
            cpu_to_mem__we = 1'b1;
            cpu_to_mem__addr = c;
            cpu_to_mem__dtype = 3'h5;
            cpu_to_mem__data = rd_data;
            state__n = cpu_to_mem__ready ? STATE__SB__2 : STATE__SB__1;
        end

        //==============================
        // STATE__SB__2
        //==============================
        STATE__SB__2:
        begin
            state__n = mem_to_cpu__valid ? (mem_to_cpu__error ? STATE__SB__4 : STATE__SB__3) : STATE__SB__2;
        end


        //==============================
        // STATE__SB__3
        //==============================
        STATE__SB__3:
        begin
            mem_to_cpu__ready = 1'b1;
            pc__n = pc + 4;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__SB__4
        //==============================
        STATE__SB__4:
        begin
            mem_to_cpu__ready = 1'b1;
            state__n = (mem_to_cpu__data == 64'h0) ? STATE__EXCEPTION__STORE_ACCESS_FAULT__0 : (mem_to_cpu__data == 64'h1) ? STATE__EXCEPTION__STORE_ADDRESS_MISALIGNED__0 : STATE__FATAL;
        end


        //==============================
        // STATE__SH__0
        //==============================
        STATE__SH__0:
        begin
            addr = rs1;
            a__n = rd_data;
            b__n = imm;
            state__n = STATE__SH__1;
        end

        //==============================
        // STATE__SH__1
        //==============================
        STATE__SH__1:
        begin
            func = 5'h0;
            addr = rs2;
            cpu_to_mem__valid = 1'b1;
            cpu_to_mem__we = 1'b1;
            cpu_to_mem__addr = c;
            cpu_to_mem__dtype = 3'h3;
            cpu_to_mem__data = rd_data;
            state__n = cpu_to_mem__ready ? STATE__SH__2 : STATE__SH__1;
        end

        //==============================
        // STATE__SH__2
        //==============================
        STATE__SH__2:
        begin
            state__n = mem_to_cpu__valid ? (mem_to_cpu__error ? STATE__SH__4 : STATE__SH__3) : STATE__SH__2;
        end

        //==============================
        // STATE__SH__3
        //==============================
        STATE__SH__3:
        begin
            mem_to_cpu__ready = 1'b1;
            pc__n = pc + 4;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__SH__4
        //==============================
        STATE__SH__4:
        begin
            mem_to_cpu__ready = 1'b1;
            state__n = (mem_to_cpu__data == 64'h0) ? STATE__EXCEPTION__STORE_ACCESS_FAULT__0 : (mem_to_cpu__data == 64'h1) ? STATE__EXCEPTION__STORE_ADDRESS_MISALIGNED__0 : STATE__FATAL;
        end

        //==============================
        // STATE__SW__0
        //==============================
        STATE__SW__0:
        begin
            addr = rs1;
            a__n = rd_data;
            b__n = imm;
            state__n = STATE__SW__1;
        end

        //==============================
        // STATE__SW__1
        //==============================
        STATE__SW__1:
        begin
            func = 5'h0;
            addr = rs2;
            cpu_to_mem__valid = 1'b1;
            cpu_to_mem__we = 1'b1;
            cpu_to_mem__addr = c;
            cpu_to_mem__dtype = 3'h1;
            cpu_to_mem__data = rd_data;
            state__n = cpu_to_mem__ready ? STATE__SW__2 : STATE__SW__1;
        end

        //==============================
        // STATE__SW__2
        //==============================
        STATE__SW__2:
        begin
            state__n = mem_to_cpu__valid ? (mem_to_cpu__error ? STATE__SW__4 : STATE__SW__3) : STATE__SW__2;
        end

        //==============================
        // STATE__SW__3
        //==============================
        STATE__SW__3:
        begin
            mem_to_cpu__ready = 1'b1;
            pc__n = pc + 4;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__SW__4
        //==============================
        STATE__SW__4:
        begin
            mem_to_cpu__ready = 1'b1;
            state__n = (mem_to_cpu__data == 64'h0) ? STATE__EXCEPTION__STORE_ACCESS_FAULT__0 : (mem_to_cpu__data == 64'h1) ? STATE__EXCEPTION__STORE_ADDRESS_MISALIGNED__0 : STATE__FATAL;
        end

        //==============================
        // STATE__SD__0
        //==============================
        STATE__SD__0:
        begin
            addr = rs1;
            a__n = rd_data;
            b__n = imm;
            state__n = STATE__SD__1;
        end

        //==============================
        // STATE__SD__1
        //==============================
        STATE__SD__1:
        begin
            func = 5'h0;
            addr = rs2;
            cpu_to_mem__valid = 1'b1;
            cpu_to_mem__we = 1'b1;
            cpu_to_mem__addr = c;
            cpu_to_mem__dtype = 3'h0;
            cpu_to_mem__data = rd_data;
            state__n = cpu_to_mem__ready ? STATE__SD__2 : STATE__SD__1;
        end

        //==============================
        // STATE__SD__2
        //==============================
        STATE__SD__2:
        begin
            state__n = mem_to_cpu__valid ? (mem_to_cpu__error ? STATE__SD__4 : STATE__SD__3) : STATE__SD__2;
        end


        //==============================
        // STATE__SD__3
        //==============================
        STATE__SD__3:
        begin
            mem_to_cpu__ready = 1'b1;
            pc__n = pc + 4;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__SD__4
        //==============================
        STATE__SD__4:
        begin
            mem_to_cpu__ready = 1'b1;
            state__n = (mem_to_cpu__data == 64'h0) ? STATE__EXCEPTION__STORE_ACCESS_FAULT__0 : (mem_to_cpu__data == 64'h1) ? STATE__EXCEPTION__STORE_ADDRESS_MISALIGNED__0 : STATE__FATAL;
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
            addr = rd;
            we = 1'b1;
            wr_data = c;
            pc__n = pc + 4;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__JALR__0
        //==============================
        STATE__JALR__0:
        begin
            addr = rs1;
            a__n = rd_data;  
            b__n = imm;  
            //state__n = ((rd_data[1:0] == 2'b00) && (imm[1:0] == 2'b10)) || ((rd_data[1:0] == 2'b00) && (imm[1:0] == 2'b11)) || ((rd_data[1:0] == 2'b01) && (imm[1:0] == 2'b01)) || ((rd_data[1:0] == 2'b01) && (imm[1:0] == 2'b10)) ||((rd_data[1:0] == 2'b10) && (imm[1:0] == 2'b00)) ||((rd_data[1:0] == 2'b10) && (imm[1:0] == 2'b01)) || ((rd_data[1:0] == 2'b11) && (imm[1:0] == 2'b00)) || ((rd_data[1:0] == 2'b11) && (imm[1:0] == 2'b11)) ? STATE__EXCEPTION__INSTRUCTION_ADDRESS_MISALIGNED__0__JALR : STATE__JALR__1;
            state__n = (rd_data[1:0] + imm[1:0] == 2'b10) || (rd_data[1:0] + imm[1:0] == 2'b11) ? STATE__EXCEPTION__INSTRUCTION_ADDRESS_MISALIGNED__0__JALR : STATE__JALR__1;
        end

        //==============================
        // STATE__JALR__1
        //==============================
        STATE__JALR__1:
        begin
            func = 5'h0;
            addr = rd;
            we = 1'b1;     
            wr_data = pc + 4;
            pc__n = {c[63:1], 1'b0};
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
            addr = rd;
            we = 1'b1;     
            wr_data = pc + 4;
            pc__n = c;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__BEQ__0
        //==============================
        STATE__BEQ__0:
        begin
            addr = rs1;
            a__n = rd_data;
            state__n = STATE__BEQ__1;
        end

        //==============================
        // STATE__BEQ__1
        //==============================
        STATE__BEQ__1:
        begin
            addr = rs2;
            b__n = rd_data;
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
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__BNE__0
        //==============================
        STATE__BNE__0:
        begin
            addr = rs1;
            a__n = rd_data;
            state__n = STATE__BNE__1;
        end

        //==============================
        // STATE__BNE__1
        //==============================
        STATE__BNE__1:
        begin
            addr = rs2;
            b__n = rd_data;
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
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__BLT__0
        //==============================
        STATE__BLT__0:
        begin
            addr = rs1;
            a__n = rd_data;
            state__n = STATE__BLT__1;
        end

        //==============================
        // STATE__BLT__1
        //==============================
        STATE__BLT__1:
        begin
            addr = rs2;
            b__n = rd_data;
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
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__BGE__0
        //==============================
        STATE__BGE__0:
        begin
            addr = rs1;
            a__n = rd_data;
            state__n = STATE__BGE__1;
        end

        //==============================
        // STATE__BGE__1
        //==============================
        STATE__BGE__1:
        begin
            addr = rs2;
            b__n = rd_data;
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
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__BLTU__0
        //==============================
        STATE__BLTU__0:
        begin
            addr = rs1;
            a__n = rd_data;
            state__n = STATE__BLTU__1;
        end

        //==============================
        // STATE__BLTU__1
        //==============================
        STATE__BLTU__1:
        begin
            addr = rs2;
            b__n = rd_data;
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
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__BGEU__0
        //==============================
        STATE__BGEU__0:
        begin
            addr = rs1;
            a__n = rd_data;
            state__n = STATE__BGEU__1;
        end

        //==============================
        // STATE__BGEU__1
        //==============================
        STATE__BGEU__1:
        begin
            addr = rs2;
            b__n = rd_data;
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
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__ECALL
        //==============================
        STATE__ECALL:
        begin
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
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__FENCE
        //==============================
        STATE__FENCE:
        begin
            pc__n = pc + 4;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__FENCE_I
        //==============================
        STATE__FENCE_I:
        begin
            pc__n = pc + 4;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__LUI
        //==============================
        STATE__LUI:
        begin
            addr = rd;
            we = 1'b1;
            wr_data = imm;
            pc__n = pc + 4;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__CSRRW__0
        //==============================
        STATE__CSRRW__0:
        begin
            addr = rs1;
            a__n = rd_data;
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
            addr = rd;
            we = 1'b1;
            wr_data = c;
            state__n = STATE__CSRRW__2;
        end

        //==============================
        // STATE__CSRRW__2
        //==============================
        STATE__CSRRW__2:
        begin
            func = 5'h10;
            csr__addr = imm[11:0];
            csr__we = 1'b1;
            csr__wr_data = c;
            pc__n = pc + 4;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__CSRRS__0
        //==============================
        STATE__CSRRS__0:
        begin
            addr = rs1;
            a__n = rd_data;
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
            addr = rd;
            we = 1'b1;
            wr_data = c;
            pc__n = pc + 4;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__CSRRC__0
        //==============================
        STATE__CSRRC__0:
        begin
            addr = rs1;
            a__n = rd_data;
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
            csr__addr = imm[11:0];
            csr__we = 1'b1;
            csr__wr_data = c;
            state__n = STATE__CSRRC__2;
        end

        //==============================
        // STATE__CSRRC__2
        //==============================
        STATE__CSRRC__2:
        begin
            func = 5'h11;
            addr = rd;
            we = 1'b1;
            wr_data = c;
            pc__n = pc + 4;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__CSRRWI__0
        //==============================
        STATE__CSRRWI__0:
        begin
            a__n = uimm;
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
            addr = rd;
            we = 1'b1;
            wr_data = c;
            state__n = STATE__CSRRWI__2;
        end

        //==============================
        // STATE__CSRRWI__2
        //==============================
        STATE__CSRRWI__2:
        begin
            func = 5'h10;
            csr__addr = imm[11:0];
            csr__we = 1'b1;
            csr__wr_data = c;
            pc__n = pc + 4;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__CSRRSI__0
        //==============================
        STATE__CSRRSI__0:
        begin
            a__n = uimm;
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
            csr__addr = imm[11:0];
            csr__we = 1'b1;
            csr__wr_data = c;
            state__n = STATE__CSRRSI__2;
        end

        //==============================
        // STATE__CSRRSI__2
        //==============================
        STATE__CSRRSI__2:
        begin
            func = 5'h11;
            addr = rd;
            we = 1'b1;
            wr_data = c;
            pc__n = pc + 4;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__CSRRCI__0
        //==============================
        STATE__CSRRCI__0:
        begin
            a__n = uimm;
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
            csr__addr = imm[11:0];
            csr__we = 1'b1;
            csr__wr_data = c;
            state__n = STATE__CSRRCI__2;
        end

        //==============================
        // STATE__CSRRCI__2
        //==============================
        STATE__CSRRCI__2:
        begin
            func = 5'h11;
            addr = rd;
            we = 1'b1;
            wr_data = c;
            pc__n = pc + 4;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__MRET__0
        //==============================
        STATE__MRET__0:
        begin
            csr__addr = 12'h300;
            csr__we = 1'b1;
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
            csr__addr = 12'h341;
            pc__n = csr__rd_data;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__EXCEPTION__ILLEGAL_INSTRUCTION
        //==============================
        STATE__EXCEPTION__ILLEGAL_INSTRUCTION:
        begin
            csr__addr = 12'h342;
            csr__we = 1'b1;
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
            csr__addr = 12'h343;
            csr__we = 1'b1;
            csr__wr_data = csr__rd_data;
            csr__wr_data[63:0] = pc;
            state__n = STATE__EXCEPTION__INSTRUCTION_ACCESS_FAULT__1;
        end

        //==============================
        // STATE__EXCEPTION__INSTRUCTION_ACCESS_FAULT__1
        //==============================
        STATE__EXCEPTION__INSTRUCTION_ACCESS_FAULT__1:
        begin
            csr__addr = 12'h342;
            csr__we = 1'b1;
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
            csr__addr = 12'h343;
            csr__we = 1'b1;
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
            csr__addr = 12'h343;
            csr__we = 1'b1;
            csr__wr_data = csr__rd_data;
            csr__wr_data[63:0] = {c[63:1], 1'b0};
            state__n = STATE__EXCEPTION__INSTRUCTION_ADDRESS_MISALIGNED__1;
        end

        //==============================
        // STATE__EXCEPTION__INSTRUCTION_ADDRESS_MISALIGNED__1
        //==============================
        STATE__EXCEPTION__INSTRUCTION_ADDRESS_MISALIGNED__1:
        begin
            csr__addr = 12'h342;
            csr__we = 1'b1;
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
            csr__addr = 12'h343;
            csr__we = 1'b1;
            csr__wr_data = csr__rd_data;
            csr__wr_data[63:0] = c;
            state__n = STATE__EXCEPTION__LOAD_ACCESS_FAULT__1;
        end

        //==============================
        // STATE__EXCEPTION__LOAD_ACCESS_FAULT__1
        //==============================
        STATE__EXCEPTION__LOAD_ACCESS_FAULT__1:
        begin
            csr__addr = 12'h342;
            csr__we = 1'b1;
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
            csr__addr = 12'h343;
            csr__we = 1'b1;
            csr__wr_data = csr__rd_data;
            csr__wr_data[63:0] = c;
            state__n = STATE__EXCEPTION__LOAD_ADDRESS_MISALIGNED__1;
        end

        //==============================
        // STATE__EXCEPTION__LOAD_ADDRESS_MISALIGNED__1
        //==============================
        STATE__EXCEPTION__LOAD_ADDRESS_MISALIGNED__1:
        begin
            csr__addr = 12'h342;
            csr__we = 1'b1;
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
            csr__addr = 12'h343;
            csr__we = 1'b1;
            csr__wr_data = csr__rd_data;
            csr__wr_data[63:0] = c;
            state__n = STATE__EXCEPTION__STORE_ACCESS_FAULT__1;
        end

        //==============================
        // STATE__EXCEPTION__STORE_ACCESS_FAULT__1
        //==============================
        STATE__EXCEPTION__STORE_ACCESS_FAULT__1:
        begin
            csr__addr = 12'h342;
            csr__we = 1'b1;
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
            csr__addr = 12'h343;
            csr__we = 1'b1;
            csr__wr_data = csr__rd_data;
            csr__wr_data[63:0] = c;
            state__n = STATE__EXCEPTION__STORE_ADDRESS_MISALIGNED__1;
        end

        //==============================
        // STATE__EXCEPTION__STORE_ADDRESS_MISALIGNED__1
        //==============================
        STATE__EXCEPTION__STORE_ADDRESS_MISALIGNED__1:
        begin
            csr__addr = 12'h342;
            csr__we = 1'b1;
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
            csr__addr = 12'h342;
            csr__we = 1'b1;
            csr__wr_data[62:0] = 63'h3;
            csr__wr_data[63] = 1'b1;
            state__n = STATE__TRAP__0;
        end

        //==============================
        // STATE__INTERRUPT__TIMER
        //==============================
        STATE__INTERRUPT__TIMER:
        begin
            csr__addr = 12'h342;
            csr__we = 1'b1;
            csr__wr_data[62:0] = 63'h7;
            csr__wr_data[63] = 1'b1;
            state__n = STATE__TRAP__0;
        end

        //==============================
        // STATE__INTERRUPT__EXTERNAL
        //==============================
        STATE__INTERRUPT__EXTERNAL:
        begin
            csr__addr = 12'h342;
            csr__we = 1'b1;
            csr__wr_data[62:0] = 63'hb;
            csr__wr_data[63] = 1'b1;
            state__n = STATE__TRAP__0;
        end


        //==============================
        // STATE__TRAP__0
        //==============================
        STATE__TRAP__0:
        begin
            csr__addr = 12'h300;
            csr__we = 1'b1;
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
            csr__addr = 12'h341;
            csr__we = 1'b1;
            csr__wr_data = csr__rd_data;
            csr__wr_data[63:0] = pc;
            state__n = STATE__TRAP__2;
        end

        //==============================
        // STATE__TRAP__2
        //==============================
        STATE__TRAP__2:
        begin
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


always_ff @(posedge clk) begin
    if (rst) begin
        state <= STATE__RESET;
    end
    else begin
        state <= state__n;
    end
end

always_ff @(posedge clk) begin
    if (rst) begin
        pc <= 64'h00000000;
    end
    else begin
        pc <= pc__n;
    end
end

always_ff @(posedge clk) begin
    ir <= ir__n;
end

always_ff @(posedge clk) begin
    a <= a__n;
end

always_ff @(posedge clk) begin
    b <= b__n;
end

endmodule

//==============================================
// register_file
//==============================================
module register_file
(
    input clk,
    input rst,
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

assign x__0 = 64'h0;

always_comb begin
    case (addr)
        5'h0: rd_data = x__0;
        5'h1: rd_data = x__1;
        5'h2: rd_data = x__2;
        5'h3: rd_data = x__3;
        5'h4: rd_data = x__4;
        5'h5: rd_data = x__5;
        5'h6: rd_data = x__6;
        5'h7: rd_data = x__7;
        5'h8: rd_data = x__8;
        5'h9: rd_data = x__9;
        5'ha: rd_data = x__10;
        5'hb: rd_data = x__11;
        5'hc: rd_data = x__12;
        5'hd: rd_data = x__13;
        5'he: rd_data = x__14;
        5'hf: rd_data = x__15;
        5'h10: rd_data = x__16;
        5'h11: rd_data = x__17;
        5'h12: rd_data = x__18;
        5'h13: rd_data = x__19;
        5'h14: rd_data = x__20;
        5'h15: rd_data = x__21;
        5'h16: rd_data = x__22;
        5'h17: rd_data = x__23;
        5'h18: rd_data = x__24;
        5'h19: rd_data = x__25;
        5'h1a: rd_data = x__26;
        5'h1b: rd_data = x__27;
        5'h1c: rd_data = x__28;
        5'h1d: rd_data = x__29;
        5'h1e: rd_data = x__30;
        5'h1f: rd_data = x__31;
    endcase
end

always_ff @(posedge clk) begin
    case (addr)
        5'h1: x__1 <= we ? wr_data : x__1;
        5'h2: x__2 <= we ? wr_data : x__2;
        5'h3: x__3 <= we ? wr_data : x__3;
        5'h4: x__4 <= we ? wr_data : x__4;
        5'h5: x__5 <= we ? wr_data : x__5;
        5'h6: x__6 <= we ? wr_data : x__6;
        5'h7: x__7 <= we ? wr_data : x__7;
        5'h8: x__8 <= we ? wr_data : x__8;
        5'h9: x__9 <= we ? wr_data : x__9;
        5'ha: x__10 <= we ? wr_data : x__10;
        5'hb: x__11 <= we ? wr_data : x__11;
        5'hc: x__12 <= we ? wr_data : x__12;
        5'hd: x__13 <= we ? wr_data : x__13;
        5'he: x__14 <= we ? wr_data : x__14;
        5'hf: x__15 <= we ? wr_data : x__15;
        5'h10: x__16 <= we ? wr_data : x__16;
        5'h11: x__17 <= we ? wr_data : x__17;
        5'h12: x__18 <= we ? wr_data : x__18;
        5'h13: x__19 <= we ? wr_data : x__19;
        5'h14: x__20 <= we ? wr_data : x__20;
        5'h15: x__21 <= we ? wr_data : x__21;
        5'h16: x__22 <= we ? wr_data : x__22;
        5'h17: x__23 <= we ? wr_data : x__23;
        5'h18: x__24 <= we ? wr_data : x__24;
        5'h19: x__25 <= we ? wr_data : x__25;
        5'h1a: x__26 <= we ? wr_data : x__26;
        5'h1b: x__27 <= we ? wr_data : x__27;
        5'h1c: x__28 <= we ? wr_data : x__28;
        5'h1d: x__29 <= we ? wr_data : x__29;
        5'h1e: x__30 <= we ? wr_data : x__30;
        5'h1f: x__31 <= we ? wr_data : x__31;
    endcase
end

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

//logic [4:0] func;
//logic [63:0] a;
//logic [63:0] b;
//logic [63:0] c;
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
    output logic geu
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
    input clk,
    input rst,
    input we,
    input [11:0] addr,
    output logic [63:0] rd_data,
    input [63:0] wr_data,
    output [63:0] mstatus,
    output [63:0] mie,
    output [63:0] mip
);

//logic we;
//logic [11:0] addr;
//logic [63:0] rd_data;
//logic [63:0] wr_data;


always_comb begin
    rd_data = misa;
    misa__we = 1'b0;
    mvendorid__we = 1'b0;
    marchid__we = 1'b0;
    mimpid__we = 1'b0;
    mhartid__we = 1'b0;
    mstatus__we = 1'b0;
    mtvec__we = 1'b0;
    medeleg__we = 1'b0;
    mideleg__we = 1'b0;
    mip__we = 1'b0;
    mie__we = 1'b0;
    mcycle__we = 1'b0;
    minstret__we = 1'b0;
    mhpmcounter3__we = 1'b0;
    mhpmevent3__we = 1'b0;
    mscratch__we = 1'b0;
    mepc__we = 1'b0;
    mcause__we = 1'b0;
    mtval__we = 1'b0;

    case (addr)
        12'h301:
        begin
            rd_data = misa;
            misa__we = we;
        end
        12'hf11:
        begin
            rd_data = mvendorid;
            mvendorid__we = we;
        end
        12'hf12:
        begin
            rd_data = marchid;
            marchid__we = we;
        end
        12'hf13:
        begin
            rd_data = mimpid;
            mimpid__we = we;
        end
        12'hf14:
        begin
            rd_data = mhartid;
            mhartid__we = we;
        end
        12'h300:
        begin
            rd_data = mstatus;
            mstatus__we = we;
        end
        12'h305:
        begin
            rd_data = mtvec;
            mtvec__we = we;
        end
        12'h302:
        begin
            rd_data = medeleg;
            medeleg__we = we;
        end
        12'h303:
        begin
            rd_data = mideleg;
            mideleg__we = we;
        end
        12'h344:
        begin
            rd_data = mip;
            mip__we = we;
        end
        12'h304:
        begin
            rd_data = mie;
            mie__we = we;
        end
        12'hb00:
        begin
            rd_data = mcycle;
            mcycle__we = we;
        end
        12'hb02:
        begin
            rd_data = minstret;
            minstret__we = we;
        end
        12'hb03:
        begin
            rd_data = mhpmcounter3;
            mhpmcounter3__we = we;
        end
        12'h323:
        begin
            rd_data = mhpmevent3;
            mhpmevent3__we = we;
        end
        12'h340:
        begin
            rd_data = mscratch; 
            mscratch__we = we;
        end
        12'h341:
        begin
            rd_data = mepc;
            mepc__we = we;
        end
        12'h342:
        begin
            rd_data = mcause;
            mcause__we = we;
        end
        12'h343:
        begin
            rd_data = mtval;
            mtval__we = we;
        end
    endcase
end


//==============================================
// Machine ISA Register (misa)
//==============================================
logic [63:0] misa;
logic misa__we;

assign misa[25:0] = 26'h0_00_01_00;
assign misa[61:26] = 36'h0;
assign misa[63:62] = 2'h2;


//==============================================
// Machine Vendor ID Register (mvendorid)
//==============================================
logic [63:0] mvendorid;
logic mvendorid__we;

assign mvendorid[63:0] = 64'h0;


//==============================================
// Machine Architecture ID Register (marchid)
//==============================================
logic [63:0] marchid;
logic marchid__we;

assign marchid[63:0] = 64'h0;



//==============================================
// Machine Implementation ID Register (mimpid)
//==============================================
logic [63:0] mimpid;
logic mimpid__we;

assign mimpid[63:0] = 64'h0;


//==============================================
// Hart ID Register (mhartid) 
//==============================================
logic [63:0] mhartid;
logic mhartid__we;

assign mhartid[63:0] = 64'h0;


//============================================== 
// Machine Status Register (mstatus) 
//==============================================
logic [63:0] mstatus;
logic mstatus__we;

assign mstatus[0] = 1'b0;
assign mstatus[1] = 1'b0;
assign mstatus[2] = 1'b0;
assign mstatus[4] = 1'b0;
assign mstatus[5] = 1'b0;
assign mstatus[6] = 1'b0;
assign mstatus[8] = 1'b0;
assign mstatus[10:9] = 2'h0;
assign mstatus[12:11] = 2'h3;
assign mstatus[14:13] = 2'h0;
assign mstatus[16:15] = 2'h0;
assign mstatus[17] = 1'b0;
assign mstatus[18] = 1'b0;
assign mstatus[19] = 1'b0;
assign mstatus[28:24] = 5'h0;
assign mstatus[63] = 1'b0;

always_ff @(posedge clk) begin
    if (rst) begin
        mstatus[3] <= 1'b0;
        mstatus[7] <= 1'b1;
        mstatus[23:20] <= 4'h0;
        mstatus[62:29] <= 33'h0;
    end
    else begin
        if (mstatus__we) begin
            mstatus[3] <= wr_data[3];
            mstatus[7] <= wr_data[7];
            mstatus[23:20] <= wr_data[23:20];
            mstatus[62:29] <= wr_data[62:29];
        end
    end
end


//============================================== 
// Machine Trap-Vector Base-Address Register (mtvec)
//==============================================
logic [63:0] mtvec;
logic mtvec__we;

assign mtvec[1:0] = 2'h0;

always_ff @(posedge clk) begin
    if (rst) begin
        mtvec[63:2] <= 62'h0;
    end
    else begin
        if (mtvec__we) begin
            mtvec[63:2] <= wr_data[63:2];
        end
    end
end




//============================================== 
// Machine Exception Delegation Register (medeleg) 
//==============================================
logic [63:0] medeleg;
logic medeleg__we;

assign medeleg[63:0] = 64'h0;

//============================================== 
// Machine Interrupt Delegation Register (mideleg) 
//==============================================
logic [63:0] mideleg;
logic mideleg__we;

assign mideleg[63:0] = 64'h0;


//============================================== 
// Machine Interrupt-Pending Register (mip) 
//==============================================
logic [63:0] mip;
logic mip__we;

assign mip[0] = 1'b0;
assign mip[1] = 1'b0;
assign mip[2] = 1'b0;
assign mip[4] = 1'b0;
assign mip[5] = 1'b0;
assign mip[6] = 1'b0;
assign mip[8] = 1'b0;
assign mip[9] = 1'b0;
assign mip[10] = 1'b0;
assign mip[63:12] = 52'h0;

always_ff @(posedge clk) begin
    if (rst) begin
        mip[3] <= 1'b0;
        mip[7] <= 1'b0;
        mip[11] <= 1'b0;
    end
end

//============================================== 
// Machine Interrupt-Enable Register (mie) 
//==============================================
logic [63:0] mie;
logic mie__we;

assign mie[0] = 1'b0;
assign mie[1] = 1'b0;
assign mie[2] = 1'b0;
assign mie[4] = 1'b0;
assign mie[5] = 1'b0;
assign mie[6] = 1'b0;
assign mie[8] = 1'b0;
assign mie[9] = 1'b0;
assign mie[10] = 1'b0;
assign mie[63:12] = 52'h0;

always_ff @(posedge clk) begin
    if (rst) begin
        mie[3] <= 1'b0;
        mie[7] <= 1'b0;
        mie[11] <= 1'b0;
    end
    else begin
        if (mie__we) begin
            mie[3] <= wr_data[3];
            mie[7] <= wr_data[7];
            mie[11] <= wr_data[11];
        end
    end
end

//============================================== 
// Machine Cycle Register (mcycle) 
//==============================================
logic [63:0] mcycle;
logic mcycle__we;

always_ff @(posedge clk) begin
    if (rst) begin
        mcycle[63:0] <= 64'h0;
    end
    else begin
        if (mcycle__we) begin
            mcycle[63:0] <= wr_data[63:0];
        end
        else begin
            mcycle[63:0] <= mcycle[63:0] + 1;
        end
    end
end

//============================================== 
// Machine Instruction Retire Register (minstret) 
//==============================================
logic [63:0] minstret;
logic minstret__we;

always_ff @(posedge clk) begin
    if (rst) begin
        minstret[63:0] <= 64'h0;
    end
    else begin
        if (minstret__we) begin
            minstret[63:0] <= wr_data[63:0];
        end
    end
end


//============================================== 
// Machine Hardware Performance Monitor Counter 3 (mhpmcounter3)
//==============================================
logic [63:0] mhpmcounter3;
logic mhpmcounter3__we;

assign mhpmcounter3[63:0] = 64'h0;


//============================================== 
// Machine Hardware Performance Monitor Event 3 (mhpmevent3)
//==============================================
logic [63:0] mhpmevent3;
logic mhpmevent3__we;

assign mhpmevent3[63:0] = 64'h0;


//============================================== 
// Machine Scratch Register (mscratch) 
//==============================================
logic [63:0] mscratch;
logic mscratch__we;

always_ff @(posedge clk) begin
    if (rst) begin
        mscratch[63:0] <= 64'h0;
    end
    else begin
        if (mscratch__we) begin
            mscratch[63:0] <= wr_data[63:0];
        end
    end
end


//============================================== 
// Machine Exception Program Counter (mepc) 
//==============================================
logic [63:0] mepc;
logic mepc__we;

always_ff @(posedge clk) begin
    if (rst) begin
        mepc[63:0] <= 64'h0;
    end
    else begin
        if (mepc__we) begin
            mepc[63:0] <= wr_data[63:0];
        end
    end
end


//============================================== 
// Machine Cause Register (mcause) 
//==============================================
logic [63:0] mcause;
logic mcause__we;

always_ff @(posedge clk) begin
    if (rst) begin
        mcause[62:0] <= 63'h0;
        mcause[63] <= 1'b0;
    end
    else begin
        if (mcause__we) begin
            mcause[62:0] <= wr_data[62:0];
            mcause[63] <= wr_data[63];
        end
    end
end


//============================================== 
// Machine Trap Value Register (mtval) 
//==============================================
logic [63:0] mtval;
logic mtval__we;

always_ff @(posedge clk) begin
    if (rst) begin
        mtval[63:0] <= 64'h0;
    end
    else begin
        if (mtval__we) begin
            mtval[63:0] <= wr_data[63:0];
        end
    end
end


endmodule

//==============================================
// memory_management_unit 
//==============================================
module memory_management_unit
(
    input clk,
    input rst,
    input cpu_to_mem__valid,
    output logic cpu_to_mem__ready,
    input cpu_to_mem__we,
    input [63:0] cpu_to_mem__addr,
    input [2:0] cpu_to_mem__dtype,
    input [63:0] cpu_to_mem__data,
    output logic mem_to_cpu__valid,
    input mem_to_cpu__ready,
    output logic mem_to_cpu__error,
    output logic [63:0] mem_to_cpu__data,
    output logic [7:0] port__0
);


logic we;
logic we__n;
logic [63:0] addr;
logic [63:0] addr__n;
logic [2:0] dtype;
logic [2:0] dtype__n;
logic [63:0] wr_data;
logic [63:0] wr_data__n;

logic ena;
logic wea;
logic [11:0] addra;
logic [63:0] dina;
logic [63:0] douta;
logic [63:0] douta__aligned;

logic [7:0] port__0__n;

logic [3:0] state;
logic [3:0] state__n;

//==============================
// store_dtype 
//==============================
store_dtype store_dtype__0
(
    .clk(clk),
    .rst(rst),
    .addr(addr[2:0]),
    .dtype(dtype),
    .wr_data(wr_data),
    .din(douta),
    .dout(dina)
);

//==============================
// read_dtype 
//==============================
read_dtype read_dtype__0
(
    .clk(clk),
    .rst(rst),
    .addr(addr[2:0]),
    .dtype(dtype),
    .din(douta),
    .dout(douta__aligned)
);


//==============================
// mem 
//==============================
memory mem 
(
    .clka(clk),
    .addra(addra),
    .dina(dina),
    .douta(douta),
    .ena(ena),
    .wea(wea)
);


assign addra = addr[8:3];

localparam STATE__RESET = 4'h0;
localparam STATE__READY = 4'h1;
localparam STATE__ACCEPT_REQ = 4'h2;
localparam STATE__PMA_CHECK = 4'h3;
localparam STATE__R0__WRITE__0 = 4'h4;
localparam STATE__R0__WRITE__1 = 4'h5;
localparam STATE__R0__WRITE__2 = 4'h6;
localparam STATE__R0__READ__0 = 4'h7;
localparam STATE__R0__READ__1 = 4'h8;
localparam STATE__R0__READ__2 = 4'h9;
localparam STATE__R1__WRITE__0 = 4'ha;
localparam STATE__R1__READ__0 = 4'hb;
localparam STATE__ACCESS_FAULT = 4'hc;
localparam STATE__MISALIGNED_ADDRESS = 4'hd;

always_comb begin
    state__n = state;
    cpu_to_mem__ready = 1'b0;
    mem_to_cpu__valid = 1'b0;
    mem_to_cpu__error = 1'b0;
    we__n = we;
    addr__n = addr;
    wr_data__n = wr_data;
    ena = 1'b0;
    wea = 1'b0;
        
    case (state)

        //==============================
        // STATE__RESET
        //==============================
        STATE__RESET:
        begin
            state__n = STATE__READY;
        end

        //==============================
        // STATE__READY
        //==============================
        STATE__READY:
        begin
            state__n = cpu_to_mem__valid ? STATE__ACCEPT_REQ : STATE__READY;
        end

        //==============================
        // STATE__ACCEPT_REQ
        //==============================
        STATE__ACCEPT_REQ:
        begin
            cpu_to_mem__ready = 1'b1;
            we__n = cpu_to_mem__we;
            addr__n = cpu_to_mem__addr; 
            dtype__n = cpu_to_mem__dtype;
            wr_data__n = cpu_to_mem__data;
            state__n = STATE__PMA_CHECK;
        end

        //==============================
        // STATE__PMA_CHECK
        //==============================
        STATE__PMA_CHECK:
        begin
            casez (addr)
                64'b0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0???_????_????_????:
                begin
                    state__n = we ? STATE__R0__WRITE__0 : STATE__R0__READ__0;
                end
                64'b0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_1???_????_????_????:
                begin
                    state__n = we ? STATE__R1__WRITE__0 : STATE__R1__READ__0;
                end
            endcase
        end

        //==============================
        // STATE__R0__WRITE__0
        //==============================
        STATE__R0__WRITE__0:
        begin
            ena = 1'b1;
            wea = 1'b0;
            state__n = STATE__R0__WRITE__1; 
        end

        //==============================
        // STATE__R0__WRITE__1
        //==============================
        STATE__R0__WRITE__1:
        begin
            ena = 1'b1;
            state__n = STATE__R0__WRITE__2; 
        end

        //==============================
        // STATE__R0__WRITE__2
        //==============================
        STATE__R0__WRITE__2:
        begin
            mem_to_cpu__valid = 1'b1;
            ena = 1'b1;
            wea = 1'b1;
            state__n = mem_to_cpu__ready ? STATE__READY : STATE__R0__WRITE__2; 
        end

        //==============================
        // STATE__R0__READ__0
        //==============================
        STATE__R0__READ__0:
        begin
            ena = 1'b1;
            wea = 1'b0;
            state__n = STATE__R0__READ__1; 
        end

        //==============================
        // STATE__R0__READ__1
        //==============================
        STATE__R0__READ__1:
        begin
            ena = 1'b1;
            state__n = STATE__R0__READ__2; 
        end

        //==============================
        // STATE__R0__READ__2
        //==============================
        STATE__R0__READ__2:
        begin
            mem_to_cpu__valid = 1'b1;
            mem_to_cpu__data = douta__aligned;
            ena = 1'b1;
            state__n = mem_to_cpu__ready ? STATE__READY : STATE__R0__READ__2; 
        end


        //==============================
        // STATE__R1__WRITE__0
        //==============================
        STATE__R1__WRITE__0:
        begin
            mem_to_cpu__valid = 1'b1;
            port__0__n = wr_data[7:0];
            state__n = mem_to_cpu__ready ? STATE__READY : STATE__R1__WRITE__0; 
        end

        //==============================
        // STATE__R1__READ__0
        //==============================
        STATE__R1__READ__0:
        begin
            mem_to_cpu__valid = 1'b1;
            mem_to_cpu__data = {56'b0, port__0};
            state__n = mem_to_cpu__ready ? STATE__READY : STATE__R1__READ__0; 
        end

        //==============================
        // STATE__ACCESS_FAULT
        //==============================
        STATE__ACCESS_FAULT:
        begin
            mem_to_cpu__valid = 1'b1;
            mem_to_cpu__data = 64'h0;
            state__n = mem_to_cpu__ready ? STATE__READY : STATE__ACCESS_FAULT;
        end

        //==============================
        // STATE__MISALIGNED_ADDRESS
        //==============================
        STATE__MISALIGNED_ADDRESS:
        begin
            mem_to_cpu__valid = 1'b1;
            mem_to_cpu__data = 64'h1;
            state__n = mem_to_cpu__ready ? STATE__READY : STATE__ACCESS_FAULT;
        end

    endcase
end

always_ff @(posedge clk) begin
    we <= we__n;
end

always_ff @(posedge clk) begin
    addr <= addr__n;
end

always_ff @(posedge clk) begin
    dtype <= dtype__n;
end

always_ff @(posedge clk) begin
    wr_data <= wr_data__n;
end

always_ff @(posedge clk) begin
    if (rst) begin
        state <= STATE__RESET;
    end
    else begin
        state <= state__n;
    end
end

always_ff @(posedge clk) begin
    if (rst) begin
        port__0 <= 8'h0;
    end
    else begin
        port__0 <= port__0__n;
    end
end


endmodule

//==============================================
// read_dtype 
//==============================================
module read_dtype 
(
    input clk,
    input rst,
    input [2:0] addr,
    input dtype,
    input [63:0] din,
    output logic [63:0] dout
);

logic [63:0] x;

always_comb begin
    case (addr[2:0])
        3'h0:
        begin
            x = din;
        end
        3'h1:
        begin
            x = din >> 8;
        end
        3'h2:
        begin
            x = din >> 16;
        end
        3'h3:
        begin
            x = din >> 24;
        end
        3'h4:
        begin
            x = din >> 32;
        end
        3'h5:
        begin
            x = din >> 40;
        end
        3'h6:
        begin
            x = din >> 48;
        end
        3'h7:
        begin
            x = din >> 56;
        end
    endcase
end

always_comb begin
    case (dtype)
        3'h0:
        begin
            dout[63:0] = x[63:0];
        end
        3'h1:
        begin
            dout[31:0] = x[31:0];
            dout[63:32] = {32{x[31]}};
        end
        3'h2:
        begin
            dout[31:0] = x[31:0];
            dout[63:32] = {32{1'b0}};
        end
        3'h3:
        begin
            dout[15:0] = x[15:0];
            dout[63:16] = {48{x[15]}};
        end
        3'h4:
        begin
            dout[15:0] = x[15:0];
            dout[63:16] = {48{1'b0}};
        end
        3'h5:
        begin
            dout[7:0] = x[7:0];
            dout[63:8] = {56{x[7]}};
        end
        3'h6:
        begin
            dout[7:0] = x[7:0];
            dout[63:8] = {56{1'b0}};
        end
    endcase
end

endmodule
//==============================================
// store_dtype 
//==============================================
module store_dtype 
(
    input clk,
    input rst,
    input [3:0] addr,
    input dtype,
    input [63:0] wr_data,
    input [63:0] din,
    output logic [63:0] dout
);

always_comb begin
    dout = din;

    case (dtype)
        3'h0:
        begin
            dout = wr_data;
        end
        3'h1:
        begin
            case (addr[2])
                1'b0:
                begin
                    dout[31:0] = wr_data[31:0];
                end
                1'b1:
                begin
                    dout[63:32] = wr_data[31:0];
                end
            endcase
        end
        3'h2:
        begin
            case (addr[2])
                1'b0:
                begin
                    dout[31:0] = wr_data[31:0];
                end
                1'b1:
                begin
                    dout[63:32] = wr_data[31:0];
                end
            endcase
        end
        3'h3:
        begin
            case (addr[2:1])
                2'h0:
                begin
                    dout[15:0] = wr_data[15:0];
                end
                2'h1:
                begin
                    dout[31:16] = wr_data[15:0];
                end
                2'h2:
                begin
                    dout[47:32] = wr_data[15:0];
                end
                2'h3:
                begin
                    dout[63:48] = wr_data[15:0];
                end
            endcase
        end
        3'h4:
        begin
            case (addr[2:1])
                2'h0:
                begin
                    dout[15:0] = wr_data[15:0];
                end
                2'h1:
                begin
                    dout[31:16] = wr_data[15:0];
                end
                2'h2:
                begin
                    dout[47:32] = wr_data[15:0];
                end
                2'h3:
                begin
                    dout[63:48] = wr_data[15:0];
                end
            endcase
        end
        3'h5:
        begin
            case (addr[2:0])
                3'h0:
                begin
                    dout[7:0] = wr_data[7:0];
                end
                3'h1:
                begin
                    dout[15:8] = wr_data[7:0];
                end
                3'h2:
                begin
                    dout[23:16] = wr_data[7:0];
                end
                3'h3:
                begin
                    dout[31:24] = wr_data[7:0];
                end
                3'h4:
                begin
                    dout[39:32] = wr_data[7:0];
                end
                3'h5:
                begin
                    dout[47:40] = wr_data[7:0];
                end
                3'h6:
                begin
                    dout[55:48] = wr_data[7:0];
                end
                3'h7:
                begin
                    dout[63:56] = wr_data[7:0];
                end
            endcase
        end
        3'h6:
        begin
            case (addr[2:0])
                3'h0:
                begin
                    dout[7:0] = wr_data[7:0];
                end
                3'h1:
                begin
                    dout[15:8] = wr_data[7:0];
                end
                3'h2:
                begin
                    dout[23:16] = wr_data[7:0];
                end
                3'h3:
                begin
                    dout[31:24] = wr_data[7:0];
                end
                3'h4:
                begin
                    dout[39:32] = wr_data[7:0];
                end
                3'h5:
                begin
                    dout[47:40] = wr_data[7:0];
                end
                3'h6:
                begin
                    dout[55:48] = wr_data[7:0];
                end
                3'h7:
                begin
                    dout[63:56] = wr_data[7:0];
                end
            endcase
        end
    endcase
end

endmodule
//==============================================
// counter
//==============================================
module debouncer
(
    input logic clk,
    input logic rst,
    input logic in,
    output logic out
);
    

parameter DEBOUNCE_COUNT = 20'd1_000_000;
parameter DEBOUNCE_COUNT__LOG2 = 20;


logic [DEBOUNCE_COUNT__LOG2:0] count;
logic in__p;


always_ff @(posedge clk) begin
    in__p <= in;
end
    

always_ff @(posedge clk) begin
    out <= (count == DEBOUNCE_COUNT) ? in__p : out;
end
    

always_ff @(posedge clk) begin
    if (rst) begin
        count <= 0;
    end
    else begin
        if (in == in__p) begin
            count <= (count == DEBOUNCE_COUNT) ?  DEBOUNCE_COUNT : count + 1;
        end
        else begin
            count <= 0;
        end
    end
end

endmodule

