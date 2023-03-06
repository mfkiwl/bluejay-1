//==============================================
// control_and_status_registers 
//==============================================
module control_and_status_registers
(
    clk,
    rst,
    cs,
    we,
    addr,
    rd_data,
    wr_data,
    eip,
    tip,
    instret,
    mstatus__mie,
    mie__meie,
    mie__msie,
    mie__mtie,
    mip__meip,
    mip__msip,
    mip__mtip
);

input clk;
input rst;
input cs;
input we;
input [11:0] addr;
output [63:0] rd_data;
input [63:0] wr_data;
input eip;
input tip;
input instret;

output mstatus__mie;
output mie__meie;
output mie__msie;
output mie__mtie;
output mip__meip;
output mip__msip;
output mip__mtip;

logic clk;
logic rst;

logic cs;
logic we;
logic [11:0] addr;
logic [63:0] rd_data;
logic [63:0] wr_data;

logic eip;
logic tip;

logic instret;

// Machine ISA Register (misa)
logic [63:0] misa;
logic [CSR__MISA__EXTENSIONS__WIDTH-1:0] misa__extensions;
logic [CSR__MISA__WIRI__0__WIDTH-1:0] misa__wiri__0;
logic [CSR__MISA__BASE__WIDTH-1:0] misa__base;
logic we__misa;
logic en__misa;

// Machine Vendor ID Register (mvendorid)
logic [63:0] mvendorid;
logic [CSR__MVENDORID__VENDOR__WIDTH-1:0] mvendorid__vendor;
logic we__mvendorid;
logic en__mvendorid;

// Machine Architecture ID Register (marchid)
logic [63:0] marchid;
logic [CSR__MARCHID__ARCHITECTURE_ID__WIDTH-1:0] marchid__architecture_id;
logic we__marchid;
logic en__marchid;

// Machine Implementation ID Register (mimpid)
logic [63:0] mimpid;
logic [CSR__MIMPID__IMPLEMENTATION__WIDTH-1:0] mimpid__implementation;
logic we__mimpid;
logic en__mimpid;

// Hart ID Register (mhartid) 
logic [63:0] mhartid;
logic [CSR__MHARTID__HART_ID__WIDTH-1:0] mhartid__hart_id;
logic we__mhartid;
logic en__mhartid;

// Machine Status Register (mstatus) 
logic [63:0] mstatus;
logic [CSR__MSTATUS__UIE__WIDTH-1:0] mstatus__uie;
logic [CSR__MSTATUS__SIE__WIDTH-1:0] mstatus__sie;
logic [CSR__MSTATUS__HIE__WIDTH-1:0] mstatus__hie;
logic [CSR__MSTATUS__MIE__WIDTH-1:0] mstatus__mie;
logic [CSR__MSTATUS__UPIE__WIDTH-1:0] mstatus__upie;
logic [CSR__MSTATUS__SPIE__WIDTH-1:0] mstatus__spie;
logic [CSR__MSTATUS__HPIE__WIDTH-1:0] mstatus__hpie;
logic [CSR__MSTATUS__MPIE__WIDTH-1:0] mstatus__mpie;
logic [CSR__MSTATUS__SPP__WIDTH-1:0] mstatus__spp;
logic [CSR__MSTATUS__HPP__WIDTH-1:0] mstatus__hpp;
logic [CSR__MSTATUS__MPP__WIDTH-1:0] mstatus__mpp;
logic [CSR__MSTATUS__FS__WIDTH-1:0] mstatus__fs;
logic [CSR__MSTATUS__XS__WIDTH-1:0] mstatus__xs;
logic [CSR__MSTATUS__MPRV__WIDTH-1:0] mstatus__mprv;
logic [CSR__MSTATUS__PUM__WIDTH-1:0] mstatus__pum;
logic [CSR__MSTATUS__MXR__WIDTH-1:0] mstatus__mxr;
logic [CSR__MSTATUS__VM__WIDTH-1:0] mstatus__vm;
logic [CSR__MSTATUS__SD__WIDTH-1:0] mstatus__sd;
logic we__mstatus;
logic en__mstatus;

// Machine Trap-Vector Base-Address Register (mtvec)
logic [63:0] mtvec;
logic [CSR__MTVEC__OFFSET__WIDTH-1:0] mtvec__offset;
logic [CSR__MTVEC__TRAP_VECTOR_BASE_ADDRESS__WIDTH-1:0] mtvec__trap_vector_base_address;
logic we__mtvec;
logic en__mtvec;

// Machine Exception Delegation Register (medeleg) 
logic [63:0] medeleg;
logic [CSR__MEDELEG__SYNCHRONOUS_EXCEPTIONS__WIDTH-1:0] medeleg__synchronous_exceptions;
logic we__medeleg;
logic en__medeleg;

// Machine Interrupt Delegation Register (mideleg) 
logic [63:0] mideleg;
logic [CSR__MIDELEG__INTERRUPTS__WIDTH-1:0] mideleg__interrupts;
logic we__mideleg;
logic en__mideleg;

// Machine Interrupt-Pending Register (mip) 
logic [63:0] mip;
logic [CSR__MIP__USIP__WIDTH-1:0] mip__usip;
logic [CSR__MIP__SSIP__WIDTH-1:0] mip__ssip;
logic [CSR__MIP__HSIP__WIDTH-1:0] mip__hsip;
logic [CSR__MIP__MSIP__WIDTH-1:0] mip__msip;
logic [CSR__MIP__UTIP__WIDTH-1:0] mip__utip;
logic [CSR__MIP__STIP__WIDTH-1:0] mip__stip;
logic [CSR__MIP__HTIP__WIDTH-1:0] mip__htip;
logic [CSR__MIP__MTIP__WIDTH-1:0] mip__mtip;
logic [CSR__MIP__UEIP__WIDTH-1:0] mip__ueip;
logic [CSR__MIP__SEIP__WIDTH-1:0] mip__seip;
logic [CSR__MIP__HEIP__WIDTH-1:0] mip__heip;
logic [CSR__MIP__MEIP__WIDTH-1:0] mip__meip;
logic [CSR__MIP__WIRI__0__WIDTH-1:0] mip__wiri__0;
logic we__mip;
logic en__mip;

// Machine Interrupt-Enable Register (mie) 
logic [63:0] mie;
logic [CSR__MIE__USIE__WIDTH-1:0] mie__usie;
logic [CSR__MIE__SSIE__WIDTH-1:0] mie__ssie;
logic [CSR__MIE__HSIE__WIDTH-1:0] mie__hsie;
logic [CSR__MIE__MSIE__WIDTH-1:0] mie__msie;
logic [CSR__MIE__UTIE__WIDTH-1:0] mie__utie;
logic [CSR__MIE__STIE__WIDTH-1:0] mie__stie;
logic [CSR__MIE__HTIE__WIDTH-1:0] mie__htie;
logic [CSR__MIE__MTIE__WIDTH-1:0] mie__mtie;
logic [CSR__MIE__UEIE__WIDTH-1:0] mie__ueie;
logic [CSR__MIE__SEIE__WIDTH-1:0] mie__seie;
logic [CSR__MIE__HEIE__WIDTH-1:0] mie__heie;
logic [CSR__MIE__MEIE__WIDTH-1:0] mie__meie;
logic [CSR__MIE__WPRI__0__WIDTH-1:0] mie__wpri__0;
logic we__mie;
logic en__mie;

// Machine Cycle Register (mcycle) 
logic [63:0] mcycle;
logic [CSR__MCYCLE__MCYCLE__WIDTH-1:0] mcycle__mcycle;
logic [CSR__MCYCLE__MCYCLE__WIDTH-1:0] mcycle__mcycle__n;
logic we__mcycle;
logic en__mcycle;

// Machine Instruction Retire Register (minstret) 
logic [63:0] minstret;
logic [CSR__MINSTRET__MINSTRET__WIDTH-1:0] minstret__minstret;
logic [CSR__MINSTRET__MINSTRET__WIDTH-1:0] minstret__minstret__n;
logic we__minstret;
logic en__minstret;
logic minstret__write_occurred;
logic state__minstret;
logic state__minstret__n;

// Machine Hardware Performance Monitor Counter 3 (mhpmcounter3)
logic [63:0] mhpmcounter3;
logic [CSR__MHPMCOUNTER3__MHPMCOUNTER3__WIDTH-1:0] mhpmcounter3__mhpmcounter3;
logic we__mhpmcounter3;
logic en__mhpmcounter3;

// Machine Hardware Performance Monitor Event 3 (mhpmevent3)
logic [63:0] mhpmevent3;
logic [CSR__MHPMEVENT3__MHPMEVENT3__WIDTH-1:0] mhpmevent3__mhpmevent3;
logic we__mhpmevent3;
logic en__mhpmevent3;

// Machine Scratch Register (mscratch) 
logic [63:0] mscratch;
logic [CSR__MSCRATCH__MSCRATCH__WIDTH-1:0] mscratch__mscratch;
logic we__mscratch;
logic en__mscratch;

// Machine Exception Program Counter (mepc) 
logic [63:0] mepc;
logic [CSR__MEPC__MEPC__WIDTH-1:0] mepc__mepc;
logic we__mepc;
logic en__mepc;

// Machine Cause Register (mcause) 
logic [63:0] mcause;
logic [CSR__MCAUSE__EXCEPTION_CODE__WIDTH-1:0] mcause__exception_code;
logic [CSR__MCAUSE__INTERRUPT__WIDTH-1:0] mcause__interrupt;
logic we__mcause;
logic en__mcause;

// Machine Trap Value Register (mtval) 
logic [63:0] mtval;
logic [CSR__MTVAL__MTVAL__WIDTH-1:0] mtval__mtval;
logic we__mtval;
logic en__mtval;


always_comb begin
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
assign misa[CSR__MISA__EXTENSIONS__FIELD] = misa__extensions;
assign misa[CSR__MISA__WIRI__0__FIELD] = misa__wiri__0;
assign misa[CSR__MISA__BASE__FIELD] = misa__base;

assign misa__extensions = CSR__MISA__EXTENSIONS__I;
assign misa__wiri__0 = CSR__MISA__WIRI__0__VALUE;
assign misa__base = CSR__MISA__BASE__RV64;


//==============================================
// Machine Vendor ID Register (mvendorid)
//==============================================
assign mvendorid[CSR__MVENDORID__VENDOR__FIELD] = mvendorid__vendor;

assign mvendorid__vendor = CSR__MVENDORID__VENDOR__VALUE;


//==============================================
// Machine Architecture ID Register (marchid)
//==============================================
assign marchid[CSR__MARCHID__ARCHITECTURE_ID__FIELD] = marchid__architecture_id;

assign marchid__architecture_id = CSR__MARCHID__ARCHITECTURE_ID__VALUE;


//==============================================
// Machine Implementation ID Register (mimpid)
//==============================================
assign mimpid[CSR__MIMPID__IMPLEMENTATION__FIELD] = mimpid__implementation;

assign mimpid__implementation = CSR__MIMPID__IMPLEMENTATION__VALUE;


//==============================================
// Hart ID Register (mhartid) 
//==============================================
assign mhartid[CSR__MHARTID__HART_ID__FIELD] = mhartid__hart_id;

assign mhartid__hart_id = CSR__MHARTID__HART_ID__VALUE;


//============================================== 
// Machine Status Register (mstatus) 
//==============================================
assign mstatus[CSR__MSTATUS__UIE__FIELD] = mstatus__uie;
assign mstatus[CSR__MSTATUS__SIE__FIELD] = mstatus__sie;
assign mstatus[CSR__MSTATUS__HIE__FIELD] = mstatus__hie;
assign mstatus[CSR__MSTATUS__MIE__FIELD] = mstatus__mie;
assign mstatus[CSR__MSTATUS__UPIE__FIELD] = mstatus__upie;
assign mstatus[CSR__MSTATUS__SPIE__FIELD] = mstatus__spie;
assign mstatus[CSR__MSTATUS__HPIE__FIELD] = mstatus__hpie;
assign mstatus[CSR__MSTATUS__MPIE__FIELD] = mstatus__mpie;
assign mstatus[CSR__MSTATUS__SPP__FIELD] = mstatus__spp;
assign mstatus[CSR__MSTATUS__HPP__FIELD] = mstatus__hpp;
assign mstatus[CSR__MSTATUS__MPP__FIELD] = mstatus__mpp;
assign mstatus[CSR__MSTATUS__FS__FIELD] = mstatus__fs;
assign mstatus[CSR__MSTATUS__XS__FIELD] = mstatus__xs;
assign mstatus[CSR__MSTATUS__MPRV__FIELD] = mstatus__mprv;
assign mstatus[CSR__MSTATUS__PUM__FIELD] = mstatus__pum;
assign mstatus[CSR__MSTATUS__MXR__FIELD] = mstatus__mxr;
assign mstatus[CSR__MSTATUS__VM__FIELD] = mstatus__vm;
assign mstatus[CSR__MSTATUS__SD__FIELD] = mstatus__sd;

assign mstatus__uie = CSR__MSTATUS__UIE__DISABLED;
assign mstatus__sie = CSR__MSTATUS__SIE__DISABLED;
assign mstatus__hie = CSR__MSTATUS__HIE__DISABLED;
assign mstatus__upie = CSR__MSTATUS__UPIE__DISABLED;
assign mstatus___spie = CSR__MSTATUS__SPIE__DISABLED;
assign mstatus__hpie = CSR__MSTATUS__HPIE__DISABLED;
assign mstatus__spp = CSR__MSTATUS__SPP__USER;
assign mstatus__hpp = CSR__MSTATUS__HPP__USER;
assign mstatus__mpp = CSR__MSTATUS__MPP__MACHINE;
assign mstatus__fs = CSR__MSTATUS__FS__OFF;
assign mstatus__xs = CSR__MSTATUS__XS__OFF;
assign mstatus__mprv = CSR__MSTATUS__MPRV__DISABLED;
assign mstatus__pum = CSR__MSTATUS__PUM__DISABLED;
assign mstatus__mxr = CSR__MSTATUS__MXR__DISABLED;
assign mstatus__vm = CSR__MSTATUS__VM__MBARE;
assign mstatus__sd = CSR__MSTATUS__SD__NOT_DIRTY;

assign en__mstatus = cs & we__mstatus;

//==============================
// d_flip_flop__mstatus__mie
//==============================
d_flip_flop #(.WIDTH(CSR__MSTATUS__MIE__WIDTH), .RESET_VALUE(CSR__MSTATUS__MIE__DISABLED)) d_flip_flop__mstatus__mie
(
    .clk(clk),
    .rst(rst),
    .en(en__mstatus),
    .d(wr_data[CSR__MSTATUS__MIE__FIELD]),
    .q(mstatus__mie)
);


//============================================== 
// Machine Trap-Vector Base-Address Register (mtvec)
//==============================================
assign mtvec[CSR__MTVEC__OFFSET__FIELD] = mtvec__offset;
assign mtvec[CSR__MTVEC__TRAP_VECTOR_BASE_ADDRESS__FIELD] = mtvec__trap_vector_base_address;

assign mtvec__offset = CSR__MTVEC__OFFSET__VALUE;

assign en__mtvec = cs & we__mtvec;

//==============================
// d_flip_flop__mtvec__trap_vector_base_address
//==============================
d_flip_flop #(.WIDTH(CSR__MTVEC__TRAP_VECTOR_BASE_ADDRESS__WIDTH), .RESET_VALUE(CSR__MTVEC__TRAP_VECTOR_BASE_ADDRESS__VALUE)) d_flip_flop__mtvec__trap_vector_base_address
(
    .clk(clk),
    .rst(rst),
    .en(en__mtvec),
    .d(wr_data[CSR__MTVEC__TRAP_VECTOR_BASE_ADDRESS__FIELD]),
    .q(mtvec__trap_vector_base_address)
);


//============================================== 
// Machine Exception Delegation Register (medeleg) 
//==============================================
assign medeleg[CSR__MEDELEG__SYNCHRONOUS_EXCEPTIONS__FIELD] = medeleg__synchronous_exceptions;

assign medeleg__synchronous_exceptions = CSR__MEDELEG__SYNCHRONOUS_EXCEPTIONS__VALUE;


//============================================== 
// Machine Interrupt Delegation Register (mideleg) 
//==============================================
assign mideleg[CSR__MIDELEG__INTERRUPTS__FIELD] = mideleg__interrupts;

assign mideleg__interrupts = CSR__MIDELEG__INTERRUPTS__VALUE;


//============================================== 
// Machine Interrupt-Pending Register (mip) 
//==============================================
assign mip[CSR__MIP__USIP__FIELD] = mip__usip;
assign mip[CSR__MIP__SSIP__FIELD] = mip__ssip;
assign mip[CSR__MIP__HSIP__FIELD] = mip__hsip;
assign mip[CSR__MIP__MSIP__FIELD] = mip__msip;
assign mip[CSR__MIP__UTIP__FIELD] = mip__utip;
assign mip[CSR__MIP__STIP__FIELD] = mip__stip;
assign mip[CSR__MIP__HTIP__FIELD] = mip__htip;
assign mip[CSR__MIP__MTIP__FIELD] = mip__mtip;
assign mip[CSR__MIP__UEIP__FIELD] = mip__ueip;
assign mip[CSR__MIP__SEIP__FIELD] = mip__seip;
assign mip[CSR__MIP__HEIP__FIELD] = mip__heip;
assign mip[CSR__MIP__MEIP__FIELD] = mip__meip;
assign mip[CSR__MIP__WIRI__0__FIELD] = mip__wiri__0;

assign mip__usip = CSR__MIP__USIP__NOT_PENDING;
assign mip__ssip = CSR__MIP__SSIP__NOT_PENDING;
assign mip__hsip = CSR__MIP__HSIP__NOT_PENDING;
assign mip__utip = CSR__MIP__UTIP__NOT_PENDING;
assign mip__stip = CSR__MIP__STIP__NOT_PENDING;
assign mip__htip = CSR__MIP__HTIP__NOT_PENDING;
assign mip__ueip = CSR__MIP__UEIP__NOT_PENDING;
assign mip__seip = CSR__MIP__SEIP__NOT_PENDING;
assign mip__heip = CSR__MIP__HEIP__NOT_PENDING;
assign mip__wiri__0 = CSR__MIP__WIRI__0__VALUE;

assign en__mip = cs & we__mip;

//==============================
// d_flip_flop__mip__msip
//==============================
d_flip_flop #(.WIDTH(CSR__MIP__MSIP__WIDTH), .RESET_VALUE(CSR__MIP__MSIP__NOT_PENDING)) d_flip_flop__mip__msip
(
    .clk(clk),
    .rst(rst),
    .en(en__mip),
    .d(wr_data[CSR__MIP__MSIP__FIELD]),
    .q(mip__msip)
);

// FIXME: The tip/eip bit will (likely) be retimed from the PLIC. Make sure the is no issues with X propagation upon reset. 
//==============================
// d_flip_flop__mip__mtip
//==============================
d_flip_flop #(.WIDTH(CSR__MIP__MTIP__WIDTH), .RESET_VALUE()) d_flip_flop__mip__mtip
(
    .clk(clk),
    .rst(1'b0),
    .en(en__mip),
    .d(wr_data[CSR__MIP__MTIP__FIELD]),
    .q(mip__mtip)
);

//==============================
// d_flip_flop__mip__meip
//==============================
d_flip_flop #(.WIDTH(CSR__MIP__MEIP__WIDTH), .RESET_VALUE()) d_flip_flop__mip__meip
(
    .clk(clk),
    .rst(1'b0),
    .en(en__mip),
    .d(wr_data[CSR__MIP__MEIP__FIELD]),
    .q(mip__meip)
);


//============================================== 
// Machine Interrupt-Enable Register (mie) 
//==============================================
assign mie[CSR__MIE__USIE__FIELD] = mie__usie;
assign mie[CSR__MIE__SSIE__FIELD] = mie__ssie;
assign mie[CSR__MIE__HSIE__FIELD] = mie__hsie;
assign mie[CSR__MIE__MSIE__FIELD] = mie__msie;
assign mie[CSR__MIE__UTIE__FIELD] = mie__utie;
assign mie[CSR__MIE__STIE__FIELD] = mie__stie;
assign mie[CSR__MIE__HTIE__FIELD] = mie__htie;
assign mie[CSR__MIE__MTIE__FIELD] = mie__mtie;
assign mie[CSR__MIE__UEIE__FIELD] = mie__ueie;
assign mie[CSR__MIE__SEIE__FIELD] = mie__seie;
assign mie[CSR__MIE__HEIE__FIELD] = mie__heie;
assign mie[CSR__MIE__MEIE__FIELD] = mie__meie;
assign mie[CSR__MIE__WPRI__0__FIELD] = mie__wpri__0;

assign mie__usie = CSR__MIE__USIE__DISABLED;
assign mie__ssie = CSR__MIE__SSIE__DISABLED;
assign mie__hsie = CSR__MIE__HSIE__DISABLED;
assign mie__utie = CSR__MIE__UTIE__DISABLED;
assign mie__stie = CSR__MIE__STIE__DISABLED;
assign mie__htie = CSR__MIE__HTIE__DISABLED;
assign mie__ueie = CSR__MIE__UEIE__DISABLED;
assign mie__seie = CSR__MIE__SEIE__DISABLED;
assign mie__heie = CSR__MIE__HEIE__DISABLED;
assign mie__wpri__0 = CSR__MIE__WPRI__0__VALUE;

assign en__mie = cs & we__mie;

//==============================
// d_flip_flop__mie__msie
//==============================
d_flip_flop #(.WIDTH(CSR__MIE__MSIE__WIDTH), .RESET_VALUE(CSR__MIE__MSIE__DISABLED)) d_flip_flop__mie__msie
(
    .clk(clk),
    .rst(rst),
    .en(en__mie),
    .d(wr_data[CSR__MIE__MSIE__FIELD]),
    .q(mie__msie)
);

//==============================
// d_flip_flop__mie__mtie
//==============================
d_flip_flop #(.WIDTH(CSR__MIE__MTIE__WIDTH), .RESET_VALUE(CSR__MIE__MTIE__DISABLED)) d_flip_flop__mie__mtie
(
    .clk(clk),
    .rst(rst),
    .en(en__mie),
    .d(wr_data[CSR__MIE__MTIE__FIELD]),
    .q(mie__mtie)
);

//==============================
// d_flip_flop__mie__meie
//==============================
d_flip_flop #(.WIDTH(CSR__MIE__MEIE__WIDTH), .RESET_VALUE(CSR__MIE__MEIE__DISABLED)) d_flip_flop__mie__meie
(
    .clk(clk),
    .rst(rst),
    .en(en__mie),
    .d(wr_data[CSR__MIE__MEIE__FIELD]),
    .q(mie__meie)
);


//============================================== 
// Machine Cycle Register (mcycle) 
//==============================================
assign mcycle[CSR__MCYCLE__MCYCLE__FIELD] = mcycle__mcycle;

assign en__mcycle = 1'b1;

always_comb
begin
    case (en__mcycle & we__mcycle)
        1'b0:
        begin
            mcycle__mcycle__n = mcycle__mcycle + 1;
        end
        1'b1:
        begin
            mcycle__mcycle__n = wr_data[CSR__MCYCLE__MCYCLE__FIELD];
        end
    endcase
end

//==============================
// d_flip_flop__mcycle__mcycle
//==============================
d_flip_flop #(.WIDTH(CSR__MCYCLE__MCYCLE__WIDTH), .RESET_VALUE(CSR__MCYCLE__MCYCLE__RESET_VALUE)) d_flip_flop__mcycle__mcycle
(
    .clk(clk),
    .rst(rst),
    .en(en__mcycle),
    .d(mcycle__mcycle__n),
    .q(mcycle__mcycle)
);


//============================================== 
// Machine Instruction Retire Register (minstret) 
//==============================================
assign minstret[CSR__MINSTRET__MINSTRET__FIELD] = minstret__minstret;

assign en__minstret = 1'b1;

always_comb
begin
    case (en__minstret & we__minstret)
        1'b0:
        begin
            case (instret & ~minstret__write_occurred)
                1'b0:
                begin
                    minstret__minstret__n = minstret__minstret;
                end
                1'b1:
                begin
                    minstret__minstret__n = minstret__minstret + 1;
                end
            endcase
        end
        1'b1:
        begin
            minstret__minstret__n = wr_data[CSR__MINSTRET__MINSTRET__FIELD];
        end
    endcase
end

//==============================
// d_flip_flop__minstret__minstret
//==============================
d_flip_flop #(.WIDTH(CSR__MINSTRET__MINSTRET__WIDTH), .RESET_VALUE(CSR__MINSTRET__MINSTRET__RESET_VALUE)) d_flip_flop__minstret__minstret
(
    .clk(clk),
    .rst(rst),
    .en(en__minstret),
    .d(minstret__minstret__n),
    .q(minstret__minstret)
);

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
            state__minstret__n = en__minstret & we__minstret & ~instret ? STATE__MINSTRET__WRITE_OCCURED : STATE__MINSTRET__NORMAL;
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

//==============================
// d_flip_flop__state__minstret
//==============================
d_flip_flop #(.WIDTH(1), .RESET_VALUE(STATE__MINSTRET__NORMAL)) d_flip_flop__state__minstret
(
    .clk(clk),
    .rst(rst),
    .en(1'b1),
    .d(state__minstret__n),
    .q(state__minstret)
);


//============================================== 
// Machine Hardware Performance Monitor Counter 3 (mhpmcounter3)
//==============================================
assign mhpmcounter3[CSR__MHPMCOUNTER3__MHPMCOUNTER3__FIELD] = mhpmcounter3__mhpmcounter3;

assign mhpmcounter3__mhpmcounter3 = CSR__MHPMCOUNTER3__MHPMCOUNTER3__VALUE;


//============================================== 
// Machine Hardware Performance Monitor Event 3 (mhpmevent3)
//==============================================
assign mhpmevent3[CSR__MHPMEVENT3__MHPMEVENT3__FIELD] = mhpmevent3__mhpmevent3;

assign mhpmevent3__mhpmevent3 = CSR__MHPMEVENT3__MHPMEVENT3__VALUE;


//============================================== 
// Machine Scratch Register (mscratch) 
//==============================================
assign mscratch[CSR__MSCRATCH__MSCRATCH__FIELD] = mscratch__mscratch;

assign en__scratch = cs & we__mscratch;

//==============================
// d_flip_flop__mscratch__mscratch
//==============================
d_flip_flop #(.WIDTH(CSR__MSCRATCH__MSCRATCH__WIDTH), .RESET_VALUE(CSR__MSCRATCH__MSCRATCH__RESET_VALUE)) d_flip_flop__mscratch__mscratch
(
    .clk(clk),
    .rst(rst),
    .en(en__mscratch),
    .d(wr_data[CSR__MSCRATCH__MSCRATCH__FIELD]),
    .q(mscratch__mscratch)
);


//============================================== 
// Machine Exception Program Counter (mepc) 
//==============================================
assign mepc[CSR__MEPC__MEPC__FIELD] = mepc__mepc;

assign en__mepc = cs & we__mepc;

//==============================
// d_flip_flop__mepc__mepc
//==============================
d_flip_flop #(.WIDTH(CSR__MEPC__MEPC__WIDTH), .RESET_VALUE(CSR__MEPC__MEPC__RESET_VALUE)) d_flip_flop__mepc__mepc
(
    .clk(clk),
    .rst(rst),
    .en(en__mepc),
    .d(wr_data[CSR__MEPC__MEPC__FIELD]),
    .q(mepc__mepc)
);


//============================================== 
// Machine Cause Register (mcause) 
//==============================================
assign mcause[CSR__MCAUSE__EXCEPTION_CODE__FIELD] = mcause__exception_code;
assign mcause[CSR__MCAUSE__INTERRUPT__FIELD] = mcause__interrupt;

assign en__mcause = cs & we__mcause;

//==============================
// d_flip_flop__mcause__exception_code
//==============================
d_flip_flop #(.WIDTH(CSR__MCAUSE__EXCEPTION_CODE__WIDTH), .RESET_VALUE(CSR__MCAUSE__EXCEPTION_CODE__HARD_RESET)) d_flip_flop__mcause__exception_code
(
    .clk(clk),
    .rst(rst),
    .en(en__mcause),
    .d(wr_data[CSR__MCAUSE__EXCEPTION_CODE__FIELD]),
    .q(mcause__exception_code)
);

//==============================
// d_flip_flop__mcause__interrupt
//==============================
d_flip_flop #(.WIDTH(CSR__MCAUSE__INTERRUPT__WIDTH), .RESET_VALUE(CSR__MCAUSE__INTERRUPT__NOT_INTERRUPT)) d_flip_flop__mcause__interrupt
(
    .clk(clk),
    .rst(rst),
    .en(en__mcause),
    .d(wr_data[CSR__MCAUSE__INTERRUPT__FIELD]),
    .q(mcause__interrupt)
);


//============================================== 
// Machine Trap Value Register (mtval) 
//==============================================
assign mtval[CSR__MTVAL__MTVAL__FIELD] = mtval__mtval;

assign en__mtval = cs & we__mtval;

//==============================
// d_flip_flop__mtval__mtval
//==============================
d_flip_flop #(.WIDTH(CSR__MTVAL__MTVAL__WIDTH), .RESET_VALUE(CSR__MTVAL__MTVAL__RESET_VALUE)) d_flip_flop__mtval__mtval
(
    .clk(clk),
    .rst(rst),
    .en(en__mtval),
    .d(wr_data[CSR__MTVAL__MTVAL__FIELD]),
    .q(mtval__mtval)
);


endmodule

