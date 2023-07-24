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
    output logic ready,
    output logic resp,
    output logic [63:0] rd_data,
    output logic tip
);

logic [63:0] mtime;
logic [63:0] mtimecmp;

logic en__mtime;
logic en__mtimecmp;

always_comb
begin
    ready = 1'b1;
    resp = 1'b0;
    rd_data = ERRORCODE__ACCESS_FAULT;
    en__mtime = 1'b0;
    en__mtimecmp = 1'b0;

    casez (addr)
        MACHINE_TIMER_REGISTERS__MTIME:
        begin
            rd_data = mtime;
            en__mtime = cs & we;
        end
        MACHINE_TIMER_REGISTERS__MTIMECMP:
        begin
            rd_data = mtimecmp;
            en__mtimecmp = cs & we;
        end
        default:
        begin
            resp = cs;
        end
    endcase
end

assign tip = mtime >= mtimecmp;

//==============================
// machine_timer_registers__mtime machine_timer_register__mtime__0
//==============================
machine_timer_registers__mtime machine_timer_register__mtime__0
(
    .clk(clk),
    .rst(rst),
    .en(en__mtime),
    .wr_data(wr_data),
    .mtime(mtime)
);

//==============================
// machine_timer_registers__mtimecmp machine_timer_register__mtimecmp__0
//==============================
machine_timer_registers__mtimecmp machine_timer_register__mtimecmp__0
(
    .clk(clk),
    .rst(rst),
    .en(en__mtimecmp),
    .wr_data(wr_data),
    .mtimecmp(mtimecmp)
);


endmodule

