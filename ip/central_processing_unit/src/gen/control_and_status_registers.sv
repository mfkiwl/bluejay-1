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



always_comb begin
    mstatus__we = 1'b0;
    mie__we = 1'b0;

    case (addr)
        12'h301:
        begin
            rd_data = misa;
        end
        12'hf11:
        begin
            rd_data = mvendorid;
        end
        12'hf13:
        begin
            rd_data = mimpid;
        end
        12'hf14:
        begin
            rd_data = mhartid;
        end
        12'h300:
        begin
            rd_data = mstatus;
            mstatus__we = we;
        end
        12'h305:
        begin
            rd_data = mtvec;
        end
        12'h302:
        begin
            rd_data = medeleg;
        end
        12'h303:
        begin
            rd_data = mideleg;
        end
        12'h344:
        begin
            rd_data = mip;
        end
        12'h304:
        begin
            rd_data = mie;
            mie__we = we;
        end
    endcase
end



//==============================================
// Machine ISA Register (misa)
//==============================================
logic [63:0] misa;

assign misa[25:0] = 26'h0_00_01_00;
assign misa[61:26] = 36'h0;
assign misa[63:62] = 2'h2;


//==============================================
// Machine Vendor ID Register (mvendorid)
//==============================================
logic [63:0] mvendorid;

assign mvendorid[63:0] = 64'h0;


//==============================================
// Machine Implementation ID Register (mimpid)
//==============================================
logic [63:0] mimpid;

assign mimpid[63:0] = 64'h0;


//==============================================
// Hart ID Register (mhartid) 
//==============================================
logic [63:0] mhartid;

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
        mstatus[7] <= 1'b0;
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

assign mtvec[1:0] = 2'h0;
assign mtvec[63:2] = 62'h0;


//============================================== 
// Machine Exception Delegation Register (medeleg) 
//==============================================
logic [63:0] medeleg;

assign medeleg[63:0] = 64'h0;

//============================================== 
// Machine Interrupt Delegation Register (mideleg) 
//==============================================
logic [63:0] mideleg;

assign mideleg[63:0] = 64'h0;


//============================================== 
// Machine Interrupt-Pending Register (mip) 
//==============================================
logic [63:0] mip;

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



//logic [63:0] mcause;
//logic [63:0] mepc;
//
//
//
//// mcause
//always_ff @(posedge clk) begin
//    mcause[62:0] <= mcause__n[62:0];
//    mcause[63] <= mcause__n[63];
//end
//
//// mepc
//always_ff @(posedge clk) begin
//    mepc[63:0] <= mepc__n[63:0];
//end
//







// marchid
//assign marchid[63:0] = 64'h0;


// medeleg

// mideleg


//// mtime (EDIT: Memory Mapped?)
//always_ff @(posedge clk) begin
//    if (rst) begin
//        mtime[63:0] <= 64'h0;
//    end
//end
//
//// mtimecmp (EDIT: Memory Mapped?)
//always_ff @(posedge clk) begin
//    if (rst) begin
//        mtimecmp[63:0] <= 64'h0;
//    end
//end
//
//// mcycle
//always_ff @(posedge clk) begin
//    if (rst) begin
//        mcycle[63:0] <= 64'h0;
//    end
//    else begin
//        mcycle[63:0] <= 64'h0;
//    end
//end
//
//
//// minstret
//always_ff @(posedge clk) begin
//    if (rst) begin
//        minstret[CSR__MINSTRET__MINSTRET__FIELD] <= CSR__MCYCLE__MINSTRET__RESET_VALUE;
//    end
//    else begin
//        if (we) begin
//            case (op)
//                CSR_OP__WRITE:
//                begin
//                    minstret[CSR__MINSTRET__MINSTRET__FIELD] <= wr_data;
//                end
//                CSR_OP__SET:
//                begin
//                    minstret[CSR__MINSTRET__MINSTRET__FIELD] <= minstret[CSR__MINSTRET__MINSTRET__FIELD] | wr_data;
//                end
//                CSR_OP__CLEAR:
//                begin
//                    minstret[CSR__MINSTRET__MINSTRET__FIELD] <= minstret[CSR__MINSTRET__MINSTRET__FIELD] & ~wr_data;
//                end
//            endcase
//        end
//        else if (instret) begin
//            minstret[CSR__MINSTRET__MINSTRET__FIELD] <= minstret[CSR__MINSTRET__MINSTRET__FIELD] + 1;
//        end
//    end
//end


endmodule

