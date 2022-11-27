//==============================================
// machine_timer_registers 
//==============================================
module machine_timer_registers
(
    input clk,
    input rst,
    input we,
    input addr,
    input [64:0] wr_data,
    output logic [64:0] rd_data,
    output logic tip 
);


logic [63:0] mtime;
logic [63:0] mtimecmp;


assign tip = mtime >= mtimecmp;

always_comb
begin
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


always_ff @(posedge clk)
begin
    if (rst) 
    begin
        mtime <= 64'h0;
    end
    else
    begin
        if (we__mtime)
        begin
            mtime <= wr_data;
        end
        else
        begin
            mtime <= mtime + 1;
        end
    end
end

always_ff @(posedge clk)
begin
    if (rst)
    begin
        mtimecmp <= 64'h0;
    end
    else
    begin
        if (we__mtimecmp)
        begin
            mtimecmp <= wr_data;    
        end
    end
end


endmodule
