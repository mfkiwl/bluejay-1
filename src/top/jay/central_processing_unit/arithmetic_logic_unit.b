//==============================================
// arithmetic_logic_unit
//==============================================
module arithmetic_logic_unit
(
    input clk,
    input rst,
    input [3:0] func,
    input [63:0] a,
    input [63:0] b,
    output logic [63:0] c
);
 
// Mathmatical/logical operations.
always_comb begin
    case (func)
        FUNC__ADD: 
        begin 
            c = a + b;
        end
        FUNC__ADDW:
        begin
            c = {{32{a[31]}}, a[31:0]} + {{32{b[31]}}, b[31:0]};
        end
        FUNC__SUB:
        begin
            c = a - b;
        end
        FUNC__SUBW:
        begin
            c = {{32{a[31]}}, a[31:0]} - {{32{b[31]}}, b[31:0]};
        end
        FUNC__SLL:
        begin 
            c = a << b[5:0];
        end
        FUNC__SLLW:
        begin
            c = {{32{a[31 - b[4:0]]}}, a[31:0] << b[4:0]};
        end
        FUNC__SLT:
        begin
            c = {63'h0, ((a[63] == b[63]) ? a < b : a[63])};
        end
        FUNC__SLTU:
        begin
            c = {63'h0, ((a[63] == b[63]) ? a >= b : b[63])};
        end
        FUNC__XOR:
        begin
            c = a ^ b;
        end
        FUNC__SRL:
        begin
            c = a >> b[4:0];
        end
        FUNC__SRLW:
        begin
            c = {32'h0, a[31:0] >> b[4:0]};
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
    endcase
end

endmodule
