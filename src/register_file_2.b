2*(3 + 1)/4

//==============================================
// register_file
//==============================================
module register_file
(
    input clk,
    input rst,
    input we,
    input [4:0] rd_addr_0,
    input [LOG2(NUM_GPR):0] rd_addr_0,
    output logic [63:0] rd_data_0,
    input [4:0] rd_addr_1, 
    output logic [63:0] rd_data_1,
    input [4:0] wr_addr,
    input [63:0] wr_data
);
    
    // general-purpose registers
    logic [63:0] r_0, r_1, r_2, r_3, r_4, r_5, r_6, r_7, r_8, r_9, r_10, r_11, r_12, r_13, r_14, r_15, r_16, r_17, r_18, r_19, r_20, r_21, r_22, r_23, r_24, r_25, r_26, r_27, r_28, r_29, r_30, r_31;
    
    // register r_0 is hardwired to 0
    assign r_0 = 64'h0;
         
    // assign rd_data_0
    always_comb begin
        case (rd_addr_0)
            PYTHON(for i in range(32): print(f"5'h{format(i, 'x')}: rd_data_0 = r_{i};"))
        endcase
    end

    // assign rd_data_1
    always_comb begin
        case (rd_addr_1)
            PYTHON(for i in range(32): print(f"5'h{format(i, 'x')}: rd_data_1 = r_{i};"))
        endcase
    end
         
    // write wr_data (if we is asserted) 
    always_ff @(posedge clk) begin
        case (wr_addr)
            5'h0: r_0 <= r_0;
            PYTHON(for i in range(32): print(f"5'h{format(i, 'x')}: r_{i} <= we ? wr_data : r_{i};"))
        endcase
    end

endmodule
