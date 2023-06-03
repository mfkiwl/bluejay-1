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
//==============================================
// central_processing_unit
//==============================================
module central_processing_unit
(
    input clk,
    input rst,
    output logic cs,
    output logic we,
    output logic [63:0] addr,
    output logic [1:0] size,
    output logic [63:0] wr_data,
    input ready,
    input resp,
    input [63:0] rd_data,
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
    size = 2'h2;
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
        end

        //==============================
        // STATE__FETCH__1
        //==============================
        STATE__FETCH__1:
        begin
            cs = 1'b1;
            addr = pc;
            size = 2'h2;
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
            size = 2'h0;
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
            size = 2'h1;
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
            size = 2'h2;
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
            size = 2'h3;
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
            size = 2'h0;
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
            size = 2'h1;
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
            size = 2'h2;
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
            size = 2'h0;
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
            size = 2'h1;
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
            size = 2'h2;
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
            size = 2'h3;
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
            pc__n = {csr__rd_data[63:2], 2'h0}; 
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
d_flip_flop #(.WIDTH(64), .RESET_VALUE(64'h0)) d_flip_flop__pc
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
// control_and_status_registers 
//==============================================
module control_and_status_registers
(
    input clk,
    input rst,
    input cs,
    input we,
    input [11:0] addr,
    output logic [63:0] rd_data,
    input [63:0] wr_data,
    input eip,
    input tip,
    input instret,
    output logic [1-1:0] mstatus__mie,
    output logic [1-1:0] mie__meie,
    output logic [1-1:0] mie__msie,
    output logic [1-1:0] mie__mtie,
    output logic [1-1:0] mip__meip,
    output logic [1-1:0] mip__msip,
    output logic [1-1:0] mip__mtip
);


// Machine ISA Register (misa)
logic [63:0] misa;
logic [26-1:0] misa__extensions;
logic [36-1:0] misa__wiri__0;
logic [2-1:0] misa__base;
logic we__misa;
logic en__misa;

// Machine Vendor ID Register (mvendorid)
logic [63:0] mvendorid;
logic [64-1:0] mvendorid__vendor;
logic we__mvendorid;
logic en__mvendorid;

// Machine Architecture ID Register (marchid)
logic [63:0] marchid;
logic [64-1:0] marchid__architecture_id;
logic we__marchid;
logic en__marchid;

// Machine Implementation ID Register (mimpid)
logic [63:0] mimpid;
logic [64-1:0] mimpid__implementation;
logic we__mimpid;
logic en__mimpid;

// Hart ID Register (mhartid) 
logic [63:0] mhartid;
logic [64-1:0] mhartid__hart_id;
logic we__mhartid;
logic en__mhartid;

// Machine Status Register (mstatus) 
logic [63:0] mstatus;
logic [1-1:0] mstatus__uie;
logic [1-1:0] mstatus__sie;
logic [1-1:0] mstatus__hie;
logic [1-1:0] mstatus__upie;
logic [1-1:0] mstatus__spie;
logic [1-1:0] mstatus__hpie;
logic [1-1:0] mstatus__mpie;
logic [1-1:0] mstatus__spp;
logic [2-1:0] mstatus__hpp;
logic [2-1:0] mstatus__mpp;
logic [2-1:0] mstatus__fs;
logic [2-1:0] mstatus__xs;
logic [1-1:0] mstatus__mprv;
logic [1-1:0] mstatus__pum;
logic [1-1:0] mstatus__mxr;
logic [5-1:0] mstatus__vm;
logic [1-1:0] mstatus__sd;
logic we__mstatus;
logic en__mstatus;

// Machine Trap-Vector Base-Address Register (mtvec)
logic [63:0] mtvec;
logic [2-1:0] mtvec__mode;
logic [62-1:0] mtvec__base;
logic we__mtvec;
logic en__mtvec;

// Machine Exception Delegation Register (medeleg) 
logic [63:0] medeleg;
logic [64-1:0] medeleg__synchronous_exceptions;
logic we__medeleg;
logic en__medeleg;

// Machine Interrupt Delegation Register (mideleg) 
logic [63:0] mideleg;
logic [64-1:0] mideleg__interrupts;
logic we__mideleg;
logic en__mideleg;

// Machine Interrupt-Pending Register (mip) 
logic [63:0] mip;
logic [1-1:0] mip__usip;
logic [1-1:0] mip__ssip;
logic [1-1:0] mip__hsip;
logic [1-1:0] mip__utip;
logic [1-1:0] mip__stip;
logic [1-1:0] mip__htip;
logic [1-1:0] mip__ueip;
logic [1-1:0] mip__seip;
logic [1-1:0] mip__heip;
logic [52-1:0] mip__wiri__0;
logic we__mip;
logic en__mip;

// Machine Interrupt-Enable Register (mie) 
logic [63:0] mie;
logic [1-1:0] mie__usie;
logic [1-1:0] mie__ssie;
logic [1-1:0] mie__hsie;
logic [1-1:0] mie__utie;
logic [1-1:0] mie__stie;
logic [1-1:0] mie__htie;
logic [1-1:0] mie__ueie;
logic [1-1:0] mie__seie;
logic [1-1:0] mie__heie;
logic [52-1:0] mie__wpri__0;
logic we__mie;
logic en__mie;

// Machine Cycle Register (mcycle) 
logic [63:0] mcycle;
logic [64-1:0] mcycle__mcycle;
logic [64-1:0] mcycle__mcycle__n;
logic we__mcycle;
logic en__mcycle;

// Machine Instruction Retire Register (minstret) 
logic [63:0] minstret;
logic [64-1:0] minstret__minstret;
logic [64-1:0] minstret__minstret__n;
logic we__minstret;
logic en__minstret;
logic minstret__write_occurred;
logic state__minstret;
logic state__minstret__n;

// Machine Hardware Performance Monitor Counter 3 (mhpmcounter3)
logic [63:0] mhpmcounter3;
logic [64-1:0] mhpmcounter3__mhpmcounter3;
logic we__mhpmcounter3;
logic en__mhpmcounter3;

// Machine Hardware Performance Monitor Event 3 (mhpmevent3)
logic [63:0] mhpmevent3;
logic [64-1:0] mhpmevent3__mhpmevent3;
logic we__mhpmevent3;
logic en__mhpmevent3;

// Machine Scratch Register (mscratch) 
logic [63:0] mscratch;
logic [64-1:0] mscratch__mscratch;
logic we__mscratch;
logic en__mscratch;

// Machine Exception Program Counter (mepc) 
logic [63:0] mepc;
logic [64-1:0] mepc__mepc;
logic we__mepc;
logic en__mepc;

// Machine Cause Register (mcause) 
logic [63:0] mcause;
logic [63-1:0] mcause__exception_code;
logic [1-1:0] mcause__interrupt;
logic we__mcause;
logic en__mcause;

// Machine Trap Value Register (mtval) 
logic [63:0] mtval;
logic [64-1:0] mtval__mtval;
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

assign misa__extensions = 26'h100;
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

//==============================
// d_flip_flop__mstatus__mpie
//==============================
d_flip_flop #(.WIDTH(1), .RESET_VALUE(1'b1)) d_flip_flop__mstatus__mpie
(
    .clk(clk),
    .rst(rst),
    .en(en__mstatus),
    .d(wr_data[7]),
    .q(mstatus__mpie)
);



//============================================== 
// Machine Trap-Vector Base-Address Register (mtvec)
//==============================================
assign mtvec[1:0] = mtvec__mode;
assign mtvec[63:2] = mtvec__base;

assign mtvec__mode = 2'h0;

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
    .q(mtvec__base)
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
    .en(1'b1),
    .d(tip),
    .q(mip__mtip)
);

//==============================
// d_flip_flop__mip__meip
//==============================
d_flip_flop #(.WIDTH(1), .RESET_VALUE()) d_flip_flop__mip__meip
(
    .clk(clk),
    .rst(1'b0),
    .en(1'b1),
    .d(eip),
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
// machine_timer_registers 
//==============================================
module machine_timer_registers
(
    input clk,
    input rst,
    input cs,
    input we,
    input [3:0] addr,
    input [63:0] wr_data,
    output logic [63:0] rd_data,
    output logic tip
);


// Machine Time Register (mtime)
logic [63:0] mtime;
logic [64-1:0] mtime__mtime;
logic [64-1:0] mtime__mtime__n;
logic we__mtime;
logic en__mtime;

// Machine Time Compare Register (mtimecmp)
logic [63:0] mtimecmp;
logic [64-1:0] mtimecmp__mtimecmp;
logic we__mtimecmp;
logic en__mtimecmp;


assign tip = mtime >= mtimecmp;


always_comb
begin
    we__mtime = 1'b0;
    we__mtimecmp = 1'b0;
            
    case (addr)
        4'h0:
        begin
            rd_data = mtime;
            we__mtime = we;
        end
        4'h8:
        begin
            rd_data = mtimecmp;
            we__mtimecmp = we;
        end
    endcase
end

//============================================== 
// Machine Time Register (mtime)
//==============================================
assign mtime[63:0] = mtime__mtime;

assign en__mtime = 1'b1; 

always_comb
begin
    case (en__mtime & we__mtime & cs)
        1'b0:
        begin
            mtime__mtime__n = mtime__mtime + 1;
        end
        1'b1:
        begin
            mtime__mtime__n = wr_data[63:0];
        end
    endcase
end

//==============================
// d_flip_flop__mtime__mtime
//==============================
d_flip_flop #(.WIDTH(64), .RESET_VALUE(64'h0)) d_flip_flop__mtime__mtime
(
    .clk(clk),
    .rst(rst),
    .en(en__mtime),
    .d(mtime__mtime__n),
    .q(mtime__mtime)
);

//============================================== 
// Machine Time Compare Register (mtimecmp)
//==============================================
assign mtimecmp[63:0] = mtimecmp__mtimecmp;

assign en__mtimecmp = cs & we__mtimecmp;

//==============================
// d_flip_flop__mtimecmp__mtimecmp
//==============================
d_flip_flop #(.WIDTH(64), .RESET_VALUE(64'h0)) d_flip_flop__mtimecmp__mtimecmp
(
    .clk(clk),
    .rst(rst),
    .en(en__mtimecmp),
    .d(wr_data[63:0]),
    .q(mtimecmp__mtimecmp)
);


endmodule
//==============================================
// platform_level_interrupt_controller 
//==============================================
module platform_level_interrupt_controller
(
    input clk,
    input rst,
    input cs,
    input we,
    input [25:0] addr,
    input [31:0] wr_data,
    output logic [31:0] rd_data,
    input int__1,
    output logic context__0__eip
);


logic request__0;
logic request__1;
logic complete__0;
logic complete__1;

//==============================
// core 
//==============================
platform_level_interrupt_controller__core core
(
    .clk(clk),
    .rst(rst),
    .cs(cs),
    .we(we),
    .addr(addr),
    .wr_data(wr_data),
    .rd_data(rd_data),
    .request__0(request__0),
    .request__1(request__1),
    .complete__0(complete__0),
    .complete__1(complete__1),
    .context__0__eip(context__0__eip)
);

//==============================
// gateway__1
//==============================
platform_level_interrupt_controller__gateway gateway__1
(
    .clk(clk),
    .rst(rst),
    .int__x(int__1),
    .request__x(request__1),
    .complete__x(complete__1)
);

endmodule



//==============================================
// platform_level_interrupt_controller__core
//==============================================
module platform_level_interrupt_controller__core
(
    input clk,
    input rst,
    input cs,
    input we,
    input [25:0] addr,
    input [31:0] wr_data,
    output logic [31:0] rd_data,
    input request__0,
    input request__1,
    output logic complete__0,
    output logic complete__1,
    output logic context__0__eip
);


logic ip__0;
logic ip__1;

// Interrupt Source Priority - Source 0
logic [31:0] priority__0;
logic we__priority__0;
logic re__priority__0;
logic en__priority__0;

// Interrupt Source Priority - Source 1
logic [31:0] priority__1;
logic we__priority__1;
logic re__priority__1;
logic en__priority__1;

// Interrupt Pending Bits - Source 0-31
logic [31:0] ip__0_to_31;
logic we__ip__0_to_31;
logic re__ip__0_to_31;
logic en__ip__0_to_31;

// Interrupt Enable Bits - Context 0 - Source 0-31
logic [31:0] context__0__ie__0_to_31;
logic we__context__0__ie__0_to_31;
logic re__context__0__ie__0_to_31;
logic en__context__0__ie__0_to_31;
logic context__0__ie__0;
logic context__0__ie__1;

// Priority Threshold - Context 0 
logic [31:0] context__0__threshold;
logic we__context__0__threshold;
logic re__context__0__threshold;
logic en__context__0__threshold;

// Interrupt Claim/Complete - Context 0 
logic [31:0] context__0__claim_complete;
logic we__context__0__claim_complete;
logic re__context__0__claim_complete;
logic en__context__0__claim_complete;

// Interrupt Claim/Complete - Combined
logic we__context__x__claim_complete;
logic re__context__x__claim_complete;
logic claim__0;
logic claim__1;

logic [9:0] context__0__priority_mux__0__id;
logic context__0__priority_mux__0__ie;
logic context__0__priority_mux__0__ip;
logic [31:0] context__0__priority_mux__0__priority;


assign ip__0 = 1'b0;

//==============================================
// sr_flip_flop__ip__1
//==============================================
sr_flip_flop sr_flip_flop__ip__1 
(
    .clk(clk),
    .s(request__1),
    .r(claim__1 || rst),
    .q(ip__1)
);


//==============================
//  context__0__mux__0
//==============================
platform_level_interrupt_controller__priority_mux context__0__priority_mux__0
(
    .clk(clk),
    .rst(rst),
    .id__a(10'h0),
    .ie__a(context__0__ie__0),
    .ip__a(ip__0),
    .priority__a(priority__0),
    .id__b(10'h1),
    .ie__b(context__0__ie__1),
    .ip__b(ip__1),
    .priority__b(priority__1),
    .id__c(context__0__priority_mux__0__id),
    .ie__c(context__0__priority_mux__0__ie),
    .ip__c(context__0__priority_mux__0__ip),
    .priority__c(context__0__priority_mux__0__priority)
);

assign context__0__id = context__0__priority_mux__0__id;
assign context__0__priority = context__0__priority_mux__0__priority;
assign context__0__eip = (context__0__priority > context__0__threshold);


always_comb
begin
    rd_data = 32'h0;
    we__priority__0 = 1'b0;
    re__priority__0 = 1'b0;
    we__priority__1 = 1'b0;
    re__priority__1 = 1'b0;
    we__ip__0_to_31 = 1'b0;
    re__ip__0_to_31 = 1'b0;
    we__context__0__ie__0_to_31 = 1'b0;
    re__context__0__ie__0_to_31 = 1'b0;
    we__context__0__threshold = 1'b0;
    re__context__0__threshold = 1'b0;
    we__context__0__claim_complete = 1'b0;
    re__context__0__claim_complete = 1'b0;

    case (addr)
        26'h0000000:
        begin
            rd_data = priority__0; 
            we__priority__0 = we;            
            re__priority__0 = ~we;            
        end
        26'h0000004:
        begin
            rd_data = priority__1; 
            we__priority__1 = we;            
            re__priority__1 = ~we;            
        end
        26'h0001000:
        begin
            rd_data = ip__0_to_31;
            we__ip__0_to_31 = we;
            re__ip__0_to_31 = ~we;
        end
        26'h0002000:
        begin
            rd_data = context__0__ie__0_to_31;
            we__context__0__ie__0_to_31 = we;
            re__context__0__ie__0_to_31 = ~we;
        end
        26'h0200000:
        begin
            rd_data = context__0__threshold;
            we__context__0__threshold = we;
            re__context__0__threshold = ~we;
        end
        26'h0200004:
        begin
            rd_data = context__0__claim_complete;
            we__context__0__claim_complete = we;
            re__context__0__claim_complete = ~we;
        end
    endcase
end


//==============================================
// Interrupt Source Priority - Source 0
//==============================================
assign priority__0 = 32'h0;


//==============================================
// Interrupt Source Priority - Source 1
//==============================================
assign priority__1 = 32'h1;


//==============================================
// Interrupt Pending Bits - Source 0-31
//==============================================
assign ip__0_to_31[0] = ip__0;
assign ip__0_to_31[1] = ip__1;
assign ip__0_to_31[31:2] = 0;


//==============================================
// Interrupt Enable Bits - Context 0 - Source 0-31
//==============================================
assign context__0__ie__0_to_31[0] = context__0__ie__0;
assign context__0__ie__0_to_31[1] = context__0__ie__1;
assign context__0__ie__0_to_31[31:2] = 0;

assign en__context__0__ie__0_to_31 = cs & we__context__0__ie__0_to_31;

assign context__0__ie__0 = 1'b0;

//==============================
// d_flip_flop__context__0__ie__1
//==============================
d_flip_flop #(.WIDTH(1), .RESET_VALUE(1'b0)) d_flip_flop__context__0__ie__1
(
    .clk(clk),
    .rst(rst),
    .en(en__context__0__ie__0_to_31),
    .d(wr_data[1]),
    .q(context__0__ie__1)
);


//==============================================
// Priority Threshold - Context 0 
//==============================================
assign en__context__0__threshold = cs & we__context__0__threshold;

//==============================
// d_flip_flop__context__0__threshold
//==============================
d_flip_flop #(.WIDTH(32), .RESET_VALUE(32'h0)) d_flip_flop__context__0__threshold
(
    .clk(clk),
    .rst(rst),
    .en(en__context__0__threshold),
    .d(wr_data),
    .q(context__0__threshold)
);


//==============================================
// Interrupt Claim/Complete - Context 0 
//==============================================
assign context__0__claim_complete[9:0] = context__0__id;
assign context__0__claim_complete[31:10] = 22'h0;




assign re__context__x__claim_complete = re__context__0__claim_complete; 
assign we__context__x__claim_complete = we__context__0__claim_complete;

always_comb
begin
    claim__0 = 1'b0; 
    claim__1 = 1'b0; 

    case (rd_data[9:0]) 
        10'h0:
        begin
            claim__0 = cs & re__context__x__claim_complete;
        end
        10'h1:
        begin
            claim__1 = cs & re__context__x__claim_complete;
        end
    endcase
end

always_comb
begin
    complete__0 = 1'b0; 
    complete__1 = 1'b0; 

    case (wr_data[9:0]) 
        10'h0:
        begin
            complete__0 = cs & we__context__x__claim_complete;
        end
        10'h1:
        begin
            complete__1 = cs & we__context__x__claim_complete;
        end
    endcase
end


endmodule
//==============================================
// platform_level_interrupt_controller__gateway 
//==============================================
module platform_level_interrupt_controller__gateway 
(
    input clk,
    input rst,
    input int__x,
    output logic request__x,
    input complete__x
);


logic [1:0] state;
logic [1:0] state__n;

localparam STATE__READY = 2'h0;
localparam STATE__REQUEST_INTERRUPT = 2'h1;
localparam STATE__WAIT = 2'h2;

always_comb
begin
    request__x = 1'b0;
    state__n = state;

    case (state)
        //==============================
        // STATE__READY
        //==============================
        STATE__READY:
        begin
            state__n = int__x ? STATE__REQUEST_INTERRUPT : STATE__READY;
        end

        //==============================
        // STATE__REQUEST_INTERRUPT
        //==============================
        STATE__REQUEST_INTERRUPT:
        begin
            request__x = 1'b1;
            state__n = STATE__WAIT;
        end
        
        //==============================
        // STATE__WAIT
        //==============================
        STATE__WAIT:
        begin
            state__n = complete__x ? STATE__READY : STATE__WAIT;
        end
    endcase
end

//==============================
// d_flip_flop__state
//==============================
d_flip_flop #(.WIDTH(2), .RESET_VALUE(STATE__READY)) d_flip_flop__state
(
    .clk(clk),
    .rst(rst),
    .en(1'b1),
    .d(state__n),
    .q(state)
);


endmodule
//==============================================
// platform_level_interrupt_controller__priority_mux
//==============================================
module platform_level_interrupt_controller__priority_mux
(
    input clk,
    input rst,
    input [9:0] id__a,
    input ie__a,
    input ip__a,
    input [31:0] priority__a,
    input [9:0] id__b,
    input ie__b,
    input ip__b,
    input [31:0] priority__b,
    output logic [9:0] id__c,
    output logic ie__c,
    output logic ip__c,
    output logic [31:0] priority__c
);


always_comb
begin
    if (({32{ip__b}} & {32{ie__b}} & priority__b[31:0]) > ({32{ip__a}} & {32{ie__a}} & priority__a[31:0]))
    begin
        id__c = id__b;
        ie__c = ie__b;
        ip__c = ip__b;
        priority__c = priority__b;
    end
    else
    begin
        id__c = id__a;
        ie__c = ie__a;
        ip__c = ip__a;
        priority__c = priority__a;
    end
end

endmodule
//==============================================
// physical_memory_attribute_registers
//==============================================
module physical_memory_attribute_registers
(
    input clk,
    input rst,
    input cs,
    input we,
    input [2:0] addr,
    input [7:0] wr_data,
    output logic [7:0] rd_data,
    output logic [7:0] pma__0,
    output logic [7:0] pma__1,
    output logic [7:0] pma__2,
    output logic [7:0] pma__3,
    output logic [7:0] pma__4,
    output logic [7:0] pma__5,
    output logic [7:0] pma__6,
    output logic [7:0] pma__7
);


always_comb
begin
    case (addr)
        3'h0:
        begin
            rd_data = pma__0; 
        end
        3'h1:
        begin
            rd_data = pma__1; 
        end
        3'h2:
        begin
            rd_data = pma__2; 
        end
        3'h3:
        begin
            rd_data = pma__3; 
        end
        3'h4:
        begin
            rd_data = pma__4; 
        end
        3'h5:
        begin
            rd_data = pma__5; 
        end
        3'h6:
        begin
            rd_data = pma__6; 
        end
        3'h7:
        begin
            rd_data = pma__7; 
        end
        default:
        begin
            rd_data[0:0] = 1'b0;
            rd_data[1:1] = 1'b0;
            rd_data[2:2] = 1'b0;
            rd_data[3:3] = 1'b0;
            rd_data[4:4] = 1'b0;
            rd_data[5:5] = 1'b0;
        end
    endcase
end

//==============================================
// Physical Memory Attributes Register 0
//==============================================
assign pma__0[0:0] = 1'b0;
assign pma__0[1:1] = 1'b1;
assign pma__0[2:2] = 1'b1;
assign pma__0[3:3] = 1'b1;
assign pma__0[4:4] = 1'b1;
assign pma__0[5:5] = 1'b0;


//==============================================
// Physical Memory Attributes Register 1
//==============================================
assign pma__1[0:0] = 1'b0;
assign pma__1[1:1] = 1'b0;
assign pma__1[2:2] = 1'b0;
assign pma__1[3:3] = 1'b1;
assign pma__1[4:4] = 1'b0;
assign pma__1[5:5] = 1'b0;

//==============================================
// Physical Memory Attributes Register 2
//==============================================
assign pma__2[0:0] = 1'b0;
assign pma__2[1:1] = 1'b0;
assign pma__2[2:2] = 1'b0;
assign pma__2[3:3] = 1'b0;
assign pma__2[4:4] = 1'b1;
assign pma__2[5:5] = 1'b0;

//==============================================
// Physical Memory Attributes Register 3
//==============================================
assign pma__3[0:0] = 1'b0;
assign pma__3[1:1] = 1'b1;
assign pma__3[2:2] = 1'b0;
assign pma__3[3:3] = 1'b0;
assign pma__3[4:4] = 1'b0;
assign pma__3[5:5] = 1'b0;

//==============================================
// Physical Memory Attributes Register 4
//==============================================
assign pma__4[0:0] = 1'b0;
assign pma__4[1:1] = 1'b1;
assign pma__4[2:2] = 1'b0;
assign pma__4[3:3] = 1'b0;
assign pma__4[4:4] = 1'b0;
assign pma__4[5:5] = 1'b0;

//==============================================
// Physical Memory Attributes Register 5
//==============================================
assign pma__5[0:0] = 1'b0;
assign pma__5[1:1] = 1'b0;
assign pma__5[2:2] = 1'b0;
assign pma__5[3:3] = 1'b0;
assign pma__5[4:4] = 1'b0;
assign pma__5[5:5] = 1'b0;

//==============================================
// Physical Memory Attributes Register 6
//==============================================
assign pma__6[0:0] = 1'b0;
assign pma__6[1:1] = 1'b0;
assign pma__6[2:2] = 1'b0;
assign pma__6[3:3] = 1'b0;
assign pma__6[4:4] = 1'b0;
assign pma__6[5:5] = 1'b0;

//==============================================
// Physical Memory Attributes Register 7
//==============================================
assign pma__7[0:0] = 1'b0;
assign pma__7[1:1] = 1'b0;
assign pma__7[2:2] = 1'b0;
assign pma__7[3:3] = 1'b0;
assign pma__7[4:4] = 1'b0;
assign pma__7[5:5] = 1'b0;

endmodule
//==============================================
// general_purpose_input_output
//==============================================
module general_purpose_input_output
(
    input clk,
    input rst,
    input cs,
    input we,
    input [3:0] addr,
    input [7:0] wr_data,
    output logic [7:0] rd_data,
    inout [7:0] port__0,
    inout [7:0] port__1,
    inout [7:0] port__2,
    inout [7:0] port__3
);


logic [7:0] data__0;
logic [7:0] oe__0;
logic we__data__0;
logic we__oe__0;
logic en__data__0;
logic en__oe__0;

logic [7:0] data__1;
logic [7:0] oe__1;
logic we__data__1;
logic we__oe__1;
logic en__data__1;
logic en__oe__1;

logic [7:0] data__2;
logic [7:0] oe__2;
logic we__data__2;
logic we__oe__2;
logic en__data__2;
logic en__oe__2;

logic [7:0] data__3;
logic [7:0] oe__3;
logic we__data__3;
logic we__oe__3;
logic en__data__3;
logic en__oe__3;

assign port__0[0] = oe__0[0] ? data__0[0] : 1'bz;
assign port__0[1] = oe__0[1] ? data__0[1] : 1'bz;
assign port__0[2] = oe__0[2] ? data__0[2] : 1'bz;
assign port__0[3] = oe__0[3] ? data__0[3] : 1'bz;
assign port__0[4] = oe__0[4] ? data__0[4] : 1'bz;
assign port__0[5] = oe__0[5] ? data__0[5] : 1'bz;
assign port__0[6] = oe__0[6] ? data__0[6] : 1'bz;
assign port__0[7] = oe__0[7] ? data__0[7] : 1'bz;

assign port__1[0] = oe__1[0] ? data__1[0] : 1'bz;
assign port__1[1] = oe__1[1] ? data__1[1] : 1'bz;
assign port__1[2] = oe__1[2] ? data__1[2] : 1'bz;
assign port__1[3] = oe__1[3] ? data__1[3] : 1'bz;
assign port__1[4] = oe__1[4] ? data__1[4] : 1'bz;
assign port__1[5] = oe__1[5] ? data__1[5] : 1'bz;
assign port__1[6] = oe__1[6] ? data__1[6] : 1'bz;
assign port__1[7] = oe__1[7] ? data__1[7] : 1'bz;

assign port__2[0] = oe__2[0] ? data__2[0] : 1'bz;
assign port__2[1] = oe__2[1] ? data__2[1] : 1'bz;
assign port__2[2] = oe__2[2] ? data__2[2] : 1'bz;
assign port__2[3] = oe__2[3] ? data__2[3] : 1'bz;
assign port__2[4] = oe__2[4] ? data__2[4] : 1'bz;
assign port__2[5] = oe__2[5] ? data__2[5] : 1'bz;
assign port__2[6] = oe__2[6] ? data__2[6] : 1'bz;
assign port__2[7] = oe__2[7] ? data__2[7] : 1'bz;

assign port__3[0] = oe__3[0] ? data__3[0] : 1'bz;
assign port__3[1] = oe__3[1] ? data__3[1] : 1'bz;
assign port__3[2] = oe__3[2] ? data__3[2] : 1'bz;
assign port__3[3] = oe__3[3] ? data__3[3] : 1'bz;
assign port__3[4] = oe__3[4] ? data__3[4] : 1'bz;
assign port__3[5] = oe__3[5] ? data__3[5] : 1'bz;
assign port__3[6] = oe__3[6] ? data__3[6] : 1'bz;
assign port__3[7] = oe__3[7] ? data__3[7] : 1'bz;


always_comb
begin
    rd_data = port__0;
    we__data__0 = 1'b0;
    we__oe__0 = 1'b0;
    we__data__1 = 1'b0;
    we__oe__1 = 1'b0;
    we__data__2 = 1'b0;
    we__oe__2 = 1'b0;
    we__data__3 = 1'b0;
    we__oe__3 = 1'b0;

    case (addr)
        4'h0:
        begin
            rd_data = port__0; 
            we__data__0 = we;
        end
        4'h1:
        begin
            rd_data = data__0; 
            we__data__0 = we;
        end
        4'h2:
        begin
            rd_data = oe__0; 
            we__oe__0 = we;
        end
        4'h3:
        begin
            rd_data = port__1; 
            we__data__1 = we;
        end
        4'h4:
        begin
            rd_data = data__1; 
            we__data__1 = we;
        end
        4'h5:
        begin
            rd_data = oe__1; 
            we__oe__1 = we;
        end
        4'h6:
        begin
            rd_data = port__2; 
            we__data__2 = we;
        end
        4'h7:
        begin
            rd_data = data__2; 
            we__data__2 = we;
        end
        4'h8:
        begin
            rd_data = oe__2; 
            we__oe__2 = we;
        end
        4'h9:
        begin
            rd_data = port__3; 
            we__data__3 = we;
        end
        4'ha:
        begin
            rd_data = data__3; 
            we__data__3 = we;
        end
        4'hb:
        begin
            rd_data = oe__3; 
            we__oe__3 = we;
        end
    endcase
end

assign en__data__0 = cs & we__data__0;

//==============================
// d_flip_flop__data__0
//==============================
d_flip_flop #(.WIDTH(8)) d_flip_flop__data__0
(
    .clk(clk),
    .rst(1'b0),
    .en(en__data__0),
    .d(wr_data),
    .q(data__0)
);


assign en__oe__0 = cs & we__oe__0;

//==============================
// d_flip_flop__oe__0
//==============================
d_flip_flop #(.WIDTH(8), .RESET_VALUE(8'h0)) d_flip_flop__oe__0
(
    .clk(clk),
    .rst(rst),
    .en(en__oe__0),
    .d(wr_data),
    .q(oe__0)
);

assign en__data__1 = cs & we__data__1;

//==============================
// d_flip_flop__data__1
//==============================
d_flip_flop #(.WIDTH(8)) d_flip_flop__data__1
(
    .clk(clk),
    .rst(1'b0),
    .en(en__data__1),
    .d(wr_data),
    .q(data__1)
);


assign en__oe__1 = cs & we__oe__1;

//==============================
// d_flip_flop__oe__1
//==============================
d_flip_flop #(.WIDTH(8), .RESET_VALUE(8'h0)) d_flip_flop__oe__1
(
    .clk(clk),
    .rst(rst),
    .en(en__oe__1),
    .d(wr_data),
    .q(oe__1)
);

assign en__data__2 = cs & we__data__2;

//==============================
// d_flip_flop__data__2
//==============================
d_flip_flop #(.WIDTH(8)) d_flip_flop__data__2
(
    .clk(clk),
    .rst(1'b0),
    .en(en__data__2),
    .d(wr_data),
    .q(data__2)
);


assign en__oe__2 = cs & we__oe__2;

//==============================
// d_flip_flop__oe__2
//==============================
d_flip_flop #(.WIDTH(8), .RESET_VALUE(8'h0)) d_flip_flop__oe__2
(
    .clk(clk),
    .rst(rst),
    .en(en__oe__2),
    .d(wr_data),
    .q(oe__2)
);

assign en__data__3 = cs & we__data__3;

//==============================
// d_flip_flop__data__3
//==============================
d_flip_flop #(.WIDTH(8)) d_flip_flop__data__3
(
    .clk(clk),
    .rst(1'b0),
    .en(en__data__3),
    .d(wr_data),
    .q(data__3)
);


assign en__oe__3 = cs & we__oe__3;

//==============================
// d_flip_flop__oe__3
//==============================
d_flip_flop #(.WIDTH(8), .RESET_VALUE(8'h0)) d_flip_flop__oe__3
(
    .clk(clk),
    .rst(rst),
    .en(en__oe__3),
    .d(wr_data),
    .q(oe__3)
);

endmodule
//==============================================
// memory_controller 
//==============================================
module memory_controller
(
    input clk,
    input rst,
    input cs,
    input we,
    input [14:0] addr,
    input [1:0] size,
    input [63:0] wr_data,
    output logic ready,
    output logic [63:0] rd_data,
    output logic ena,
    output logic [7:0] wea,
    output logic [11:0] addra, 
    output logic [63:0] dina,
    input [63:0] douta
);


logic [2:0] state;
logic [2:0] state__n;

localparam STATE__IDLE = 3'h0;
localparam STATE__WRITE = 3'h1;
localparam STATE__READ__0 = 3'h2;
localparam STATE__READ__1 = 3'h3;
localparam STATE__READ__2 = 3'h4;


assign addra = addr[14:3];

always_comb
begin
    ena = 1'b0;
    wea = 8'b0000_0000; 
    dina = wr_data;
    ready = 1'b0;
    rd_data = douta;
        
    case (state)
        //==============================
        // STATE__IDLE
        //==============================
        STATE__IDLE:
        begin
            state__n = (cs & we) ? STATE__WRITE : (cs & ~we) ? STATE__READ__0 : STATE__IDLE; 
        end

        //==============================
        // STATE__WRITE
        //==============================
        STATE__WRITE:
        begin
            ena = 1'b1;
            wea = (size == 2'h0) ? (8'b0000_0001 << addr[2:0]) : (size == 2'h1) ? (8'b0000_0011 << addr[2:0]) : (size == 2'h2) ? (8'b0000_1111 << addr[2:0]) : 8'b1111_1111;
            dina = (wr_data << {addr[2:0], 3'h0});
            ready = 1'b1;
            state__n = STATE__IDLE; 
        end

        //==============================
        // STATE__READ__0
        //==============================
        STATE__READ__0:
        begin
            ena = 1'b1;
            state__n = STATE__READ__1; 
        end

        //==============================
        // STATE__READ__1
        //==============================
        STATE__READ__1:
        begin
            ena = 1'b1;
            state__n = STATE__READ__2; 
        end

        //==============================
        // STATE__READ__2
        //==============================
        STATE__READ__2:
        begin
            ena = 1'b1;
            ready = 1'b1;
            rd_data = (douta >> {addr[2:0], 3'h0}); 
            state__n = STATE__IDLE; 
        end
    endcase
end

//==============================
// d_flip_flop__state
//==============================
d_flip_flop #(.WIDTH(3), .RESET_VALUE(STATE__IDLE)) d_flip_flop__state
(
    .clk(clk),
    .rst(rst),
    .en(1'b1),
    .d(state__n),
    .q(state)
);

endmodule
//==============================================
// memory_management_unit 
//==============================================
module memory_management_unit
(
    input clk,
    input rst,
    output logic cs__0,
    output logic we__0,
    output logic [39:0] addr__0,
    output logic [1:0] size__0,
    output logic [63:0] wr_data__0,
    input ready__0,
    input [63:0] rd_data__0,
    input [7:0] pma__0,
    output logic cs__1,
    output logic we__1,
    output logic [39:0] addr__1,
    output logic [1:0] size__1,
    output logic [63:0] wr_data__1,
    input ready__1,
    input [63:0] rd_data__1,
    input [7:0] pma__1,
    output logic cs__2,
    output logic we__2,
    output logic [39:0] addr__2,
    output logic [1:0] size__2,
    output logic [63:0] wr_data__2,
    input ready__2,
    input [63:0] rd_data__2,
    input [7:0] pma__2,
    output logic cs__3,
    output logic we__3,
    output logic [39:0] addr__3,
    output logic [1:0] size__3,
    output logic [63:0] wr_data__3,
    input ready__3,
    input [63:0] rd_data__3,
    input [7:0] pma__3,
    output logic cs__4,
    output logic we__4,
    output logic [39:0] addr__4,
    output logic [1:0] size__4,
    output logic [63:0] wr_data__4,
    input ready__4,
    input [63:0] rd_data__4,
    input [7:0] pma__4,
    output logic cs__5,
    output logic we__5,
    output logic [39:0] addr__5,
    output logic [1:0] size__5,
    output logic [63:0] wr_data__5,
    input ready__5,
    input [63:0] rd_data__5,
    input [7:0] pma__5,
    output logic cs__6,
    output logic we__6,
    output logic [39:0] addr__6,
    output logic [1:0] size__6,
    output logic [63:0] wr_data__6,
    input ready__6,
    input [63:0] rd_data__6,
    input [7:0] pma__6,
    output logic cs__7,
    output logic we__7,
    output logic [39:0] addr__7,
    output logic [1:0] size__7,
    output logic [63:0] wr_data__7,
    input ready__7,
    input [63:0] rd_data__7,
    input [7:0] pma__7,
    input cs,
    input we,
    input [63:0] addr,
    input [1:0] size,
    input [63:0] wr_data,
    output logic ready,
    output logic resp,
    output logic [63:0] rd_data
);

logic [5:0] state;
logic [5:0] state__n;

logic we__x;
logic [39:0] addr__x;
logic [1:0] size__x;
logic [63:0] wr_data__x;
logic ready__x;
logic resp__x;
logic [63:0] rd_data__x__n;
logic [63:0] rd_data__x;

logic en__we__x;
logic en__addr__x;
logic en__size__x;
logic en__wr_data__x;
logic en__rd_data__x;

localparam STATE__RESET = 8'h0;
localparam STATE__READY = 8'h1;
localparam STATE__DECODE = 8'h2;
localparam STATE__RESP = 8'h3;
localparam STATE__ACCESS_FAULT = 8'h4;
localparam STATE__MISALIGNED_ADDRESS = 8'h5;
localparam STATE__REGION__0__PMA_CHECK = 8'h6;
localparam STATE__REGION__0__REQ = 8'h7;
localparam STATE__REGION__1__PMA_CHECK = 8'h8;
localparam STATE__REGION__1__REQ = 8'h9;
localparam STATE__REGION__2__PMA_CHECK = 8'ha;
localparam STATE__REGION__2__REQ = 8'hb;
localparam STATE__REGION__3__PMA_CHECK = 8'hc;
localparam STATE__REGION__3__REQ = 8'hd;
localparam STATE__REGION__4__PMA_CHECK = 8'he;
localparam STATE__REGION__4__REQ = 8'hf;
localparam STATE__REGION__5__PMA_CHECK = 8'h10;
localparam STATE__REGION__5__REQ = 8'h11;
localparam STATE__REGION__6__PMA_CHECK = 8'h12;
localparam STATE__REGION__6__REQ = 8'h13;
localparam STATE__REGION__7__PMA_CHECK = 8'h14;
localparam STATE__REGION__7__REQ = 8'h15;


always_comb
begin
    cs__0 = 1'b0;
    cs__1 = 1'b0;
    cs__2 = 1'b0;
    cs__3 = 1'b0;
    cs__4 = 1'b0;
    cs__5 = 1'b0;
    cs__6 = 1'b0;
    cs__7 = 1'b0;
    en__we__x = 1'b0;
    en__addr__x = 1'b0; 
    en__size__x = 1'b0; 
    en__wr_data__x = 1'b0; 
    en__rd_data__x = 1'b0; 
    ready = 1'b0;
    rd_data = rd_data__x;
    rd_data__x__n = rd_data__x;

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
            en__we__x = 1'b1;
            en__addr__x = 1'b1; 
            en__size__x = 1'b1; 
            en__wr_data__x = 1'b1; 
            state__n = cs ? STATE__DECODE : STATE__READY;
        end

        //==============================
        // STATE__DECODE
        //==============================
        STATE__DECODE:
        begin
            casez (addr__x)
            64'b0000_0000__0000_0000__0000_0000__0000_0000__0000_????__????_????__????_????__????_????:
            begin
                state__n = STATE__REGION__0__PMA_CHECK;
            end
            64'b0000_0000__0000_0000__0000_0000__0000_0000__1001_????__????_????__????_????__????_????:
            begin
                state__n = STATE__REGION__1__PMA_CHECK;
            end
            64'b0000_0000__0000_0000__0000_0000__0000_0000__1010_????__????_????__????_????__????_????:
            begin
                state__n = STATE__REGION__2__PMA_CHECK;
            end
            64'b0000_0000__0000_0000__0000_0000__0000_0000__1011_????__????_????__????_????__????_????:
            begin
                state__n = STATE__REGION__3__PMA_CHECK;
            end
            64'b0000_0000__0000_0000__0000_0000__0000_0000__1100_????__????_????__????_????__????_????:
            begin
                state__n = STATE__REGION__4__PMA_CHECK;
            end
            64'b0000_0000__0000_0000__0000_0000__0000_0000__1101_????__????_????__????_????__????_????:
            begin
                state__n = STATE__REGION__5__PMA_CHECK;
            end
            64'b0000_0000__0000_0000__0000_0000__0000_0000__1110_????__????_????__????_????__????_????:
            begin
                state__n = STATE__REGION__6__PMA_CHECK;
            end
            64'b0000_0000__0000_0000__0000_0000__0000_0000__1111_????__????_????__????_????__????_????:
            begin
                state__n = STATE__REGION__7__PMA_CHECK;
            end
            default:
            begin
                state__n = STATE__ACCESS_FAULT;
            end
            endcase
        end

        //==============================
        // STATE__REGION__0__PMA_CHECK
        //==============================
        STATE__REGION__0__PMA_CHECK:
        begin
            case (size__x)
                2'h0:
                begin
                    state__n = (pma__0[1:1] == 1'b0) ? STATE__ACCESS_FAULT : STATE__REGION__0__REQ;
                end
                2'h1:
                begin
                    state__n = (pma__0[2:2] == 1'b0) ? STATE__ACCESS_FAULT : (addr[0] != 1'b0) && (pma__0[5:5] == 1'b0) ? STATE__MISALIGNED_ADDRESS : STATE__REGION__0__REQ;
                end
                2'h2:
                begin
                    state__n = (pma__0[3:3] == 1'b0) ? STATE__ACCESS_FAULT : (addr[1:0] != 2'h0) && (pma__0[5:5] == 1'b0) ? STATE__MISALIGNED_ADDRESS : STATE__REGION__0__REQ;
                end
                2'h3:
                begin
                    state__n = (pma__0[4:4] == 1'b0) ? STATE__ACCESS_FAULT : (addr[2:0] != 3'h0) && (pma__0[5:5] == 1'b0)? STATE__MISALIGNED_ADDRESS : STATE__REGION__0__REQ;
                end
            endcase
        end

        //==============================
        // STATE__REGION__0__REQ
        //==============================
        STATE__REGION__0__REQ:
        begin
            cs__0 = 1'b1;
            en__rd_data__x = ready__0;
            rd_data__x__n = rd_data__0;
            state__n = ready__0 ? STATE__RESP : STATE__REGION__0__REQ;
        end

        //==============================
        // STATE__REGION__1__PMA_CHECK
        //==============================
        STATE__REGION__1__PMA_CHECK:
        begin
            case (size__x)
                2'h0:
                begin
                    state__n = (pma__1[1:1] == 1'b0) ? STATE__ACCESS_FAULT : STATE__REGION__1__REQ;
                end
                2'h1:
                begin
                    state__n = (pma__1[2:2] == 1'b0) ? STATE__ACCESS_FAULT : (addr[0] != 1'b0) && (pma__1[5:5] == 1'b0) ? STATE__MISALIGNED_ADDRESS : STATE__REGION__1__REQ;
                end
                2'h2:
                begin
                    state__n = (pma__1[3:3] == 1'b0) ? STATE__ACCESS_FAULT : (addr[1:0] != 2'h0) && (pma__1[5:5] == 1'b0) ? STATE__MISALIGNED_ADDRESS : STATE__REGION__1__REQ;
                end
                2'h3:
                begin
                    state__n = (pma__1[4:4] == 1'b0) ? STATE__ACCESS_FAULT : (addr[2:0] != 3'h0) && (pma__1[5:5] == 1'b0)? STATE__MISALIGNED_ADDRESS : STATE__REGION__1__REQ;
                end
            endcase
        end

        //==============================
        // STATE__REGION__1__REQ
        //==============================
        STATE__REGION__1__REQ:
        begin
            cs__1 = 1'b1;
            en__rd_data__x = ready__1;
            rd_data__x__n = rd_data__1;
            state__n = ready__1 ? STATE__RESP : STATE__REGION__1__REQ;
        end

        //==============================
        // STATE__REGION__2__PMA_CHECK
        //==============================
        STATE__REGION__2__PMA_CHECK:
        begin
            case (size__x)
                2'h0:
                begin
                    state__n = (pma__2[1:1] == 1'b0) ? STATE__ACCESS_FAULT : STATE__REGION__2__REQ;
                end
                2'h1:
                begin
                    state__n = (pma__2[2:2] == 1'b0) ? STATE__ACCESS_FAULT : (addr[0] != 1'b0) && (pma__2[5:5] == 1'b0) ? STATE__MISALIGNED_ADDRESS : STATE__REGION__2__REQ;
                end
                2'h2:
                begin
                    state__n = (pma__2[3:3] == 1'b0) ? STATE__ACCESS_FAULT : (addr[1:0] != 2'h0) && (pma__2[5:5] == 1'b0) ? STATE__MISALIGNED_ADDRESS : STATE__REGION__2__REQ;
                end
                2'h3:
                begin
                    state__n = (pma__2[4:4] == 1'b0) ? STATE__ACCESS_FAULT : (addr[2:0] != 3'h0) && (pma__2[5:5] == 1'b0)? STATE__MISALIGNED_ADDRESS : STATE__REGION__2__REQ;
                end
            endcase
        end

        //==============================
        // STATE__REGION__2__REQ
        //==============================
        STATE__REGION__2__REQ:
        begin
            cs__2 = 1'b1;
            en__rd_data__x = ready__2;
            rd_data__x__n = rd_data__2;
            state__n = ready__2 ? STATE__RESP : STATE__REGION__2__REQ;
        end

        //==============================
        // STATE__REGION__3__PMA_CHECK
        //==============================
        STATE__REGION__3__PMA_CHECK:
        begin
            case (size__x)
                2'h0:
                begin
                    state__n = (pma__3[1:1] == 1'b0) ? STATE__ACCESS_FAULT : STATE__REGION__3__REQ;
                end
                2'h1:
                begin
                    state__n = (pma__3[2:2] == 1'b0) ? STATE__ACCESS_FAULT : (addr[0] != 1'b0) && (pma__3[5:5] == 1'b0) ? STATE__MISALIGNED_ADDRESS : STATE__REGION__3__REQ;
                end
                2'h2:
                begin
                    state__n = (pma__3[3:3] == 1'b0) ? STATE__ACCESS_FAULT : (addr[1:0] != 2'h0) && (pma__3[5:5] == 1'b0) ? STATE__MISALIGNED_ADDRESS : STATE__REGION__3__REQ;
                end
                2'h3:
                begin
                    state__n = (pma__3[4:4] == 1'b0) ? STATE__ACCESS_FAULT : (addr[2:0] != 3'h0) && (pma__3[5:5] == 1'b0)? STATE__MISALIGNED_ADDRESS : STATE__REGION__3__REQ;
                end
            endcase
        end

        //==============================
        // STATE__REGION__3__REQ
        //==============================
        STATE__REGION__3__REQ:
        begin
            cs__3 = 1'b1;
            en__rd_data__x = ready__3;
            rd_data__x__n = rd_data__3;
            state__n = ready__3 ? STATE__RESP : STATE__REGION__3__REQ;
        end

        //==============================
        // STATE__REGION__4__PMA_CHECK
        //==============================
        STATE__REGION__4__PMA_CHECK:
        begin
            case (size__x)
                2'h0:
                begin
                    state__n = (pma__4[1:1] == 1'b0) ? STATE__ACCESS_FAULT : STATE__REGION__4__REQ;
                end
                2'h1:
                begin
                    state__n = (pma__4[2:2] == 1'b0) ? STATE__ACCESS_FAULT : (addr[0] != 1'b0) && (pma__4[5:5] == 1'b0) ? STATE__MISALIGNED_ADDRESS : STATE__REGION__4__REQ;
                end
                2'h2:
                begin
                    state__n = (pma__4[3:3] == 1'b0) ? STATE__ACCESS_FAULT : (addr[1:0] != 2'h0) && (pma__4[5:5] == 1'b0) ? STATE__MISALIGNED_ADDRESS : STATE__REGION__4__REQ;
                end
                2'h3:
                begin
                    state__n = (pma__4[4:4] == 1'b0) ? STATE__ACCESS_FAULT : (addr[2:0] != 3'h0) && (pma__4[5:5] == 1'b0)? STATE__MISALIGNED_ADDRESS : STATE__REGION__4__REQ;
                end
            endcase
        end

        //==============================
        // STATE__REGION__4__REQ
        //==============================
        STATE__REGION__4__REQ:
        begin
            cs__4 = 1'b1;
            en__rd_data__x = ready__4;
            rd_data__x__n = rd_data__4;
            state__n = ready__4 ? STATE__RESP : STATE__REGION__4__REQ;
        end

        //==============================
        // STATE__REGION__5__PMA_CHECK
        //==============================
        STATE__REGION__5__PMA_CHECK:
        begin
            case (size__x)
                2'h0:
                begin
                    state__n = (pma__5[1:1] == 1'b0) ? STATE__ACCESS_FAULT : STATE__REGION__5__REQ;
                end
                2'h1:
                begin
                    state__n = (pma__5[2:2] == 1'b0) ? STATE__ACCESS_FAULT : (addr[0] != 1'b0) && (pma__5[5:5] == 1'b0) ? STATE__MISALIGNED_ADDRESS : STATE__REGION__5__REQ;
                end
                2'h2:
                begin
                    state__n = (pma__5[3:3] == 1'b0) ? STATE__ACCESS_FAULT : (addr[1:0] != 2'h0) && (pma__5[5:5] == 1'b0) ? STATE__MISALIGNED_ADDRESS : STATE__REGION__5__REQ;
                end
                2'h3:
                begin
                    state__n = (pma__5[4:4] == 1'b0) ? STATE__ACCESS_FAULT : (addr[2:0] != 3'h0) && (pma__5[5:5] == 1'b0)? STATE__MISALIGNED_ADDRESS : STATE__REGION__5__REQ;
                end
            endcase
        end

        //==============================
        // STATE__REGION__5__REQ
        //==============================
        STATE__REGION__5__REQ:
        begin
            cs__5 = 1'b1;
            en__rd_data__x = ready__5;
            rd_data__x__n = rd_data__5;
            state__n = ready__5 ? STATE__RESP : STATE__REGION__5__REQ;
        end

        //==============================
        // STATE__REGION__6__PMA_CHECK
        //==============================
        STATE__REGION__6__PMA_CHECK:
        begin
            case (size__x)
                2'h0:
                begin
                    state__n = (pma__6[1:1] == 1'b0) ? STATE__ACCESS_FAULT : STATE__REGION__6__REQ;
                end
                2'h1:
                begin
                    state__n = (pma__6[2:2] == 1'b0) ? STATE__ACCESS_FAULT : (addr[0] != 1'b0) && (pma__6[5:5] == 1'b0) ? STATE__MISALIGNED_ADDRESS : STATE__REGION__6__REQ;
                end
                2'h2:
                begin
                    state__n = (pma__6[3:3] == 1'b0) ? STATE__ACCESS_FAULT : (addr[1:0] != 2'h0) && (pma__6[5:5] == 1'b0) ? STATE__MISALIGNED_ADDRESS : STATE__REGION__6__REQ;
                end
                2'h3:
                begin
                    state__n = (pma__6[4:4] == 1'b0) ? STATE__ACCESS_FAULT : (addr[2:0] != 3'h0) && (pma__6[5:5] == 1'b0)? STATE__MISALIGNED_ADDRESS : STATE__REGION__6__REQ;
                end
            endcase
        end

        //==============================
        // STATE__REGION__6__REQ
        //==============================
        STATE__REGION__6__REQ:
        begin
            cs__6 = 1'b1;
            en__rd_data__x = ready__6;
            rd_data__x__n = rd_data__6;
            state__n = ready__6 ? STATE__RESP : STATE__REGION__6__REQ;
        end

        //==============================
        // STATE__REGION__7__PMA_CHECK
        //==============================
        STATE__REGION__7__PMA_CHECK:
        begin
            case (size__x)
                2'h0:
                begin
                    state__n = (pma__7[1:1] == 1'b0) ? STATE__ACCESS_FAULT : STATE__REGION__7__REQ;
                end
                2'h1:
                begin
                    state__n = (pma__7[2:2] == 1'b0) ? STATE__ACCESS_FAULT : (addr[0] != 1'b0) && (pma__7[5:5] == 1'b0) ? STATE__MISALIGNED_ADDRESS : STATE__REGION__7__REQ;
                end
                2'h2:
                begin
                    state__n = (pma__7[3:3] == 1'b0) ? STATE__ACCESS_FAULT : (addr[1:0] != 2'h0) && (pma__7[5:5] == 1'b0) ? STATE__MISALIGNED_ADDRESS : STATE__REGION__7__REQ;
                end
                2'h3:
                begin
                    state__n = (pma__7[4:4] == 1'b0) ? STATE__ACCESS_FAULT : (addr[2:0] != 3'h0) && (pma__7[5:5] == 1'b0)? STATE__MISALIGNED_ADDRESS : STATE__REGION__7__REQ;
                end
            endcase
        end

        //==============================
        // STATE__REGION__7__REQ
        //==============================
        STATE__REGION__7__REQ:
        begin
            cs__7 = 1'b1;
            en__rd_data__x = ready__7;
            rd_data__x__n = rd_data__7;
            state__n = ready__7 ? STATE__RESP : STATE__REGION__7__REQ;
        end

            
        //==============================
        // STATE__RESP
        //==============================
        STATE__RESP:
        begin
            ready = 1'b1;
            resp = 1'b0;
            rd_data = rd_data__x;
            state__n = STATE__READY; 
        end

        //==============================
        // STATE__ACCESS_FAULT
        //==============================
        STATE__ACCESS_FAULT:
        begin
            ready = 1'b1;
            resp = 1'b1;
            rd_data = 64'h0;
            state__n = STATE__READY;
        end

        //==============================
        // STATE__MISALIGNED_ADDRESS
        //==============================
        STATE__MISALIGNED_ADDRESS:
        begin
            ready = 1'b1;
            resp = 1'b1;
            rd_data = 64'h1;
            state__n = STATE__READY;
        end
    endcase
end


assign we__0 = we__x;
assign addr__0 = addr__x;
assign size__0 = size__x;
assign wr_data__0 = wr_data__x;
assign we__1 = we__x;
assign addr__1 = addr__x;
assign size__1 = size__x;
assign wr_data__1 = wr_data__x;
assign we__2 = we__x;
assign addr__2 = addr__x;
assign size__2 = size__x;
assign wr_data__2 = wr_data__x;
assign we__3 = we__x;
assign addr__3 = addr__x;
assign size__3 = size__x;
assign wr_data__3 = wr_data__x;
assign we__4 = we__x;
assign addr__4 = addr__x;
assign size__4 = size__x;
assign wr_data__4 = wr_data__x;
assign we__5 = we__x;
assign addr__5 = addr__x;
assign size__5 = size__x;
assign wr_data__5 = wr_data__x;
assign we__6 = we__x;
assign addr__6 = addr__x;
assign size__6 = size__x;
assign wr_data__6 = wr_data__x;
assign we__7 = we__x;
assign addr__7 = addr__x;
assign size__7 = size__x;
assign wr_data__7 = wr_data__x;


//==============================
// d_flip_flop__we__x
//==============================
d_flip_flop #(.WIDTH(1)) d_flip_flop__we__x
(
    .clk(clk),
    .rst(rst),
    .en(en__we__x),
    .d(we),
    .q(we__x)
);

//==============================
// d_flip_flop__addr__x
//==============================
d_flip_flop #(.WIDTH(40)) d_flip_flop__addr__x
(
    .clk(clk),
    .rst(rst),
    .en(en__addr__x),
    .d(addr[39:0]),
    .q(addr__x)
);

//==============================
// d_flip_flop__size__x
//==============================
d_flip_flop #(.WIDTH(2)) d_flip_flop__size__x
(
    .clk(clk),
    .rst(rst),
    .en(en__size__x),
    .d(size),
    .q(size__x)
);

//==============================
// d_flip_flop__wr_data__x
//==============================
d_flip_flop #(.WIDTH(64)) d_flip_flop__wr_data__x
(
    .clk(clk),
    .rst(rst),
    .en(en__wr_data__x),
    .d(wr_data),
    .q(wr_data__x)
);

//==============================
// d_flip_flop__rd_data__x
//==============================
d_flip_flop #(.WIDTH(64)) d_flip_flop__rd_data__x
(
    .clk(clk),
    .rst(rst),
    .en(en__rd_data__x),
    .d(rd_data__x__n),
    .q(rd_data__x)
);

//==============================
// d_flip_flop__state
//==============================
d_flip_flop #(.WIDTH(6), .RESET_VALUE(STATE__RESET)) d_flip_flop__state
(
    .clk(clk),
    .rst(rst),
    .en(1'b1),
    .d(state__n),
    .q(state)
);


endmodule

//==============================================
// counter
//==============================================
module debouncer
#(parameter DEBOUNCE_COUNT = 0)
(
    input clk,
    input rst,
    input x,
    output logic x__clean 
);
    
logic [1:0] state;
logic [1:0] state__n;

logic [63:0] count;
logic [63:0] count__n;

localparam STATE__LOW = 2'h0;
localparam STATE__LOW_TO_HIGH = 2'h1;
localparam STATE__HIGH_TO_LOW = 2'h2;
localparam STATE__HIGH = 2'h3;

always_comb
begin
    case (state)

        //==============================
        // STATE__LOW
        //==============================
        STATE__LOW:
        begin
            x__clean = 1'b0;
            count__n = 64'h0;
            state__n = x ? STATE__LOW_TO_HIGH : STATE__LOW;
        end

        //==============================
        // STATE__LOW_TO_HIGH
        //==============================
        STATE__LOW_TO_HIGH:
        begin
            x__clean = 1'b0;
            count__n = count + 1;
            state__n = x ? (count == DEBOUNCE_COUNT) ? STATE__HIGH : STATE__LOW_TO_HIGH : STATE__LOW;
        end

        //==============================
        // STATE__HIGH_TO_LOW
        //==============================
        STATE__HIGH_TO_LOW:
        begin
            x__clean = 1'b1;
            count__n = count + 1;
            state__n = x ? STATE__HIGH : (count == DEBOUNCE_COUNT) ? STATE__LOW : STATE__HIGH_TO_LOW;
        end

        //==============================
        // STATE__HIGH
        //==============================
        STATE__HIGH:
        begin
            x__clean = 1'b1;
            count__n = 64'h0;
            state__n = x ? STATE__HIGH : STATE__HIGH_TO_LOW;
        end

    endcase
end


//==============================
// d_flip_flop__state
//==============================
d_flip_flop #(.WIDTH(2), .RESET_VALUE(STATE__LOW)) d_flip_flop__state
(
    .clk(clk),
    .rst(rst),
    .en(1'b1),
    .d(state__n),
    .q(state)
);

//==============================
// d_flip_flop__count
//==============================
d_flip_flop #(.WIDTH(64), .RESET_VALUE(64'h0)) d_flip_flop__count
(
    .clk(clk),
    .rst(rst),
    .en(1'b1),
    .d(count__n),
    .q(count)
);

endmodule

//==============================================
// edge_detector
//==============================================
module edge_detector
(
    input clk,
    input rst,
    input x,
    output logic x__edge 
);

logic [1:0] state;
logic [1:0] state__n;

localparam STATE__LOW = 2'h0;
localparam STATE__EDGE = 2'h1;
localparam STATE__HIGH = 2'h2;

always_comb
begin
    case (state)

        //==============================
        // STATE__LOW
        //==============================
        STATE__LOW:
        begin
            x__edge = 1'b0;
            state__n = x ? STATE__EDGE : STATE__LOW;
        end

        //==============================
        // STATE__EDGE
        //==============================
        STATE__EDGE:
        begin
            x__edge = 1'b1;
            state__n = x ? STATE__HIGH : STATE__LOW;
        end

        //==============================
        // STATE__HIGH
        //==============================
        STATE__HIGH:
        begin
            x__edge = 1'b0;
            state__n = x ? STATE__HIGH : STATE__LOW;
        end

    endcase
end

//==============================
// d_flip_flop__state
//==============================
d_flip_flop #(.WIDTH(2), .RESET_VALUE(STATE__LOW)) d_flip_flop__state
(
    .clk(clk),
    .rst(rst),
    .en(1'b1),
    .d(state__n),
    .q(state)
);

    
endmodule
//==============================================
// pulse_width_modulator
//==============================================
module pulse_width_modulator 
(
    input clk,
    input rst,
    input cs,
    input we,
    input [3:0] addr,
    input [63:0] wr_data,
    output logic [63:0] rd_data,
    output logic pwm 
);


logic [2:0] state;
logic [2:0] state__n;

logic [63:0] x;
logic [63:0] x__n;
logic [63:0] x__high;
logic [63:0] x__high__n;
logic en__x__high;
logic [63:0] x__low;
logic [63:0] x__low__n;
logic en__x__low;


// Period Register 
logic [63:0] period;
logic we__period;
logic en__period;

// Duty Register 
logic [63:0] duty;
logic we__duty;
logic en__duty;

always_comb
begin
    we__period = 1'b0;
    we__duty = 1'b0;
            
    case (addr)
        PULSE_WIDTH_MODULATOR__PERIOD:
        begin
            rd_data = period;
            we__period = we;
        end
        PULSE_WIDTH_MODULATOR__DUTY:
        begin
            rd_data = duty;
            we__duty = we;
        end
    endcase
end


assign x__high__n = duty;
assign x__low__n = period - duty;


localparam STATE__RESET = 3'h0;
localparam STATE__LOW = 3'h1;
localparam STATE__LOW_LAST = 3'h2;
localparam STATE__HIGH = 3'h3;
localparam STATE__HIGH_LAST = 3'h4;

always_comb
begin
    case (state)
        //==============================
        // STATE__RESET
        //==============================
        STATE__RESET:
        begin
            pwm = 1'b0;
            x__n = 0;
            en__x__high = 1'b0;
            en__x__low = 1'b0;
            state__n = (x__low == 0) & (x__high == 0) : STATE__RESET : (x__low == 0) & (x__high == 1) ? STATE__HIGH_LAST : STATE__LOW_LAST;
        end

        //==============================
        // STATE__LOW
        //==============================
        STATE__LOW:
        begin
            pwm = 1'b0;
            x__n = x + 1;
            en__x__high = (x == (x__low - 1));
            en__x__low = (x == (x__low - 1));
            state__n = (x == (x__low - 1)) ? STATE__LOW_LAST : STATE__LOW;
        end

        //==============================
        // STATE__LOW_LAST
        //==============================
        STATE__LOW_LAST:
        begin
            pwm = 1'b0;
            x__n = 0;
            en__x__high = 1'b0;
            en__x__low = 1'b0;
            state__n = (x__high == 0) & (x__low == 1) ? STATE__LOW_LAST : (x__high == 0) & (x__low > 1) ? STATE__LOW : (x__high == 1) ? STATE__HIGH_LAST : STATE__HIGH; 
        end

        //==============================
        // STATE__HIGH
        //==============================
        STATE__HIGH:
        begin
            pwm = 1'b1;
            x__n = x + 1;
            en__x__high = 1'b0;
            en__x__low = 1'b0;
            state__n = (x == (x__high - 1)) ? STATE__HIGH_LAST : STATE__HIGH;
        end

        //==============================
        // STATE__HIGH_LAST
        //==============================
        STATE__HIGH_LAST:
        begin
            pwm = 1'b1;
            x__n = 0;
            en__x__high = 1'b0;
            en__x__low = 1'b0;
            state__n = (x__low == 0) & (x__high == 1) ? STATE__HIGH_LAST : (x__low == 0) & (x__high > 1) ? STATE__HIGH : (x__low == 1) ? STATE__LOW_LAST : STATE__LOW;
        end

    endcase
end

always_comb
begin
    case (en__mtime & we__mtime & cs)
        1'b0:
        begin
            count = mtime__mtime + 1;
        end
        1'b1:
        begin
            mtime__mtime__n = wr_data[63:0];
        end
    endcase
end


assign en__period = cs & we__period;

//==============================
// d_flip_flop__period
//==============================
d_flip_flop #(.WIDTH(64), .RESET_VALUE(64'h0)) d_flip_flop__period
(
    .clk(clk),
    .rst(rst),
    .en(en__period),
    .d(wr_data),
    .q(period)
);

assign en__duty = cs & we__duty;

//==============================
// d_flip_flop__duty
//==============================
d_flip_flop #(.WIDTH(64), .RESET_VALUE(64'h0)) d_flip_flop__duty
(
    .clk(clk),
    .rst(rst),
    .en(en__duty),
    .d(wr_data),
    .q(duty)
);

//==============================
// d_flip_flop__state
//==============================
d_flip_flop #(.WIDTH(3), .RESET_VALUE(STATE__RESET)) d_flip_flop__state
(
    .clk(clk),
    .rst(rst),
    .en(1'b1),
    .d(state__n),
    .q(state)
);

//==============================
// d_flip_flop__x
//==============================
d_flip_flop #(.WIDTH(64), .RESET_VALUE(64'h0)) d_flip_flop__x
(
    .clk(clk),
    .rst(rst),
    .en(1'b1),
    .d(x__n),
    .q(x)
);

//==============================
// d_flip_flop__x__high
//==============================
d_flip_flop #(.WIDTH(64), .RESET_VALUE(64'h0)) d_flip_flop__x__high
(
    .clk(clk),
    .rst(rst),
    .en(en__x__high),
    .d(x__high__n),
    .q(x__high)
);

//==============================
// d_flip_flop__x__low
//==============================
d_flip_flop #(.WIDTH(64), .RESET_VALUE(64'h0)) d_flip_flop__x__low
(
    .clk(clk),
    .rst(rst),
    .en(en__x__low),
    .d(x__low__n),
    .q(x__low)
);





endmodule
//==============================================
// jay 
//==============================================
module jay 
(
    input clk,
    input rst,
    inout [7:0] port__0,
    inout [7:0] port__1,
    inout [7:0] port__2,
    inout [7:0] port__3,
    output logic ena,
    output logic [7:0] wea,
    output logic [11:0] addra, 
    output logic [63:0] dina,
    input [63:0] douta,
    input int__1
);


logic context__0__eip;

logic tip;

logic cs;
logic we;
logic [39:0] addr;
logic [1:0] size;
logic [63:0] wr_data;
logic ready;
logic resp;
logic [63:0] rd_data;

assign ready__1 = 1'b1;
assign ready__2 = 1'b1;
assign ready__3 = 1'b1;
assign ready__4 = 1'b1;
assign ready__5 = 1'b1;
assign ready__6 = 1'b1;
assign ready__7 = 1'b1;

logic cs__0;
logic we__0;
logic [39:0] addr__0;
logic [1:0] size__0;
logic [63:0] wr_data__0;
logic ready__0;
logic [63:0] rd_data__0;
logic [7:0] pma__0;
logic cs__1;
logic we__1;
logic [39:0] addr__1;
logic [1:0] size__1;
logic [63:0] wr_data__1;
logic ready__1;
logic [63:0] rd_data__1;
logic [7:0] pma__1;
logic cs__2;
logic we__2;
logic [39:0] addr__2;
logic [1:0] size__2;
logic [63:0] wr_data__2;
logic ready__2;
logic [63:0] rd_data__2;
logic [7:0] pma__2;
logic cs__3;
logic we__3;
logic [39:0] addr__3;
logic [1:0] size__3;
logic [63:0] wr_data__3;
logic ready__3;
logic [63:0] rd_data__3;
logic [7:0] pma__3;
logic cs__4;
logic we__4;
logic [39:0] addr__4;
logic [1:0] size__4;
logic [63:0] wr_data__4;
logic ready__4;
logic [63:0] rd_data__4;
logic [7:0] pma__4;
logic cs__5;
logic we__5;
logic [39:0] addr__5;
logic [1:0] size__5;
logic [63:0] wr_data__5;
logic ready__5;
logic [63:0] rd_data__5;
logic [7:0] pma__5;
logic cs__6;
logic we__6;
logic [39:0] addr__6;
logic [1:0] size__6;
logic [63:0] wr_data__6;
logic ready__6;
logic [63:0] rd_data__6;
logic [7:0] pma__6;
logic cs__7;
logic we__7;
logic [39:0] addr__7;
logic [1:0] size__7;
logic [63:0] wr_data__7;
logic ready__7;
logic [63:0] rd_data__7;
logic [7:0] pma__7;

//==============================
// central_processing_unit__0
//==============================
central_processing_unit central_processing_unit__0 
(
    .clk(clk),
    .rst(rst),
    .cs(cs),
    .we(we),
    .addr(addr),
    .size(size),
    .wr_data(wr_data),
    .ready(ready),
    .resp(resp),
    .rd_data(rd_data),
    .eip(context__0__eip),
    .tip(tip)
);

//==============================
// memory_management_unit__0
//==============================
memory_management_unit memory_management_unit__0
(
    .clk(clk),
    .rst(rst),
    .cs__0(cs__0),
    .we__0(we__0),
    .addr__0(addr__0),
    .size__0(size__0),
    .wr_data__0(wr_data__0),
    .ready__0(ready__0),
    .rd_data__0(rd_data__0),
    .pma__0(pma__0),
    .cs__1(cs__1),
    .we__1(we__1),
    .addr__1(addr__1),
    .size__1(size__1),
    .wr_data__1(wr_data__1),
    .ready__1(ready__1),
    .rd_data__1(rd_data__1),
    .pma__1(pma__1),
    .cs__2(cs__2),
    .we__2(we__2),
    .addr__2(addr__2),
    .size__2(size__2),
    .wr_data__2(wr_data__2),
    .ready__2(ready__2),
    .rd_data__2(rd_data__2),
    .pma__2(pma__2),
    .cs__3(cs__3),
    .we__3(we__3),
    .addr__3(addr__3),
    .size__3(size__3),
    .wr_data__3(wr_data__3),
    .ready__3(ready__3),
    .rd_data__3(rd_data__3),
    .pma__3(pma__3),
    .cs__4(cs__4),
    .we__4(we__4),
    .addr__4(addr__4),
    .size__4(size__4),
    .wr_data__4(wr_data__4),
    .ready__4(ready__4),
    .rd_data__4(rd_data__4),
    .pma__4(pma__4),
    .cs__5(cs__5),
    .we__5(we__5),
    .addr__5(addr__5),
    .size__5(size__5),
    .wr_data__5(wr_data__5),
    .ready__5(ready__5),
    .rd_data__5(rd_data__5),
    .pma__5(pma__5),
    .cs__6(cs__6),
    .we__6(we__6),
    .addr__6(addr__6),
    .size__6(size__6),
    .wr_data__6(wr_data__6),
    .ready__6(ready__6),
    .rd_data__6(rd_data__6),
    .pma__6(pma__6),
    .cs__7(cs__7),
    .we__7(we__7),
    .addr__7(addr__7),
    .size__7(size__7),
    .wr_data__7(wr_data__7),
    .ready__7(ready__7),
    .rd_data__7(rd_data__7),
    .pma__7(pma__7),
    .cs(cs),
    .we(we),
    .addr(addr),
    .size(size),
    .wr_data(wr_data),
    .ready(ready),
    .resp(resp),
    .rd_data(rd_data)
);



//==============================
// memory_controller__0
//==============================
memory_controller memory_controller__0
(
    .clk(clk),
    .rst(rst),
    .cs(cs__0),
    .we(we__0),
    .addr(addr__0[14:0]),
    .size(size__0),
    .wr_data(wr_data__0),
    .ready(ready__0),
    .rd_data(rd_data__0),
    .ena(ena),
    .wea(wea),
    .addra(addra),
    .dina(dina),
    .douta(douta)
);

//==============================================
// platform_level_interrupt_controller 
//==============================================
platform_level_interrupt_controller platform_level_interrupt_controller__0
(
    .clk(clk),
    .rst(rst),
    .cs(cs__1),
    .we(we__1),
    .addr(addr__1[25:0]),
    .wr_data(wr_data__1[31:0]),
    .rd_data(rd_data__1[31:0]),
    .int__1(int__1),
    .context__0__eip(context__0__eip)
);

//==============================================
// machine_timer_registers__0 
//==============================================
machine_timer_registers machine_timer_registers__0 
(
    .clk(clk),
    .rst(rst),
    .cs(cs__2),
    .we(we__2),
    .addr(addr__2[3:0]),
    .wr_data(wr_data__2),
    .rd_data(rd_data__2),
    .tip(tip)
);

//==============================
// physical_memory_attribute_registers__0
//==============================
physical_memory_attribute_registers physical_memory_attribute_registers__0
(   
    .clk(clk),
    .rst(rst),
    .cs(cs__3),
    .we(we__3),
    .addr(addr__3[2:0]),
    .wr_data(wr_data__3[7:0]),
    .rd_data(rd_data__3[7:0]),
    .pma__0(pma__0),
    .pma__1(pma__1),
    .pma__2(pma__2),
    .pma__3(pma__3),
    .pma__4(pma__4),
    .pma__5(pma__5),
    .pma__6(pma__6),
    .pma__7(pma__7)
);

//==============================
// general_purpose_input_output__0
//==============================
general_purpose_input_output general_purpose_input_output__0
(
    .clk(clk),
    .rst(rst),
    .cs(cs__4),
    .we(we__4),
    .addr(addr__4[3:0]),
    .wr_data(wr_data__4[7:0]),
    .rd_data(rd_data__4[7:0]),
    .port__0(port__0),
    .port__1(port__1),
    .port__2(port__2),
    .port__3(port__3)
);

endmodule

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
    inout led16_b,
    output logic led16_g,
    output logic led16_r,
    output logic led17_b,
    output logic led17_g,
    output logic led17_r,
    output logic aud_pwm,
    output logic aud_sd,
    output logic [7:0] an,
    output logic ca, 
    output logic cb, 
    output logic cc, 
    output logic cd, 
    output logic ce, 
    output logic cf, 
    output logic cg
);



logic clk;
logic rst;

wire [7:0] port__0;
wire [7:0] port__1;
wire [7:0] port__2;
wire [7:0] port__3;

logic ena;
logic [7:0] wea;
logic [11:0] addra;
logic [63:0] dina;
logic [63:0] douta;


logic btnd__clean;
logic btnd__clean__edge;

logic int__1;

assign clk = clk_100mhz;
assign rst = btnc;
assign led16_b = port__0[0];
assign int__1 = btnd__clean__edge;
assign aud_pwm = port__0[1];
assign aud_sd = 1'b1;

assign led = 0;
//assign led16_b = 0;
assign led16_g = 0;
assign led16_r = 0;
assign led17_b = 0;
assign led17_g = 0;
assign led17_r = 0;
assign an = 8'hff;
assign ca = 0; 
assign cb = 0; 
assign cc = 0; 
assign cd = 0; 
assign ce = 0; 
assign cf = 0; 
assign cg = 0;



//==============================
// jay__0
//==============================
jay jay__0
(
    .clk(clk),
    .rst(rst),
    .port__0(port__0),
    .port__1(port__1),
    .port__2(port__2),
    .port__3(port__3),
    .int__1(int__1),
    .ena(ena),
    .wea(wea),
    .addra(addra),
    .dina(dina),
    .douta(douta)
);

//==============================
// blk_mem_gen_0 
//==============================
blk_mem_gen_0 blk_mem_gen_0__0 
(
    .clka(clk),
    .addra(addra),
    .dina(dina),
    .douta(douta),
    .ena(ena),
    .wea(wea)
);


//==============================
// debouncer__btnd
//==============================
//debouncer #(.DEBOUNCE_COUNT(0)) debouncer__btnd
debouncer #(.DEBOUNCE_COUNT(1000000)) debouncer__btnd
(
    .clk(clk),
    .rst(rst),
    .x(btnd),
    .x__clean(btnd__clean)
);

//==============================
// edge_detector__btnd__clean
//==============================
edge_detector edge_detector__btnd__clean
(
    .clk(clk),
    .rst(rst),
    .x(btnd__clean),
    .x__edge(btnd__clean__edge)
);



endmodule
//==============================================
// timescale
//==============================================
//`timescale 1ns / 1ps

//==============================================
// tb 
//==============================================
module tb;

logic clk_100mhz;
logic [15:0] sw;
logic btnc;
logic btnu;
logic btnl;
logic btnr;
logic btnd;
logic [15:0] led;
//logic led16_b;
wire led16_b;
wire aud_pwm;
wire aud_sd;
logic led16_g;
logic led16_r;
logic led17_b;
logic led17_g;
logic led17_r;
logic [7:0] an;
logic ca; 
logic cb; 
logic cc; 
logic cd; 
logic ce; 
logic cf; 
logic cg;

//==============================
// top 
//==============================
top dut
(
    .clk_100mhz(clk_100mhz),
    .sw(sw),
    .btnc(btnc),
    .btnu(btnu),
    .btnl(btnl),
    .btnr(btnr),
    .btnd(btnd),
    .led(led),
    .led16_b(led16_b),
    .led16_g(led16_g),
    .led16_r(led16_r),
    .led17_b(led17_b),
    .led17_g(led17_g),
    .led17_r(led17_r),
    .aud_pwm(aud_pwm),
    .aud_sd(aud_sd),
    .an(an),
    .ca(ca), 
    .cb(cb), 
    .cc(cc), 
    .cd(cd), 
    .ce(ce), 
    .cf(cf), 
    .cg(cg)
);



//==============================================
// Clock (10ns)
//==============================================
always begin
    #5 clk_100mhz = !clk_100mhz;
end


initial begin
    // initialize clk
    clk_100mhz = 1'b1;
    btnc = 1'b1;
    btnd = 1'b0;
    #11;
    // de-assert rst
    btnc = 1'b0;
    #30000
    btnd = 1'b1;
    #10000
    btnd = 1'b0;
    //
    #200000;
end

endmodule
