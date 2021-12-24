//==============================================
// arithmetic_logic_unit
//==============================================
module arithmetic_logic_unit
(
    input clk,
    input rst,
    input [3:0] func,
    input [63:0] data_0,
    input [63:0] data_1,
    output logic [63:0] data_2,
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
        4'h0: data_2 = data_0 + data_1;      // rd ← sx(rs1) + sx(rs2)
        4'h1: data_2 = data_0 - data_1;      // rd ← sx(rs1) - sx(rs2)
        4'h2: data_2 = data_0 << data_1;     // rd ← ux(rs1) « rs2
        4'h3: data_2 = data_0 < data_1;      // rd ← sx(rs1) < sx(rs2)
        4'h4: data_2 = data_0 & data_1;     // rd ← ux(rs1) < ux(rs2)
        4'h5: data_2 = data_0 ^ data_1;      // rd ← ux(rs1) ⊕ ux(rs2)
        4'h6: data_2 = data_0 >> data_1;     // rd ← ux(rs1) » rs2
        4'h7: data_2 = data_0 >>> data_1;    // rd ← sx(rs1) » rs2
        4'h8: data_2 = data_0 | data_1;       // rd ← ux(rs1) & ux(rs2)
        4'h9: data_2 = data_0 | data_1;      // rd ← ux(rs1) | ux(rs2) 
    endcase
end
    

    
    
endmodule
