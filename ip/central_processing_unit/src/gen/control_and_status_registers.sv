//==============================================
// control_and_status_registers 
//==============================================
module control_and_status_registers
(
    input clk,
    input rst,
    input we,
    input [11:0] addr,
    output logic [63:0] rd_data,
    input [63:0] wr_data,
    input eip,
    input tip,
    input instret,
    output logic [63:0] mstatus,
    output logic [63:0] mie,
    output logic [63:0] mip
);


always_comb begin
    rd_data = misa;
    we__misa = 1'b0;
    we__mvendorid = 1'b0;
    we__marchid = 1'b0;
    we__mimpid = 1'b0;
    we__mhartid = 1'b0;
    we__mstatus = 1'b0;
    we__mtvec = 1'b0;
    we__medeleg = 1'b0;
    we__mideleg = 1'b0;
    we__mip = 1'b0;
    we__mie = 1'b0;
    we__mcycle = 1'b0;
    we__minstret = 1'b0;
    we__mhpmcounter3 = 1'b0;
    we__mhpmevent3 = 1'b0;
    we__mscratch = 1'b0;
    we__mepc = 1'b0;
    we__mcause = 1'b0;
    we__mtval = 1'b0;

    case (addr)
        12'h301:
        begin
            rd_data = misa;
            we__misa = we;
        end
        12'hf11:
        begin
            rd_data = mvendorid;
            we__mvendorid = we;
        end
        12'hf12:
        begin
            rd_data = marchid;
            we__marchid = we;
        end
        12'hf13:
        begin
            rd_data = mimpid;
            we__mimpid = we;
        end
        12'hf14:
        begin
            rd_data = mhartid;
            we__mhartid = we;
        end
        12'h300:
        begin
            rd_data = mstatus;
            we__mstatus = we;
        end
        12'h305:
        begin
            rd_data = mtvec;
            we__mtvec = we;
        end
        12'h302:
        begin
            rd_data = medeleg;
            we__medeleg = we;
        end
        12'h303:
        begin
            rd_data = mideleg;
            we__mideleg = we;
        end
        12'h344:
        begin
            rd_data = mip;
            we__mip = we;
        end
        12'h304:
        begin
            rd_data = mie;
            we__mie = we;
        end
        12'hb00:
        begin
            rd_data = mcycle;
            we__mcycle = we;
        end
        12'hb02:
        begin
            rd_data = minstret;
            we__minstret = we;
        end
        12'hb03:
        begin
            rd_data = mhpmcounter3;
            we__mhpmcounter3 = we;
        end
        12'h323:
        begin
            rd_data = mhpmevent3;
            we__mhpmevent3 = we;
        end
        12'h340:
        begin
            rd_data = mscratch; 
            we__mscratch = we;
        end
        12'h341:
        begin
            rd_data = mepc;
            we__mepc = we;
        end
        12'h342:
        begin
            rd_data = mcause;
            we__mcause = we;
        end
        12'h343:
        begin
            rd_data = mtval;
            we__mtval = we;
        end
    endcase
end


//==============================================
// Machine ISA Register (misa)
//==============================================
logic [63:0] misa;
logic we__misa;

assign misa[25:0] = 26'h0_00_01_00;
assign misa[61:26] = 36'h0;
assign misa[63:62] = 2'h2;


//==============================================
// Machine Vendor ID Register (mvendorid)
//==============================================
logic [63:0] mvendorid;
logic we__mvendorid;

assign mvendorid[63:0] = 64'h0;


//==============================================
// Machine Architecture ID Register (marchid)
//==============================================
logic [63:0] marchid;
logic we__marchid;

assign marchid[63:0] = 64'h0;



//==============================================
// Machine Implementation ID Register (mimpid)
//==============================================
logic [63:0] mimpid;
logic we__mimpid;

assign mimpid[63:0] = 64'h0;


//==============================================
// Hart ID Register (mhartid) 
//==============================================
logic [63:0] mhartid;
logic we__mhartid;

assign mhartid[63:0] = 64'h0;


//============================================== 
// Machine Status Register (mstatus) 
//==============================================
logic [63:0] mstatus;
logic we__mstatus;

assign mstatus[0] = 1'b0;
assign mstatus[1] = 1'b0;
assign mstatus[2] = 1'b0;
assign mstatus[4] = 1'b0;
assign mstatus[5] = 1'b0;
assign mstatus[6] = 1'b0;
assign mstatus[8] = 1'b0;
assign mstatus[10:9] = 2'h0;
assign mstatus[12:11] = 2'h3;
assign mstatus[14:13] = 2'h0;
assign mstatus[16:15] = 2'h0;
assign mstatus[17] = 1'b0;
assign mstatus[18] = 1'b0;
assign mstatus[19] = 1'b0;
assign mstatus[28:24] = 5'h0;
assign mstatus[63] = 1'b0;

always_ff @(posedge clk) 
begin
    if (rst) 
    begin
        mstatus[3] <= 1'b0;
        mstatus[7] <= 1'b1;
        mstatus[23:20] <= 4'h0;
        mstatus[62:29] <= 33'h0;
    end
    else
    begin
        if (we__mstatus)
        begin
            mstatus[3] <= wr_data[3];
            mstatus[7] <= wr_data[7];
            mstatus[23:20] <= wr_data[23:20];
            mstatus[62:29] <= wr_data[62:29];
        end
    end
end


//============================================== 
// Machine Trap-Vector Base-Address Register (mtvec)
//==============================================
logic [63:0] mtvec;
logic we__mtvec;

assign mtvec[1:0] = 2'h0;

always_ff @(posedge clk)
begin
    if (rst)
    begin
        mtvec[63:2] <= 62'h0;
    end
    else
    begin
        if (we__mtvec)
        begin
            mtvec[63:2] <= wr_data[63:2];
        end
    end
end




//============================================== 
// Machine Exception Delegation Register (medeleg) 
//==============================================
logic [63:0] medeleg;
logic we__medeleg;

assign medeleg[63:0] = 64'h0;

//============================================== 
// Machine Interrupt Delegation Register (mideleg) 
//==============================================
logic [63:0] mideleg;
logic we__mideleg;

assign mideleg[63:0] = 64'h0;


//============================================== 
// Machine Interrupt-Pending Register (mip) 
//==============================================
logic [63:0] mip;
logic we__mip;

assign mip[0] = 1'b0;
assign mip[1] = 1'b0;
assign mip[2] = 1'b0;
assign mip[4] = 1'b0;
assign mip[5] = 1'b0;
assign mip[6] = 1'b0;
assign mip[8] = 1'b0;
assign mip[9] = 1'b0;
assign mip[10] = 1'b0;
assign mip[63:12] = 52'h0;

always_ff @(posedge clk)
begin
    if (rst) 
    begin
        mip[3] <= 1'b0;
    end
    else
    begin
        mip[3] <= 1'b0;
    end
end


// FIXME: The tip/eip bit will (likely) be retimed from the PLIC. Make sure the is no issues with X propagation upon reset. 
always_ff @(posedge clk)
begin
    mip[7] <= tip;
    mip[11] <= eip;
end

//============================================== 
// Machine Interrupt-Enable Register (mie) 
//==============================================
logic [63:0] mie;
logic we__mie;

assign mie[0] = 1'b0;
assign mie[1] = 1'b0;
assign mie[2] = 1'b0;
assign mie[4] = 1'b0;
assign mie[5] = 1'b0;
assign mie[6] = 1'b0;
assign mie[8] = 1'b0;
assign mie[9] = 1'b0;
assign mie[10] = 1'b0;
assign mie[63:12] = 52'h0;

always_ff @(posedge clk)
begin
    if (rst)
    begin
        mie[3] <= 1'b0;
        mie[7] <= 1'b0;
        mie[11] <= 1'b0;
    end
    else
    begin
        if (we__mie)
        begin
            mie[3] <= wr_data[3];
            mie[7] <= wr_data[7];
            mie[11] <= wr_data[11];
        end
    end
end

//============================================== 
// Machine Cycle Register (mcycle) 
//==============================================
logic [63:0] mcycle;
logic we__mcycle;

always_ff @(posedge clk)
begin
    if (rst)
    begin
        mcycle[63:0] <= 64'h0;
    end
    else
    begin
        if (we__mcycle)
        begin
            mcycle[63:0] <= wr_data[63:0];
        end
        else
        begin
            mcycle[63:0] <= mcycle[63:0] + 1;
        end
    end
end

//============================================== 
// Machine Instruction Retire Register (minstret) 
//==============================================
logic [63:0] minstret;
logic we__minstret;
logic minstret__write_occurred;
logic state__minstret;
logic state__minstret__n;

always_ff @(posedge clk)
begin
    if (rst)
    begin
        minstret[63:0] <= 64'h0;
    end
    else
    begin
        if (we__minstret)
        begin
            minstret[63:0] <= wr_data[63:0];
        end
        else if (instret && ~minstret__write_occurred)
        begin
            minstret[63:0] <= minstret[63:0] + 1;
        end
    end
end

parameter STATE__MINSTRET__NORMAL = 1'b0;
parameter STATE__MINSTRET__WRITE_OCCURED = 1'b1;

always_comb
begin
    case (state__minstret)
        //==============================
        // STATE__MINSTRET__NORMAL
        //==============================
        STATE__MINSTRET__NORMAL:
        begin
            minstret__write_occurred = 1'b0; 
            state__minstret__n = we__minstret & ~instret ? STATE__MINSTRET__WRITE_OCCURED : STATE__MINSTRET__NORMAL;
        end

        //==============================
        // STATE__MINSTRET__WRITE_OCCURED
        //==============================
        STATE__MINSTRET__WRITE_OCCURED:
        begin
            minstret__write_occurred = 1'b1; 
            state__minstret__n = instret ? STATE__MINSTRET__NORMAL : STATE__MINSTRET__WRITE_OCCURED;
        end
    endcase
end


//============================================== 
// Machine Hardware Performance Monitor Counter 3 (mhpmcounter3)
//==============================================
logic [63:0] mhpmcounter3;
logic we__mhpmcounter3;

assign mhpmcounter3[63:0] = 64'h0;


//============================================== 
// Machine Hardware Performance Monitor Event 3 (mhpmevent3)
//==============================================
logic [63:0] mhpmevent3;
logic we__mhpmevent3;

assign mhpmevent3[63:0] = 64'h0;


//============================================== 
// Machine Scratch Register (mscratch) 
//==============================================
logic [63:0] mscratch;
logic we__mscratch;

always_ff @(posedge clk)
begin
    if (rst)
    begin
        mscratch[63:0] <= 64'h0;
    end
    else
    begin
        if (we__mscratch)
        begin
            mscratch[63:0] <= wr_data[63:0];
        end
    end
end


//============================================== 
// Machine Exception Program Counter (mepc) 
//==============================================
logic [63:0] mepc;
logic we__mepc;

always_ff @(posedge clk)
begin
    if (rst)
    begin
        mepc[63:0] <= 64'h0;
    end
    else
    begin
        if (we__mepc)
        begin
            mepc[63:0] <= wr_data[63:0];
        end
    end
end


//============================================== 
// Machine Cause Register (mcause) 
//==============================================
logic [63:0] mcause;
logic we__mcause;

always_ff @(posedge clk)
begin
    if (rst)
    begin
        mcause[62:0] <= 63'h0;
        mcause[63] <= 1'b0;
    end
    else
    begin
        if (we__mcause)
        begin
            mcause[62:0] <= wr_data[62:0];
            mcause[63] <= wr_data[63];
        end
    end
end


//============================================== 
// Machine Trap Value Register (mtval) 
//==============================================
logic [63:0] mtval;
logic we__mtval;

always_ff @(posedge clk)
begin
    if (rst)
    begin
        mtval[63:0] <= 64'h0;
    end
    else
    begin
        if (we__mtval)
        begin
            mtval[63:0] <= wr_data[63:0];
        end
    end
end


endmodule

