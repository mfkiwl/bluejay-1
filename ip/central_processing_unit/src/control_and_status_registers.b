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
        CSR__MISA:
        begin
            rd_data = misa;
            we__misa = we;
        end
        CSR__MVENDORID:
        begin
            rd_data = mvendorid;
            we__mvendorid = we;
        end
        CSR__MARCHID:
        begin
            rd_data = marchid;
            we__marchid = we;
        end
        CSR__MIMPID:
        begin
            rd_data = mimpid;
            we__mimpid = we;
        end
        CSR__MHARTID:
        begin
            rd_data = mhartid;
            we__mhartid = we;
        end
        CSR__MSTATUS:
        begin
            rd_data = mstatus;
            we__mstatus = we;
        end
        CSR__MTVEC:
        begin
            rd_data = mtvec;
            we__mtvec = we;
        end
        CSR__MEDELEG:
        begin
            rd_data = medeleg;
            we__medeleg = we;
        end
        CSR__MIDELEG:
        begin
            rd_data = mideleg;
            we__mideleg = we;
        end
        CSR__MIP:
        begin
            rd_data = mip;
            we__mip = we;
        end
        CSR__MIE:
        begin
            rd_data = mie;
            we__mie = we;
        end
        CSR__MCYCLE:
        begin
            rd_data = mcycle;
            we__mcycle = we;
        end
        CSR__MINSTRET:
        begin
            rd_data = minstret;
            we__minstret = we;
        end
        CSR__MHPMCOUNTER3:
        begin
            rd_data = mhpmcounter3;
            we__mhpmcounter3 = we;
        end
        CSR__MHPMEVENT3:
        begin
            rd_data = mhpmevent3;
            we__mhpmevent3 = we;
        end
        CSR__MSCRATCH:
        begin
            rd_data = mscratch; 
            we__mscratch = we;
        end
        CSR__MEPC:
        begin
            rd_data = mepc;
            we__mepc = we;
        end
        CSR__MCAUSE:
        begin
            rd_data = mcause;
            we__mcause = we;
        end
        CSR__MTVAL:
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

assign misa[CSR__MISA__EXTENSIONS__FIELD] = CSR__MISA__EXTENSIONS__I;
assign misa[CSR__MISA__WIRI__0__FIELD] = CSR__MISA__WIRI__0__VALUE;
assign misa[CSR__MISA__BASE__FIELD] = CSR__MISA__BASE__RV64;


//==============================================
// Machine Vendor ID Register (mvendorid)
//==============================================
logic [63:0] mvendorid;
logic we__mvendorid;

assign mvendorid[CSR__MVENDORID__VENDOR__FIELD] = CSR__MVENDORID__VENDOR__VALUE;


//==============================================
// Machine Architecture ID Register (marchid)
//==============================================
logic [63:0] marchid;
logic we__marchid;

assign marchid[CSR__MARCHID__ARCHITECTURE_ID__FIELD] = CSR__MARCHID__ARCHITECTURE_ID__VALUE;



//==============================================
// Machine Implementation ID Register (mimpid)
//==============================================
logic [63:0] mimpid;
logic we__mimpid;

assign mimpid[CSR__MIMPID__IMPLEMENTATION__FIELD] = CSR__MIMPID__IMPLEMENTATION__VALUE;


//==============================================
// Hart ID Register (mhartid) 
//==============================================
logic [63:0] mhartid;
logic we__mhartid;

assign mhartid[CSR__MHARTID__HART_ID__FIELD] = CSR__MHARTID__HART_ID__VALUE;


//============================================== 
// Machine Status Register (mstatus) 
//==============================================
logic [63:0] mstatus;
logic we__mstatus;

assign mstatus[CSR__MSTATUS__UIE__FIELD] = CSR__MSTATUS__UIE__DISABLED;
assign mstatus[CSR__MSTATUS__SIE__FIELD] = CSR__MSTATUS__SIE__DISABLED;
assign mstatus[CSR__MSTATUS__HIE__FIELD] = CSR__MSTATUS__HIE__DISABLED;
assign mstatus[CSR__MSTATUS__UPIE__FIELD] = CSR__MSTATUS__UPIE__DISABLED;
assign mstatus[CSR__MSTATUS__SPIE__FIELD] = CSR__MSTATUS__SPIE__DISABLED;
assign mstatus[CSR__MSTATUS__HPIE__FIELD] = CSR__MSTATUS__HPIE__DISABLED;
assign mstatus[CSR__MSTATUS__SPP__FIELD] = CSR__MSTATUS__SPP__USER;
assign mstatus[CSR__MSTATUS__HPP__FIELD] = CSR__MSTATUS__HPP__USER;
assign mstatus[CSR__MSTATUS__MPP__FIELD] = CSR__MSTATUS__MPP__MACHINE;
assign mstatus[CSR__MSTATUS__FS__FIELD] = CSR__MSTATUS__FS__OFF;
assign mstatus[CSR__MSTATUS__XS__FIELD] = CSR__MSTATUS__XS__OFF;
assign mstatus[CSR__MSTATUS__MPRV__FIELD] = CSR__MSTATUS__MPRV__DISABLED;
assign mstatus[CSR__MSTATUS__PUM__FIELD] = CSR__MSTATUS__PUM__DISABLED;
assign mstatus[CSR__MSTATUS__MXR__FIELD] = CSR__MSTATUS__MXR__DISABLED;
assign mstatus[CSR__MSTATUS__VM__FIELD] = CSR__MSTATUS__VM__MBARE;
assign mstatus[CSR__MSTATUS__SD__FIELD] = CSR__MSTATUS__SD__NOT_DIRTY;

always_ff @(posedge clk) 
begin
    if (rst) 
    begin
        mstatus[CSR__MSTATUS__MIE__FIELD] <= CSR__MSTATUS__MIE__DISABLED;
        mstatus[CSR__MSTATUS__MPIE__FIELD] <= CSR__MSTATUS__MPIE__ENABLED;
        mstatus[CSR__MSTATUS__WPRI__0__FIELD] <= CSR__MSTATUS__WPRI__0__RESET_VALUE;
        mstatus[CSR__MSTATUS__WPRI__1__FIELD] <= CSR__MSTATUS__WPRI__1__RESET_VALUE;
    end
    else
    begin
        if (we__mstatus)
        begin
            mstatus[CSR__MSTATUS__MIE__FIELD] <= wr_data[CSR__MSTATUS__MIE__FIELD];
            mstatus[CSR__MSTATUS__MPIE__FIELD] <= wr_data[CSR__MSTATUS__MPIE__FIELD];
            mstatus[CSR__MSTATUS__WPRI__0__FIELD] <= wr_data[CSR__MSTATUS__WPRI__0__FIELD];
            mstatus[CSR__MSTATUS__WPRI__1__FIELD] <= wr_data[CSR__MSTATUS__WPRI__1__FIELD];
        end
    end
end


//============================================== 
// Machine Trap-Vector Base-Address Register (mtvec)
//==============================================
logic [63:0] mtvec;
logic we__mtvec;

assign mtvec[CSR__MTVEC__OFFSET__FIELD] = CSR__MTVEC__OFFSET__VALUE;

always_ff @(posedge clk)
begin
    if (rst)
    begin
        mtvec[CSR__MTVEC__TRAP_VECTOR_BASE_ADDRESS__FIELD] <= CSR__MTVEC__TRAP_VECTOR_BASE_ADDRESS__VALUE;
    end
    else
    begin
        if (we__mtvec)
        begin
            mtvec[CSR__MTVEC__TRAP_VECTOR_BASE_ADDRESS__FIELD] <= wr_data[CSR__MTVEC__TRAP_VECTOR_BASE_ADDRESS__FIELD];
        end
    end
end




//============================================== 
// Machine Exception Delegation Register (medeleg) 
//==============================================
logic [63:0] medeleg;
logic we__medeleg;

assign medeleg[CSR__MEDELEG__SYNCHRONOUS_EXCEPTIONS__FIELD] = CSR__MEDELEG__SYNCHRONOUS_EXCEPTIONS__VALUE;

//============================================== 
// Machine Interrupt Delegation Register (mideleg) 
//==============================================
logic [63:0] mideleg;
logic we__mideleg;

assign mideleg[CSR__MIDELEG__INTERRUPTS__FIELD] = CSR__MIDELEG__INTERRUPTS__VALUE;


//============================================== 
// Machine Interrupt-Pending Register (mip) 
//==============================================
logic [63:0] mip;
logic we__mip;

assign mip[CSR__MIP__USIP__FIELD] = CSR__MIP__USIP__NOT_PENDING;
assign mip[CSR__MIP__SSIP__FIELD] = CSR__MIP__SSIP__NOT_PENDING;
assign mip[CSR__MIP__HSIP__FIELD] = CSR__MIP__HSIP__NOT_PENDING;
assign mip[CSR__MIP__UTIP__FIELD] = CSR__MIP__UTIP__NOT_PENDING;
assign mip[CSR__MIP__STIP__FIELD] = CSR__MIP__STIP__NOT_PENDING;
assign mip[CSR__MIP__HTIP__FIELD] = CSR__MIP__HTIP__NOT_PENDING;
assign mip[CSR__MIP__UEIP__FIELD] = CSR__MIP__UEIP__NOT_PENDING;
assign mip[CSR__MIP__SEIP__FIELD] = CSR__MIP__SEIP__NOT_PENDING;
assign mip[CSR__MIP__HEIP__FIELD] = CSR__MIP__HEIP__NOT_PENDING;
assign mip[CSR__MIP__WIRI__0__FIELD] = CSR__MIP__WIRI__0__VALUE;

always_ff @(posedge clk)
begin
    if (rst) 
    begin
        mip[CSR__MIP__MSIP__FIELD] <= CSR__MIP__MSIP__NOT_PENDING;
    end
    else
    begin
        mip[CSR__MIP__MSIP__FIELD] <= CSR__MIP__MSIP__NOT_PENDING;
    end
end


// FIXME: The tip/eip bit will (likely) be retimed from the PLIC. Make sure the is no issues with X propagation upon reset. 
always_ff @(posedge clk)
begin
    mip[CSR__MIP__MTIP__FIELD] <= tip;
    mip[CSR__MIP__MEIP__FIELD] <= eip;
end

//============================================== 
// Machine Interrupt-Enable Register (mie) 
//==============================================
logic [63:0] mie;
logic we__mie;

assign mie[CSR__MIE__USIE__FIELD] = CSR__MIE__USIE__DISABLED;
assign mie[CSR__MIE__SSIE__FIELD] = CSR__MIE__SSIE__DISABLED;
assign mie[CSR__MIE__HSIE__FIELD] = CSR__MIE__HSIE__DISABLED;
assign mie[CSR__MIE__UTIE__FIELD] = CSR__MIE__UTIE__DISABLED;
assign mie[CSR__MIE__STIE__FIELD] = CSR__MIE__STIE__DISABLED;
assign mie[CSR__MIE__HTIE__FIELD] = CSR__MIE__HTIE__DISABLED;
assign mie[CSR__MIE__UEIE__FIELD] = CSR__MIE__UEIE__DISABLED;
assign mie[CSR__MIE__SEIE__FIELD] = CSR__MIE__SEIE__DISABLED;
assign mie[CSR__MIE__HEIE__FIELD] = CSR__MIE__HEIE__DISABLED;
assign mie[CSR__MIE__WPRI__0__FIELD] = CSR__MIE__WPRI__0__VALUE;

always_ff @(posedge clk)
begin
    if (rst)
    begin
        mie[CSR__MIE__MSIE__FIELD] <= CSR__MIE__MSIE__DISABLED;
        mie[CSR__MIE__MTIE__FIELD] <= CSR__MIE__MTIE__DISABLED;
        mie[CSR__MIE__MEIE__FIELD] <= CSR__MIE__MEIE__DISABLED;
    end
    else
    begin
        if (we__mie)
        begin
            mie[CSR__MIE__MSIE__FIELD] <= wr_data[CSR__MIE__MSIE__FIELD];
            mie[CSR__MIE__MTIE__FIELD] <= wr_data[CSR__MIE__MTIE__FIELD];
            mie[CSR__MIE__MEIE__FIELD] <= wr_data[CSR__MIE__MEIE__FIELD];
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
        mcycle[CSR__MCYCLE__MCYCLE__FIELD] <= CSR__MCYCLE__MCYCLE__RESET_VALUE;
    end
    else
    begin
        if (we__mcycle)
        begin
            mcycle[CSR__MCYCLE__MCYCLE__FIELD] <= wr_data[CSR__MCYCLE__MCYCLE__FIELD];
        end
        else
        begin
            mcycle[CSR__MCYCLE__MCYCLE__FIELD] <= mcycle[CSR__MCYCLE__MCYCLE__FIELD] + 1;
        end
    end
end

//============================================== 
// Machine Instruction Retire Register (minstret) 
//==============================================
logic [63:0] minstret;
logic we__minstret;
logic minstret__write_occured;
logic state__minstret;
logic state__minstret__n;

always_ff @(posedge clk)
begin
    if (rst)
    begin
        minstret[CSR__MINSTRET__MINSTRET__FIELD] <= CSR__MINSTRET__MINSTRET__RESET_VALUE;
    end
    else
    begin
        if (we__minstret)
        begin
            minstret[CSR__MINSTRET__MINSTRET__FIELD] <= wr_data[CSR__MINSTRET__MINSTRET__FIELD];
        end
        else if (instret && ~minstret__write_occurred)
        begin
            minstret[CSR__MINSTRET__MINSTRET__FIELD] <= minstret[CSR__MINSTRET__MINSTRET__FIELD] + 1;
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
            state__n = instret ? STATE__MINSTRET__NORMAL : STATE__MINSTRET__WRITE_OCCURED;
        end
    endcase
end


//============================================== 
// Machine Hardware Performance Monitor Counter 3 (mhpmcounter3)
//==============================================
logic [63:0] mhpmcounter3;
logic we__mhpmcounter3;

assign mhpmcounter3[CSR__MHPMCOUNTER3__MHPMCOUNTER3__FIELD] = CSR__MHPMCOUNTER3__MHPMCOUNTER3__VALUE;


//============================================== 
// Machine Hardware Performance Monitor Event 3 (mhpmevent3)
//==============================================
logic [63:0] mhpmevent3;
logic we__mhpmevent3;

assign mhpmevent3[CSR__MHPMEVENT3__MHPMEVENT3__FIELD] = CSR__MHPMEVENT3__MHPMEVENT3__VALUE;


//============================================== 
// Machine Scratch Register (mscratch) 
//==============================================
logic [63:0] mscratch;
logic we__mscratch;

always_ff @(posedge clk)
begin
    if (rst)
    begin
        mscratch[CSR__MSCRATCH__MSCRATCH__FIELD] <= CSR__MSCRATCH__MSCRATCH__RESET_VALUE;
    end
    else
    begin
        if (we__mscratch)
        begin
            mscratch[CSR__MSCRATCH__MSCRATCH__FIELD] <= wr_data[CSR__MSCRATCH__MSCRATCH__FIELD];
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
        mepc[CSR__MEPC__MEPC__FIELD] <= CSR__MEPC__MEPC__RESET_VALUE;
    end
    else
    begin
        if (we__mepc)
        begin
            mepc[CSR__MEPC__MEPC__FIELD] <= wr_data[CSR__MEPC__MEPC__FIELD];
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
        mcause[CSR__MCAUSE__EXCEPTION_CODE__FIELD] <= CSR__MCAUSE__EXCEPTION_CODE__HARD_RESET;
        mcause[CSR__MCAUSE__INTERRUPT__FIELD] <= CSR__MCAUSE__INTERRUPT__NOT_INTERRUPT;
    end
    else
    begin
        if (we__mcause)
        begin
            mcause[CSR__MCAUSE__EXCEPTION_CODE__FIELD] <= wr_data[CSR__MCAUSE__EXCEPTION_CODE__FIELD];
            mcause[CSR__MCAUSE__INTERRUPT__FIELD] <= wr_data[CSR__MCAUSE__INTERRUPT__FIELD];
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
        mtval[CSR__MTVAL__MTVAL__FIELD] <= CSR__MTVAL__MTVAL__RESET_VALUE;
    end
    else
    begin
        if (we__mtval)
        begin
            mtval[CSR__MTVAL__MTVAL__FIELD] <= wr_data[CSR__MTVAL__MTVAL__FIELD];
        end
    end
end


endmodule

