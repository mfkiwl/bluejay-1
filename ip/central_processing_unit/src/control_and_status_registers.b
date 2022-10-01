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
        CSR__MISA:
        begin
            rd_data = misa;
        end
        CSR__MVENDORID:
        begin
            rd_data = mvendorid;
        end
        CSR__MIMPID:
        begin
            rd_data = mimpid;
        end
        CSR__MHARTID:
        begin
            rd_data = mhartid;
        end
        CSR__MSTATUS:
        begin
            rd_data = mstatus;
            mstatus__we = we;
        end
        CSR__MTVEC:
        begin
            rd_data = mtvec;
        end
        CSR__MEDELEG:
        begin
            rd_data = medeleg;
        end
        CSR__MIDELEG:
        begin
            rd_data = mideleg;
        end
        CSR__MIP:
        begin
            rd_data = mip;
        end
        CSR__MIE:
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

assign misa[CSR__MISA__EXTENSIONS__FIELD] = CSR__MISA__EXTENSIONS__I;
assign misa[CSR__MISA__WIRI__0__FIELD] = CSR__MISA__WIRI__0__VALUE;
assign misa[CSR__MISA__BASE__FIELD] = CSR__MISA__BASE__RV64;


//==============================================
// Machine Vendor ID Register (mvendorid)
//==============================================
logic [63:0] mvendorid;

assign mvendorid[CSR__MVENDORID__VENDOR__FIELD] = CSR__MVENDORID__VENDOR__VALUE;


//==============================================
// Machine Implementation ID Register (mimpid)
//==============================================
logic [63:0] mimpid;

assign mimpid[CSR__MIMPID__IMPLEMENTATION__FIELD] = CSR__MIMPID__IMPLEMENTATION__VALUE;


//==============================================
// Hart ID Register (mhartid) 
//==============================================
logic [63:0] mhartid;

assign mhartid[CSR__MHARTID__HART_ID__FIELD] = CSR__MHARTID__HART_ID__VALUE;


//============================================== 
// Machine Status Register (mstatus) 
//==============================================
logic [63:0] mstatus;
logic mstatus__we;

assign mstatus[CSR__MSTATUS__UIE__FIELD] = CSR__MSTATUS__UIE__DISABLED;
assign mstatus[CSR__MSTATUS__SIE__FIELD] = CSR__MSTATUS__SIE__DISABLED;
assign mstatus[CSR__MSTATUS__HIE__FIELD] = CSR__MSTATUS__HIE__DISABLED;
assign mstatus[CSR__MSTATUS__UPIE__FIELD] = CSR__MSTATUS__UPIE__DISABLED;
assign mstatus[CSR__MSTATUS__SPIE__FIELD] = CSR__MSTATUS__SPIE__DISABLED;
assign mstatus[CSR__MSTATUS__HPIE__FIELD] = CSR__MSTATUS__HPIE__DISABLED;
assign mstatus[CSR__MSTATUS__MPP__FIELD] = CSR__MSTATUS__MPP__MACHINE;
assign mstatus[CSR__MSTATUS__FS__FIELD] = CSR__MSTATUS__FS__OFF;
assign mstatus[CSR__MSTATUS__XS__FIELD] = CSR__MSTATUS__XS__OFF;
assign mstatus[CSR__MSTATUS__MPRV__FIELD] = CSR__MSTATUS__MPRV__DISABLED;
assign mstatus[CSR__MSTATUS__PUM__FIELD] = CSR__MSTATUS__PUM__DISABLED;
assign mstatus[CSR__MSTATUS__MXR__FIELD] = CSR__MSTATUS__MXR__DISABLED;
assign mstatus[CSR__MSTATUS__VM__FIELD] = CSR__MSTATUS__VM__MBARE;
assign mstatus[CSR__MSTATUS__SD__FIELD] = CSR__MSTATUS__SD__NOT_DIRTY;

always_ff @(posedge clk) begin
    if (rst) begin
        mstatus[CSR__MSTATUS__MIE__FIELD] <= CSR__MSTATUS__MIE__DISABLED;
        mstatus[CSR__MSTATUS__MPIE__FIELD] <= CSR__MSTATUS__MPIE__DISABLED;
        mstatus[CSR__MSTATUS__WPRI__0__FIELD] <= CSR__MSTATUS__WPRI__0__RESET_VALUE;
        mstatus[CSR__MSTATUS__WPRI__1__FIELD] <= CSR__MSTATUS__WPRI__1__RESET_VALUE;
    end
    else begin
        if (mstatus__we) begin
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

assign mtvec[CSR__MTVEC__OFFSET__FIELD] = CSR__MTVEC__OFFSET__VALUE;
assign mtvec[CSR__MTVEC__TRAP_VECTOR_BASE_ADDRESS__FIELD] <= CSR__MTVEC__TRAP_VECTOR_BASE_ADDRESS__VALUE;


//============================================== 
// Machine Exception Delegation Register (medeleg) 
//==============================================
logic [63:0] medeleg;

assign medeleg[CSR__MEDELEG__SYNCHRONOUS_EXCEPTIONS__FIELD] = CSR__MEDELEG__SYNCHRONOUS_EXCEPTIONS__VALUE;

//============================================== 
// Machine Interrupt Delegation Register (mideleg) 
//==============================================
logic [63:0] mideleg;

assign mideleg[CSR__MIDELEG__INTERRUPTS__FIELD] = CSR__MIDELEG__INTERRUPTS__VALUE;


//============================================== 
// Machine Interrupt-Pending Register (mip) 
//==============================================
logic [63:0] mip;

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

always_ff @(posedge clk) begin
    if (rst) begin
        mip[CSR__MIP__MSIP__FIELD] <= CSR__MIP__MSIP__NOT_PENDING;
        mip[CSR__MIP__MTIP__FIELD] <= CSR__MIP__MTIP__NOT_PENDING;
        mip[CSR__MIP__MEIP__FIELD] <= CSR__MIP__MEIP__NOT_PENDING;
    end
end

//============================================== 
// Machine Interrupt-Enable Register (mie) 
//==============================================
logic [63:0] mie;
logic mie__we;

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

always_ff @(posedge clk) begin
    if (rst) begin
        mie[CSR__MIE__MSIE__FIELD] <= CSR__MIE__MSIE__DISABLED;
        mie[CSR__MIE__MTIE__FIELD] <= CSR__MIE__MTIE__DISABLED;
        mie[CSR__MIE__MEIE__FIELD] <= CSR__MIE__MEIE__DISABLED;
    end
    else begin
        if (mie__we) begin
            mie[CSR__MIE__MSIE__FIELD] <= wr_data[CSR__MIE__MSIE__FIELD];
            mie[CSR__MIE__MTIE__FIELD] <= wr_data[CSR__MIE__MTIE__FIELD];
            mie[CSR__MIE__MEIE__FIELD] <= wr_data[CSR__MIE__MEIE__FIELD];
        end
    end
end






logic [63:0] mcause;
logic [63:0] mepc;



// mcause
always_ff @(posedge clk) begin
    mcause[CSR__MCAUSE__EXCEPTION_CODE__FIELD] <= mcause__n[CSR__MCAUSE__EXCEPTION_CODE__FIELD];
    mcause[CSR__MCAUSE__INTERRUPT__FIELD] <= mcause__n[CSR__MCAUSE__INTERRUPT__FIELD];
end

// mepc
always_ff @(posedge clk) begin
    mepc[CSR__MEPC__MEPC__FIELD] <= mepc__n[CSR__MEPC__MEPC__FIELD];
end









//==============================================
// mstatus
//==============================================
assign mstatus[CSR__MSTATUS__UIE__FIELD] = CSR__MSTATUS__UIE__DISABLED;
assign mstatus[CSR__MSTATUS__SIE__FIELD] = CSR__MSTATUS__SIE__DISABLED;
assign mstatus[CSR__MSTATUS__HIE__FIELD] = CSR__MSTATUS__HIE__DISABLED;
assign mstatus[CSR__MSTATUS__MPP__FIELD] = CSR__MSTATUS__MPP__MACHINE;
assign mstatus[CSR__MSTATUS__FS__FIELD] = CSR__MSTATUS__FS__OFF;
assign mstatus[CSR__MSTATUS__XS__FIELD] = CSR__MSTATUS__XS__OFF;
assign mstatus[CSR__MSTATUS__VM__FIELD] = CSR__MSTATUS__VM__MBARE;
assign mstatus[CSR__MSTATUS__SD__FIELD] = CSR__MSTATUS__SD__NOT_DIRTY;


always_ff @(posedge clk) begin
    if (rst) begin
        mstatus[CSR__MSTATUS__MIE__FIELD] <= CSR__MSTATUS__MIE__DISABLED;
    end
    else begin
        if (we__mstatus) begin
        end
        else if (mtrap) begin
            mstatus[CSR__MSTATUS__MIE__FIELD] <= CSR__MSTATUS__MIE__DISABLED;
            mstatus[CSR__MSTATUS__MPIE__FIELD] <= mstatus[CSR__MSTATUS__MIE__FIELD];
        end

    end
end






//==============================================
// misa (Machine ISA Register), RW
//==============================================
assign misa[CSR__MISA__EXTENSIONS__FIELD] = CSR__MISA__EXTENSIONS__I;
assign misa[CSR__MISA__WIRI_0__FIELD] = CSR__MISA__WIRI_0__VALUE;
assign misa[CSR__MISA__BASE__FIELD] = CSR__MISA__BASE__RV64;



// marchid
assign marchid[CSR__MARCHID__ARCHITECTURE_ID__FIELD] = CSR__MARCHID__ARCHITECTURE_ID__VALUE;


// mhartid
assign mhartid[CSR__MHARTID__HART_ID__FIELD] = CSR__MHARTID__HART_ID__VALUE;

// mstatus
assign mstatus[CSR__MSTATUS__UIE__FIELD] = CSR__MSTATUS__UIE__DISABLED;
assign mstatus[CSR__MSTATUS__SIE__FIELD] = CSR__MSTATUS__SIE__DISABLED;
assign mstatus[CSR__MSTATUS__HIE__FIELD] = CSR__MSTATUS__HIE__DISABLED;
assign mstatus[CSR__MSTATUS__MPP__FIELD] = CSR__MSTATUS__MPP__MACHINE;
assign mstatus[CSR__MSTATUS__FS__FIELD] = CSR__MSTATUS__FS__OFF;
assign mstatus[CSR__MSTATUS__XS__FIELD] = CSR__MSTATUS__XS__OFF;
assign mstatus[CSR__MSTATUS__VM__FIELD] = CSR__MSTATUS__VM__MBARE;
assign mstatus[CSR__MSTATUS__SD__FIELD] = CSR__MSTATUS__SD__NOT_DIRTY;


always_ff @(posedge clk) begin
    if (rst) begin
        mstatus[CSR__MSTATUS__MIE__FIELD] <= CSR__MSTATUS__MIE__DISABLED;
    end
    else begin
        if (we__mstatus) begin
            case (op) begin
                
            end
        end
    end
end

// mtvec
assign mtvec[CSR__MTVEC__OFFSET__FIELD] = CSR__MTVEC__OFFSET__VALUE;

always_ff @(posedge clk) begin
    if (rst) begin
        mstatus[CSR__MTVEC__TRAP_VECTOR_BASE_ADDRESS__FIELD] <= CSR__MTVEC__TRAP_VECTOR_BASE_ADDRESS__RESET_VALUE;
    end
    else begin

    end
end

// medeleg

// mideleg


// mtime (EDIT: Memory Mapped?)
always_ff @(posedge clk) begin
    if (rst) begin
        mtime[CSR__MTIME__MTIME__FIELD] <= CSR__MTIME__MTIME__RESET_VALUE;
    end
end

// mtimecmp (EDIT: Memory Mapped?)
always_ff @(posedge clk) begin
    if (rst) begin
        mtimecmp[CSR__MTIMECMP__MTIMECMP__FIELD] <= CSR__MTIMECMP__MTIMECMP__RESET_VALUE;
    end
end

// mcycle
always_ff @(posedge clk) begin
    if (rst) begin
        mcycle[CSR__MCYCLE__MCYCLE__FIELD] <= CSR__MCYCLE__MCYCLE__RESET_VALUE;
    end
    else begin
        mcycle[CSR__MCYCLE__MCYCLE__FIELD] <= CSR__MCYCLE__MCYCLE__RESET_VALUE;
    end
end


// minstret
always_ff @(posedge clk) begin
    if (rst) begin
        minstret[CSR__MINSTRET__MINSTRET__FIELD] <= CSR__MCYCLE__MINSTRET__RESET_VALUE;
    end
    else begin
        if (we) begin
            case (op)
                CSR_OP__WRITE:
                begin
                    minstret[CSR__MINSTRET__MINSTRET__FIELD] <= wr_data;
                end
                CSR_OP__SET:
                begin
                    minstret[CSR__MINSTRET__MINSTRET__FIELD] <= minstret[CSR__MINSTRET__MINSTRET__FIELD] | wr_data;
                end
                CSR_OP__CLEAR:
                begin
                    minstret[CSR__MINSTRET__MINSTRET__FIELD] <= minstret[CSR__MINSTRET__MINSTRET__FIELD] & ~wr_data;
                end
            endcase
        end
        else if (instret) begin
            minstret[CSR__MINSTRET__MINSTRET__FIELD] <= minstret[CSR__MINSTRET__MINSTRET__FIELD] + 1;
        end
    end
end


always_comb begin
    case (state)
        STATE__READY:
        begin
            state__n =             
        end
    endcase
end


endmodule

