//==============================================
// jbus__slave
//==============================================
module jbus__slave
(
    input clk,
    input rst,
    output logic jcs,
    output logic jwe,
    output logic [39:0] jaddr,
    output logic [1:0] jsize,
    output logic [63:0] jwr_data,
    input jready,
    input jresp,
    input [63:0] jrd_data,
    input cs,
    input we,
    input [39:0] addr,
    input [1:0] size,
    input [63:0] wr_data,
    output logic ready,
    output logic resp,
    output logic [63:0] rd_data
);

logic [1:0] state;
logic [1:0] state__n;

logic en__jwe;
logic en__jaddr;
logic en__jsize;
logic en__jwr_data;
logic en__resp;
logic en__rd_data;

always_comb
begin
    ready = 1'b0;
    jcs = 1'b0;
    en__jwe = 1'b0;
    en__jaddr = 1'b0;
    en__jsize = 1'b0;
    en__jwr_data = 1'b0;
    en__resp = 1'b0;
    en__rd_data = 1'b0;

    case (state)
        //==============================
        // STATE__READY
        //==============================
        STATE__READY:
        begin
            en__jwe = cs;
            en__jaddr = cs;
            en__jsize = cs;
            en__jwr_data = cs;
            state__n = cs ? STATE__REQ : STATE__READY;
        end

        //==============================
        // STATE__REQ
        //==============================
        STATE__REQ:
        begin
            jcs = 1'b1;
            en__resp = jready;
            en__rd_data = jready;
            state__n = jready ? STATE__RESP : STATE__REQ;
        end

        //==============================
        // STATE__RESP
        //==============================
        STATE__RESP:
        begin
            ready = 1'b1;
            state__n = STATE__READY;
        end
    endcase
end

//==============================
// d_flip_flop__jwe
//==============================
d_flip_flop #(.WIDTH(1)) d_flip_flop__jwe
(
    .clk(clk),
    .rst(rst),
    .en(en__jwe),
    .d(we),
    .q(jwe)
);

//==============================
// d_flip_flop__jaddr
//==============================
d_flip_flop #(.WIDTH(40)) d_flip_flop__jaddr
(
    .clk(clk),
    .rst(rst),
    .en(en__jaddr),
    .d(addr),
    .q(jaddr)
);

//==============================
// d_flip_flop__jsize
//==============================
d_flip_flop #(.WIDTH(2)) d_flip_flop__jsize
(
    .clk(clk),
    .rst(rst),
    .en(en__jsize),
    .d(size),
    .q(jsize)
);

//==============================
// d_flip_flop__jwr_data
//==============================
d_flip_flop #(.WIDTH(64)) d_flip_flop__jwr_data
(
    .clk(clk),
    .rst(rst),
    .en(en__jwr_data),
    .d(wr_data),
    .q(jwr_data)
);

//==============================
// d_flip_flop__resp
//==============================
d_flip_flop #(.WIDTH(1)) d_flip_flop__resp
(
    .clk(clk),
    .rst(rst),
    .en(en__resp),
    .d(jresp),
    .q(resp)
);

//==============================
// d_flip_flop__rd_data
//==============================
d_flip_flop #(.WIDTH(64)) d_flip_flop__rd_data
(
    .clk(clk),
    .rst(rst),
    .en(en__rd_data),
    .d(jrd_data),
    .q(rd_data)
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
