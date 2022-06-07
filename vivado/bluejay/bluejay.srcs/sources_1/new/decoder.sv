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
                // lb
                3'h0:
                begin
                    op = 6'h1;
                end
                // lh
                3'h1:
                begin
                    op = 6'h2;
                end
                // lw
                3'h2:
                begin
                    op = 6'h3;
                end
                // ld
                3'h3:
                begin
                    op = 6'h4;
                end
                // lbu
                3'h4:
                begin
                    op = 6'h5;
                end
                // lhu
                3'h5:
                begin
                    op = 6'h6;
                end
                // lhw
                3'h6:
                begin
                    op = 6'h7;
                end
            endcase
        end
        7'h0f:
        begin
            case (funct3)
                // fence
                3'h0:
                begin
                    op = 6'h8;
                end
                // fence.i
                3'h1:
                begin
                    op = 6'h9;
                end
            endcase
        end
        7'h13:
        begin
            case (funct3)
                // addi
                3'h0:
                begin
                    op = 6'ha;
                end
                3'h1:
                begin
                    case (funct7)
                        // slli
                        7'h00:
                        begin
                            op = 6'hb;
                        end
                    endcase
                end
                // slti
                3'h2:
                begin
                    op = 6'hc;
                end
                // sltiu
                3'h3:
                begin
                    op = 6'hd;
                end
                // xori
                3'h4:
                begin
                    op = 6'he;
                end
                3'h5:
                begin
                    case (funct7)
                        // srli
                        7'h00:
                        begin
                            op = 6'hf;
                        end
                        // srai
                        7'h20:
                        begin
                            op = 6'h10;
                        end
                    endcase
                end
                // ori
                3'h6:
                begin
                    op = 6'h11;
                end
                // andi
                3'h7:
                begin
                    op = 6'h12;
                end
            endcase
        end
        // auipc
        7'h17:
        begin
            op = 6'h13;
        end
        7'h1b:
        begin
            case (funct3)
                // addiw
                3'h0:
                begin
                    op = 6'h14;
                end
                3'h1:
                begin
                    case (funct7)
                        // slliw
                        7'h00:
                        begin
                            op = 6'h15;
                        end
                    endcase
                end
                3'h5:
                begin
                    case (funct7)
                        // srliw
                        7'h00:
                        begin
                            op = 6'h16;
                        end
                        // sraiw
                        7'h00:
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
                // sb
                3'h0:
                begin
                    op = 6'h18;
                end
                // sh
                3'h1:
                begin
                    op = 6'h19;
                end
                // sw
                3'h2:
                begin
                    op = 6'h1a;
                end
                // sd
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
                        // add
                        7'h00:
                        begin
                            op = 6'h1c;
                        end
                        // sub
                        7'h20:
                        begin
                            op = 6'h1d;
                        end
                    endcase
                end
                3'h1:
                begin
                    case (funct7)
                        // sll
                        7'h00:
                        begin
                            op = 6'h1e;
                        end
                    endcase
                end
                3'h2:
                begin
                    case (funct7)
                        // slt
                        7'h00:
                        begin
                            op = 6'h1f;
                        end
                    endcase
                end
                3'h3:
                begin
                    case (funct7)
                        // sltu
                        7'h00:
                        begin
                            op = 6'h20;
                        end
                    endcase
                end
                3'h4:
                begin
                    case (funct7)
                        // xor
                        7'h00:
                        begin
                            op = 6'h21;
                        end
                    endcase
                end
                3'h5:
                begin
                    case (funct7)
                        // srl
                        7'h00:
                        begin
                            op = 6'h22;
                        end
                        // sra
                        7'h20:
                        begin
                            op = 6'h23;
                        end
                    endcase
                end
                3'h6:
                begin
                    case (funct7)
                        // or
                        7'h00:
                        begin
                            op = 6'h24;
                        end
                    endcase
                end
                3'h7:
                begin
                    case (funct7)
                        // and
                        7'h00:
                        begin
                            op = 6'h25;
                        end
                    endcase
                end
            endcase
        end
        // lui
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
                        // addw
                        7'h00:
                        begin
                            op = 6'h27;
                        end
                        // subw
                        7'h20:
                        begin
                            op = 6'h28;
                        end
                    endcase
                end
                3'h1:
                begin
                    case (funct7)
                        // sllw
                        7'h00:
                        begin
                            op = 6'h29;
                        end
                    endcase
                end
                3'h5:
                begin
                    case (funct7)
                        // srlw
                        7'h00:
                        begin
                            op = 6'h2a;
                        end
                        // sraw
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
                // beq
                3'h0:
                begin
                    op = 6'h2c;
                end
                // bne
                3'h1:
                begin
                    op = 6'h2d;
                end
                // blt
                3'h4:
                begin
                    op = 6'h2e;
                end
                // bge
                3'h5:
                begin
                    op = 6'h2f;
                end
                // bltu
                3'h6:
                begin
                    op = 6'h30;
                end
                // bgeu
                3'h7:
                begin
                    op = 6'h31;
                end
            endcase
        end
        7'h67:
        begin
            case (funct3)
                // jalr
                3'h0:
                begin
                    op = 6'h32;
                end
            endcase
        end
        // jal
        7'h6f:
        begin
            op = 6'h33;
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
                            op = 6'h34;
                        end
                        // ebreak
                        12'h001:
                        begin
                            op = 6'h35;
                        end
                    endcase
                end
            endcase
        end
    endcase
end

// Set control signals.
always_comb begin
    format = 3'h1;
    func = 4'h0;
    dtype = 3'h0;

    case (op)
        6'h1:
        begin
            dtype = 3'h5;
        end
        6'h2:
        begin
            dtype = 3'h3;
        end
        6'h3:
        begin
            dtype = 3'h1;
        end
        6'h4:
        begin
            dtype = 3'h0;
        end
        6'h5:
        begin
            dtype = 3'h6;
        end
        6'h6:
        begin
            dtype = 3'h4;
        end
        6'h7:
        begin
            dtype = 3'h4;
        end
        6'h8:
        begin
        end
        6'h9:
        begin
        end
        6'ha:
        begin
            func = 4'h0;
        end
        6'hb:
        begin
            func = 4'h4;
        end
        6'hc:
        begin
            func = 4'h6;
        end
        6'hd:
        begin
            func = 4'h7;
        end
        6'he:
        begin
            func = 4'h8;
        end
        6'hf:
        begin
            func = 4'h9;
        end
        6'h10:
        begin
            func = 4'hb;
        end
        6'h11:
        begin
            func = 4'hd;
        end
        6'h12:
        begin
            func = 4'he;
        end
        6'h13:
        begin
            format = 3'h4;
        end
        6'h14:
        begin
            func = 4'h1;
        end
        6'h15:
        begin
            func = 4'h5;
        end
        6'h16:
        begin
            func = 4'ha;
        end
        6'h17:
        begin
            func = 4'hc;
        end
        6'h18:
        begin
            format = 3'h2;
            dtype = 3'h5;
        end
        6'h19:
        begin
            format = 3'h2;
            dtype = 3'h3;
        end
        6'h1a:
        begin
            format = 3'h2;
            dtype = 3'h1;
        end
        6'h1b:
        begin
            format = 3'h2;
            dtype = 3'h0;
        end
        6'h1c:
        begin
            format = 3'h0;
            func = 4'h0;
        end
        6'h1d:
        begin
            format = 3'h0;
            func = 4'h2;
        end
        6'h1e:
        begin
            format = 3'h0;
            func = 4'h4;
        end
        6'h1f:
        begin
            format = 3'h0;
            func = 4'h6;
        end
        6'h20:
        begin
            format = 3'h0;
            func = 4'h7;
        end
        6'h21:
        begin
            format = 3'h0;
            func = 4'h8;
        end
        6'h22:
        begin
            format = 3'h0;
            func = 4'h9;
        end
        6'h23:
        begin
            format = 3'h0;
            func = 4'hb;
        end
        6'h24:
        begin
            format = 3'h0;
            func = 4'hd;
        end
        6'h25:
        begin
            format = 3'h0;
            func = 4'he;; 
        end
        6'h26:
        begin
            format = 3'h4;
        end
        6'h27:
        begin
            format = 3'h0;
            func = 4'h1;
        end
        6'h28:
        begin
            format = 3'h0;
            func = 4'h3;
        end
        6'h29:
        begin
            format = 3'h0;
            func = 4'h5;
        end
        6'h2a:
        begin
            format = 3'h0;
            func = 4'ha;
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
        end
        6'h33:
        begin
            format = 3'h5;
        end
        6'h34:
        begin
            
        end
        6'h35:
        begin
            
        end
    endcase
end 




endmodule
