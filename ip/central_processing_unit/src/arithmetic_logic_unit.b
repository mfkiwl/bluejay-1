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
        FUNC__ADD: 
        begin 
            c = a + b;
        end
        FUNC__ADDW:
        begin
            x = a + b;
            c = {{32{x[31]}}, x[31:0]};
        end
        FUNC__SUB:
        begin
            c = a - b;
        end
        FUNC__SUBW:
        begin
            x = a - b;
            c = {{32{x[31]}}, x[31:0]};
        end
        FUNC__SLL:
        begin 
            c = a << b[5:0];
        end
        FUNC__SLLW:
        begin
            x = a << b[4:0];
            c = {{32{x[31]}}, x[31:0]};
        end
        FUNC__SLT:
        begin
            c = {63'h0, ((a[63] == b[63]) ? a < b : a[63])};
        end
        FUNC__SLTU:
        begin
            c = {63'h0, a < b};
        end
        FUNC__XOR:
        begin
            c = a ^ b;
        end
        FUNC__SRL:
        begin
            c = a >> b[5:0];
        end
        FUNC__SRLW:
        begin
            case (b[4:0])
                PYTHON(for i in range(1): print(f"5'h{i:x}: c = {{{{{32 + i}{{a[31]}}}}, a[31:{i}]}};"))
                PYTHON(for i in range(1, 32): print(f"5'h{i:x}: c = {{{{{32 + i}{{1'b0}}}}, a[31:{i}]}};"))
            endcase
        end
        FUNC__SRA:
        begin
            case (b[5:0])
                PYTHON(for i in range(64): print(f"6'h{i:x}: c = {{{{{i}{{a[63]}}}}, a[63:{i}]}};"))
            endcase
        end
        FUNC__SRAW:
        begin
            case (b[4:0])
                PYTHON(for i in range(32): print(f"5'h{i:x}: c = {{{{{32 + i}{{a[31]}}}}, a[31:{i}]}};"))
            endcase
        end
        FUNC__OR:
        begin
            c = a | b;
        end
        FUNC__AND:
        begin
            c = a & b;
        end
        FUNC__CLR:
        begin
            c = ~a & b;
        end
        FUNC__NULL_A:
        begin
            c = a;
        end
        FUNC__NULL_B:
        begin
            c = b;
        end
    endcase
end

endmodule
