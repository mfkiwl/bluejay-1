//==============================================
// arithmetic_logic_unit
//==============================================
module arithmetic_logic_unit
(
    input clk,
    input rst,
    input [3:0] func,
    input [WIDTH-1:0] data_0,
    input [WIDTH-1:0] data_1,
    output logic [WIDTH-1:0] data_2,
    output logic eq,
    output logic ne,
    output logic lt,
    output logic le
);

    // comparisons
    // assign eq = (data_0 == data_1);
    // assign ne = ~eq;
    // assign lt = data_0 < data_1;
    // assign le = lt | eq;
    
// mathmatical/logical operations
always_comb begin
    case (func)
        ADD: data_2 = data_0 + data_1;      // rd ← sx(rs1) + sx(rs2)
        SUB: data_2 = data_0 - data_1;      // rd ← sx(rs1) - sx(rs2)
        SLL: data_2 = data_0 << data_1;     // rd ← ux(rs1) « rs2
        SLT: data_2 = data_0 < data_1;      // rd ← sx(rs1) < sx(rs2)
        SLTU: data_2 = data_0 & data_1;     // rd ← ux(rs1) < ux(rs2)
        XOR: data_2 = data_0 ^ data_1;      // rd ← ux(rs1) ⊕ ux(rs2)
        SRL: data_2 = data_0 >> data_1;     // rd ← ux(rs1) » rs2
        SRA: data_2 = data_0 >>> data_1;    // rd ← sx(rs1) » rs2
        OR: data_2 = data_0 | data_1;       // rd ← ux(rs1) & ux(rs2)
        AND: data_2 = data_0 | data_1;      // rd ← ux(rs1) | ux(rs2) 
    endcase
end
    

    
    
endmodule
