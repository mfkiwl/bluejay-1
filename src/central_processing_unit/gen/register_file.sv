//==============================================
// register_file
//==============================================
module register_file
(
    input clk,
    input rst,
    input we,
    input [4:0] rd_addr__0,
    output logic [63:0] rd_data__0,
    input [4:0] rd_addr__1,
    output logic [63:0] rd_data__1,
    input [4:0] wr_addr,
    input [63:0] wr_data
);

// General-purpose registers.
logic [63:0] x_0;
logic [63:0] x_1;
logic [63:0] x_2;
logic [63:0] x_3;
logic [63:0] x_4;
logic [63:0] x_5;
logic [63:0] x_6;
logic [63:0] x_7;
logic [63:0] x_8;
logic [63:0] x_9;
logic [63:0] x_10;
logic [63:0] x_11;
logic [63:0] x_12;
logic [63:0] x_13;
logic [63:0] x_14;
logic [63:0] x_15;
logic [63:0] x_16;
logic [63:0] x_17;
logic [63:0] x_18;
logic [63:0] x_19;
logic [63:0] x_20;
logic [63:0] x_21;
logic [63:0] x_22;
logic [63:0] x_23;
logic [63:0] x_24;
logic [63:0] x_25;
logic [63:0] x_26;
logic [63:0] x_27;
logic [63:0] x_28;
logic [63:0] x_29;
logic [63:0] x_30;
logic [63:0] x_31;

// Register x_0 is hardwired to 0.
assign x_0 = 64'h0;

// Assign rd_data__0.
always_comb begin
    case (rd_addr__0)
        5'h0: rd_data__0 = x_0;
        5'h1: rd_data__0 = x_1;
        5'h2: rd_data__0 = x_2;
        5'h3: rd_data__0 = x_3;
        5'h4: rd_data__0 = x_4;
        5'h5: rd_data__0 = x_5;
        5'h6: rd_data__0 = x_6;
        5'h7: rd_data__0 = x_7;
        5'h8: rd_data__0 = x_8;
        5'h9: rd_data__0 = x_9;
        5'ha: rd_data__0 = x_10;
        5'hb: rd_data__0 = x_11;
        5'hc: rd_data__0 = x_12;
        5'hd: rd_data__0 = x_13;
        5'he: rd_data__0 = x_14;
        5'hf: rd_data__0 = x_15;
        5'h10: rd_data__0 = x_16;
        5'h11: rd_data__0 = x_17;
        5'h12: rd_data__0 = x_18;
        5'h13: rd_data__0 = x_19;
        5'h14: rd_data__0 = x_20;
        5'h15: rd_data__0 = x_21;
        5'h16: rd_data__0 = x_22;
        5'h17: rd_data__0 = x_23;
        5'h18: rd_data__0 = x_24;
        5'h19: rd_data__0 = x_25;
        5'h1a: rd_data__0 = x_26;
        5'h1b: rd_data__0 = x_27;
        5'h1c: rd_data__0 = x_28;
        5'h1d: rd_data__0 = x_29;
        5'h1e: rd_data__0 = x_30;
        5'h1f: rd_data__0 = x_31;
    endcase
end

// Assign rd_data__1.
always_comb begin
    case (rd_addr__1)
        5'h0: rd_data__1 = x_0;
        5'h1: rd_data__1 = x_1;
        5'h2: rd_data__1 = x_2;
        5'h3: rd_data__1 = x_3;
        5'h4: rd_data__1 = x_4;
        5'h5: rd_data__1 = x_5;
        5'h6: rd_data__1 = x_6;
        5'h7: rd_data__1 = x_7;
        5'h8: rd_data__1 = x_8;
        5'h9: rd_data__1 = x_9;
        5'ha: rd_data__1 = x_10;
        5'hb: rd_data__1 = x_11;
        5'hc: rd_data__1 = x_12;
        5'hd: rd_data__1 = x_13;
        5'he: rd_data__1 = x_14;
        5'hf: rd_data__1 = x_15;
        5'h10: rd_data__1 = x_16;
        5'h11: rd_data__1 = x_17;
        5'h12: rd_data__1 = x_18;
        5'h13: rd_data__1 = x_19;
        5'h14: rd_data__1 = x_20;
        5'h15: rd_data__1 = x_21;
        5'h16: rd_data__1 = x_22;
        5'h17: rd_data__1 = x_23;
        5'h18: rd_data__1 = x_24;
        5'h19: rd_data__1 = x_25;
        5'h1a: rd_data__1 = x_26;
        5'h1b: rd_data__1 = x_27;
        5'h1c: rd_data__1 = x_28;
        5'h1d: rd_data__1 = x_29;
        5'h1e: rd_data__1 = x_30;
        5'h1f: rd_data__1 = x_31;
    endcase
end
     
// Write rd_data (if we is asserted). 
always_ff @(posedge clk) begin
    case (wr_addr)
        5'h1: x_1 <= we ? wr_data : x_1;
        5'h2: x_2 <= we ? wr_data : x_2;
        5'h3: x_3 <= we ? wr_data : x_3;
        5'h4: x_4 <= we ? wr_data : x_4;
        5'h5: x_5 <= we ? wr_data : x_5;
        5'h6: x_6 <= we ? wr_data : x_6;
        5'h7: x_7 <= we ? wr_data : x_7;
        5'h8: x_8 <= we ? wr_data : x_8;
        5'h9: x_9 <= we ? wr_data : x_9;
        5'ha: x_10 <= we ? wr_data : x_10;
        5'hb: x_11 <= we ? wr_data : x_11;
        5'hc: x_12 <= we ? wr_data : x_12;
        5'hd: x_13 <= we ? wr_data : x_13;
        5'he: x_14 <= we ? wr_data : x_14;
        5'hf: x_15 <= we ? wr_data : x_15;
        5'h10: x_16 <= we ? wr_data : x_16;
        5'h11: x_17 <= we ? wr_data : x_17;
        5'h12: x_18 <= we ? wr_data : x_18;
        5'h13: x_19 <= we ? wr_data : x_19;
        5'h14: x_20 <= we ? wr_data : x_20;
        5'h15: x_21 <= we ? wr_data : x_21;
        5'h16: x_22 <= we ? wr_data : x_22;
        5'h17: x_23 <= we ? wr_data : x_23;
        5'h18: x_24 <= we ? wr_data : x_24;
        5'h19: x_25 <= we ? wr_data : x_25;
        5'h1a: x_26 <= we ? wr_data : x_26;
        5'h1b: x_27 <= we ? wr_data : x_27;
        5'h1c: x_28 <= we ? wr_data : x_28;
        5'h1d: x_29 <= we ? wr_data : x_29;
        5'h1e: x_30 <= we ? wr_data : x_30;
        5'h1f: x_31 <= we ? wr_data : x_31;
    endcase
end

endmodule
