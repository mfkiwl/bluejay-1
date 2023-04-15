//==============================================
// machine_timer_registers 
//==============================================
module machine_timer_registers
(
    input clk,
    input rst,
    input cs,
    input we,
    input [3:0] addr,
    input [63:0] wr_data,
    output logic [63:0] rd_data,
    output logic tip
);


// Machine Time Register (mtime)
logic [63:0] mtime;
logic [MACHINE_TIMER_REGISTERS__MTIME__MTIME__WIDTH-1:0] mtime__mtime;
logic [MACHINE_TIMER_REGISTERS__MTIME__MTIME__WIDTH-1:0] mtime__mtime__n;
logic we__mtime;
logic en__mtime;

// Machine Time Compare Register (mtimecmp)
logic [63:0] mtimecmp;
logic [MACHINE_TIMER_REGISTERS__MTIMECMP__MTIMECMP__WIDTH-1:0] mtimecmp__mtimecmp;
logic we__mtimecmp;
logic en__mtimecmp;


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
assign mtime[MACHINE_TIMER_REGISTERS__MTIME__MTIME__FIELD] = mtime__mtime;

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
            mtime__mtime__n = wr_data[MACHINE_TIMER_REGISTERS__MTIME__MTIME__FIELD];
        end
    endcase
end

//==============================
// d_flip_flop__mtime__mtime
//==============================
d_flip_flop #(.WIDTH(MACHINE_TIMER_REGISTERS__MTIME__MTIME__WIDTH), .RESET_VALUE(MACHINE_TIMER_REGISTERS__MTIME__MTIME__RESET_VALUE)) d_flip_flop__mtime__mtime
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
assign mtimecmp[MACHINE_TIMER_REGISTERS__MTIMECMP__MTIMECMP__FIELD] = mtimecmp__mtimecmp;

assign en__mtimecmp = cs & we__mtimecmp;

//==============================
// d_flip_flop__mtimecmp__mtimecmp
//==============================
d_flip_flop #(.WIDTH(MACHINE_TIMER_REGISTERS__MTIMECMP__MTIMECMP__WIDTH), .RESET_VALUE(MACHINE_TIMER_REGISTERS__MTIMECMP__MTIMECMP__RESET_VALUE)) d_flip_flop__mtimecmp__mtimecmp
(
    .clk(clk),
    .rst(rst),
    .en(en__mtimecmp),
    .d(wr_data[MACHINE_TIMER_REGISTERS__MTIMECMP__MTIMECMP__FIELD]),
    .q(mtimecmp__mtimecmp)
);


endmodule
