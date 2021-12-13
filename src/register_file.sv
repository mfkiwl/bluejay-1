//==============================================
// register_file
//==============================================
module register_file
(
    input clk,
    input rst,
    input we,
    input [4:0] rd_addr_0,
    output logic [63:0] rd_data_0,
    input [4:0] rd_addr_1, 
    output logic [63:0] rd_data_1,
    input [4:0] wr_addr,
    input [63:0] wr_data
);
    
    // general-purpose registers
    logic [63:0] r_0, r_1, r_2, r_3, r_4, r_5, r_6, r_7, r_8, r_9, r_10, r_11, r_12, r_13, r_14, r_15, r_16, r_17, r_18, r_19, r_20, r_21, r_22, r_23, r_24, r_25, r_26, r_27, r_28, r_29, r_30, r_31;

    // register r_0 is hardwired to 0
    assign r_0 = 64'h00;
         
    // assign rd_data_0
    always_comb begin
        case (rd_addr_0)
            5'h00: rd_data_0 = r_0;
            5'h01: rd_data_0 = r_1;
            5'h02: rd_data_0 = r_2;
            5'h03: rd_data_0 = r_3;
            5'h04: rd_data_0 = r_4;
            5'h05: rd_data_0 = r_5;
            5'h06: rd_data_0 = r_6;
            5'h07: rd_data_0 = r_7;
            5'h08: rd_data_0 = r_8;
            5'h09: rd_data_0 = r_9;
            5'h0a: rd_data_0 = r_10;
            5'h0b: rd_data_0 = r_11;
            5'h0c: rd_data_0 = r_12;
            5'h0d: rd_data_0 = r_13;
            5'h0e: rd_data_0 = r_14;
            5'h0f: rd_data_0 = r_15;
            5'h10: rd_data_0 = r_16;
            5'h11: rd_data_0 = r_17;
            5'h12: rd_data_0 = r_18;
            5'h13: rd_data_0 = r_19;
            5'h14: rd_data_0 = r_20;
            5'h15: rd_data_0 = r_21;
            5'h16: rd_data_0 = r_22;
            5'h17: rd_data_0 = r_23;
            5'h18: rd_data_0 = r_24;
            5'h19: rd_data_0 = r_25;
            5'h1a: rd_data_0 = r_26;
            5'h1b: rd_data_0 = r_27;
            5'h1c: rd_data_0 = r_28;
            5'h1d: rd_data_0 = r_29;
            5'h1e: rd_data_0 = r_30;
            5'h1f: rd_data_0 = r_31;
        endcase
    end

    // assign rd_data_1
    always_comb begin
        case (rd_addr_1)
            5'h00: rd_data_1 = r_0;
            5'h01: rd_data_1 = r_1;
            5'h02: rd_data_1 = r_2;
            5'h03: rd_data_1 = r_3;
            5'h04: rd_data_1 = r_4;
            5'h05: rd_data_1 = r_5;
            5'h06: rd_data_1 = r_6;
            5'h07: rd_data_1 = r_7;
            5'h08: rd_data_1 = r_8;
            5'h09: rd_data_1 = r_9;
            5'h0a: rd_data_1 = r_10;
            5'h0b: rd_data_1 = r_11;
            5'h0c: rd_data_1 = r_12;
            5'h0d: rd_data_1 = r_13;
            5'h0e: rd_data_1 = r_14;
            5'h0f: rd_data_1 = r_15;
            5'h10: rd_data_1 = r_16;
            5'h11: rd_data_1 = r_17;
            5'h12: rd_data_1 = r_18;
            5'h13: rd_data_1 = r_19;
            5'h14: rd_data_1 = r_20;
            5'h15: rd_data_1 = r_21;
            5'h16: rd_data_1 = r_22;
            5'h17: rd_data_1 = r_23;
            5'h18: rd_data_1 = r_24;
            5'h19: rd_data_1 = r_25;
            5'h1a: rd_data_1 = r_26;
            5'h1b: rd_data_1 = r_27;
            5'h1c: rd_data_1 = r_28;
            5'h1d: rd_data_1 = r_29;
            5'h1e: rd_data_1 = r_30;
            5'h1f: rd_data_1 = r_31;
        endcase
    end
         
    // write wr_data (if we is asserted) 
    always_ff @(posedge clk) begin
        case (wr_addr)
            5'h00: r_0 <= r_0;
            5'h01: r_1 <= we ? wr_data : r_1;
            5'h02: r_2 <= we ? wr_data : r_2;
            5'h03: r_3 <= we ? wr_data : r_3;
            5'h04: r_4 <= we ? wr_data : r_4;
            5'h05: r_5 <= we ? wr_data : r_5;
            5'h06: r_6 <= we ? wr_data : r_6;
            5'h07: r_7 <= we ? wr_data : r_7;
            5'h08: r_8 <= we ? wr_data : r_8;
            5'h09: r_9 <= we ? wr_data : r_9;
            5'h0a: r_10 <= we ? wr_data : r_10;
            5'h0b: r_11 <= we ? wr_data : r_11;
            5'h0c: r_12 <= we ? wr_data : r_12;
            5'h0d: r_13 <= we ? wr_data : r_13;
            5'h0e: r_14 <= we ? wr_data : r_14;
            5'h0f: r_15 <= we ? wr_data : r_15;
            5'h10: r_16 <= we ? wr_data : r_16;
            5'h11: r_17 <= we ? wr_data : r_17;
            5'h12: r_18 <= we ? wr_data : r_18;
            5'h13: r_19 <= we ? wr_data : r_19;
            5'h14: r_20 <= we ? wr_data : r_20;
            5'h15: r_21 <= we ? wr_data : r_21;
            5'h16: r_22 <= we ? wr_data : r_22;
            5'h17: r_23 <= we ? wr_data : r_23;
            5'h18: r_24 <= we ? wr_data : r_24;
            5'h19: r_25 <= we ? wr_data : r_25;
            5'h1a: r_26 <= we ? wr_data : r_26;
            5'h1b: r_27 <= we ? wr_data : r_27;
            5'h1c: r_28 <= we ? wr_data : r_28;
            5'h1d: r_29 <= we ? wr_data : r_29;
            5'h1e: r_30 <= we ? wr_data : r_30;
            5'h1f: r_31 <= we ? wr_data : r_31;
        endcase
    end
    
endmodule
