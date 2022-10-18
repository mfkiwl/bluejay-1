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
