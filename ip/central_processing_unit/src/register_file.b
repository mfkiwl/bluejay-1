//==============================================
// register_file
//==============================================
module register_file
(
    input clk,
    input rst,
    input cs,
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

logic we__x__0;
logic we__x__1;
logic we__x__2;
logic we__x__3;
logic we__x__4;
logic we__x__5;
logic we__x__6;
logic we__x__7;
logic we__x__8;
logic we__x__9;
logic we__x__10;
logic we__x__11;
logic we__x__12;
logic we__x__13;
logic we__x__14;
logic we__x__15;
logic we__x__16;
logic we__x__17;
logic we__x__18;
logic we__x__19;
logic we__x__20;
logic we__x__21;
logic we__x__22;
logic we__x__23;
logic we__x__24;
logic we__x__25;
logic we__x__26;
logic we__x__27;
logic we__x__28;
logic we__x__29;
logic we__x__30;
logic we__x__31;

logic en__x__0;
logic en__x__1;
logic en__x__2;
logic en__x__3;
logic en__x__4;
logic en__x__5;
logic en__x__6;
logic en__x__7;
logic en__x__8;
logic en__x__9;
logic en__x__10;
logic en__x__11;
logic en__x__12;
logic en__x__13;
logic en__x__14;
logic en__x__15;
logic en__x__16;
logic en__x__17;
logic en__x__18;
logic en__x__19;
logic en__x__20;
logic en__x__21;
logic en__x__22;
logic en__x__23;
logic en__x__24;
logic en__x__25;
logic en__x__26;
logic en__x__27;
logic en__x__28;
logic en__x__29;
logic en__x__30;
logic en__x__31;

always_comb
begin
    we__x__0 = 1'b0;
    we__x__1 = 1'b0;
    we__x__2 = 1'b0;
    we__x__3 = 1'b0;
    we__x__4 = 1'b0;
    we__x__5 = 1'b0;
    we__x__6 = 1'b0;
    we__x__7 = 1'b0;
    we__x__8 = 1'b0;
    we__x__9 = 1'b0;
    we__x__10 = 1'b0;
    we__x__11 = 1'b0;
    we__x__12 = 1'b0;
    we__x__13 = 1'b0;
    we__x__14 = 1'b0;
    we__x__15 = 1'b0;
    we__x__16 = 1'b0;
    we__x__17 = 1'b0;
    we__x__18 = 1'b0;
    we__x__19 = 1'b0;
    we__x__20 = 1'b0;
    we__x__21 = 1'b0;
    we__x__22 = 1'b0;
    we__x__23 = 1'b0;
    we__x__24 = 1'b0;
    we__x__25 = 1'b0;
    we__x__26 = 1'b0;
    we__x__27 = 1'b0;
    we__x__28 = 1'b0;
    we__x__29 = 1'b0;
    we__x__30 = 1'b0;
    we__x__31 = 1'b0;

    case (addr)
        5'h0:
        begin
            rd_data = x__0;
            we__x__0 = we;
        end
        5'h1:
        begin
            rd_data = x__1;
            we__x__1 = we;
        end
        5'h2:
        begin
            rd_data = x__2;
            we__x__2 = we;
        end
        5'h3:
        begin
            rd_data = x__3;
            we__x__3 = we;
        end
        5'h4:
        begin
            rd_data = x__4;
            we__x__4 = we;
        end
        5'h5:
        begin
            rd_data = x__5;
            we__x__5 = we;
        end
        5'h6:
        begin
            rd_data = x__6;
            we__x__6 = we;
        end
        5'h7:
        begin
            rd_data = x__7;
            we__x__7 = we;
        end
        5'h8:
        begin
            rd_data = x__8;
            we__x__8 = we;
        end
        5'h9:
        begin
            rd_data = x__9;
            we__x__9 = we;
        end
        5'ha:
        begin
            rd_data = x__10;
            we__x__10 = we;
        end
        5'hb:
        begin
            rd_data = x__11;
            we__x__11 = we;
        end
        5'hc:
        begin
            rd_data = x__12;
            we__x__12 = we;
        end
        5'hd:
        begin
            rd_data = x__13;
            we__x__13 = we;
        end
        5'he:
        begin
            rd_data = x__14;
            we__x__14 = we;
        end
        5'hf:
        begin
            rd_data = x__15;
            we__x__15 = we;
        end
        5'h10:
        begin
            rd_data = x__16;
            we__x__16 = we;
        end
        5'h11:
        begin
            rd_data = x__17;
            we__x__17 = we;
        end
        5'h12:
        begin
            rd_data = x__18;
            we__x__18 = we;
        end
        5'h13:
        begin
            rd_data = x__19;
            we__x__19 = we;
        end
        5'h14:
        begin
            rd_data = x__20;
            we__x__20 = we;
        end
        5'h15:
        begin
            rd_data = x__21;
            we__x__21 = we;
        end
        5'h16:
        begin
            rd_data = x__22;
            we__x__22 = we;
        end
        5'h17:
        begin
            rd_data = x__23;
            we__x__23 = we;
        end
        5'h18:
        begin
            rd_data = x__24;
            we__x__24 = we;
        end
        5'h19:
        begin
            rd_data = x__25;
            we__x__25 = we;
        end
        5'h1a:
        begin
            rd_data = x__26;
            we__x__26 = we;
        end
        5'h1b:
        begin
            rd_data = x__27;
            we__x__27 = we;
        end
        5'h1c:
        begin
            rd_data = x__28;
            we__x__28 = we;
        end
        5'h1d:
        begin
            rd_data = x__29;
            we__x__29 = we;
        end
        5'h1e:
        begin
            rd_data = x__30;
            we__x__30 = we;
        end
        5'h1f:
        begin
            rd_data = x__31;
            we__x__31 = we;
        end
    endcase
end

assign en__x__0 = cs & we__x__0;
assign en__x__1 = cs & we__x__1;
assign en__x__2 = cs & we__x__2;
assign en__x__3 = cs & we__x__3;
assign en__x__4 = cs & we__x__4;
assign en__x__5 = cs & we__x__5;
assign en__x__6 = cs & we__x__6;
assign en__x__7 = cs & we__x__7;
assign en__x__8 = cs & we__x__8;
assign en__x__9 = cs & we__x__9;
assign en__x__10 = cs & we__x__10;
assign en__x__11 = cs & we__x__11;
assign en__x__12 = cs & we__x__12;
assign en__x__13 = cs & we__x__13;
assign en__x__14 = cs & we__x__14;
assign en__x__15 = cs & we__x__15;
assign en__x__16 = cs & we__x__16;
assign en__x__17 = cs & we__x__17;
assign en__x__18 = cs & we__x__18;
assign en__x__19 = cs & we__x__19;
assign en__x__20 = cs & we__x__20;
assign en__x__21 = cs & we__x__21;
assign en__x__22 = cs & we__x__22;
assign en__x__23 = cs & we__x__23;
assign en__x__24 = cs & we__x__24;
assign en__x__25 = cs & we__x__25;
assign en__x__26 = cs & we__x__26;
assign en__x__27 = cs & we__x__27;
assign en__x__28 = cs & we__x__28;
assign en__x__29 = cs & we__x__29;
assign en__x__30 = cs & we__x__30;
assign en__x__31 = cs & we__x__31;

assign x__0 = 64'h0;

//==============================
// d_flip_flop__x__1
//==============================
d_flip_flop #(.WIDTH(64)) d_flip_flop__x__1
(
    .clk(clk),
    .rst(1'b0),
    .en(en__x__1),
    .d(wr_data),
    .q(x__1)
);


//==============================
// d_flip_flop__x__2
//==============================
d_flip_flop #(.WIDTH(64)) d_flip_flop__x__2
(
    .clk(clk),
    .rst(1'b0),
    .en(en__x__2),
    .d(wr_data),
    .q(x__2)
);


//==============================
// d_flip_flop__x__3
//==============================
d_flip_flop #(.WIDTH(64)) d_flip_flop__x__3
(
    .clk(clk),
    .rst(1'b0),
    .en(en__x__3),
    .d(wr_data),
    .q(x__3)
);


//==============================
// d_flip_flop__x__4
//==============================
d_flip_flop #(.WIDTH(64)) d_flip_flop__x__4
(
    .clk(clk),
    .rst(1'b0),
    .en(en__x__4),
    .d(wr_data),
    .q(x__4)
);


//==============================
// d_flip_flop__x__5
//==============================
d_flip_flop #(.WIDTH(64)) d_flip_flop__x__5
(
    .clk(clk),
    .rst(1'b0),
    .en(en__x__5),
    .d(wr_data),
    .q(x__5)
);


//==============================
// d_flip_flop__x__6
//==============================
d_flip_flop #(.WIDTH(64)) d_flip_flop__x__6
(
    .clk(clk),
    .rst(1'b0),
    .en(en__x__6),
    .d(wr_data),
    .q(x__6)
);


//==============================
// d_flip_flop__x__7
//==============================
d_flip_flop #(.WIDTH(64)) d_flip_flop__x__7
(
    .clk(clk),
    .rst(1'b0),
    .en(en__x__7),
    .d(wr_data),
    .q(x__7)
);


//==============================
// d_flip_flop__x__8
//==============================
d_flip_flop #(.WIDTH(64)) d_flip_flop__x__8
(
    .clk(clk),
    .rst(1'b0),
    .en(en__x__8),
    .d(wr_data),
    .q(x__8)
);


//==============================
// d_flip_flop__x__9
//==============================
d_flip_flop #(.WIDTH(64)) d_flip_flop__x__9
(
    .clk(clk),
    .rst(1'b0),
    .en(en__x__9),
    .d(wr_data),
    .q(x__9)
);


//==============================
// d_flip_flop__x__10
//==============================
d_flip_flop #(.WIDTH(64)) d_flip_flop__x__10
(
    .clk(clk),
    .rst(1'b0),
    .en(en__x__10),
    .d(wr_data),
    .q(x__10)
);


//==============================
// d_flip_flop__x__11
//==============================
d_flip_flop #(.WIDTH(64)) d_flip_flop__x__11
(
    .clk(clk),
    .rst(1'b0),
    .en(en__x__11),
    .d(wr_data),
    .q(x__11)
);


//==============================
// d_flip_flop__x__12
//==============================
d_flip_flop #(.WIDTH(64)) d_flip_flop__x__12
(
    .clk(clk),
    .rst(1'b0),
    .en(en__x__12),
    .d(wr_data),
    .q(x__12)
);


//==============================
// d_flip_flop__x__13
//==============================
d_flip_flop #(.WIDTH(64)) d_flip_flop__x__13
(
    .clk(clk),
    .rst(1'b0),
    .en(en__x__13),
    .d(wr_data),
    .q(x__13)
);


//==============================
// d_flip_flop__x__14
//==============================
d_flip_flop #(.WIDTH(64)) d_flip_flop__x__14
(
    .clk(clk),
    .rst(1'b0),
    .en(en__x__14),
    .d(wr_data),
    .q(x__14)
);


//==============================
// d_flip_flop__x__15
//==============================
d_flip_flop #(.WIDTH(64)) d_flip_flop__x__15
(
    .clk(clk),
    .rst(1'b0),
    .en(en__x__15),
    .d(wr_data),
    .q(x__15)
);


//==============================
// d_flip_flop__x__16
//==============================
d_flip_flop #(.WIDTH(64)) d_flip_flop__x__16
(
    .clk(clk),
    .rst(1'b0),
    .en(en__x__16),
    .d(wr_data),
    .q(x__16)
);


//==============================
// d_flip_flop__x__17
//==============================
d_flip_flop #(.WIDTH(64)) d_flip_flop__x__17
(
    .clk(clk),
    .rst(1'b0),
    .en(en__x__17),
    .d(wr_data),
    .q(x__17)
);


//==============================
// d_flip_flop__x__18
//==============================
d_flip_flop #(.WIDTH(64)) d_flip_flop__x__18
(
    .clk(clk),
    .rst(1'b0),
    .en(en__x__18),
    .d(wr_data),
    .q(x__18)
);


//==============================
// d_flip_flop__x__19
//==============================
d_flip_flop #(.WIDTH(64)) d_flip_flop__x__19
(
    .clk(clk),
    .rst(1'b0),
    .en(en__x__19),
    .d(wr_data),
    .q(x__19)
);


//==============================
// d_flip_flop__x__20
//==============================
d_flip_flop #(.WIDTH(64)) d_flip_flop__x__20
(
    .clk(clk),
    .rst(1'b0),
    .en(en__x__20),
    .d(wr_data),
    .q(x__20)
);


//==============================
// d_flip_flop__x__21
//==============================
d_flip_flop #(.WIDTH(64)) d_flip_flop__x__21
(
    .clk(clk),
    .rst(1'b0),
    .en(en__x__21),
    .d(wr_data),
    .q(x__21)
);


//==============================
// d_flip_flop__x__22
//==============================
d_flip_flop #(.WIDTH(64)) d_flip_flop__x__22
(
    .clk(clk),
    .rst(1'b0),
    .en(en__x__22),
    .d(wr_data),
    .q(x__22)
);


//==============================
// d_flip_flop__x__23
//==============================
d_flip_flop #(.WIDTH(64)) d_flip_flop__x__23
(
    .clk(clk),
    .rst(1'b0),
    .en(en__x__23),
    .d(wr_data),
    .q(x__23)
);


//==============================
// d_flip_flop__x__24
//==============================
d_flip_flop #(.WIDTH(64)) d_flip_flop__x__24
(
    .clk(clk),
    .rst(1'b0),
    .en(en__x__24),
    .d(wr_data),
    .q(x__24)
);


//==============================
// d_flip_flop__x__25
//==============================
d_flip_flop #(.WIDTH(64)) d_flip_flop__x__25
(
    .clk(clk),
    .rst(1'b0),
    .en(en__x__25),
    .d(wr_data),
    .q(x__25)
);


//==============================
// d_flip_flop__x__26
//==============================
d_flip_flop #(.WIDTH(64)) d_flip_flop__x__26
(
    .clk(clk),
    .rst(1'b0),
    .en(en__x__26),
    .d(wr_data),
    .q(x__26)
);


//==============================
// d_flip_flop__x__27
//==============================
d_flip_flop #(.WIDTH(64)) d_flip_flop__x__27
(
    .clk(clk),
    .rst(1'b0),
    .en(en__x__27),
    .d(wr_data),
    .q(x__27)
);


//==============================
// d_flip_flop__x__28
//==============================
d_flip_flop #(.WIDTH(64)) d_flip_flop__x__28
(
    .clk(clk),
    .rst(1'b0),
    .en(en__x__28),
    .d(wr_data),
    .q(x__28)
);


//==============================
// d_flip_flop__x__29
//==============================
d_flip_flop #(.WIDTH(64)) d_flip_flop__x__29
(
    .clk(clk),
    .rst(1'b0),
    .en(en__x__29),
    .d(wr_data),
    .q(x__29)
);


//==============================
// d_flip_flop__x__30
//==============================
d_flip_flop #(.WIDTH(64)) d_flip_flop__x__30
(
    .clk(clk),
    .rst(1'b0),
    .en(en__x__30),
    .d(wr_data),
    .q(x__30)
);


//==============================
// d_flip_flop__x__31
//==============================
d_flip_flop #(.WIDTH(64)) d_flip_flop__x__31
(
    .clk(clk),
    .rst(1'b0),
    .en(en__x__31),
    .d(wr_data),
    .q(x__31)
);




endmodule
