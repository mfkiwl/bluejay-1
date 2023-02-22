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
);

input clk;
input rst;

input cs;
input we;
input addr;
input [7:0] wr_data;
output [7:0] rd_data;

logic clk;
logic rst;

logic cs;
logic we;
logic addr;
logic [7:0] wr_data;
logic [7:0] rd_data;


logic port__0__input;
logic port__0__output;
logic port__0__oe;

logic [7:0] data__0;

logic [7:0] oe__0;

logic en__data__0;

logic en__oe__0;



always_comb
begin
    we__port__0 = 1'b0;
    we__data__0 = 1'b0;
    we__oe__0 = 1'b0;

    case (addr)
        GENERAL_PURPOSE_INPUT_OUTPUT__PORT__0:
        begin
            rd_data = port__0; 
            we__port__0 = we;
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
    endcase
end

assign en__data__0 = cs & we__data__0;

assign en__oe__0 = cs & we__oe__0;


//==============================
// d_flip_flop__data__0
//==============================
d_flip_flop #(.WIDTH(8)) d_flip_flop__data__0
(
    .clk(clk),
    .rst(rst),
    .en(en__data__0),
    .d(wr_data),
    .q(data__0)
);

//==============================
// d_flip_flop__oe__0
//==============================
d_flip_flop #(.WIDTH(8)) d_flip_flop__oe__0
(
    .clk(clk),
    .rst(rst),
    .en(en__oe__0),
    .d(wr_data),
    .q(oe__0)
);


endmodule
