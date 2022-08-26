//==============================================
// decoder
//==============================================
module decoder
(
    input clk,
    input rst,
    input [31:0] ir,
    output logic [5:0] op,
    output logic [3:0] func,
    output logic [4:0] rd_addr__0,
    output logic [4:0] rd_addr__1,
    output logic [4:0] wr_addr,
    output logic [63:0] imm,
    output logic we,
    output logic sel__a,
    output logic sel__b,
    output logic [1:0] sel__wr_data,
    output logic mem_valid,
    output logic mem_rw,
    output logic [2:0] mem_dtype
);

logic [6:0] opcode;
logic [2:0] funct3;
logic [6:0] funct7;
logic [2:0] format;
logic [4:0] rs1;
logic [4:0] rs2;
logic [4:0] rd;

// Breakout instruction fields.
assign opcode = ir[6:0];
assign rs1 = ir[19:15];
assign rs2 = ir[24:20];
assign rd = ir[11:7];
assign funct3 = ir[14:12];
assign funct7 = ir[31:25];

// Generate immediate.
always_comb begin
    case (format)
        FORMAT__R_TYPE: imm = 0;
        FORMAT__I_TYPE: imm = {{53{ir[31]}}, ir[30:25], ir[24:21], ir[20]};
        FORMAT__S_TYPE: imm = {{53{ir[31]}}, ir[30:25], ir[11:8], ir[7]};
        FORMAT__B_TYPE: imm = {{52{ir[31]}}, ir[7], ir[30:25], ir[11:8], 1'b0};
        FORMAT__U_TYPE: imm = {{33{ir[31]}}, ir[30:20], ir[19:12], 12'h0};
        FORMAT__J_TYPE: imm = {{44{ir[31]}}, ir[19:12], ir[20], ir[30:25], ir[24:21], 1'b0};
    endcase
end

// Decode instruction.
always_comb begin
    case (opcode)
        7'h03:
        begin
            case (funct3)
                // lb
                3'h0:
                begin
                    op = OP__LB;
                end
                // lh
                3'h1:
                begin
                    op = OP__LH;
                end
                // lw
                3'h2:
                begin
                    op = OP__LW;
                end
                // ld
                3'h3:
                begin
                    op = OP__LD;
                end
                // lbu
                3'h4:
                begin
                    op = OP__LBU;
                end
                // lhu
                3'h5:
                begin
                    op = OP__LHU;
                end
                // lhw
                3'h6:
                begin
                    op = OP__LWU;
                end
            endcase
        end
        7'h0f:
        begin
            case (funct3)
                // fence
                3'h0:
                begin
                    op = OP__FENCE;
                end
                // fence.i
                3'h1:
                begin
                    op = OP__FENCE_I;
                end
            endcase
        end
        7'h13:
        begin
            case (funct3)
                // addi
                3'h0:
                begin
                    op = OP__ADDI;
                end
                3'h1:
                begin
                    case (funct7)
                        // slli
                        7'h00:
                        begin
                            op = OP__SLLI;
                        end
                    endcase
                end
                // slti
                3'h2:
                begin
                    op = OP__SLTI;
                end
                // sltiu
                3'h3:
                begin
                    op = OP__SLTIU;
                end
                // xori
                3'h4:
                begin
                    op = OP__XORI;
                end
                3'h5:
                begin
                    case (funct7)
                        // srli
                        7'h00:
                        begin
                            op = OP__SRLI;
                        end
                        // srai
                        7'h20:
                        begin
                            op = OP__SRAI;
                        end
                    endcase
                end
                // ori
                3'h6:
                begin
                    op = OP__ORI;
                end
                // andi
                3'h7:
                begin
                    op = OP__ANDI;
                end
            endcase
        end
        // auipc
        7'h17:
        begin
            op = OP__AUIPC;
        end
        7'h1b:
        begin
            case (funct3)
                // addiw
                3'h0:
                begin
                    op = OP__ADDIW;
                end
                3'h1:
                begin
                    case (funct7)
                        // slliw
                        7'h00:
                        begin
                            op = OP__SLLIW;
                        end
                    endcase
                end
                3'h5:
                begin
                    case (funct7)
                        // srliw
                        7'h00:
                        begin
                            op = OP__SRLIW;
                        end
                        // sraiw
                        7'h00:
                        begin
                            op = OP__SRAIW;
                        end
                    endcase
                end
            endcase
        end
        7'h23:
        begin
            case (funct3)
                // sb
                3'h0:
                begin
                    op = OP__SB;
                end
                // sh
                3'h1:
                begin
                    op = OP__SH;
                end
                // sw
                3'h2:
                begin
                    op = OP__SW;
                end
                // sd
                3'h3:
                begin
                    op = OP__SD;
                end
            endcase
        end
        7'h33:
        begin
            case (funct3)
                3'h0:
                begin
                    case (funct7)
                        // add
                        7'h00:
                        begin
                            op = OP__ADD;
                        end
                        // sub
                        7'h20:
                        begin
                            op = OP__SUB;
                        end
                    endcase
                end
                3'h1:
                begin
                    case (funct7)
                        // sll
                        7'h00:
                        begin
                            op = OP__SLL;
                        end
                    endcase
                end
                3'h2:
                begin
                    case (funct7)
                        // slt
                        7'h00:
                        begin
                            op = OP__SLT;
                        end
                    endcase
                end
                3'h3:
                begin
                    case (funct7)
                        // sltu
                        7'h00:
                        begin
                            op = OP__SLTU;
                        end
                    endcase
                end
                3'h4:
                begin
                    case (funct7)
                        // xor
                        7'h00:
                        begin
                            op = OP__XOR;
                        end
                    endcase
                end
                3'h5:
                begin
                    case (funct7)
                        // srl
                        7'h00:
                        begin
                            op = OP__SRL;
                        end
                        // sra
                        7'h20:
                        begin
                            op = OP__SRA;
                        end
                    endcase
                end
                3'h6:
                begin
                    case (funct7)
                        // or
                        7'h00:
                        begin
                            op = OP__OR;
                        end
                    endcase
                end
                3'h7:
                begin
                    case (funct7)
                        // and
                        7'h00:
                        begin
                            op = OP__AND;
                        end
                    endcase
                end
            endcase
        end
        // lui
        7'h37:
        begin
            op = OP__LUI;
        end
        7'h3b:
        begin
            case (funct3)
                3'h0:
                begin
                    case (funct7)
                        // addw
                        7'h00:
                        begin
                            op = OP__ADDW;
                        end
                        // subw
                        7'h20:
                        begin
                            op = OP__SUBW;
                        end
                    endcase
                end
                3'h1:
                begin
                    case (funct7)
                        // sllw
                        7'h00:
                        begin
                            op = OP__SLLW;
                        end
                    endcase
                end
                3'h5:
                begin
                    case (funct7)
                        // srlw
                        7'h00:
                        begin
                            op = OP__SRLW;
                        end
                        // sraw
                        7'h20:
                        begin
                           op = OP__SRAW;
                        end
                    endcase
                end
            endcase
        end
        7'h63:
        begin
            case (funct3)
                // beq
                3'h0:
                begin
                    op = OP__BEQ;
                end
                // bne
                3'h1:
                begin
                    op = OP__BNE;
                end
                // blt
                3'h4:
                begin
                    op = OP__BLT;
                end
                // bge
                3'h5:
                begin
                    op = OP__BGE;
                end
                // bltu
                3'h6:
                begin
                    op = OP__BLTU;
                end
                // bgeu
                3'h7:
                begin
                    op = OP__BGEU;
                end
            endcase
        end
        7'h67:
        begin
            case (funct3)
                // jalr
                3'h0:
                begin
                    op = OP__JALR;
                end
            endcase
        end
        // jal
        7'h6f:
        begin
            op = OP__JAL;
        end
        7'h73:
        begin
            case (funct3)
                3'h0:
                begin
                    case (ir[31:20])
                        // ecall
                        12'h000:
                        begin
                            op = OP__ECALL;
                        end
                        // ebreak
                        12'h001:
                        begin
                            op = OP__EBREAK;
                        end
                    endcase
                end
            endcase
        end
    endcase
end

// Set control signals.
always_comb begin
    format = FORMAT__I_TYPE;
    func = FUNC__ADD;
    rd_addr__0 = rs1;
    rd_addr__1 = rs2;
    wr_addr = rd;
    we = 1'b0;
    sel__a = SEL__A__RD_DATA__0;
    sel__b = SEL__B__IMM; 
    sel__wr_data = SEL__WD_DATA__C;
    mem_valid = 1'b0;
    mem_rw = 1'b0;
    mem_dtype = DTYPE__D;

    case (op)
        OP__LB:
        begin
            we = 1'b1;
            sel__wr_data = SEL__WD_DATA__MEM_RD_DATA;
            mem_valid = 1'b1;
            mem_dtype = DTYPE__B;
        end
        OP__LH:
        begin
            we = 1'b1;
            sel__wr_data = SEL__WD_DATA__MEM_RD_DATA;
            mem_valid = 1'b1;
            mem_dtype = DTYPE__H;
        end
        OP__LW:
        begin
            we = 1'b1;
            sel__wr_data = SEL__WD_DATA__MEM_RD_DATA;
            mem_valid = 1'b1;
            mem_dtype = DTYPE__W;
        end
        OP__LD:
        begin
            we = 1'b1;
            sel__wr_data = SEL__WD_DATA__MEM_RD_DATA;
            mem_valid = 1'b1;
            mem_dtype = DTYPE__D;
        end
        OP__LBU:
        begin
            we = 1'b1;
            sel__wr_data = SEL__WD_DATA__MEM_RD_DATA;
            mem_valid = 1'b1;
            mem_dtype = DTYPE__BU;
        end
        OP__LHU:
        begin
            we = 1'b1;
            sel__wr_data = SEL__WD_DATA__MEM_RD_DATA;
            mem_valid = 1'b1;
            mem_dtype = DTYPE__HU;
        end
        OP__LWU:
        begin
            we = 1'b1;
            sel__wr_data = SEL__WD_DATA__MEM_RD_DATA;
            mem_valid = 1'b1;
            mem_dtype = DTYPE__HU;
        end
        OP__FENCE:
        begin
        end
        OP__FENCE_I:
        begin
        end
        OP__ADDI:
        begin
            func = FUNC__ADD;
            we = 1'b1;
        end
        OP__SLLI:
        begin
            func = FUNC__SLL;
            we = 1'b1;
        end
        OP__SLTI:
        begin
            func = FUNC__SLT;
            we = 1'b1;
        end
        OP__SLTIU:
        begin
            func = FUNC__SLTU;
            we = 1'b1;
        end
        OP__XORI:
        begin
            func = FUNC__XOR;
            we = 1'b1;
        end
        OP__SRLI:
        begin
            func = FUNC__SRL;
            we = 1'b1;
        end
        OP__SRAI:
        begin
            func = FUNC__SRA;
            we = 1'b1;
        end
        OP__ORI:
        begin
            func = FUNC__OR;
            we = 1'b1;
        end
        OP__ANDI:
        begin
            func = FUNC__AND;
            we = 1'b1;
        end
        OP__AUIPC:
        begin
            format = FORMAT__U_TYPE;
            we = 1'b1;
            sel__a = SEL__A__PC;
        end
        OP__ADDIW:
        begin
            func = FUNC__ADDW;
            we = 1'b1;
        end
        OP__SLLIW:
        begin
            func = FUNC__SLLW;
            we = 1'b1;
        end
        OP__SRLIW:
        begin
            func = FUNC__SRLW;
            we = 1'b1;
        end
        OP__SRAIW:
        begin
            func = FUNC__SRAW;
            we = 1'b1;
        end
        OP__SB:
        begin
            format = FORMAT__S_TYPE;
            mem_dtype = DTYPE__B;
            mem_valid = 1'b1;
            mem_rw = 1'b1;
        end
        OP__SH:
        begin
            format = FORMAT__S_TYPE;
            mem_dtype = DTYPE__H;
            mem_valid = 1'b1;
            mem_rw = 1'b1;
        end
        OP__SW:
        begin
            format = FORMAT__S_TYPE;
            mem_dtype = DTYPE__W;
            mem_valid = 1'b1;
            mem_rw = 1'b1;
        end
        OP__SD:
        begin
            format = FORMAT__S_TYPE;
            mem_dtype = DTYPE__D;
            mem_valid = 1'b1;
            mem_rw = 1'b1;
        end
        OP__ADD:
        begin
            format = FORMAT__R_TYPE;
            func = FUNC__ADD;
            we = 1'b1;
            sel__b = SEL__B__RD_DATA__1; 
        end
        OP__SUB:
        begin
            format = FORMAT__R_TYPE;
            func = FUNC__SUB;
            we = 1'b1;
            sel__b = SEL__B__RD_DATA__1; 
        end
        OP__SLL:
        begin
            format = FORMAT__R_TYPE;
            func = FUNC__SLL;
            we = 1'b1;
            sel__b = SEL__B__RD_DATA__1; 
        end
        OP__SLT:
        begin
            format = FORMAT__R_TYPE;
            func = FUNC__SLT;
            we = 1'b1;
            sel__b = SEL__B__RD_DATA__1; 
        end
        OP__SLTU:
        begin
            format = FORMAT__R_TYPE;
            func = FUNC__SLTU;
            we = 1'b1;
            sel__b = SEL__B__RD_DATA__1; 
        end
        OP__XOR:
        begin
            format = FORMAT__R_TYPE;
            func = FUNC__XOR;
            we = 1'b1;
            sel__b = SEL__B__RD_DATA__1; 
        end
        OP__SRL:
        begin
            format = FORMAT__R_TYPE;
            func = FUNC__SRL;
            we = 1'b1;
            sel__b = SEL__B__RD_DATA__1; 
        end
        OP__SRA:
        begin
            format = FORMAT__R_TYPE;
            func = FUNC__SRA;
            we = 1'b1;
            sel__b = SEL__B__RD_DATA__1; 
        end
        OP__OR:
        begin
            format = FORMAT__R_TYPE;
            func = FUNC__OR;
            we = 1'b1;
            sel__b = SEL__B__RD_DATA__1; 
        end
        OP__AND:
        begin
            format = FORMAT__R_TYPE;
            func = FUNC__AND;
            we = 1'b1;
            sel__b = SEL__B__RD_DATA__1; 
        end
        OP__LUI:
        begin
            format = FORMAT__U_TYPE;
            rd_addr__0 = 0;
            we = 1'b1;
        end
        OP__ADDW:
        begin
            format = FORMAT__R_TYPE;
            func = FUNC__ADDW;
            we = 1'b1;
            sel__b = SEL__B__RD_DATA__1; 
        end
        OP__SUBW:
        begin
            format = FORMAT__R_TYPE;
            func = FUNC__SUBW;
            we = 1'b1;
            sel__b = SEL__B__RD_DATA__1; 
        end
        OP__SLLW:
        begin
            format = FORMAT__R_TYPE;
            func = FUNC__SLLW;
            we = 1'b1;
            sel__b = SEL__B__RD_DATA__1; 
        end
        OP__SRLW:
        begin
            format = FORMAT__R_TYPE;
            func = FUNC__SRLW;
            we = 1'b1;
            sel__b = SEL__B__RD_DATA__1; 
        end
        OP__SRAW:
        begin
            format = FORMAT__R_TYPE;
            func = FUNC__SRAW;
            we = 1'b1;
            sel__b = SEL__B__RD_DATA__1; 
        end
        OP__BEQ:
        begin
            format = FORMAT__B_TYPE;
            sel__a = SEL__A__PC;
        end
        OP__BNE:
        begin
            format = FORMAT__B_TYPE;
            sel__a = SEL__A__PC;
        end
        OP__BLT:
        begin
            format = FORMAT__B_TYPE;
            sel__a = SEL__A__PC;
        end
        OP__BGE:
        begin
            format = FORMAT__B_TYPE;
            sel__a = SEL__A__PC;
        end
        OP__BLTU:
        begin
            format = FORMAT__B_TYPE;
            sel__a = SEL__A__PC;
        end
        OP__BGEU:
        begin
            format = FORMAT__B_TYPE;
            sel__a = SEL__A__PC;
        end
        OP__JALR:
        begin
            we = 1'b1;
            sel__wr_data = SEL__WD_DATA__PC_PLUS_FOUR;
        end
        OP__JAL:
        begin
            format = FORMAT__J_TYPE;
            we = 1'b1;
            sel__a = SEL__A__PC;
            sel__wr_data = SEL__WD_DATA__PC_PLUS_FOUR;
        end
        OP__ECALL:
        begin
            
        end
        OP__EBREAK:
        begin
            
        end
    endcase
end 




endmodule
