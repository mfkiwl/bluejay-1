//==============================================
// register_file
//==============================================
module register_file
(
    input clk,
    input rst,
    input we,
    input [4:0] rs1,
    output logic [63:0] rs1_data,
    input [4:0] rs2,
    output logic [63:0] rs2_data,
    input [4:0] rd,
    input [63:0] rd_data
);
    
// general-purpose registers
logic [63:0] x_0, x_1, x_2, x_3, x_4, x_5, x_6, x_7, x_8, x_9, x_10, x_11, x_12, x_13, x_14, x_15, x_16, x_17, x_18, x_19, x_20, x_21, x_22, x_23, x_24, x_25, x_26, x_27, x_28, x_29, x_30, x_31;

// register x_0 is hardwired to 0
assign x_0 = 64'h0;
     
// assign rs1_data
always_comb begin
    case (rs1)
        5'h00: rs1_data = x_0;
        5'h01: rs1_data = x_1;
        5'h02: rs1_data = x_2;
        5'h03: rs1_data = x_3;
        5'h04: rs1_data = x_4;
        5'h05: rs1_data = x_5;
        5'h06: rs1_data = x_6;
        5'h07: rs1_data = x_7;
        5'h08: rs1_data = x_8;
        5'h09: rs1_data = x_9;
        5'h0a: rs1_data = x_10;
        5'h0b: rs1_data = x_11;
        5'h0c: rs1_data = x_12;
        5'h0d: rs1_data = x_13;
        5'h0e: rs1_data = x_14;
        5'h0f: rs1_data = x_15;
        5'h10: rs1_data = x_16;
        5'h11: rs1_data = x_17;
        5'h12: rs1_data = x_18;
        5'h13: rs1_data = x_19;
        5'h14: rs1_data = x_20;
        5'h15: rs1_data = x_21;
        5'h16: rs1_data = x_22;
        5'h17: rs1_data = x_23;
        5'h18: rs1_data = x_24;
        5'h19: rs1_data = x_25;
        5'h1a: rs1_data = x_26;
        5'h1b: rs1_data = x_27;
        5'h1c: rs1_data = x_28;
        5'h1d: rs1_data = x_29;
        5'h1e: rs1_data = x_30;
        5'h1f: rs1_data = x_31;
    endcase
end

// assign rs2_data
always_comb begin
    case (rs2)
        5'h00: rs2_data = x_0;
        5'h01: rs2_data = x_1;
        5'h02: rs2_data = x_2;
        5'h03: rs2_data = x_3;
        5'h04: rs2_data = x_4;
        5'h05: rs2_data = x_5;
        5'h06: rs2_data = x_6;
        5'h07: rs2_data = x_7;
        5'h08: rs2_data = x_8;
        5'h09: rs2_data = x_9;
        5'h0a: rs2_data = x_10;
        5'h0b: rs2_data = x_11;
        5'h0c: rs2_data = x_12;
        5'h0d: rs2_data = x_13;
        5'h0e: rs2_data = x_14;
        5'h0f: rs2_data = x_15;
        5'h10: rs2_data = x_16;
        5'h11: rs2_data = x_17;
        5'h12: rs2_data = x_18;
        5'h13: rs2_data = x_19;
        5'h14: rs2_data = x_20;
        5'h15: rs2_data = x_21;
        5'h16: rs2_data = x_22;
        5'h17: rs2_data = x_23;
        5'h18: rs2_data = x_24;
        5'h19: rs2_data = x_25;
        5'h1a: rs2_data = x_26;
        5'h1b: rs2_data = x_27;
        5'h1c: rs2_data = x_28;
        5'h1d: rs2_data = x_29;
        5'h1e: rs2_data = x_30;
        5'h1f: rs2_data = x_31;
    endcase
end
     
// write rd_data (if we is asserted) 
always_ff @(posedge clk) begin
    case (rd)
        5'h01: x_1 <= we ? rd_data : x_1;
        5'h02: x_2 <= we ? rd_data : x_2;
        5'h03: x_3 <= we ? rd_data : x_3;
        5'h04: x_4 <= we ? rd_data : x_4;
        5'h05: x_5 <= we ? rd_data : x_5;
        5'h06: x_6 <= we ? rd_data : x_6;
        5'h07: x_7 <= we ? rd_data : x_7;
        5'h08: x_8 <= we ? rd_data : x_8;
        5'h09: x_9 <= we ? rd_data : x_9;
        5'h0a: x_10 <= we ? rd_data : x_10;
        5'h0b: x_11 <= we ? rd_data : x_11;
        5'h0c: x_12 <= we ? rd_data : x_12;
        5'h0d: x_13 <= we ? rd_data : x_13;
        5'h0e: x_14 <= we ? rd_data : x_14;
        5'h0f: x_15 <= we ? rd_data : x_15;
        5'h10: x_16 <= we ? rd_data : x_16;
        5'h11: x_17 <= we ? rd_data : x_17;
        5'h12: x_18 <= we ? rd_data : x_18;
        5'h13: x_19 <= we ? rd_data : x_19;
        5'h14: x_20 <= we ? rd_data : x_20;
        5'h15: x_21 <= we ? rd_data : x_21;
        5'h16: x_22 <= we ? rd_data : x_22;
        5'h17: x_23 <= we ? rd_data : x_23;
        5'h18: x_24 <= we ? rd_data : x_24;
        5'h19: x_25 <= we ? rd_data : x_25;
        5'h1a: x_26 <= we ? rd_data : x_26;
        5'h1b: x_27 <= we ? rd_data : x_27;
        5'h1c: x_28 <= we ? rd_data : x_28;
        5'h1d: x_29 <= we ? rd_data : x_29;
        5'h1e: x_30 <= we ? rd_data : x_30;
        5'h1f: x_31 <= we ? rd_data : x_31;
    endcase
end

endmodule
