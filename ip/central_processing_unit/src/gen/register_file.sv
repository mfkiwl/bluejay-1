//==============================================
// register_file
//==============================================
module register_file
(
    input clk,
    input rst,
    input we,
    input [4:0] addr,
    output logic [63:0] rd_data,
    input [63:0] wr_data
);

logic [63:0] x__0;
logic [63:0] x__1;
logic [63:0] x__2;
logic [63:0] x__3;
logic [63:0] x__4;
logic [63:0] x__5;
logic [63:0] x__6;
logic [63:0] x__7;
logic [63:0] x__8;
logic [63:0] x__9;
logic [63:0] x__10;
logic [63:0] x__11;
logic [63:0] x__12;
logic [63:0] x__13;
logic [63:0] x__14;
logic [63:0] x__15;
logic [63:0] x__16;
logic [63:0] x__17;
logic [63:0] x__18;
logic [63:0] x__19;
logic [63:0] x__20;
logic [63:0] x__21;
logic [63:0] x__22;
logic [63:0] x__23;
logic [63:0] x__24;
logic [63:0] x__25;
logic [63:0] x__26;
logic [63:0] x__27;
logic [63:0] x__28;
logic [63:0] x__29;
logic [63:0] x__30;
logic [63:0] x__31;

assign x__0 = 64'h0;

always_comb begin
    case (addr)
        5'h0: rd_data = x__0;
        5'h1: rd_data = x__1;
        5'h2: rd_data = x__2;
        5'h3: rd_data = x__3;
        5'h4: rd_data = x__4;
        5'h5: rd_data = x__5;
        5'h6: rd_data = x__6;
        5'h7: rd_data = x__7;
        5'h8: rd_data = x__8;
        5'h9: rd_data = x__9;
        5'ha: rd_data = x__10;
        5'hb: rd_data = x__11;
        5'hc: rd_data = x__12;
        5'hd: rd_data = x__13;
        5'he: rd_data = x__14;
        5'hf: rd_data = x__15;
        5'h10: rd_data = x__16;
        5'h11: rd_data = x__17;
        5'h12: rd_data = x__18;
        5'h13: rd_data = x__19;
        5'h14: rd_data = x__20;
        5'h15: rd_data = x__21;
        5'h16: rd_data = x__22;
        5'h17: rd_data = x__23;
        5'h18: rd_data = x__24;
        5'h19: rd_data = x__25;
        5'h1a: rd_data = x__26;
        5'h1b: rd_data = x__27;
        5'h1c: rd_data = x__28;
        5'h1d: rd_data = x__29;
        5'h1e: rd_data = x__30;
        5'h1f: rd_data = x__31;
    endcase
end

always_ff @(posedge clk) begin
    case (addr)
        5'h1: x__1 <= we ? wr_data : x__1;
        5'h2: x__2 <= we ? wr_data : x__2;
        5'h3: x__3 <= we ? wr_data : x__3;
        5'h4: x__4 <= we ? wr_data : x__4;
        5'h5: x__5 <= we ? wr_data : x__5;
        5'h6: x__6 <= we ? wr_data : x__6;
        5'h7: x__7 <= we ? wr_data : x__7;
        5'h8: x__8 <= we ? wr_data : x__8;
        5'h9: x__9 <= we ? wr_data : x__9;
        5'ha: x__10 <= we ? wr_data : x__10;
        5'hb: x__11 <= we ? wr_data : x__11;
        5'hc: x__12 <= we ? wr_data : x__12;
        5'hd: x__13 <= we ? wr_data : x__13;
        5'he: x__14 <= we ? wr_data : x__14;
        5'hf: x__15 <= we ? wr_data : x__15;
        5'h10: x__16 <= we ? wr_data : x__16;
        5'h11: x__17 <= we ? wr_data : x__17;
        5'h12: x__18 <= we ? wr_data : x__18;
        5'h13: x__19 <= we ? wr_data : x__19;
        5'h14: x__20 <= we ? wr_data : x__20;
        5'h15: x__21 <= we ? wr_data : x__21;
        5'h16: x__22 <= we ? wr_data : x__22;
        5'h17: x__23 <= we ? wr_data : x__23;
        5'h18: x__24 <= we ? wr_data : x__24;
        5'h19: x__25 <= we ? wr_data : x__25;
        5'h1a: x__26 <= we ? wr_data : x__26;
        5'h1b: x__27 <= we ? wr_data : x__27;
        5'h1c: x__28 <= we ? wr_data : x__28;
        5'h1d: x__29 <= we ? wr_data : x__29;
        5'h1e: x__30 <= we ? wr_data : x__30;
        5'h1f: x__31 <= we ? wr_data : x__31;
    endcase
end

endmodule
