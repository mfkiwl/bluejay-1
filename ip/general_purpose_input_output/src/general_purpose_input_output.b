//==============================================
// general_purpose_input_output
//==============================================
module general_purpose_input_output
(
    clk,
    rst,
    cs,
    we,
    addr,
    wr_data,
    rd_data,
    port__0,
    port__1,
    port__2,
    port__3
);

input clk;
input rst;

input cs;
input we;
input [3:0] addr;
input [7:0] wr_data;
output [7:0] rd_data;

inout [7:0] port__0;
inout [7:0] port__1;
inout [7:0] port__2;
inout [7:0] port__3;

logic clk;
logic rst;

logic cs;
logic we;
logic [3:0] addr;
logic [7:0] wr_data;
logic [7:0] rd_data;

//logic [7:0] port__0;
logic [7:0] data__0;
logic [7:0] oe__0;
logic we__data__0;
logic we__oe__0;
logic en__data__0;
logic en__oe__0;

//logic [7:0] port__1;
logic [7:0] data__1;
logic [7:0] oe__1;
logic we__data__1;
logic we__oe__1;
logic en__data__1;
logic en__oe__1;

//logic [7:0] port__2;
logic [7:0] data__2;
logic [7:0] oe__2;
logic we__data__2;
logic we__oe__2;
logic en__data__2;
logic en__oe__2;

//logic [7:0] port__3;
logic [7:0] data__3;
logic [7:0] oe__3;
logic we__data__3;
logic we__oe__3;
logic en__data__3;
logic en__oe__3;

assign port__0[0] = oe__0[0] ? data__0[0] : 1'bz;
assign port__0[1] = oe__0[1] ? data__0[1] : 1'bz;
assign port__0[2] = oe__0[2] ? data__0[2] : 1'bz;
assign port__0[3] = oe__0[3] ? data__0[3] : 1'bz;
assign port__0[4] = oe__0[4] ? data__0[4] : 1'bz;
assign port__0[5] = oe__0[5] ? data__0[5] : 1'bz;
assign port__0[6] = oe__0[6] ? data__0[6] : 1'bz;
assign port__0[7] = oe__0[7] ? data__0[7] : 1'bz;

assign port__1[0] = oe__1[0] ? data__1[0] : 1'bz;
assign port__1[1] = oe__1[1] ? data__1[1] : 1'bz;
assign port__1[2] = oe__1[2] ? data__1[2] : 1'bz;
assign port__1[3] = oe__1[3] ? data__1[3] : 1'bz;
assign port__1[4] = oe__1[4] ? data__1[4] : 1'bz;
assign port__1[5] = oe__1[5] ? data__1[5] : 1'bz;
assign port__1[6] = oe__1[6] ? data__1[6] : 1'bz;
assign port__1[7] = oe__1[7] ? data__1[7] : 1'bz;

assign port__2[0] = oe__2[0] ? data__2[0] : 1'bz;
assign port__2[1] = oe__2[1] ? data__2[1] : 1'bz;
assign port__2[2] = oe__2[2] ? data__2[2] : 1'bz;
assign port__2[3] = oe__2[3] ? data__2[3] : 1'bz;
assign port__2[4] = oe__2[4] ? data__2[4] : 1'bz;
assign port__2[5] = oe__2[5] ? data__2[5] : 1'bz;
assign port__2[6] = oe__2[6] ? data__2[6] : 1'bz;
assign port__2[7] = oe__2[7] ? data__2[7] : 1'bz;

assign port__3[0] = oe__3[0] ? data__3[0] : 1'bz;
assign port__3[1] = oe__3[1] ? data__3[1] : 1'bz;
assign port__3[2] = oe__3[2] ? data__3[2] : 1'bz;
assign port__3[3] = oe__3[3] ? data__3[3] : 1'bz;
assign port__3[4] = oe__3[4] ? data__3[4] : 1'bz;
assign port__3[5] = oe__3[5] ? data__3[5] : 1'bz;
assign port__3[6] = oe__3[6] ? data__3[6] : 1'bz;
assign port__3[7] = oe__3[7] ? data__3[7] : 1'bz;


always_comb
begin
    rd_data = port__0;
    we__data__0 = 1'b0;
    we__oe__0 = 1'b0;
    we__data__1 = 1'b0;
    we__oe__1 = 1'b0;
    we__data__2 = 1'b0;
    we__oe__2 = 1'b0;
    we__data__3 = 1'b0;
    we__oe__3 = 1'b0;

    case (addr)
        GENERAL_PURPOSE_INPUT_OUTPUT__PORT__0:
        begin
            rd_data = port__0; 
            we__data__0 = we;
        end
        GENERAL_PURPOSE_INPUT_OUTPUT__DATA__0:
        begin
            rd_data = data__0; 
            we__data__0 = we;
        end
        GENERAL_PURPOSE_INPUT_OUTPUT__OE__0:
        begin
            rd_data = oe__0; 
            we__oe__0 = we;
        end
        GENERAL_PURPOSE_INPUT_OUTPUT__PORT__1:
        begin
            rd_data = port__1; 
            we__data__1 = we;
        end
        GENERAL_PURPOSE_INPUT_OUTPUT__DATA__1:
        begin
            rd_data = data__1; 
            we__data__1 = we;
        end
        GENERAL_PURPOSE_INPUT_OUTPUT__OE__1:
        begin
            rd_data = oe__1; 
            we__oe__1 = we;
        end
        GENERAL_PURPOSE_INPUT_OUTPUT__PORT__2:
        begin
            rd_data = port__2; 
            we__data__2 = we;
        end
        GENERAL_PURPOSE_INPUT_OUTPUT__DATA__2:
        begin
            rd_data = data__2; 
            we__data__2 = we;
        end
        GENERAL_PURPOSE_INPUT_OUTPUT__OE__2:
        begin
            rd_data = oe__2; 
            we__oe__2 = we;
        end
        GENERAL_PURPOSE_INPUT_OUTPUT__PORT__3:
        begin
            rd_data = port__3; 
            we__data__3 = we;
        end
        GENERAL_PURPOSE_INPUT_OUTPUT__DATA__3:
        begin
            rd_data = data__3; 
            we__data__3 = we;
        end
        GENERAL_PURPOSE_INPUT_OUTPUT__OE__3:
        begin
            rd_data = oe__3; 
            we__oe__3 = we;
        end
    endcase
end

assign en__data__0 = cs & we__data__0;

//==============================
// d_flip_flop__data__0
//==============================
d_flip_flop #(.WIDTH(8)) d_flip_flop__data__0
(
    .clk(clk),
    .rst(1'b0),
    .en(en__data__0),
    .d(wr_data),
    .q(data__0)
);


assign en__oe__0 = cs & we__oe__0;

//==============================
// d_flip_flop__oe__0
//==============================
d_flip_flop #(.WIDTH(8), .RESET_VALUE(8'h0)) d_flip_flop__oe__0
(
    .clk(clk),
    .rst(rst),
    .en(en__oe__0),
    .d(wr_data),
    .q(oe__0)
);

assign en__data__1 = cs & we__data__1;

//==============================
// d_flip_flop__data__1
//==============================
d_flip_flop #(.WIDTH(8)) d_flip_flop__data__1
(
    .clk(clk),
    .rst(1'b0),
    .en(en__data__1),
    .d(wr_data),
    .q(data__1)
);


assign en__oe__1 = cs & we__oe__1;

//==============================
// d_flip_flop__oe__1
//==============================
d_flip_flop #(.WIDTH(8), .RESET_VALUE(8'h0)) d_flip_flop__oe__1
(
    .clk(clk),
    .rst(rst),
    .en(en__oe__1),
    .d(wr_data),
    .q(oe__1)
);

assign en__data__2 = cs & we__data__2;

//==============================
// d_flip_flop__data__2
//==============================
d_flip_flop #(.WIDTH(8)) d_flip_flop__data__2
(
    .clk(clk),
    .rst(1'b0),
    .en(en__data__2),
    .d(wr_data),
    .q(data__2)
);


assign en__oe__2 = cs & we__oe__2;

//==============================
// d_flip_flop__oe__2
//==============================
d_flip_flop #(.WIDTH(8), .RESET_VALUE(8'h0)) d_flip_flop__oe__2
(
    .clk(clk),
    .rst(rst),
    .en(en__oe__2),
    .d(wr_data),
    .q(oe__2)
);

assign en__data__3 = cs & we__data__3;

//==============================
// d_flip_flop__data__3
//==============================
d_flip_flop #(.WIDTH(8)) d_flip_flop__data__3
(
    .clk(clk),
    .rst(1'b0),
    .en(en__data__3),
    .d(wr_data),
    .q(data__3)
);


assign en__oe__3 = cs & we__oe__3;

//==============================
// d_flip_flop__oe__3
//==============================
d_flip_flop #(.WIDTH(8), .RESET_VALUE(8'h0)) d_flip_flop__oe__3
(
    .clk(clk),
    .rst(rst),
    .en(en__oe__3),
    .d(wr_data),
    .q(oe__3)
);

endmodule
