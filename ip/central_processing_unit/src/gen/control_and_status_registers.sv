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
logic [25:0] misa__extensions;
logic [35:0] misa__wiri__0;
logic [1:0] misa__base;
logic we__misa;
logic en__misa;

// Machine Vendor ID Register (mvendorid)
logic [63:0] mvendorid;
logic [63:0] mvendorid__vendor;
logic we__mvendorid;
logic en__mvendorid;

// Machine Architecture ID Register (marchid)
logic [63:0] marchid;
logic [63:0] marchid__architecture_id;
logic we__marchid;
logic en__marchid;

// Machine Implementation ID Register (mimpid)
logic [63:0] mimpid;
logic [63:0] mimpid__implementation;
logic we__mimpid;
logic en__mimpid;

// Hart ID Register (mhartid) 
logic [63:0] mhartid;
logic [63:0] mhartid__hart_id;
logic we__mhartid;
logic en__mhartid;

// Machine Status Register (mstatus) 
logic [63:0] mstatus;
logic [0:0] mstatus__uie;
logic [0:0] mstatus__sie;
logic [0:0] mstatus__hie;
logic [0:0] mstatus__mie;
logic [0:0] mstatus__upie;
logic [0:0] mstatus__spie;
logic [0:0] mstatus__hpie;
logic [0:0] mstatus__mpie;
logic [0:0] mstatus__spp;
logic [1:0] mstatus__hpp;
logic [1:0] mstatus__mpp;
logic [1:0] mstatus__fs;
logic [1:0] mstatus__xs;
logic [0:0] mstatus__mprv;
logic [0:0] mstatus__pum;
logic [0:0] mstatus__mxr;
logic [4:0] mstatus__vm;
logic [0:0] mstatus__sd;
logic we__mstatus;
logic en__mstatus;

// Machine Trap-Vector Base-Address Register (mtvec)
logic [63:0] mtvec;
logic [1:0] mtvec__offset;
logic [61:0] mtvec__trap_vector_base_address;
logic we__mtvec;
logic en__mtvec;

// Machine Exception Delegation Register (medeleg) 
logic [63:0] medeleg;
logic [63:0] medeleg__synchronous_exceptions;
logic we__medeleg;
logic en__medeleg;

// Machine Interrupt Delegation Register (mideleg) 
logic [63:0] mideleg;
logic [63:0] mideleg__interrupts;
logic we__mideleg;
logic en__mideleg;

// Machine Interrupt-Pending Register (mip) 
logic [63:0] mip;
logic [0:0] mip__usip;
logic [0:0] mip__ssip;
logic [0:0] mip__hsip;
logic [0:0] mip__msip;
logic [0:0] mip__utip;
logic [0:0] mip__stip;
logic [0:0] mip__htip;
logic [0:0] mip__mtip;
logic [0:0] mip__ueip;
logic [0:0] mip__seip;
logic [0:0] mip__heip;
logic [0:0] mip__meip;
logic [51:0] mip__wiri__0;
logic we__mip;
logic en__mip;

// Machine Interrupt-Enable Register (mie) 
logic [63:0] mie;
logic [0:0] mie__usie;
logic [0:0] mie__ssie;
logic [0:0] mie__hsie;
logic [0:0] mie__msie;
logic [0:0] mie__utie;
logic [0:0] mie__stie;
logic [0:0] mie__htie;
logic [0:0] mie__mtie;
logic [0:0] mie__ueie;
logic [0:0] mie__seie;
logic [0:0] mie__heie;
logic [0:0] mie__meie;
logic [51:0] mie__wpri__0;
logic we__mie;
logic en__mie;

// Machine Cycle Register (mcycle) 
logic [63:0] mcycle;
logic [63:0] mcycle__mcycle;
logic [63:0] mcycle__mcycle__n;
logic we__mcycle;
logic en__mcycle;

// Machine Instruction Retire Register (minstret) 
logic [63:0] minstret;
logic [63:0] minstret__minstret;
logic [63:0] minstret__minstret__n;
logic we__minstret;
logic en__minstret;
logic minstret__write_occurred;
logic state__minstret;
logic state__minstret__n;

// Machine Hardware Performance Monitor Counter 3 (mhpmcounter3)
logic [63:0] mhpmcounter3;
logic [63:0] mhpmcounter3__mhpmcounter3;
logic we__mhpmcounter3;
logic en__mhpmcounter3;

// Machine Hardware Performance Monitor Event 3 (mhpmevent3)
logic [63:0] mhpmevent3;
logic [63:0] mhpmevent3__mhpmevent3;
logic we__mhpmevent3;
logic en__mhpmevent3;

// Machine Scratch Register (mscratch) 
logic [63:0] mscratch;
logic [63:0] mscratch__mscratch;
logic we__mscratch;
logic en__mscratch;

// Machine Exception Program Counter (mepc) 
logic [63:0] mepc;
logic [63:0] mepc__mepc;
logic we__mepc;
logic en__mepc;

// Machine Cause Register (mcause) 
logic [63:0] mcause;
logic [62:0] mcause__exception_code;
logic [0:0] mcause__interrupt;
logic we__mcause;
logic en__mcause;

// Machine Trap Value Register (mtval) 
logic [63:0] mtval;
logic [63:0] mtval__mtval;
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
assign misa[25:0] = misa__extensions;
assign misa[61:26] = misa__wiri__0;
assign misa[63:62] = misa__base;

assign misa__extensions = 26'h0_00_01_00;
assign misa__wiri__0 = 36'h0;
assign misa__base = 2'h2;


//==============================================
// Machine Vendor ID Register (mvendorid)
//==============================================
assign mvendorid[63:0] = mvendorid__vendor;

assign mvendorid__vendor = 64'h0;


//==============================================
// Machine Architecture ID Register (marchid)
//==============================================
assign marchid[63:0] = marchid__architecture_id;

assign marchid__architecture_id = 64'h0;


//==============================================
// Machine Implementation ID Register (mimpid)
//==============================================
assign mimpid[63:0] = mimpid__implementation;

assign mimpid__implementation = 64'h0;


//==============================================
// Hart ID Register (mhartid) 
//==============================================
assign mhartid[63:0] = mhartid__hart_id;

assign mhartid__hart_id = 64'h0;


//============================================== 
// Machine Status Register (mstatus) 
//==============================================
assign mstatus[0] = mstatus__uie;
assign mstatus[1] = mstatus__sie;
assign mstatus[2] = mstatus__hie;
assign mstatus[3] = mstatus__mie;
assign mstatus[4] = mstatus__upie;
assign mstatus[5] = mstatus__spie;
assign mstatus[6] = mstatus__hpie;
assign mstatus[7] = mstatus__mpie;
assign mstatus[8] = mstatus__spp;
assign mstatus[10:9] = mstatus__hpp;
assign mstatus[12:11] = mstatus__mpp;
assign mstatus[14:13] = mstatus__fs;
assign mstatus[16:15] = mstatus__xs;
assign mstatus[17] = mstatus__mprv;
assign mstatus[18] = mstatus__pum;
assign mstatus[19] = mstatus__mxr;
assign mstatus[28:24] = mstatus__vm;
assign mstatus[63] = mstatus__sd;

assign mstatus__uie = 1'b0;
assign mstatus__sie = 1'b0;
assign mstatus__hie = 1'b0;
assign mstatus__upie = 1'b0;
assign mstatus___spie = 1'b0;
assign mstatus__hpie = 1'b0;
assign mstatus__spp = 1'b0;
assign mstatus__hpp = 2'h0;
assign mstatus__mpp = 2'h3;
assign mstatus__fs = 2'h0;
assign mstatus__xs = 2'h0;
assign mstatus__mprv = 1'b0;
assign mstatus__pum = 1'b0;
assign mstatus__mxr = 1'b0;
assign mstatus__vm = 5'h0;
assign mstatus__sd = 1'b0;

assign en__mstatus = cs & we__mstatus;

//==============================
// d_flip_flop__mstatus__mie
//==============================
d_flip_flop #(.WIDTH(1), .RESET_VALUE(1'b0)) d_flip_flop__mstatus__mie
(
    .clk(clk),
    .rst(rst),
    .en(en__mstatus),
    .d(wr_data[3]),
    .q(mstatus__mie)
);


//============================================== 
// Machine Trap-Vector Base-Address Register (mtvec)
//==============================================
assign mtvec[1:0] = mtvec__offset;
assign mtvec[63:2] = mtvec__trap_vector_base_address;

assign mtvec__offset = 2'h0;

assign en__mtvec = cs & we__mtvec;

//==============================
// d_flip_flop__mtvec__trap_vector_base_address
//==============================
d_flip_flop #(.WIDTH(62), .RESET_VALUE(62'h0)) d_flip_flop__mtvec__trap_vector_base_address
(
    .clk(clk),
    .rst(rst),
    .en(en__mtvec),
    .d(wr_data[63:2]),
    .q(mtvec__trap_vector_base_address)
);


//============================================== 
// Machine Exception Delegation Register (medeleg) 
//==============================================
assign medeleg[63:0] = medeleg__synchronous_exceptions;

assign medeleg__synchronous_exceptions = 64'h0;


//============================================== 
// Machine Interrupt Delegation Register (mideleg) 
//==============================================
assign mideleg[63:0] = mideleg__interrupts;

assign mideleg__interrupts = 64'h0;


//============================================== 
// Machine Interrupt-Pending Register (mip) 
//==============================================
assign mip[0] = mip__usip;
assign mip[1] = mip__ssip;
assign mip[2] = mip__hsip;
assign mip[3] = mip__msip;
assign mip[4] = mip__utip;
assign mip[5] = mip__stip;
assign mip[6] = mip__htip;
assign mip[7] = mip__mtip;
assign mip[8] = mip__ueip;
assign mip[9] = mip__seip;
assign mip[10] = mip__heip;
assign mip[11] = mip__meip;
assign mip[63:12] = mip__wiri__0;

assign mip__usip = 1'b0;
assign mip__ssip = 1'b0;
assign mip__hsip = 1'b0;
assign mip__utip = 1'b0;
assign mip__stip = 1'b0;
assign mip__htip = 1'b0;
assign mip__ueip = 1'b0;
assign mip__seip = 1'b0;
assign mip__heip = 1'b0;
assign mip__wiri__0 = 52'h0;

assign en__mip = cs & we__mip;

//==============================
// d_flip_flop__mip__msip
//==============================
d_flip_flop #(.WIDTH(1), .RESET_VALUE(1'b0)) d_flip_flop__mip__msip
(
    .clk(clk),
    .rst(rst),
    .en(en__mip),
    .d(wr_data[3]),
    .q(mip__msip)
);

// FIXME: The tip/eip bit will (likely) be retimed from the PLIC. Make sure the is no issues with X propagation upon reset. 
//==============================
// d_flip_flop__mip__mtip
//==============================
d_flip_flop #(.WIDTH(1), .RESET_VALUE()) d_flip_flop__mip__mtip
(
    .clk(clk),
    .rst(1'b0),
    .en(en__mip),
    .d(wr_data[7]),
    .q(mip__mtip)
);

//==============================
// d_flip_flop__mip__meip
//==============================
d_flip_flop #(.WIDTH(1), .RESET_VALUE()) d_flip_flop__mip__meip
(
    .clk(clk),
    .rst(1'b0),
    .en(en__mip),
    .d(wr_data[11]),
    .q(mip__meip)
);


//============================================== 
// Machine Interrupt-Enable Register (mie) 
//==============================================
assign mie[0] = mie__usie;
assign mie[1] = mie__ssie;
assign mie[2] = mie__hsie;
assign mie[3] = mie__msie;
assign mie[4] = mie__utie;
assign mie[5] = mie__stie;
assign mie[6] = mie__htie;
assign mie[7] = mie__mtie;
assign mie[8] = mie__ueie;
assign mie[9] = mie__seie;
assign mie[10] = mie__heie;
assign mie[11] = mie__meie;
assign mie[63:12] = mie__wpri__0;

assign mie__usie = 1'b0;
assign mie__ssie = 1'b0;
assign mie__hsie = 1'b0;
assign mie__utie = 1'b0;
assign mie__stie = 1'b0;
assign mie__htie = 1'b0;
assign mie__ueie = 1'b0;
assign mie__seie = 1'b0;
assign mie__heie = 1'b0;
assign mie__wpri__0 = 52'h0;

assign en__mie = cs & we__mie;

//==============================
// d_flip_flop__mie__msie
//==============================
d_flip_flop #(.WIDTH(1), .RESET_VALUE(1'b0)) d_flip_flop__mie__msie
(
    .clk(clk),
    .rst(rst),
    .en(en__mie),
    .d(wr_data[3]),
    .q(mie__msie)
);

//==============================
// d_flip_flop__mie__mtie
//==============================
d_flip_flop #(.WIDTH(1), .RESET_VALUE(1'b0)) d_flip_flop__mie__mtie
(
    .clk(clk),
    .rst(rst),
    .en(en__mie),
    .d(wr_data[7]),
    .q(mie__mtie)
);

//==============================
// d_flip_flop__mie__meie
//==============================
d_flip_flop #(.WIDTH(1), .RESET_VALUE(1'b0)) d_flip_flop__mie__meie
(
    .clk(clk),
    .rst(rst),
    .en(en__mie),
    .d(wr_data[11]),
    .q(mie__meie)
);


//============================================== 
// Machine Cycle Register (mcycle) 
//==============================================
assign mcycle[63:0] = mcycle__mcycle;
assign mcycle[63:0] = mcycle__mcycle__n;

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
            mcycle__mcycle__n = wr_data[63:0];
        end
    endcase
end

//==============================
// d_flip_flop__mcycle__mcycle
//==============================
d_flip_flop #(.WIDTH(64), .RESET_VALUE(64'h0)) d_flip_flop__mcycle__mcycle
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
assign minstret[63:0] = minstret__minstret;

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
            minstret__minstret__n = wr_data[63:0];
        end
    endcase
end

//==============================
// d_flip_flop__minstret__minstret
//==============================
d_flip_flop #(.WIDTH(64), .RESET_VALUE(64'h0)) d_flip_flop__minstret__minstret
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
assign mhpmcounter3[63:0] = mhpmcounter3__mhpmcounter3;

assign mhpmcounter3__mhpmcounter3 = 64'h0;


//============================================== 
// Machine Hardware Performance Monitor Event 3 (mhpmevent3)
//==============================================
assign mhpmevent3[63:0] = mhpmevent3__mhpmevent3;

assign mhpmevent3__mhpmevent3 = 64'h0;


//============================================== 
// Machine Scratch Register (mscratch) 
//==============================================
assign mscratch[63:0] = mscratch__mscratch;

assign en__scratch = cs & we__mscratch;

//==============================
// d_flip_flop__mscratch__mscratch
//==============================
d_flip_flop #(.WIDTH(64), .RESET_VALUE(64'h0)) d_flip_flop__mscratch__mscratch
(
    .clk(clk),
    .rst(rst),
    .en(en__mscratch),
    .d(wr_data[63:0]),
    .q(mscratch__mscratch)
);


//============================================== 
// Machine Exception Program Counter (mepc) 
//==============================================
assign mepc[63:0] = mepc__mepc;

assign en__mepc = cs & we__mepc;

//==============================
// d_flip_flop__mepc__mepc
//==============================
d_flip_flop #(.WIDTH(64), .RESET_VALUE(64'h0)) d_flip_flop__mepc__mepc
(
    .clk(clk),
    .rst(rst),
    .en(en__mepc),
    .d(wr_data[63:0]),
    .q(mepc__mepc)
);


//============================================== 
// Machine Cause Register (mcause) 
//==============================================
assign mcause[62:0] = mcause__exception_code;
assign mcause[63] = mcause__interrupt;

assign en__mcause = cs & we__mcause;

//==============================
// d_flip_flop__mcause__exception_code
//==============================
d_flip_flop #(.WIDTH(63), .RESET_VALUE(63'h0)) d_flip_flop__mcause__exception_code
(
    .clk(clk),
    .rst(rst),
    .en(en__mcause),
    .d(wr_data[62:0]),
    .q(mcause__exception_code)
);

//==============================
// d_flip_flop__mcause__interrupt
//==============================
d_flip_flop #(.WIDTH(1), .RESET_VALUE(1'b0)) d_flip_flop__mcause__interrupt
(
    .clk(clk),
    .rst(rst),
    .en(en__mcause),
    .d(wr_data[63]),
    .q(mcause__interrupt)
);


//============================================== 
// Machine Trap Value Register (mtval) 
//==============================================
assign mtval[63:0] = mtval__mtval;

assign en__mtval = cs & we__mtval;

//==============================
// d_flip_flop__mtval__mtval
//==============================
d_flip_flop #(.WIDTH(64), .RESET_VALUE(64'h0)) d_flip_flop__mtval__mtval
(
    .clk(clk),
    .rst(rst),
    .en(en__mtval),
    .d(wr_data[63:0]),
    .q(mtval__mtval)
);


endmodule

