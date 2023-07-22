//==============================================
// jbus__driver
//==============================================
module jbus__driver
(
    input clk,
    input rst,

    input cs__a,
    input we__a,
    input [39:0] addr__a,
    input [1:0] size__a,
    input [63:0] wr_data__a,
    output logic ready__a,
    output logic resp__a,
    output logic [63:0] rd_data__a,

    input a__cs,
    input a__we,
    input [39:0] a__addr,
    input [1:0] a__size,
    input [63:0] a__wr_data,
    output logic a__ready,
    output logic a__resp,
    output logic [63:0] a__rd_data,

    output logic b__cs,
    output logic b__we,
    output logic [39:0] b__addr,
    output logic [1:0] b__size,
    output logic [63:0] b__wr_data,
    input b__ready,
    input b__resp,
    input [63:0] b__rd_data
);


logic [1:0] state;
logic [1:0] state__n;

logic en__we__b;
logic en__addr__b;
logic en__size__b;
logic en__b__wr_data;
logic en__a__resp;
logic en__a__rd_data;

always_comb
begin
    jready = 1'b0;
    cs = 1'b0;
    en__we = 1'b0;
    en__addr = 1'b0;
    en__size = 1'b0;
    en__wr_data = 1'b0;
    en__jresp = 1'b0;
    en__jrd_data = 1'b0;

    case (state)
        //==============================
        // STATE__READY
        //==============================
        STATE__READY:
        begin
            en__we = jcs;
            en__addr = jcs;
            en__size = jcs;
            en__wr_data = jcs;
            state__n = jcs ? STATE__REQ : STATE__READY;
        end

        //==============================
        // STATE__REQ
        //==============================
        STATE__REQ:
        begin
            cs = 1'b1;
            en__jresp = ready;
            en__jrd_data = ready;
            state__n = ready ? STATE__RESP : STATE__REQ;
        end

        //==============================
        // STATE__RESP
        //==============================
        STATE__RESP:
        begin
            jready = 1'b1;
            state__n = STATE__READY;
        end
    endcase
end

//==============================
// d_flip_flop__we
//==============================
d_flip_flop #(.WIDTH(1)) d_flip_flop__we
(
    .clk(clk),
    .rst(rst),
    .en(en__we),
    .d(jwe),
    .q(we)
);

//==============================
// d_flip_flop__addr
//==============================
d_flip_flop #(.WIDTH(40)) d_flip_flop__addr
(
    .clk(clk),
    .rst(rst),
    .en(en__addr),
    .d(jaddr),
    .q(addr)
);

//==============================
// d_flip_flop__size
//==============================
d_flip_flop #(.WIDTH(2)) d_flip_flop__size
(
    .clk(clk),
    .rst(rst),
    .en(en__size),
    .d(jsize),
    .q(size)
);

//==============================
// d_flip_flop__wr_data
//==============================
d_flip_flop #(.WIDTH(64)) d_flip_flop__wr_data
(
    .clk(clk),
    .rst(rst),
    .en(en__wr_data),
    .d(jwr_data),
    .q(wr_data)
);

//==============================
// d_flip_flop__jresp
//==============================
d_flip_flop #(.WIDTH(1)) d_flip_flop__jresp
(
    .clk(clk),
    .rst(rst),
    .en(en__jresp),
    .d(resp),
    .q(jresp)
);

//==============================
// d_flip_flop__jrd_data
//==============================
d_flip_flop #(.WIDTH(64)) d_flip_flop__jrd_data
(
    .clk(clk),
    .rst(rst),
    .en(en__jrd_data),
    .d(rd_data),
    .q(jrd_data)
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
