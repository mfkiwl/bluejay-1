//==============================================
// machine_timer_registers 
//==============================================
module machine_timer_registers
(
    input clk,
    input rst,
    input cs,
    input we,
    input addr,
    input [64:0] wr_data,
    output logic [64:0] rd_data,
    output logic tip 
);


assign tip = mtime >= mtimecmp;


always_comb
begin
    we__mtime = 1'b0;
    we__mtimecmp = 1'b0;
            
    case (addr)
        1'b0:
        begin
            rd_data = mtime;
            we__mtime = we;
        end
        1'b1:
        begin
            rd_data = mtimecmp;
            we__mtimecmp = we;
        end
    endcase
end


//============================================== 
// Machine Time Register (mtime)
//==============================================
logic [63:0] mtime;
logic [63:0] mtime__mtime;
logic [63:0] mtime__mtime__n;
logic we__mtime;
logic en__mtime;

assign mtime[63:0] = mtime__mtime;

assign en__mtime = 1'b1; 

always_comb
begin
    case (en__mtime & we__mtime & cs)
        1'b0:
        begin
            mtime__mtime__n = mtime__mtime + 1;
        end
        1'b1:
        begin
            mtime__mtime__n = wr_data[63:0];
        end
    endcase
end

//==============================
// d_flip_flop__mtime__mtime
//==============================
d_flip_flop #(.WIDTH(64), .RESET_VALUE(64'h0)) d_flip_flop__mtime__mtime
(
    .clk(clk),
    .rst(rst),
    .en(en__mtime),
    .d(mtime__mtime__n),
    .q(mtime__mtime)
);


//============================================== 
// Machine Time Compare Register (mtimecmp)
//==============================================
logic [63:0] mtimecmp;
logic [63:0] mtimecmp__mtimecmp;
logic we__mtimecmp;
logic en__mtimecmp;

assign mtimecmp[63:0] = mtimecmp__mtimecmp;

assign en__mtimecmp = cs & we__mtimecmp;

//==============================
// d_flip_flop__mtimecmp__mtimecmp
//==============================
d_flip_flop #(.WIDTH(64), .RESET_VALUE(64'h0)) d_flip_flop__mtimecmp__mtimecmp
(
    .clk(clk),
    .rst(rst),
    .en(en__mtimecmp),
    .d(wr_data[63:0]),
    .q(mtimecmp__mtimecmp)
);


endmodule
