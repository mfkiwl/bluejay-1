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
    input [63:0] wr_data
);

//logic we;
//logic [11:0] addr;
//logic [63:0] rd_data;
//logic [63:0] wr_data;


always_comb begin
    rd_data = misa;
    misa__we = 1'b0;
    mvendorid__we = 1'b0;
    marchid__we = 1'b0;
    mimpid__we = 1'b0;
    mhartid__we = 1'b0;
    mstatus__we = 1'b0;
    mtvec__we = 1'b0;
    medeleg__we = 1'b0;
    mideleg__we = 1'b0;
    mip__we = 1'b0;
    mie__we = 1'b0;
    mcycle__we = 1'b0;
    minstret__we = 1'b0;
    mhpmcounter3__we = 1'b0;
    mhpmevent3__we = 1'b0;
    mscratch__we = 1'b0;
    mepc__we = 1'b0;
    mcause__we = 1'b0;
    mtval__we = 1'b0;

    case (addr)
        12'h301:
        begin
            rd_data = misa;
            misa__we = we;
        end
        12'hf11:
        begin
            rd_data = mvendorid;
            mvendorid__we = we;
        end
        12'hf12:
        begin
            rd_data = marchid;
            marchid__we = we;
        end
        12'hf13:
        begin
            rd_data = mimpid;
            mimpid__we = we;
        end
        12'hf14:
        begin
            rd_data = mhartid;
            mhartid__we = we;
        end
        12'h300:
        begin
            rd_data = mstatus;
            mstatus__we = we;
        end
        12'h305:
        begin
            rd_data = mtvec;
            mtvec__we = we;
        end
        12'h302:
        begin
            rd_data = medeleg;
            medeleg__we = we;
        end
        12'h303:
        begin
            rd_data = mideleg;
            mideleg__we = we;
        end
        12'h344:
        begin
            rd_data = mip;
            mip__we = we;
        end
        12'h304:
        begin
            rd_data = mie;
            mie__we = we;
        end
        12'hb00:
        begin
            rd_data = mcycle;
            mcycle__we = we;
        end
        12'hb02:
        begin
            rd_data = minstret;
            minstret__we = we;
        end
        12'hb03:
        begin
            rd_data = mhpmcounter3;
            mhpmcounter3__we = we;
        end
        12'h323:
        begin
            rd_data = mhpmevent3;
            mhpmevent3__we = we;
        end
        12'h340:
        begin
            rd_data = mscratch; 
            mscratch__we = we;
        end
        12'h341:
        begin
            rd_data = mepc;
            mepc__we = we;
        end
        12'h342:
        begin
            rd_data = mcause;
            mcause__we = we;
        end
        12'h343:
        begin
            rd_data = mtval;
            mtval__we = we;
        end
    endcase
end


//==============================================
// Machine ISA Register (misa)
//==============================================
logic [63:0] misa;
logic misa__we;

assign misa[25:0] = 26'h0_00_01_00;
assign misa[61:26] = 36'h0;
assign misa[63:62] = 2'h2;


//==============================================
// Machine Vendor ID Register (mvendorid)
//==============================================
logic [63:0] mvendorid;
logic mvendorid__we;

assign mvendorid[63:0] = 64'h0;


//==============================================
// Machine Architecture ID Register (marchid)
//==============================================
logic [63:0] marchid;
logic marchid__we;

assign marchid[63:0] = 64'h0;



//==============================================
// Machine Implementation ID Register (mimpid)
//==============================================
logic [63:0] mimpid;
logic mimpid__we;

assign mimpid[63:0] = 64'h0;


//==============================================
// Hart ID Register (mhartid) 
//==============================================
logic [63:0] mhartid;
logic mhartid__we;

assign mhartid[63:0] = 64'h0;


//============================================== 
// Machine Status Register (mstatus) 
//==============================================
logic [63:0] mstatus;
logic mstatus__we;

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

always_ff @(posedge clk) begin
    if (rst) begin
        mstatus[3] <= 1'b0;
        mstatus[7] <= 1'b1;
        mstatus[23:20] <= 4'h0;
        mstatus[62:29] <= 33'h0;
    end
    else begin
        if (mstatus__we) begin
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
logic mtvec__we;

assign mtvec[1:0] = 2'h0;

always_ff @(posedge clk) begin
    if (rst) begin
        mtvec[63:2] <= 62'h0;
    end
    else begin
        if (mtvec__we) begin
            mtvec[63:2] <= wr_data[63:2];
        end
    end
end




//============================================== 
// Machine Exception Delegation Register (medeleg) 
//==============================================
logic [63:0] medeleg;
logic medeleg__we;

assign medeleg[63:0] = 64'h0;

//============================================== 
// Machine Interrupt Delegation Register (mideleg) 
//==============================================
logic [63:0] mideleg;
logic mideleg__we;

assign mideleg[63:0] = 64'h0;


//============================================== 
// Machine Interrupt-Pending Register (mip) 
//==============================================
logic [63:0] mip;
logic mip__we;

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

always_ff @(posedge clk) begin
    if (rst) begin
        mip[3] <= 1'b0;
        mip[7] <= 1'b0;
        mip[11] <= 1'b0;
    end
end

//============================================== 
// Machine Interrupt-Enable Register (mie) 
//==============================================
logic [63:0] mie;
logic mie__we;

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

always_ff @(posedge clk) begin
    if (rst) begin
        mie[3] <= 1'b0;
        mie[7] <= 1'b0;
        mie[11] <= 1'b0;
    end
    else begin
        if (mie__we) begin
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
logic mcycle__we;

always_ff @(posedge clk) begin
    if (rst) begin
        mcycle[63:0] <= 64'h0;
    end
    else begin
        if (mcycle__we) begin
            mcycle[63:0] <= wr_data[63:0];
        end
        else begin
            mcycle[63:0] <= mcycle[63:0] + 1;
        end
    end
end

//============================================== 
// Machine Instruction Retire Register (minstret) 
//==============================================
logic [63:0] minstret;
logic minstret__we;

always_ff @(posedge clk) begin
    if (rst) begin
        minstret[63:0] <= 64'h0;
    end
    else begin
        if (minstret__we) begin
            minstret[63:0] <= wr_data[63:0];
        end
    end
end


//============================================== 
// Machine Hardware Performance Monitor Counter 3 (mhpmcounter3)
//==============================================
logic [63:0] mhpmcounter3;
logic mhpmcounter3__we;

assign mhpmcounter3[63:0] = 64'h0;


//============================================== 
// Machine Hardware Performance Monitor Event 3 (mhpmevent3)
//==============================================
logic [63:0] mhpmevent3;
logic mhpmevent3__we;

assign mhpmevent3[63:0] = 64'h0;


//============================================== 
// Machine Scratch Register (mscratch) 
//==============================================
logic [63:0] mscratch;
logic mscratch__we;

always_ff @(posedge clk) begin
    if (rst) begin
        mscratch[63:0] <= 64'h0;
    end
    else begin
        if (mscratch__we) begin
            mscratch[63:0] <= wr_data[63:0];
        end
    end
end


//============================================== 
// Machine Exception Program Counter (mepc) 
//==============================================
logic [63:0] mepc;
logic mepc__we;

always_ff @(posedge clk) begin
    if (rst) begin
        mepc[63:0] <= 64'h0;
    end
    else begin
        if (mepc__we) begin
            mepc[63:0] <= wr_data[63:0];
        end
    end
end


//============================================== 
// Machine Cause Register (mcause) 
//==============================================
logic [63:0] mcause;
logic mcause__we;

always_ff @(posedge clk) begin
    if (rst) begin
        mcause[62:0] <= 63'h0;
        mcause[63] <= 1'b0;
    end
    else begin
        if (mcause__we) begin
            mcause[62:0] <= wr_data[62:0];
            mcause[63] <= wr_data[63];
        end
    end
end


//============================================== 
// Machine Trap Value Register (mtval) 
//==============================================
logic [63:0] mtval;
logic mtval__we;

always_ff @(posedge clk) begin
    if (rst) begin
        mtval[63:0] <= 64'h0;
    end
    else begin
        if (mtval__we) begin
            mtval[63:0] <= wr_data[63:0];
        end
    end
end


endmodule

