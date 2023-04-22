//==============================================
// memory_management_unit 
//==============================================
module memory_management_unit
(
    input clk,
    input rst,
    output logic cs__0,
    output logic we__0,
    output logic [39:0] addr__0,
    output logic [1:0] size__0,
    output logic [63:0] wr_data__0,
    input ready__0,
    input [63:0] rd_data__0,
    input [7:0] pma__0,
    output logic cs__1,
    output logic we__1,
    output logic [39:0] addr__1,
    output logic [1:0] size__1,
    output logic [63:0] wr_data__1,
    input ready__1,
    input [63:0] rd_data__1,
    input [7:0] pma__1,
    output logic cs__2,
    output logic we__2,
    output logic [39:0] addr__2,
    output logic [1:0] size__2,
    output logic [63:0] wr_data__2,
    input ready__2,
    input [63:0] rd_data__2,
    input [7:0] pma__2,
    output logic cs__3,
    output logic we__3,
    output logic [39:0] addr__3,
    output logic [1:0] size__3,
    output logic [63:0] wr_data__3,
    input ready__3,
    input [63:0] rd_data__3,
    input [7:0] pma__3,
    output logic cs__4,
    output logic we__4,
    output logic [39:0] addr__4,
    output logic [1:0] size__4,
    output logic [63:0] wr_data__4,
    input ready__4,
    input [63:0] rd_data__4,
    input [7:0] pma__4,
    output logic cs__5,
    output logic we__5,
    output logic [39:0] addr__5,
    output logic [1:0] size__5,
    output logic [63:0] wr_data__5,
    input ready__5,
    input [63:0] rd_data__5,
    input [7:0] pma__5,
    output logic cs__6,
    output logic we__6,
    output logic [39:0] addr__6,
    output logic [1:0] size__6,
    output logic [63:0] wr_data__6,
    input ready__6,
    input [63:0] rd_data__6,
    input [7:0] pma__6,
    output logic cs__7,
    output logic we__7,
    output logic [39:0] addr__7,
    output logic [1:0] size__7,
    output logic [63:0] wr_data__7,
    input ready__7,
    input [63:0] rd_data__7,
    input [7:0] pma__7,
    input cs,
    input we,
    input [63:0] addr,
    input [1:0] size,
    input [63:0] wr_data,
    output logic ready,
    output logic resp,
    output logic [63:0] rd_data
);

logic [5:0] state;
logic [5:0] state__n;

logic we__x;
logic [39:0] addr__x;
logic [1:0] size__x;
logic [63:0] wr_data__x;
logic ready__x;
logic resp__x;
logic [63:0] rd_data__x__n;
logic [63:0] rd_data__x;

logic en__we__x;
logic en__addr__x;
logic en__size__x;
logic en__wr_data__x;
logic en__rd_data__x;

localparam STATE__RESET = 8'h0;
localparam STATE__READY = 8'h1;
localparam STATE__DECODE = 8'h2;
localparam STATE__RESP = 8'h3;
localparam STATE__ACCESS_FAULT = 8'h4;
localparam STATE__MISALIGNED_ADDRESS = 8'h5;
localparam STATE__REGION__0__PMA_CHECK = 8'h6;
localparam STATE__REGION__0__REQ = 8'h7;
localparam STATE__REGION__1__PMA_CHECK = 8'h8;
localparam STATE__REGION__1__REQ = 8'h9;
localparam STATE__REGION__2__PMA_CHECK = 8'ha;
localparam STATE__REGION__2__REQ = 8'hb;
localparam STATE__REGION__3__PMA_CHECK = 8'hc;
localparam STATE__REGION__3__REQ = 8'hd;
localparam STATE__REGION__4__PMA_CHECK = 8'he;
localparam STATE__REGION__4__REQ = 8'hf;
localparam STATE__REGION__5__PMA_CHECK = 8'h10;
localparam STATE__REGION__5__REQ = 8'h11;
localparam STATE__REGION__6__PMA_CHECK = 8'h12;
localparam STATE__REGION__6__REQ = 8'h13;
localparam STATE__REGION__7__PMA_CHECK = 8'h14;
localparam STATE__REGION__7__REQ = 8'h15;


always_comb
begin
    cs__0 = 1'b0;
    cs__1 = 1'b0;
    cs__2 = 1'b0;
    cs__3 = 1'b0;
    cs__4 = 1'b0;
    cs__5 = 1'b0;
    cs__6 = 1'b0;
    cs__7 = 1'b0;
    en__we__x = 1'b0;
    en__addr__x = 1'b0; 
    en__size__x = 1'b0; 
    en__wr_data__x = 1'b0; 
    en__rd_data__x = 1'b0; 
    ready = 1'b0;
    rd_data = rd_data__x;
    rd_data__x__n = rd_data__x;

    case (state)
        //==============================
        // STATE__RESET
        //==============================
        STATE__RESET:
        begin
            state__n = STATE__READY;
        end

        //==============================
        // STATE__READY
        //==============================
        STATE__READY:
        begin
            en__we__x = 1'b1;
            en__addr__x = 1'b1; 
            en__size__x = 1'b1; 
            en__wr_data__x = 1'b1; 
            state__n = cs ? STATE__DECODE : STATE__READY;
        end

        //==============================
        // STATE__DECODE
        //==============================
        STATE__DECODE:
        begin
            casez (addr__x)
            64'b0000_0000__0000_0000__0000_0000__0000_0000__0000_????__????_????__????_????__????_????:
            begin
                state__n = STATE__REGION__0__PMA_CHECK;
            end
            64'b0000_0000__0000_0000__0000_0000__0000_0000__1001_????__????_????__????_????__????_????:
            begin
                state__n = STATE__REGION__1__PMA_CHECK;
            end
            64'b0000_0000__0000_0000__0000_0000__0000_0000__1010_????__????_????__????_????__????_????:
            begin
                state__n = STATE__REGION__2__PMA_CHECK;
            end
            64'b0000_0000__0000_0000__0000_0000__0000_0000__1011_????__????_????__????_????__????_????:
            begin
                state__n = STATE__REGION__3__PMA_CHECK;
            end
            64'b0000_0000__0000_0000__0000_0000__0000_0000__1100_????__????_????__????_????__????_????:
            begin
                state__n = STATE__REGION__4__PMA_CHECK;
            end
            64'b0000_0000__0000_0000__0000_0000__0000_0000__1101_????__????_????__????_????__????_????:
            begin
                state__n = STATE__REGION__5__PMA_CHECK;
            end
            64'b0000_0000__0000_0000__0000_0000__0000_0000__1110_????__????_????__????_????__????_????:
            begin
                state__n = STATE__REGION__6__PMA_CHECK;
            end
            64'b0000_0000__0000_0000__0000_0000__0000_0000__1111_????__????_????__????_????__????_????:
            begin
                state__n = STATE__REGION__7__PMA_CHECK;
            end
            default:
            begin
                state__n = STATE__ACCESS_FAULT;
            end
            endcase
        end

        //==============================
        // STATE__REGION__0__PMA_CHECK
        //==============================
        STATE__REGION__0__PMA_CHECK:
        begin
            case (size__x)
                2'h0:
                begin
                    state__n = (pma__0[1:1] == 1'b0) ? STATE__ACCESS_FAULT : STATE__REGION__0__REQ;
                end
                2'h1:
                begin
                    state__n = (pma__0[2:2] == 1'b0) ? STATE__ACCESS_FAULT : (addr[0] != 1'b0) && (pma__0[5:5] == 1'b0) ? STATE__MISALIGNED_ADDRESS : STATE__REGION__0__REQ;
                end
                2'h2:
                begin
                    state__n = (pma__0[3:3] == 1'b0) ? STATE__ACCESS_FAULT : (addr[1:0] != 2'h0) && (pma__0[5:5] == 1'b0) ? STATE__MISALIGNED_ADDRESS : STATE__REGION__0__REQ;
                end
                2'h3:
                begin
                    state__n = (pma__0[4:4] == 1'b0) ? STATE__ACCESS_FAULT : (addr[2:0] != 3'h0) && (pma__0[5:5] == 1'b0)? STATE__MISALIGNED_ADDRESS : STATE__REGION__0__REQ;
                end
            endcase
        end

        //==============================
        // STATE__REGION__0__REQ
        //==============================
        STATE__REGION__0__REQ:
        begin
            cs__0 = 1'b1;
            en__rd_data__x = ready__0;
            rd_data__x__n = rd_data__0;
            state__n = ready__0 ? STATE__RESP : STATE__REGION__0__REQ;
        end

        //==============================
        // STATE__REGION__1__PMA_CHECK
        //==============================
        STATE__REGION__1__PMA_CHECK:
        begin
            case (size__x)
                2'h0:
                begin
                    state__n = (pma__1[1:1] == 1'b0) ? STATE__ACCESS_FAULT : STATE__REGION__1__REQ;
                end
                2'h1:
                begin
                    state__n = (pma__1[2:2] == 1'b0) ? STATE__ACCESS_FAULT : (addr[0] != 1'b0) && (pma__1[5:5] == 1'b0) ? STATE__MISALIGNED_ADDRESS : STATE__REGION__1__REQ;
                end
                2'h2:
                begin
                    state__n = (pma__1[3:3] == 1'b0) ? STATE__ACCESS_FAULT : (addr[1:0] != 2'h0) && (pma__1[5:5] == 1'b0) ? STATE__MISALIGNED_ADDRESS : STATE__REGION__1__REQ;
                end
                2'h3:
                begin
                    state__n = (pma__1[4:4] == 1'b0) ? STATE__ACCESS_FAULT : (addr[2:0] != 3'h0) && (pma__1[5:5] == 1'b0)? STATE__MISALIGNED_ADDRESS : STATE__REGION__1__REQ;
                end
            endcase
        end

        //==============================
        // STATE__REGION__1__REQ
        //==============================
        STATE__REGION__1__REQ:
        begin
            cs__1 = 1'b1;
            en__rd_data__x = ready__1;
            rd_data__x__n = rd_data__1;
            state__n = ready__1 ? STATE__RESP : STATE__REGION__1__REQ;
        end

        //==============================
        // STATE__REGION__2__PMA_CHECK
        //==============================
        STATE__REGION__2__PMA_CHECK:
        begin
            case (size__x)
                2'h0:
                begin
                    state__n = (pma__2[1:1] == 1'b0) ? STATE__ACCESS_FAULT : STATE__REGION__2__REQ;
                end
                2'h1:
                begin
                    state__n = (pma__2[2:2] == 1'b0) ? STATE__ACCESS_FAULT : (addr[0] != 1'b0) && (pma__2[5:5] == 1'b0) ? STATE__MISALIGNED_ADDRESS : STATE__REGION__2__REQ;
                end
                2'h2:
                begin
                    state__n = (pma__2[3:3] == 1'b0) ? STATE__ACCESS_FAULT : (addr[1:0] != 2'h0) && (pma__2[5:5] == 1'b0) ? STATE__MISALIGNED_ADDRESS : STATE__REGION__2__REQ;
                end
                2'h3:
                begin
                    state__n = (pma__2[4:4] == 1'b0) ? STATE__ACCESS_FAULT : (addr[2:0] != 3'h0) && (pma__2[5:5] == 1'b0)? STATE__MISALIGNED_ADDRESS : STATE__REGION__2__REQ;
                end
            endcase
        end

        //==============================
        // STATE__REGION__2__REQ
        //==============================
        STATE__REGION__2__REQ:
        begin
            cs__2 = 1'b1;
            en__rd_data__x = ready__2;
            rd_data__x__n = rd_data__2;
            state__n = ready__2 ? STATE__RESP : STATE__REGION__2__REQ;
        end

        //==============================
        // STATE__REGION__3__PMA_CHECK
        //==============================
        STATE__REGION__3__PMA_CHECK:
        begin
            case (size__x)
                2'h0:
                begin
                    state__n = (pma__3[1:1] == 1'b0) ? STATE__ACCESS_FAULT : STATE__REGION__3__REQ;
                end
                2'h1:
                begin
                    state__n = (pma__3[2:2] == 1'b0) ? STATE__ACCESS_FAULT : (addr[0] != 1'b0) && (pma__3[5:5] == 1'b0) ? STATE__MISALIGNED_ADDRESS : STATE__REGION__3__REQ;
                end
                2'h2:
                begin
                    state__n = (pma__3[3:3] == 1'b0) ? STATE__ACCESS_FAULT : (addr[1:0] != 2'h0) && (pma__3[5:5] == 1'b0) ? STATE__MISALIGNED_ADDRESS : STATE__REGION__3__REQ;
                end
                2'h3:
                begin
                    state__n = (pma__3[4:4] == 1'b0) ? STATE__ACCESS_FAULT : (addr[2:0] != 3'h0) && (pma__3[5:5] == 1'b0)? STATE__MISALIGNED_ADDRESS : STATE__REGION__3__REQ;
                end
            endcase
        end

        //==============================
        // STATE__REGION__3__REQ
        //==============================
        STATE__REGION__3__REQ:
        begin
            cs__3 = 1'b1;
            en__rd_data__x = ready__3;
            rd_data__x__n = rd_data__3;
            state__n = ready__3 ? STATE__RESP : STATE__REGION__3__REQ;
        end

        //==============================
        // STATE__REGION__4__PMA_CHECK
        //==============================
        STATE__REGION__4__PMA_CHECK:
        begin
            case (size__x)
                2'h0:
                begin
                    state__n = (pma__4[1:1] == 1'b0) ? STATE__ACCESS_FAULT : STATE__REGION__4__REQ;
                end
                2'h1:
                begin
                    state__n = (pma__4[2:2] == 1'b0) ? STATE__ACCESS_FAULT : (addr[0] != 1'b0) && (pma__4[5:5] == 1'b0) ? STATE__MISALIGNED_ADDRESS : STATE__REGION__4__REQ;
                end
                2'h2:
                begin
                    state__n = (pma__4[3:3] == 1'b0) ? STATE__ACCESS_FAULT : (addr[1:0] != 2'h0) && (pma__4[5:5] == 1'b0) ? STATE__MISALIGNED_ADDRESS : STATE__REGION__4__REQ;
                end
                2'h3:
                begin
                    state__n = (pma__4[4:4] == 1'b0) ? STATE__ACCESS_FAULT : (addr[2:0] != 3'h0) && (pma__4[5:5] == 1'b0)? STATE__MISALIGNED_ADDRESS : STATE__REGION__4__REQ;
                end
            endcase
        end

        //==============================
        // STATE__REGION__4__REQ
        //==============================
        STATE__REGION__4__REQ:
        begin
            cs__4 = 1'b1;
            en__rd_data__x = ready__4;
            rd_data__x__n = rd_data__4;
            state__n = ready__4 ? STATE__RESP : STATE__REGION__4__REQ;
        end

        //==============================
        // STATE__REGION__5__PMA_CHECK
        //==============================
        STATE__REGION__5__PMA_CHECK:
        begin
            case (size__x)
                2'h0:
                begin
                    state__n = (pma__5[1:1] == 1'b0) ? STATE__ACCESS_FAULT : STATE__REGION__5__REQ;
                end
                2'h1:
                begin
                    state__n = (pma__5[2:2] == 1'b0) ? STATE__ACCESS_FAULT : (addr[0] != 1'b0) && (pma__5[5:5] == 1'b0) ? STATE__MISALIGNED_ADDRESS : STATE__REGION__5__REQ;
                end
                2'h2:
                begin
                    state__n = (pma__5[3:3] == 1'b0) ? STATE__ACCESS_FAULT : (addr[1:0] != 2'h0) && (pma__5[5:5] == 1'b0) ? STATE__MISALIGNED_ADDRESS : STATE__REGION__5__REQ;
                end
                2'h3:
                begin
                    state__n = (pma__5[4:4] == 1'b0) ? STATE__ACCESS_FAULT : (addr[2:0] != 3'h0) && (pma__5[5:5] == 1'b0)? STATE__MISALIGNED_ADDRESS : STATE__REGION__5__REQ;
                end
            endcase
        end

        //==============================
        // STATE__REGION__5__REQ
        //==============================
        STATE__REGION__5__REQ:
        begin
            cs__5 = 1'b1;
            en__rd_data__x = ready__5;
            rd_data__x__n = rd_data__5;
            state__n = ready__5 ? STATE__RESP : STATE__REGION__5__REQ;
        end

        //==============================
        // STATE__REGION__6__PMA_CHECK
        //==============================
        STATE__REGION__6__PMA_CHECK:
        begin
            case (size__x)
                2'h0:
                begin
                    state__n = (pma__6[1:1] == 1'b0) ? STATE__ACCESS_FAULT : STATE__REGION__6__REQ;
                end
                2'h1:
                begin
                    state__n = (pma__6[2:2] == 1'b0) ? STATE__ACCESS_FAULT : (addr[0] != 1'b0) && (pma__6[5:5] == 1'b0) ? STATE__MISALIGNED_ADDRESS : STATE__REGION__6__REQ;
                end
                2'h2:
                begin
                    state__n = (pma__6[3:3] == 1'b0) ? STATE__ACCESS_FAULT : (addr[1:0] != 2'h0) && (pma__6[5:5] == 1'b0) ? STATE__MISALIGNED_ADDRESS : STATE__REGION__6__REQ;
                end
                2'h3:
                begin
                    state__n = (pma__6[4:4] == 1'b0) ? STATE__ACCESS_FAULT : (addr[2:0] != 3'h0) && (pma__6[5:5] == 1'b0)? STATE__MISALIGNED_ADDRESS : STATE__REGION__6__REQ;
                end
            endcase
        end

        //==============================
        // STATE__REGION__6__REQ
        //==============================
        STATE__REGION__6__REQ:
        begin
            cs__6 = 1'b1;
            en__rd_data__x = ready__6;
            rd_data__x__n = rd_data__6;
            state__n = ready__6 ? STATE__RESP : STATE__REGION__6__REQ;
        end

        //==============================
        // STATE__REGION__7__PMA_CHECK
        //==============================
        STATE__REGION__7__PMA_CHECK:
        begin
            case (size__x)
                2'h0:
                begin
                    state__n = (pma__7[1:1] == 1'b0) ? STATE__ACCESS_FAULT : STATE__REGION__7__REQ;
                end
                2'h1:
                begin
                    state__n = (pma__7[2:2] == 1'b0) ? STATE__ACCESS_FAULT : (addr[0] != 1'b0) && (pma__7[5:5] == 1'b0) ? STATE__MISALIGNED_ADDRESS : STATE__REGION__7__REQ;
                end
                2'h2:
                begin
                    state__n = (pma__7[3:3] == 1'b0) ? STATE__ACCESS_FAULT : (addr[1:0] != 2'h0) && (pma__7[5:5] == 1'b0) ? STATE__MISALIGNED_ADDRESS : STATE__REGION__7__REQ;
                end
                2'h3:
                begin
                    state__n = (pma__7[4:4] == 1'b0) ? STATE__ACCESS_FAULT : (addr[2:0] != 3'h0) && (pma__7[5:5] == 1'b0)? STATE__MISALIGNED_ADDRESS : STATE__REGION__7__REQ;
                end
            endcase
        end

        //==============================
        // STATE__REGION__7__REQ
        //==============================
        STATE__REGION__7__REQ:
        begin
            cs__7 = 1'b1;
            en__rd_data__x = ready__7;
            rd_data__x__n = rd_data__7;
            state__n = ready__7 ? STATE__RESP : STATE__REGION__7__REQ;
        end

            
        //==============================
        // STATE__RESP
        //==============================
        STATE__RESP:
        begin
            ready = 1'b1;
            resp = 1'b0;
            rd_data = rd_data__x;
            state__n = STATE__READY; 
        end

        //==============================
        // STATE__ACCESS_FAULT
        //==============================
        STATE__ACCESS_FAULT:
        begin
            ready = 1'b1;
            resp = 1'b1;
            rd_data = 64'h0;
            state__n = STATE__READY;
        end

        //==============================
        // STATE__MISALIGNED_ADDRESS
        //==============================
        STATE__MISALIGNED_ADDRESS:
        begin
            ready = 1'b1;
            resp = 1'b1;
            rd_data = 64'h1;
            state__n = STATE__READY;
        end
    endcase
end


assign we__0 = we__x;
assign addr__0 = addr__x;
assign size__0 = size__x;
assign wr_data__0 = wr_data__x;
assign we__1 = we__x;
assign addr__1 = addr__x;
assign size__1 = size__x;
assign wr_data__1 = wr_data__x;
assign we__2 = we__x;
assign addr__2 = addr__x;
assign size__2 = size__x;
assign wr_data__2 = wr_data__x;
assign we__3 = we__x;
assign addr__3 = addr__x;
assign size__3 = size__x;
assign wr_data__3 = wr_data__x;
assign we__4 = we__x;
assign addr__4 = addr__x;
assign size__4 = size__x;
assign wr_data__4 = wr_data__x;
assign we__5 = we__x;
assign addr__5 = addr__x;
assign size__5 = size__x;
assign wr_data__5 = wr_data__x;
assign we__6 = we__x;
assign addr__6 = addr__x;
assign size__6 = size__x;
assign wr_data__6 = wr_data__x;
assign we__7 = we__x;
assign addr__7 = addr__x;
assign size__7 = size__x;
assign wr_data__7 = wr_data__x;


//==============================
// d_flip_flop__we__x
//==============================
d_flip_flop #(.WIDTH(1)) d_flip_flop__we__x
(
    .clk(clk),
    .rst(rst),
    .en(en__we__x),
    .d(we),
    .q(we__x)
);

//==============================
// d_flip_flop__addr__x
//==============================
d_flip_flop #(.WIDTH(40)) d_flip_flop__addr__x
(
    .clk(clk),
    .rst(rst),
    .en(en__addr__x),
    .d(addr[39:0]),
    .q(addr__x)
);

//==============================
// d_flip_flop__size__x
//==============================
d_flip_flop #(.WIDTH(2)) d_flip_flop__size__x
(
    .clk(clk),
    .rst(rst),
    .en(en__size__x),
    .d(size),
    .q(size__x)
);

//==============================
// d_flip_flop__wr_data__x
//==============================
d_flip_flop #(.WIDTH(64)) d_flip_flop__wr_data__x
(
    .clk(clk),
    .rst(rst),
    .en(en__wr_data__x),
    .d(wr_data),
    .q(wr_data__x)
);

//==============================
// d_flip_flop__rd_data__x
//==============================
d_flip_flop #(.WIDTH(64)) d_flip_flop__rd_data__x
(
    .clk(clk),
    .rst(rst),
    .en(en__rd_data__x),
    .d(rd_data__x__n),
    .q(rd_data__x)
);

//==============================
// d_flip_flop__state
//==============================
d_flip_flop #(.WIDTH(6), .RESET_VALUE(STATE__RESET)) d_flip_flop__state
(
    .clk(clk),
    .rst(rst),
    .en(1'b1),
    .d(state__n),
    .q(state)
);


endmodule

