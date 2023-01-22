//==============================================
// central_processing_unit
//==============================================
module central_processing_unit
(
    input clk,
    input rst,
    output logic cpu_to_mem__valid,
    output logic cpu_to_mem__we,
    output logic [63:0] cpu_to_mem__addr,
    output logic [2:0] cpu_to_mem__dtype,
    output logic [63:0] cpu_to_mem__data,
    input mem_to_cpu__valid,
    input mem_to_cpu__error,
    input [63:0] mem_to_cpu__data,
    input eip,
    input tip
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
logic mstatus__mie;
logic mie__meie;
logic mie__msie;
logic mie__mtie;
logic mip__meip;
logic mip__msip;
logic mip__mtip;

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
    .cs(1'b1),
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
    .cs(1'b1),
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
localparam STATE__FETCH__2 = 8'h3;
localparam STATE__DECODE = 8'h4;
localparam STATE__LB__0 = 8'h5;
localparam STATE__LB__1 = 8'h6;
localparam STATE__LB__2 = 8'h7;
localparam STATE__LB__3 = 8'h8;
localparam STATE__LH__0 = 8'h9;
localparam STATE__LH__1 = 8'ha;
localparam STATE__LH__2 = 8'hb;
localparam STATE__LH__3 = 8'hc;
localparam STATE__LW__0 = 8'hd;
localparam STATE__LW__1 = 8'he;
localparam STATE__LW__2 = 8'hf;
localparam STATE__LW__3 = 8'h10;
localparam STATE__LD__0 = 8'h11;
localparam STATE__LD__1 = 8'h12;
localparam STATE__LD__2 = 8'h13;
localparam STATE__LD__3 = 8'h14;
localparam STATE__LBU__0 = 8'h15;
localparam STATE__LBU__1 = 8'h16;
localparam STATE__LBU__2 = 8'h17;
localparam STATE__LBU__3 = 8'h18;
localparam STATE__LHU__0 = 8'h19;
localparam STATE__LHU__1 = 8'h1a;
localparam STATE__LHU__2 = 8'h1b;
localparam STATE__LHU__3 = 8'h1c;
localparam STATE__LWU__0 = 8'h1d;
localparam STATE__LWU__1 = 8'h1e;
localparam STATE__LWU__2 = 8'h1f;
localparam STATE__LWU__3 = 8'h20;
localparam STATE__SB__0 = 8'h21;
localparam STATE__SB__1 = 8'h22;
localparam STATE__SB__2 = 8'h23;
localparam STATE__SB__3 = 8'h24;
localparam STATE__SH__0 = 8'h25;
localparam STATE__SH__1 = 8'h26;
localparam STATE__SH__2 = 8'h27;
localparam STATE__SH__3 = 8'h28;
localparam STATE__SW__0 = 8'h29;
localparam STATE__SW__1 = 8'h2a;
localparam STATE__SW__2 = 8'h2b;
localparam STATE__SW__3 = 8'h2c;
localparam STATE__SD__0 = 8'h2d;
localparam STATE__SD__1 = 8'h2e;
localparam STATE__SD__2 = 8'h2f;
localparam STATE__SD__3 = 8'h30;
localparam STATE__ADD__0 = 8'h31;
localparam STATE__ADD__1 = 8'h32;
localparam STATE__ADD__2 = 8'h33;
localparam STATE__SUB__0 = 8'h34;
localparam STATE__SUB__1 = 8'h35;
localparam STATE__SUB__2 = 8'h36;
localparam STATE__SLL__0 = 8'h37;
localparam STATE__SLL__1 = 8'h38;
localparam STATE__SLL__2 = 8'h39;
localparam STATE__SLT__0 = 8'h3a;
localparam STATE__SLT__1 = 8'h3b;
localparam STATE__SLT__2 = 8'h3c;
localparam STATE__SLTU__0 = 8'h3d;
localparam STATE__SLTU__1 = 8'h3e;
localparam STATE__SLTU__2 = 8'h3f;
localparam STATE__XOR__0 = 8'h40;
localparam STATE__XOR__1 = 8'h41;
localparam STATE__XOR__2 = 8'h42;
localparam STATE__SRL__0 = 8'h43;
localparam STATE__SRL__1 = 8'h44;
localparam STATE__SRL__2 = 8'h45;
localparam STATE__SRA__0 = 8'h46;
localparam STATE__SRA__1 = 8'h47;
localparam STATE__SRA__2 = 8'h48;
localparam STATE__OR__0 = 8'h49;
localparam STATE__OR__1 = 8'h4a;
localparam STATE__OR__2 = 8'h4b;
localparam STATE__AND__0 = 8'h4c;
localparam STATE__AND__1 = 8'h4d;
localparam STATE__AND__2 = 8'h4e;
localparam STATE__LUI = 8'h4f;
localparam STATE__ADDW__0 = 8'h50;
localparam STATE__ADDW__1 = 8'h51;
localparam STATE__ADDW__2 = 8'h52;
localparam STATE__SUBW__0 = 8'h53;
localparam STATE__SUBW__1 = 8'h54;
localparam STATE__SUBW__2 = 8'h55;
localparam STATE__SLLW__0 = 8'h56;
localparam STATE__SLLW__1 = 8'h57;
localparam STATE__SLLW__2 = 8'h58;
localparam STATE__SRLW__0 = 8'h59;
localparam STATE__SRLW__1 = 8'h5a;
localparam STATE__SRLW__2 = 8'h5b;
localparam STATE__SRAW__0 = 8'h5c;
localparam STATE__SRAW__1 = 8'h5d;
localparam STATE__SRAW__2 = 8'h5e;
localparam STATE__ADDI__0 = 8'h5f;
localparam STATE__ADDI__1 = 8'h60;
localparam STATE__SLLI__0 = 8'h61;
localparam STATE__SLLI__1 = 8'h62;
localparam STATE__SLTI__0 = 8'h63;
localparam STATE__SLTI__1 = 8'h64;
localparam STATE__SLTIU__0 = 8'h65;
localparam STATE__SLTIU__1 = 8'h66;
localparam STATE__XORI__0 = 8'h67;
localparam STATE__XORI__1 = 8'h68;
localparam STATE__SRLI__0 = 8'h69;
localparam STATE__SRLI__1 = 8'h6a;
localparam STATE__SRAI__0 = 8'h6b;
localparam STATE__SRAI__1 = 8'h6c;
localparam STATE__ORI__0 = 8'h6d;
localparam STATE__ORI__1 = 8'h6e;
localparam STATE__ANDI__0 = 8'h6f;
localparam STATE__ANDI__1 = 8'h70;
localparam STATE__ADDIW__0 = 8'h71;
localparam STATE__ADDIW__1 = 8'h72;
localparam STATE__SLLIW__0 = 8'h73;
localparam STATE__SLLIW__1 = 8'h74;
localparam STATE__SRLIW__0 = 8'h75;
localparam STATE__SRLIW__1 = 8'h76;
localparam STATE__SRAIW__0 = 8'h77;
localparam STATE__SRAIW__1 = 8'h78;
localparam STATE__AUIPC__0 = 8'h79;
localparam STATE__AUIPC__1 = 8'h7a;
localparam STATE__JALR__0 = 8'h7b;
localparam STATE__JALR__1 = 8'h7c;
localparam STATE__JAL__0 = 8'h7d;
localparam STATE__JAL__1 = 8'h7e;
localparam STATE__BEQ__0 = 8'h7f;
localparam STATE__BEQ__1 = 8'h80;
localparam STATE__BEQ__2 = 8'h81;
localparam STATE__BEQ__3 = 8'h82;
localparam STATE__BEQ__4 = 8'h83;
localparam STATE__BEQ__5 = 8'h84;
localparam STATE__BNE__0 = 8'h85;
localparam STATE__BNE__1 = 8'h86;
localparam STATE__BNE__2 = 8'h87;
localparam STATE__BNE__3 = 8'h88;
localparam STATE__BNE__4 = 8'h89;
localparam STATE__BNE__5 = 8'h8a;
localparam STATE__BLT__0 = 8'h8b;
localparam STATE__BLT__1 = 8'h8c;
localparam STATE__BLT__2 = 8'h8d;
localparam STATE__BLT__3 = 8'h8e;
localparam STATE__BLT__4 = 8'h8f;
localparam STATE__BLT__5 = 8'h90;
localparam STATE__BGE__0 = 8'h91;
localparam STATE__BGE__1 = 8'h92;
localparam STATE__BGE__2 = 8'h93;
localparam STATE__BGE__3 = 8'h94;
localparam STATE__BGE__4 = 8'h95;
localparam STATE__BGE__5 = 8'h96;
localparam STATE__BLTU__0 = 8'h97;
localparam STATE__BLTU__1 = 8'h98;
localparam STATE__BLTU__2 = 8'h99;
localparam STATE__BLTU__3 = 8'h9a;
localparam STATE__BLTU__4 = 8'h9b;
localparam STATE__BLTU__5 = 8'h9c;
localparam STATE__BGEU__0 = 8'h9d;
localparam STATE__BGEU__1 = 8'h9e;
localparam STATE__BGEU__2 = 8'h9f;
localparam STATE__BGEU__3 = 8'ha0;
localparam STATE__BGEU__4 = 8'ha1;
localparam STATE__BGEU__5 = 8'ha2;
localparam STATE__ECALL = 8'ha3;
localparam STATE__EBREAK = 8'ha4;
localparam STATE__WFI = 8'ha5;
localparam STATE__FENCE = 8'ha6;
localparam STATE__FENCE_I = 8'ha7;
localparam STATE__CSRRW__0 = 8'ha8;
localparam STATE__CSRRW__1 = 8'ha9;
localparam STATE__CSRRW__2 = 8'haa;
localparam STATE__CSRRS__0 = 8'hab;
localparam STATE__CSRRS__1 = 8'hac;
localparam STATE__CSRRS__2 = 8'had;
localparam STATE__CSRRC__0 = 8'hae;
localparam STATE__CSRRC__1 = 8'haf;
localparam STATE__CSRRC__2 = 8'hb0;
localparam STATE__CSRRWI__0 = 8'hb1;
localparam STATE__CSRRWI__1 = 8'hb2;
localparam STATE__CSRRWI__2 = 8'hb3;
localparam STATE__CSRRSI__0 = 8'hb4;
localparam STATE__CSRRSI__1 = 8'hb5;
localparam STATE__CSRRSI__2 = 8'hb6;
localparam STATE__CSRRCI__0 = 8'hb7;
localparam STATE__CSRRCI__1 = 8'hb8;
localparam STATE__CSRRCI__2 = 8'hb9;
localparam STATE__MRET__0 = 8'hba;
localparam STATE__MRET__1 = 8'hbb;
localparam STATE__TRAP__0 = 8'hbc;
localparam STATE__TRAP__1 = 8'hbd;
localparam STATE__TRAP__2 = 8'hbe;
localparam STATE__EXCEPTION__INSTRUCTION_ADDRESS_MISALIGNED__0 = 8'hbf;
localparam STATE__EXCEPTION__INSTRUCTION_ADDRESS_MISALIGNED__0__JALR = 8'hc0;
localparam STATE__EXCEPTION__INSTRUCTION_ADDRESS_MISALIGNED__1 = 8'hc1;
localparam STATE__EXCEPTION__INSTRUCTION_ACCESS_FAULT__0 = 8'hc2;
localparam STATE__EXCEPTION__INSTRUCTION_ACCESS_FAULT__1 = 8'hc3;
localparam STATE__EXCEPTION__ILLEGAL_INSTRUCTION = 8'hc4;
localparam STATE__EXCEPTION__LOAD_ADDRESS_MISALIGNED__0 = 8'hc5;
localparam STATE__EXCEPTION__LOAD_ADDRESS_MISALIGNED__1 = 8'hc6;
localparam STATE__EXCEPTION__LOAD_ACCESS_FAULT__0 = 8'hc7;
localparam STATE__EXCEPTION__LOAD_ACCESS_FAULT__1 = 8'hc8;
localparam STATE__EXCEPTION__STORE_ADDRESS_MISALIGNED__0 = 8'hc9;
localparam STATE__EXCEPTION__STORE_ADDRESS_MISALIGNED__1 = 8'hca;
localparam STATE__EXCEPTION__STORE_ACCESS_FAULT__0 = 8'hcb;
localparam STATE__EXCEPTION__STORE_ACCESS_FAULT__1 = 8'hcc;
localparam STATE__INTERRUPT__SOFTWARE = 8'hcd;
localparam STATE__INTERRUPT__TIMER = 8'hce;
localparam STATE__INTERRUPT__EXTERNAL = 8'hcf;
localparam STATE__FATAL = 8'hd0;


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
    csr__addr = imm[11:0];
    csr__we = 1'b0;
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
            cpu_to_mem__valid = 1'b1;
            cpu_to_mem__addr = pc;
            cpu_to_mem__dtype = 3'h1;
            state__n = STATE__FETCH__2;
        end

        //==============================
        // STATE__FETCH__2
        //==============================
        STATE__FETCH__2:
        begin
            ir__n = mem_to_cpu__data[31:0];
            state__n = (mem_to_cpu__valid & ~mem_to_cpu__error) ? STATE__DECODE : (mem_to_cpu__valid & mem_to_cpu__error & (mem_to_cpu__data == 64'h0)) ? STATE__EXCEPTION__INSTRUCTION_ACCESS_FAULT__0 : STATE__FETCH__2;
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
            instret = 1'b1;
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
            instret = 1'b1;
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
            instret = 1'b1;
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
            instret = 1'b1;
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
            instret = 1'b1;
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
            instret = 1'b1;
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
            instret = 1'b1;
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
            instret = 1'b1;
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
            instret = 1'b1;
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
            instret = 1'b1;
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
            instret = 1'b1;
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
            instret = 1'b1;
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
            instret = 1'b1;
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
            instret = 1'b1;
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
            instret = 1'b1;
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
            instret = 1'b1;
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
            instret = 1'b1;
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
            instret = 1'b1;
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
            instret = 1'b1;
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
            instret = 1'b1;
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
            instret = 1'b1;
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
            instret = 1'b1;
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
            instret = 1'b1;
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
            instret = 1'b1;
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
            instret = 1'b1;
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
            instret = 1'b1;
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
            instret = 1'b1;
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
            instret = 1'b1;
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
            state__n = STATE__LB__2;
        end

        //==============================
        // STATE__LB__2
        //==============================
        STATE__LB__2:
        begin
            addr = rd;
            we = mem_to_cpu__valid & ~mem_to_cpu__error;
            wr_data = mem_to_cpu__data;
            state__n = (mem_to_cpu__valid & ~mem_to_cpu__error) ? STATE__LB__3 : (mem_to_cpu__valid & mem_to_cpu__error & (mem_to_cpu__data == 64'h0)) ? STATE__EXCEPTION__LOAD_ACCESS_FAULT__0 : (mem_to_cpu__valid & mem_to_cpu__error & (mem_to_cpu__data == 64'h1)) ? STATE__EXCEPTION__LOAD_ADDRESS_MISALIGNED__0 : STATE__LB__2;
        end

        //==============================
        // STATE__LB__3
        //==============================
        STATE__LB__3:
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
            state__n = STATE__LH__2;
        end

        //==============================
        // STATE__LH__2
        //==============================
        STATE__LH__2:
        begin
            addr = rd;
            we = mem_to_cpu__valid & ~mem_to_cpu__error;
            wr_data = mem_to_cpu__data;
            state__n = (mem_to_cpu__valid & ~mem_to_cpu__error) ? STATE__LH__3 : (mem_to_cpu__valid & mem_to_cpu__error & (mem_to_cpu__data == 64'h0)) ? STATE__EXCEPTION__LOAD_ACCESS_FAULT__0 : (mem_to_cpu__valid & mem_to_cpu__error & (mem_to_cpu__data == 64'h1)) ? STATE__EXCEPTION__LOAD_ADDRESS_MISALIGNED__0 : STATE__LH__2;
        end

        //==============================
        // STATE__LH__3
        //==============================
        STATE__LH__3:
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
            state__n = STATE__LW__2;
        end

        //==============================
        // STATE__LW__2
        //==============================
        STATE__LW__2:
        begin
            addr = rd;
            we = mem_to_cpu__valid & ~mem_to_cpu__error;
            wr_data = mem_to_cpu__data;
            state__n = (mem_to_cpu__valid & ~mem_to_cpu__error) ? STATE__LW__3 : (mem_to_cpu__valid & mem_to_cpu__error & (mem_to_cpu__data == 64'h0)) ? STATE__EXCEPTION__LOAD_ACCESS_FAULT__0 : (mem_to_cpu__valid & mem_to_cpu__error & (mem_to_cpu__data == 64'h1)) ? STATE__EXCEPTION__LOAD_ADDRESS_MISALIGNED__0 : STATE__LW__2;
        end

        //==============================
        // STATE__LW__3
        //==============================
        STATE__LW__3:
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
            state__n = STATE__LD__2;
        end

        //==============================
        // STATE__LD__2
        //==============================
        STATE__LD__2:
        begin
            addr = rd;
            we = mem_to_cpu__valid & ~mem_to_cpu__error;
            wr_data = mem_to_cpu__data;
            state__n = (mem_to_cpu__valid & ~mem_to_cpu__error) ? STATE__LD__3 : (mem_to_cpu__valid & mem_to_cpu__error & (mem_to_cpu__data == 64'h0)) ? STATE__EXCEPTION__LOAD_ACCESS_FAULT__0 : (mem_to_cpu__valid & mem_to_cpu__error & (mem_to_cpu__data == 64'h1)) ? STATE__EXCEPTION__LOAD_ADDRESS_MISALIGNED__0 : STATE__LD__2;
        end

        //==============================
        // STATE__LD__3
        //==============================
        STATE__LD__3:
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
            state__n = STATE__LBU__2;
        end

        //==============================
        // STATE__LBU__2
        //==============================
        STATE__LBU__2:
        begin
            addr = rd;
            we = mem_to_cpu__valid & ~mem_to_cpu__error;
            wr_data = mem_to_cpu__data;
            state__n = (mem_to_cpu__valid & ~mem_to_cpu__error) ? STATE__LBU__3 : (mem_to_cpu__valid & mem_to_cpu__error & (mem_to_cpu__data == 64'h0)) ? STATE__EXCEPTION__LOAD_ACCESS_FAULT__0 : (mem_to_cpu__valid & mem_to_cpu__error & (mem_to_cpu__data == 64'h1)) ? STATE__EXCEPTION__LOAD_ADDRESS_MISALIGNED__0 : STATE__LBU__2;
        end

        //==============================
        // STATE__LBU__3
        //==============================
        STATE__LBU__3:
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
            state__n = STATE__LHU__2;
        end

        //==============================
        // STATE__LHU__2
        //==============================
        STATE__LHU__2:
        begin
            addr = rd;
            we = mem_to_cpu__valid & ~mem_to_cpu__error;
            wr_data = mem_to_cpu__data;
            state__n = (mem_to_cpu__valid & ~mem_to_cpu__error) ? STATE__LHU__3 : (mem_to_cpu__valid & mem_to_cpu__error & (mem_to_cpu__data == 64'h0)) ? STATE__EXCEPTION__LOAD_ACCESS_FAULT__0 : (mem_to_cpu__valid & mem_to_cpu__error & (mem_to_cpu__data == 64'h1)) ? STATE__EXCEPTION__LOAD_ADDRESS_MISALIGNED__0 : STATE__LHU__2;
        end

        //==============================
        // STATE__LHU__3
        //==============================
        STATE__LHU__3:
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
            state__n = STATE__LWU__2;
        end

        //==============================
        // STATE__LWU__2
        //==============================
        STATE__LWU__2:
        begin
            addr = rd;
            we = mem_to_cpu__valid & ~mem_to_cpu__error;
            wr_data = mem_to_cpu__data;
            state__n = (mem_to_cpu__valid & ~mem_to_cpu__error) ? STATE__LWU__3 : (mem_to_cpu__valid & mem_to_cpu__error & (mem_to_cpu__data == 64'h0)) ? STATE__EXCEPTION__LOAD_ACCESS_FAULT__0 : (mem_to_cpu__valid & mem_to_cpu__error & (mem_to_cpu__data == 64'h1)) ? STATE__EXCEPTION__LOAD_ADDRESS_MISALIGNED__0 : STATE__LWU__2;
        end

        //==============================
        // STATE__LWU__3
        //==============================
        STATE__LWU__3:
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
            state__n = STATE__SB__2;
        end

        //==============================
        // STATE__SB__2
        //==============================
        STATE__SB__2:
        begin
            state__n = (mem_to_cpu__valid & ~mem_to_cpu__error) ? STATE__SB__3 : (mem_to_cpu__valid & mem_to_cpu__error & (mem_to_cpu__data == 64'h0)) ? STATE__EXCEPTION__STORE_ACCESS_FAULT__0 : (mem_to_cpu__valid & mem_to_cpu__error & (mem_to_cpu__data == 64'h1)) ? STATE__EXCEPTION__STORE_ADDRESS_MISALIGNED__0 : STATE__SB__2;
        end

        //==============================
        // STATE__SB__3
        //==============================
        STATE__SB__3:
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
            state__n = STATE__SH__2;
        end

        //==============================
        // STATE__SH__2
        //==============================
        STATE__SH__2:
        begin
            state__n = (mem_to_cpu__valid & ~mem_to_cpu__error) ? STATE__SH__3 : (mem_to_cpu__valid & mem_to_cpu__error & (mem_to_cpu__data == 64'h0)) ? STATE__EXCEPTION__STORE_ACCESS_FAULT__0 : (mem_to_cpu__valid & mem_to_cpu__error & (mem_to_cpu__data == 64'h1)) ? STATE__EXCEPTION__STORE_ADDRESS_MISALIGNED__0 : STATE__SH__2;
        end

        //==============================
        // STATE__SH__3
        //==============================
        STATE__SH__3:
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
            state__n = STATE__SW__2;
        end

        //==============================
        // STATE__SW__2
        //==============================
        STATE__SW__2:
        begin
            state__n = (mem_to_cpu__valid & ~mem_to_cpu__error) ? STATE__SW__3 : (mem_to_cpu__valid & mem_to_cpu__error & (mem_to_cpu__data == 64'h0)) ? STATE__EXCEPTION__STORE_ACCESS_FAULT__0 : (mem_to_cpu__valid & mem_to_cpu__error & (mem_to_cpu__data == 64'h1)) ? STATE__EXCEPTION__STORE_ADDRESS_MISALIGNED__0 : STATE__SW__2;
        end

        //==============================
        // STATE__SW__3
        //==============================
        STATE__SW__3:
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
            state__n = STATE__SD__2;
        end

        //==============================
        // STATE__SD__2
        //==============================
        STATE__SD__2:
        begin
            state__n = (mem_to_cpu__valid & ~mem_to_cpu__error) ? STATE__SD__3 : (mem_to_cpu__valid & mem_to_cpu__error & (mem_to_cpu__data == 64'h0)) ? STATE__EXCEPTION__STORE_ACCESS_FAULT__0 : (mem_to_cpu__valid & mem_to_cpu__error & (mem_to_cpu__data == 64'h1)) ? STATE__EXCEPTION__STORE_ADDRESS_MISALIGNED__0 : STATE__SD__2;
        end

        //==============================
        // STATE__SD__3
        //==============================
        STATE__SD__3:
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
            addr = rd;
            we = 1'b1;
            wr_data = c;
            pc__n = pc + 4;
            instret = 1'b1;
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
            addr = rd;
            we = 1'b1;     
            wr_data = pc + 4;
            pc__n = c;
            instret = 1'b1;
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
            addr = rd;
            we = 1'b1;
            wr_data = imm;
            pc__n = pc + 4;
            instret = 1'b1;
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
            instret = 1'b1;
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
            instret = 1'b1;
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
            instret = 1'b1;
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
            instret = 1'b1;
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
            instret = 1'b1;
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
            instret = 1'b1;
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
            instret = 1'b1;
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

