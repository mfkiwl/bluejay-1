//==============================================
// l1
//==============================================
module l1
(
    input clk,
    input rst,
    input cpu_to_l1__valid,
    output logic cpu_to_l1__ready,
    input cpu_to_l1__we,
    input [63:0] cpu_to_l1__addr,
    input [63:0] cpu_to_l1__wr_data,
    output logic cpu_to_l1__rd_data,
    input [2:0] cpu_to_l1__dtype,
    output logic [60:0] l1_to_mem__addr,
    output logic [63:0] l1_to_mem__wr_data,
    input [63:0] l1_to_mem__rd_data,
    output logic l1_to_mem__en,
    output logic l1_to_mem__we
);

logic [2:0] state;
logic [2:0] state__n;
logic [63:0] addr;
logic [63:0] addr__n;
logic we;
logic we__n;
logic [63:0] wr_data;
logic [63:0] wr_data__n;
logic [63:0] rd_data;
logic [63:0] rd_data__n;
logic [2:0] dtype;
logic [2:0] dtype__n;
logic [63:0] temp__0;
logic [63:0] temp__1;

always_ff @(posedge clk) begin
    if (rst) begin
        state <= STATE__IDLE;
    end
    else begin
        state <= state__n;
    end
end

always_ff @(posedge clk) begin
    addr <= addr__n;
end

always_ff @(posedge clk) begin
    we <= we__n;
end

always_ff @(posedge clk) begin
    wr_data <= wr_data__n;
end

always_ff @(posedge clk) begin
    rd_data <= rd_data__n;
end

always_ff @(posedge clk) begin
    dtype <= dtype__n;
end

assign l1_to_mem__addr = addr[63:3];
assign cpu_to_l1__rd_data = rd_data;


//==============================================
// Finite State Machine
//==============================================
parameter STATE__IDLE = 3'h0;
parameter STATE__REQUEST_DATA = 3'h1;
parameter STATE__WAIT__0 = 3'h2;
parameter STATE__WAIT__1 = 3'h3;
parameter STATE__READ = 3'h4;
parameter STATE__WRITE = 3'h5;

always_comb begin
    state__n = state;
    cpu_to_l1__ready = 1'b0;
    addr__n = addr;
    dtype__n = dytpe;
    wr_data__n = wr_data;
    rd_data__n = rd_data;
    l1_to_mem__en = 1'b0;
    l1_to_mem__we = 1'b0;

    case (state)

        //==============================
        // STATE__IDLE
        //==============================
        STATE__IDLE:
        begin
            cpu_to_l1__ready = 1'b1;

            if (cpu_to_l1__valid) begin
                addr__n = cpu_to_l1__addr;
                dtype__n = cpu_to_l1__dtype;
                wr_data__n = cpu_to_l1__data;
                we__n = cpu_to_l1__we;
                state__n = STATE__REQUEST_DATA;
            end
        end

        //==============================
        // STATE__REQUEST_DATA
        //==============================
        STATE__REQUEST_DATA:
        begin
            l1_to_mem__en = 1'b1;
            state__n = STATE__WAIT__0;
        end

        //==============================
        // STATE__WAIT__0
        //==============================
        STATE__WAIT__0:
        begin
            state__n = STATE__WAIT__1;
        end

        //==============================
        // STATE__WAIT__1
        //==============================
        STATE__WAIT__1:
        begin
            if (we) begin
                state__n = STATE__WRITE;
            end
            else begin
                state__n = STATE__READ;
            end
        end

        //==============================
        // STATE__READ
        //==============================
        STATE__READ:
        begin
            rd_data__n = temp__1;
            state__n = STATE__IDLE;
        end

        //==============================
        // STATE__WRITE
        //==============================
        STATE__WRITE:
        begin
            l1_to_mem__en = 1'b1;
            l1_to_mem__we = 1'b1;
            state__n = STATE__IDLE;
        end
    endcase
end



always_comb begin
    case (addr[2:0])
        3'h0:
        begin
            temp__0 = l1_to_mem__rd_data[63:0];
        end
        3'h1:
        begin
            temp__0 = {8'h0, l1_to_mem__rd_data[63:8]};
        end
        3'h2:
        begin
            temp__0 = {16'h0, l1_to_mem__rd_data[63:16]};
        end
        3'h3:
        begin
            temp__0 = {24'h0, l1_to_mem__rd_data[63:24]};
        end
        3'h4:
        begin
            temp__0 = {32'h0, l1_to_mem__rd_data[63:32]};
        end
        3'h5:
        begin
            temp__0 = {40'h0, l1_to_mem__rd_data[63:40]};
        end
        3'h6:
        begin
            temp__0 = {48'h0, l1_to_mem__rd_data[63:48]};
        end
        3'h7:
        begin
            temp__0 = {56'h0, l1_to_mem__rd_data[63:56]};
        end
    endcase
end

always_comb begin
    case (dtype)
        3'h0:
        begin
            temp__1 = temp__0[63:0];
        end
        3'h1:
        begin
            temp__1 = {{32{temp__0[31]}}, temp__0[31:0]};
        end
        3'h2:
        begin
            temp__1 = {32'h0, temp__0[31:0]};
        end
        3'h3:
        begin
            temp__1 = {{48{temp__0[15]}}, temp__0[15:0]};
        end
        3'h4:
        begin
            temp__1 = {48'h0, temp__0[31:0]};
        end
        3'h5:
        begin
            temp__1 = {{56{temp__0[7]}}, temp__0[7:0]};
        end
        3'h6:
        begin
            temp__1 = {56'h0}, temp__0[31:0]};
        end
    endcase
end

always_comb begin
    l1_to_mem__wr_data = l1_to_mem__rd_data;

    case (dtype)
        3'h0:
        begin
            l1_to_mem__wr_data = wr_data;
        end
        3'h1:
        begin
            case (addr[2])
                1'h0:
                begin
                    l1_to_mem__wr_data[31:0] = wr_data[31:0];
                end
                1'h1:
                begin
                    l1_to_mem__wr_data[63:32] = wr_data[31:0];
                end
            endcase
        end
        3'h3:
        begin
            case (addr[2:1])
                2'h0:
                begin
                    l1_to_mem__wr_data[15:0] = wr_data[15:0];
                end
                2'h1:
                begin
                    l1_to_mem__wr_data[31:16] = wr_data[15:0];
                end
                2'h2:
                begin
                    l1_to_mem__wr_data[47:32] = wr_data[15:0];
                end
                2'h3:
                begin
                    l1_to_mem__wr_data[63:48] = wr_data[15:0];
                end
            endcase
        end
        3'h5:
        begin
            case (addr[2:0])
                3'h0:
                begin
                    l1_to_mem__wr_data[7:0] = wr_data[7:0];
                end
                3'h1:
                begin
                    l1_to_mem__wr_data[15:8] = wr_data[7:0];
                end
                3'h2:
                begin
                    l1_to_mem__wr_data[23:16] = wr_data[7:0];
                end
                3'h3:
                begin
                    l1_to_mem__wr_data[31:24] = wr_data[7:0];
                end
                3'h4:
                begin
                    l1_to_mem__wr_data[39:32] = wr_data[7:0];
                end
                3'h5:
                begin
                    l1_to_mem__wr_data[47:40] = wr_data[7:0];
                end
                3'h6:
                begin
                    l1_to_mem__wr_data[55:48] = wr_data[7:0];
                end
                3'h7:
                begin
                    l1_to_mem__wr_data[63:56] = wr_data[7:0];
                end
            endcase
        end
    endcase
end

endmodule

