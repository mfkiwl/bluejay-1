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
    output logic [4:0] rs1,
    output logic [4:0] rs2,
    output logic [4:0] rd,
    output logic [63:0] imm,
    output logic [2:0] dtype
);

logic [6:0] opcode;
logic [2:0] funct3;
logic [6:0] funct7;
logic [2:0] format;

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
                3'h0:
                begin
                    op = OP__LB;
                end
                3'h1:
                begin
                    op = OP__LH;
                end
                3'h2:
                begin
                    op = OP__LW;
                end
                3'h3:
                begin
                    op = OP__LD;
                end
                3'h4:
                begin
                    op = OP__LBU;
                end
                3'h5:
                begin
                    op = OP__LHU;
                end
                3'h6:
                begin
                    op = OP__LWU;
                end
            endcase
        end
        7'h0f:
        begin
            case (funct3)
                3'h0:
                begin
                    op = OP__FENCE;
                end
                3'h1:
                begin
                    op = OP__FENCE_I;
                end
            endcase
        end
        7'h13:
        begin
            case (funct3)
                3'h0:
                begin
                    op = OP__ADDI;
                end
                3'h1:
                begin
                    case (funct7)
                        7'h00:
                        begin
                            op = OP__SLLI;
                        end
                        7'h01:
                        begin
                            op = OP__SLLI;
                        end
                    endcase
                end
                3'h2:
                begin
                    op = OP__SLTI;
                end
                3'h3:
                begin
                    op = OP__SLTIU;
                end
                3'h4:
                begin
                    op = OP__XORI;
                end
                3'h5:
                begin
                    case (funct7)
                        7'h00:
                        begin
                            op = OP__SRLI;
                        end
                        7'h01:
                        begin
                            op = OP__SRLI;
                        end
                        7'h20:
                        begin
                            op = OP__SRAI;
                        end
                        7'h21:
                        begin
                            op = OP__SRAI;
                        end
                    endcase
                end
                3'h6:
                begin
                    op = OP__ORI;
                end
                3'h7:
                begin
                    op = OP__ANDI;
                end
            endcase
        end
        7'h17:
        begin
            op = OP__AUIPC;
        end
        7'h1b:
        begin
            case (funct3)
                3'h0:
                begin
                    op = OP__ADDIW;
                end
                3'h1:
                begin
                    case (funct7)
                        7'h00:
                        begin
                            op = OP__SLLIW;
                        end
                    endcase
                end
                3'h5:
                begin
                    case (funct7)
                        7'h00:
                        begin
                            op = OP__SRLIW;
                        end
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
                3'h0:
                begin
                    op = OP__SB;
                end
                3'h1:
                begin
                    op = OP__SH;
                end
                3'h2:
                begin
                    op = OP__SW;
                end
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
                        7'h00:
                        begin
                            op = OP__ADD;
                        end
                        7'h20:
                        begin
                            op = OP__SUB;
                        end
                    endcase
                end
                3'h1:
                begin
                    case (funct7)
                        7'h00:
                        begin
                            op = OP__SLL;
                        end
                    endcase
                end
                3'h2:
                begin
                    case (funct7)
                        7'h00:
                        begin
                            op = OP__SLT;
                        end
                    endcase
                end
                3'h3:
                begin
                    case (funct7)
                        7'h00:
                        begin
                            op = OP__SLTU;
                        end
                    endcase
                end
                3'h4:
                begin
                    case (funct7)
                        7'h00:
                        begin
                            op = OP__XOR;
                        end
                    endcase
                end
                3'h5:
                begin
                    case (funct7)
                        7'h00:
                        begin
                            op = OP__SRL;
                        end
                        7'h20:
                        begin
                            op = OP__SRA;
                        end
                    endcase
                end
                3'h6:
                begin
                    case (funct7)
                        7'h00:
                        begin
                            op = OP__OR;
                        end
                    endcase
                end
                3'h7:
                begin
                    case (funct7)
                        7'h00:
                        begin
                            op = OP__AND;
                        end
                    endcase
                end
            endcase
        end
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
                        7'h00:
                        begin
                            op = OP__ADDW;
                        end
                        7'h20:
                        begin
                            op = OP__SUBW;
                        end
                    endcase
                end
                3'h1:
                begin
                    case (funct7)
                        7'h00:
                        begin
                            op = OP__SLLW;
                        end
                    endcase
                end
                3'h5:
                begin
                    case (funct7)
                        7'h00:
                        begin
                            op = OP__SRLW;
                        end
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
                3'h0:
                begin
                    op = OP__BEQ;
                end
                3'h1:
                begin
                    op = OP__BNE;
                end
                3'h4:
                begin
                    op = OP__BLT;
                end
                3'h5:
                begin
                    op = OP__BGE;
                end
                3'h6:
                begin
                    op = OP__BLTU;
                end
                3'h7:
                begin
                    op = OP__BGEU;
                end
            endcase
        end
        7'h67:
        begin
            case (funct3)
                3'h0:
                begin
                    op = OP__JALR;
                end
            endcase
        end
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
                        12'h000:
                        begin
                            op = OP__ECALL;
                        end
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
    dtype = DTYPE__DOUBLE_WORD;

    case (op)
        OP__LB:
        begin
            dtype = DTYPE__BYTE;
        end
        OP__LH:
        begin
            dtype = DTYPE__HALF_WORD;
        end
        OP__LW:
        begin
            dtype = DTYPE__WORD;
        end
        OP__LD:
        begin
            dtype = DTYPE__DOUBLE_WORD;
        end
        OP__LBU:
        begin
            dtype = DTYPE__BYTE_UNSIGNED;
        end
        OP__LHU:
        begin
            dtype = DTYPE__HALF_WORD_UNSIGNED;
        end
        OP__LWU:
        begin
            dtype = DTYPE__HALF_WORD_UNSIGNED;
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
        end
        OP__SLLI:
        begin
            func = FUNC__SLL;
        end
        OP__SLTI:
        begin
            func = FUNC__SLT;
        end
        OP__SLTIU:
        begin
            func = FUNC__SLTU;
        end
        OP__XORI:
        begin
            func = FUNC__XOR;
        end
        OP__SRLI:
        begin
            func = FUNC__SRL;
        end
        OP__SRAI:
        begin
            func = FUNC__SRA;
        end
        OP__ORI:
        begin
            func = FUNC__OR;
        end
        OP__ANDI:
        begin
            func = FUNC__AND;
        end
        OP__AUIPC:
        begin
            format = FORMAT__U_TYPE;
        end
        OP__ADDIW:
        begin
            func = FUNC__ADDW;
        end
        OP__SLLIW:
        begin
            func = FUNC__SLLW;
        end
        OP__SRLIW:
        begin
            func = FUNC__SRLW;
        end
        OP__SRAIW:
        begin
            func = FUNC__SRAW;
        end
        OP__SB:
        begin
            format = FORMAT__S_TYPE;
            dtype = DTYPE__BYTE;
        end
        OP__SH:
        begin
            format = FORMAT__S_TYPE;
            dtype = DTYPE__HALF_WORD;
        end
        OP__SW:
        begin
            format = FORMAT__S_TYPE;
            dtype = DTYPE__WORD;
        end
        OP__SD:
        begin
            format = FORMAT__S_TYPE;
            dtype = DTYPE__DOUBLE_WORD;
        end
        OP__ADD:
        begin
            format = FORMAT__R_TYPE;
            func = FUNC__ADD;
        end
        OP__SUB:
        begin
            format = FORMAT__R_TYPE;
            func = FUNC__SUB;
        end
        OP__SLL:
        begin
            format = FORMAT__R_TYPE;
            func = FUNC__SLL;
        end
        OP__SLT:
        begin
            format = FORMAT__R_TYPE;
            func = FUNC__SLT;
        end
        OP__SLTU:
        begin
            format = FORMAT__R_TYPE;
            func = FUNC__SLTU;
        end
        OP__XOR:
        begin
            format = FORMAT__R_TYPE;
            func = FUNC__XOR;
        end
        OP__SRL:
        begin
            format = FORMAT__R_TYPE;
            func = FUNC__SRL;
        end
        OP__SRA:
        begin
            format = FORMAT__R_TYPE;
            func = FUNC__SRA;
        end
        OP__OR:
        begin
            format = FORMAT__R_TYPE;
            func = FUNC__OR;
        end
        OP__AND:
        begin
            format = FORMAT__R_TYPE;
            func = FUNC__AND;; 
        end
        OP__LUI:
        begin
            format = FORMAT__U_TYPE;
        end
        OP__ADDW:
        begin
            format = FORMAT__R_TYPE;
            func = FUNC__ADDW;
        end
        OP__SUBW:
        begin
            format = FORMAT__R_TYPE;
            func = FUNC__SUBW;
        end
        OP__SLLW:
        begin
            format = FORMAT__R_TYPE;
            func = FUNC__SLLW;
        end
        OP__SRLW:
        begin
            format = FORMAT__R_TYPE;
            func = FUNC__SRLW;
        end
        OP__SRAW:
        begin
            format = FORMAT__R_TYPE;
            func = FUNC__SRAW;
        end
        OP__BEQ:
        begin
            format = FORMAT__B_TYPE;
        end
        OP__BNE:
        begin
            format = FORMAT__B_TYPE;
        end
        OP__BLT:
        begin
            format = FORMAT__B_TYPE;
        end
        OP__BGE:
        begin
            format = FORMAT__B_TYPE;
        end
        OP__BLTU:
        begin
            format = FORMAT__B_TYPE;
        end
        OP__BGEU:
        begin
            format = FORMAT__B_TYPE;
        end
        OP__JALR:
        begin
        end
        OP__JAL:
        begin
            format = FORMAT__J_TYPE;
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
