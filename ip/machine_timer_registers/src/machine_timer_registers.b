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
        MACHINE_TIMER_REGISTERS__MTIME:
        begin
            rd_data = mtime;
            we__mtime = we;
        end
        MACHINE_TIMER_REGISTERS__MTIMECMP:
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
logic [CSR__MTIME__MTIME__WIDTH-1:0] mtime__mtime;
logic [CSR__MTIME__MTIME__WIDTH-1:0] mtime__mtime__n;
logic we__mtime;
logic en__mtime;

assign mtime[CSR__MTIME__MTIME__FIELD] = mtime__mtime;

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
            mtime__mtime__n = wr_data[CSR__MTIME__MTIME__FIELD];
        end
    endcase
end

//==============================
// d_flip_flop__mtime__mtime
//==============================
d_flip_flop #(.WIDTH(CSR__MTIME__MTIME__WIDTH), .RESET_VALUE(CSR__MTIME__MTIME__RESET_VALUE)) d_flip_flop__mtime__mtime
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
logic [CSR__MTIMECMP__MTIMECMP__WIDTH-1:0] mtimecmp__mtimecmp;
logic we__mtimecmp;
logic en__mtimecmp;

assign mtimecmp[CSR__MTIMECMP__MTIMECMP__FIELD] = mtimecmp__mtimecmp;

assign en__mtimecmp = cs & we__mtimecmp;

//==============================
// d_flip_flop__mtimecmp__mtimecmp
//==============================
d_flip_flop #(.WIDTH(CSR__MTIMECMP__MTIMECMP__WIDTH), .RESET_VALUE(CSR__MTIMECMP__MTIMECMP__RESET_VALUE)) d_flip_flop__mtimecmp__mtimecmp
(
    .clk(clk),
    .rst(rst),
    .en(en__mtimecmp),
    .d(wr_data[CSR__MTIMECMP__MTIMECMP__FIELD]),
    .q(mtimecmp__mtimecmp)
);


endmodule
