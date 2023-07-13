//==============================================
// bus__buffer
//==============================================
module bus__buffer 
(
    input clk,
    input rst,
    input a__cs,
    input a__we,
    input [63:0] a__addr,
    input [1:0] a__size,
    input [63:0] a__wr_data,
    output logic a__ready,
    output logic a__resp,
    output logic [63:0] a__rd_data
    output logic b__cs,
    output logic b__we,
    output logic [63:0] b__addr,
    output logic [1:0] b__size,
    output logic [63:0] b__wr_data,
    input b__ready,
    input b__resp,
    input [63:0] b__rd_data
);


logic [1:0] state;
logic [1:0] state__n;

always_comb
begin
    a__ready = 1'b0;
    b__cs = 1'b0;
    en__a = 1'b0;
    en__b = 1'b0; 

    case (state)
        //==============================
        // STATE__READY
        //==============================
        STATE__READY:
        begin
            en__b = a__cs;
            state__n = a__cs ? STATE__REQ : STATE__READY;
        end

        //==============================
        // STATE__REQ
        //==============================
        STATE__REQ:
        begin
            b__cs = 1'b1;
            en__a = b__ready;
            state__n = b__ready ? STATE__RESP : STATE__REQ;
        end

        //==============================
        // STATE__RESP
        //==============================
        STATE__RESP:
        begin
            a__ready = 1'b1;
            state__n = STATE__READY;
        end
    endcase
end

//==============================
// d_flip_flop__b__we
//==============================
d_flip_flop #(.WIDTH(1)) d_flip_flop__b__we
(
    .clk(clk),
    .rst(rst),
    .en(en__b),
    .d(a__we),
    .q(b__we)
);

//==============================
// d_flip_flop__b__addr
//==============================
d_flip_flop #(.WIDTH(64)) d_flip_flop__b__addr
(
    .clk(clk),
    .rst(rst),
    .en(en__b),
    .d(a__addr[39:0]),
    .q(b__addr)
);

//==============================
// d_flip_flop__b__size
//==============================
d_flip_flop #(.WIDTH(2)) d_flip_flop__b__size
(
    .clk(clk),
    .rst(rst),
    .en(en__b),
    .d(a__size),
    .q(b__size)
);

//==============================
// d_flip_flop__b__wr_data
//==============================
d_flip_flop #(.WIDTH(64)) d_flip_flop__b__wr_data
(
    .clk(clk),
    .rst(rst),
    .en(en__b),
    .d(a__wr_data),
    .q(b__wr_data)
);

//==============================
// d_flip_flop__a__resp
//==============================
d_flip_flop #(.WIDTH(1)) d_flip_flop__a__resp
(
    .clk(clk),
    .rst(rst),
    .en(en__a),
    .d(b__resp),
    .q(a__resp)
);

//==============================
// d_flip_flop__a__rd_data
//==============================
d_flip_flop #(.WIDTH(64)) d_flip_flop__a__rd_data
(
    .clk(clk),
    .rst(rst),
    .en(en__a),
    .d(b__rd_data),
    .q(a__rd_data)
);

//==============================
// d_flip_flop__state
//==============================
d_flip_flop #(.WIDTH(2), .RESET_VALUE(STATE__READY)) d_flip_flop__state
(
    .clk(clk),
    .rst(rst),
    .en(1'b1),
    .d(state__n),
    .q(state)
);


endmodule
