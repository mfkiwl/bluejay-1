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
            // FUNC__ADD: data_2 = data_0 + data_1;
            // FUNC__SUB: data_2 = data_0 - data_1;
            // FUNC__SLL: data_2 = data_0 << data_1;
            0: data_2 = $signed(data_0) < $signed(data_1);
            // FUNC__SLTU: data_2 = data_0 & data_1;
            // FUNC__XOR: data_2 = data_0 & data_1;
            // FUNC__SRL: data_2 = data_0 & data_1;
            // FUNC__SRA: data_2 = data_0 & data_1;
            // FUNC__OR: data_2 = data_0 & data_1;
            // FUNC__AND: data_2 = data_0 & data_1;
            // FUNC__: data_2 = data_0 & data_1;
            // FUNC__SLL: data_2 = data_0 & data_1;
            // 3'h3: data_2 = data_0 | data_1;
            // 3'h4: data_2 = data_0 ^ data_1;
            // 3'h5: data_2 = data_0 << data_1;
            // 3'h6: data_2 = data_0 >> data_1;
            // 3'h7: data_2 = 8'h00;
        endcase
    end
    

    
    
endmodule
