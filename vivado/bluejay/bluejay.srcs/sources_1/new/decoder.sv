//==============================================
// decoder
//==============================================
module decoder
(
    input clk,
    input rst,
    input [31:0] ir,

    output logic [4:0] rs1,
    output logic [4:0] rs2,
    output logic [4:0] rd,
    output logic [63:0] imm,
    output logic [3:0] func,
    output logic sel__pc,
    output logic sel__data_0,
    output logic sel__data_1
);

logic [6:0] opcode;
logic [2:0] funct3;
logic [6:0] funct7;
logic [1:0] instr_format;

// decode the instruction fields
assign opcode = ir[6:0];
assign rs1 = ir[19:15];
assign rs2 = ir[24:20];
assign rd = ir[11:7];
assign funct3 = ir[14:12];
assign funct7 = ir[31:25];


always_comb begin
    func = 4'h0;
    sel__pc = 2'h0;
    sel__data_0 = 1'b0;
    sel__data_1 = 1'b0;
    case (opcode)
        7'h03:
        begin
            case (funct3)
                // lb
                3'h0:
                begin
                    instr_format = 3'h1;
                    sel__data_1 = 1'b1;
                end
                // lh
                3'h1:
                begin
                    instr_format = 3'h1;
                    sel__data_1 = 1'b1;
                end
                // lw
                3'h2:
                begin
                    instr_format = 3'h1;
                    sel__data_1 = 1'b1;
                end
                // ld
                3'h3:
                begin
                    instr_format = 3'h1;
                    sel__data_1 = 1'b1;
                end
                // lbu
                3'h4:
                begin
                    instr_format = 3'h1;
                    sel__data_1 = 1'b1;
                end
                // lhu
                3'h5:
                begin
                    instr_format = 3'h1;
                    sel__data_1 = 1'b1;
                end
                // lhu
                3'h6:
                begin
                    instr_format = 3'h1;
                    sel__data_1 = 1'b1;
                end
            endcase
        end
        7'h0f:
        begin
            case (funct3)
                // fence
                3'h0:
                begin
                    instr_format = 3'h1;
                end
                // fence.i
                3'h1:
                begin
                    instr_format = 3'h1;
                end
            endcase
        end
        7'h13:
        begin
            case (funct3)
                // addi
                3'h0:
                begin
                    instr_format = 3'h1;
                    func = 4'h0;
                    sel__data_1 = 1'b1;
                end
                3'h1:
                begin
                    case (funct7)
                        // slli
                        7'h00:
                        begin
                            instr_format = 3'h1;
                            func = 4'h4;
                            sel__data_1 = 1'b1;
                        end
                    endcase
                end
                // slti
                3'h2:
                begin
                    instr_format = 3'h1;
                    func = 4'h6;
                    sel__data_1 = 1'b1;
                end
                // sltiu
                3'h3:
                begin
                    instr_format = 3'h1;
                    func = 4'h7;
                    sel__data_1 = 1'b1;
                end
                // xori
                3'h4:
                begin
                    instr_format = 3'h1;
                    func = 4'h8;
                    sel__data_1 = 1'b1;
                end
                3'h5:
                begin
                    case (funct7)
                        // srli
                        7'h00:
                        begin
                            instr_format = 3'h1;
                            func = 4'h9;
                            sel__data_1 = 1'b1;
                        end
                        // srai
                        7'h20:
                        begin
                            instr_format = 3'h1;
                            func = 4'hb;
                            sel__data_1 = 1'b1;
                        end
                    endcase
                end
                // ori
                3'h6:
                begin
                    instr_format = 3'h1;
                    func = 4'hd;
                    sel__data_1 = 1'b1;
                end
                // andi
                3'h7:
                begin
                    instr_format = 3'h1;
                    func = 4'he;
                    sel__data_1 = 1'b1;
                end
            endcase
        end
        // auipc
        7'h17:
        begin
            instr_format = 3'h4;
            func = 4'he;
            sel__data_0 = 1'b1;
            sel__data_1 = 1'b1;
        end
        7'h1b:
        begin
            case (funct3)
                // addiw
                3'h0:
                begin
                    instr_format = 3'h1;
                    func = 4'h1;
                    sel__data_1 = 1'b1;
                end
                3'h1:
                begin
                    case (funct7)
                        // slliw
                        7'h00:
                        begin
                            instr_format = 3'h1;
                            func = 4'h5;
                            sel__data_1 = 1'b1;
                        end
                    endcase
                end
                3'h5:
                begin
                    case (funct7)
                        // srliw
                        7'h00:
                        begin
                            instr_format = 3'h1;
                            func = 4'ha;
                            sel__data_1 = 1'b1;
                        end
                        // sraiw
                        7'h00:
                        begin
                            instr_format = 3'h1;
                            func = 4'hc;
                            sel__data_1 = 1'b1;
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
                    instr_format = 3'h2;
                end
                // sh
                3'h1:
                begin
                    instr_format = 3'h2;
                end
                // sw
                3'h2:
                begin
                    instr_format = 3'h2;
                end
                // sd
                3'h3:
                begin
                    instr_format = 3'h2;
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
                            instr_format = 3'h0;
                            func = 4'h0;
                        end
                        // sub
                        7'h20:
                        begin
                            instr_format = 3'h0;
                            func = 4'h2;
                        end
                    endcase
                end
                3'h1:
                begin
                    case (funct7)
                        // sll
                        7'h00:
                        begin
                            instr_format = 3'h0;
                            func = 4'h4;
                        end
                    endcase
                end
                3'h2:
                begin
                    case (funct7)
                        // slt
                        7'h00:
                        begin
                            instr_format = 3'h0;
                            func = 4'h6;
                        end
                    endcase
                end
                3'h3:
                begin
                    case (funct7)
                        // sltu
                        7'h00:
                        begin
                            instr_format = 3'h0;
                            func = 4'h7;
                        end
                    endcase
                end
                3'h4:
                begin
                    case (funct7)
                        // xor
                        7'h00:
                        begin
                            instr_format = 3'h0;
                            func = 4'h8;
                        end
                    endcase
                end
                3'h5:
                begin
                    case (funct7)
                        // srl
                        7'h00:
                        begin
                            instr_format = 3'h0;
                            func = 4'h9;
                        end
                        // sra
                        7'h20:
                        begin
                            instr_format = 3'h0;
                            func = 4'hb;
                        end
                    endcase
                end
                3'h6:
                begin
                    case (funct7)
                        // or
                        7'h00:
                        begin
                            instr_format = 3'h0;
                            func = 4'hd;
                        end
                    endcase
                end
                3'h7:
                begin
                    case (funct7)
                        // and
                        7'h00:
                        begin
                            instr_format = 3'h0;
                            func = 4'he;
                        end
                    endcase
                end
            endcase
        end
        // lui
        7'h37:
        begin
            instr_format = 3'h4;
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
                            instr_format = 3'h0;
                            func = 4'h1;
                        end
                        // subw
                        7'h20:
                        begin
                            instr_format = 3'h0;
                            func = 4'h3;
                        end
                    endcase
                end
                3'h1:
                begin
                    case (funct7)
                        // sllw
                        7'h00:
                        begin
                            instr_format = 3'h0;
                            func = 4'h5;
                        end
                    endcase
                end
                3'h5:
                begin
                    case (funct7)
                        // srlw
                        7'h00:
                        begin
                            instr_format = 3'h0;
                            func = 4'ha;
                        end
                        // sraw
                        7'h20:
                        begin
                            instr_format = 3'h0;
                            func = 4'hc;
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
                    instr_format = 3'h3;
                end
                // bne
                3'h1:
                begin
                    instr_format = 3'h3;
                end
                // blt
                3'h4:
                begin
                    instr_format = 3'h3;
                end
                // bge
                3'h5:
                begin
                    instr_format = 3'h3;
                end
                // bltu
                3'h6:
                begin
                    instr_format = 3'h3;
                end
                // bgeu
                3'h7:
                begin
                    instr_format = 3'h3;
                end
            endcase
        end
        7'h67:
        begin
            case (funct3)
                // jalr
                3'h0:
                begin
                    instr_format = 3'h1;
                    sel__data_1 = 1'b1;
                end
            endcase
        end
        7'h6f:
        begin
            instr_format = 3'h5;
            sel__data_1 = 1'b1;
        end
    endcase
end

// create the immediate value
always_comb begin
    case (instr_format)
        3'h1: imm = {{53{ir[31]}}, ir[30:25], ir[24:21], ir[20]};
        3'h2: imm = {{53{ir[31]}}, ir[30:25], ir[11:8], ir[7]};
        3'h3: imm = {{52{ir[31]}}, ir[7], ir[30:25], ir[11:8], 1'b0};
        3'h4: imm = {{33{ir[31]}}, ir[30:20], ir[19:12], 12'h0};
        3'h5: imm = {{44{ir[31]}}, ir[19:12], ir[20], ir[30:25], ir[24:21], 1'b0};
    endcase
end

endmodule
