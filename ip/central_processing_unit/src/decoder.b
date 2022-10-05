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
logic [2:0] format;

// Breakout instruction fields.
assign opcode = ir[6:0];
assign rs1 = ir[19:15];
assign rs2 = ir[24:20];
assign rd = ir[11:7];
assign funct3 = ir[14:12];
assign funct7 = ir[31:25];
assign uimm = {{59{1'b0}}, ir[19:15]};

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
                        7'h20:
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
                3'h1:
                begin
                    op = OP__CSRRW;
                end
                3'h2:
                begin
                    op = OP__CSRRS;
                end
                3'h3:
                begin
                    op = OP__CSRRC;
                end
                3'h5:
                begin
                    op = OP__CSRRWI;
                end
                3'h6:
                begin
                    op = OP__CSRRSI;
                end
                3'h7:
                begin
                    op = OP__CSRRCI;
                end
            endcase
        end
    endcase
end

// Set control signals.
always_comb begin
    format = FORMAT__I_TYPE;

    case (op)
        OP__LB:
        begin
            format = FORMAT__I_TYPE;
        end
        OP__LH:
        begin
            format = FORMAT__I_TYPE;
        end
        OP__LW:
        begin
            format = FORMAT__I_TYPE;
        end
        OP__LD:
        begin
            format = FORMAT__I_TYPE;
        end
        OP__LBU:
        begin
            format = FORMAT__I_TYPE;
        end
        OP__LHU:
        begin
            format = FORMAT__I_TYPE;
        end
        OP__LWU:
        begin
            format = FORMAT__I_TYPE;
        end
        OP__FENCE:
        begin
        end
        OP__FENCE_I:
        begin
        end
        OP__ADDI:
        begin
            format = FORMAT__I_TYPE;
        end
        OP__SLLI:
        begin
            format = FORMAT__I_TYPE;
        end
        OP__SLTI:
        begin
            format = FORMAT__I_TYPE;
        end
        OP__SLTIU:
        begin
            format = FORMAT__I_TYPE;
        end
        OP__XORI:
        begin
            format = FORMAT__I_TYPE;
        end
        OP__SRLI:
        begin
            format = FORMAT__I_TYPE;
        end
        OP__SRAI:
        begin
            format = FORMAT__I_TYPE;
        end
        OP__ORI:
        begin
            format = FORMAT__I_TYPE;
        end
        OP__ANDI:
        begin
            format = FORMAT__I_TYPE;
        end
        OP__AUIPC:
        begin
            format = FORMAT__U_TYPE;
        end
        OP__ADDIW:
        begin
            format = FORMAT__I_TYPE;
        end
        OP__SLLIW:
        begin
            format = FORMAT__I_TYPE;
        end
        OP__SRLIW:
        begin
            format = FORMAT__I_TYPE;
        end
        OP__SRAIW:
        begin
            format = FORMAT__I_TYPE;
        end
        OP__SB:
        begin
            format = FORMAT__S_TYPE;
        end
        OP__SH:
        begin
            format = FORMAT__S_TYPE;
        end
        OP__SW:
        begin
            format = FORMAT__S_TYPE;
        end
        OP__SD:
        begin
            format = FORMAT__S_TYPE;
        end
        OP__ADD:
        begin
            format = FORMAT__R_TYPE;
        end
        OP__SUB:
        begin
            format = FORMAT__R_TYPE;
        end
        OP__SLL:
        begin
            format = FORMAT__R_TYPE;
        end
        OP__SLT:
        begin
            format = FORMAT__R_TYPE;
        end
        OP__SLTU:
        begin
            format = FORMAT__R_TYPE;
        end
        OP__XOR:
        begin
            format = FORMAT__R_TYPE;
        end
        OP__SRL:
        begin
            format = FORMAT__R_TYPE;
        end
        OP__SRA:
        begin
            format = FORMAT__R_TYPE;
        end
        OP__OR:
        begin
            format = FORMAT__R_TYPE;
        end
        OP__AND:
        begin
            format = FORMAT__R_TYPE;
        end
        OP__LUI:
        begin
            format = FORMAT__U_TYPE;
        end
        OP__ADDW:
        begin
            format = FORMAT__R_TYPE;
        end
        OP__SUBW:
        begin
            format = FORMAT__R_TYPE;
        end
        OP__SLLW:
        begin
            format = FORMAT__R_TYPE;
        end
        OP__SRLW:
        begin
            format = FORMAT__R_TYPE;
        end
        OP__SRAW:
        begin
            format = FORMAT__R_TYPE;
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
            format = FORMAT__I_TYPE;
        end
        OP__JAL:
        begin
            format = FORMAT__J_TYPE;
        end
        OP__ECALL:
        begin
            format = FORMAT__I_TYPE;
        end
        OP__EBREAK:
        begin
            format = FORMAT__I_TYPE;
        end
        OP__CSRRW:
        begin
            format = FORMAT__I_TYPE;
        end
        OP__CSRRS:
        begin
            format = FORMAT__I_TYPE;
        end
        OP__CSRRC:
        begin
            format = FORMAT__I_TYPE;
        end
        OP__CSRRWI:
        begin
            format = FORMAT__I_TYPE;
        end
        OP__CSRRSI:
        begin
            format = FORMAT__I_TYPE;
        end
        OP__CSRRCI:
        begin
            format = FORMAT__I_TYPE;
        end
    endcase
end 

endmodule
