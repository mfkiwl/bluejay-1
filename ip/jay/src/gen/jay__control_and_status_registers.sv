//==============================================
// jay__control_and_status_registers 
//==============================================
module jay__control_and_status_registers
(
    input clk,
    input rst,
    input cs,
    input we,
    input [11:0] addr,
    output logic [63:0] rd_data,
    input [63:0] wr_data,
    input tip,
    input sip,
    input eip,
    input instret,
    output logic [1-1:0] mstatus__mie,
    output logic [1-1:0] mie__msie,
    output logic [1-1:0] mie__mtie,
    output logic [1-1:0] mie__meie,
    output logic [1-1:0] mip__msip,
    output logic [1-1:0] mip__mtip,
    output logic [1-1:0] mip__meip
);

logic [63:0] misa;
logic [63:0] mvendorid;
logic [63:0] marchid;
logic [63:0] mimpid;
logic [63:0] mhartid;
logic [63:0] mstatus;
logic [63:0] mtvec;
logic [63:0] medeleg;
logic [63:0] mideleg;
logic [63:0] mip;
logic [63:0] mie;
logic [63:0] mcycle;
logic [63:0] minstret;
logic [63:0] mscratch;
logic [63:0] mepc;
logic [63:0] mcause;
logic [63:0] mtval;
logic [63:0] mhpmcounter3;
logic [63:0] mhpmevent3;
logic [63:0] mhpmcounter4;
logic [63:0] mhpmevent4;
logic [63:0] mhpmcounter5;
logic [63:0] mhpmevent5;
logic [63:0] mhpmcounter6;
logic [63:0] mhpmevent6;
logic [63:0] mhpmcounter7;
logic [63:0] mhpmevent7;
logic [63:0] mhpmcounter8;
logic [63:0] mhpmevent8;
logic [63:0] mhpmcounter9;
logic [63:0] mhpmevent9;
logic [63:0] mhpmcounter10;
logic [63:0] mhpmevent10;
logic [63:0] mhpmcounter11;
logic [63:0] mhpmevent11;
logic [63:0] mhpmcounter12;
logic [63:0] mhpmevent12;
logic [63:0] mhpmcounter13;
logic [63:0] mhpmevent13;
logic [63:0] mhpmcounter14;
logic [63:0] mhpmevent14;
logic [63:0] mhpmcounter15;
logic [63:0] mhpmevent15;
logic [63:0] mhpmcounter16;
logic [63:0] mhpmevent16;
logic [63:0] mhpmcounter17;
logic [63:0] mhpmevent17;
logic [63:0] mhpmcounter18;
logic [63:0] mhpmevent18;
logic [63:0] mhpmcounter19;
logic [63:0] mhpmevent19;
logic [63:0] mhpmcounter20;
logic [63:0] mhpmevent20;
logic [63:0] mhpmcounter21;
logic [63:0] mhpmevent21;
logic [63:0] mhpmcounter22;
logic [63:0] mhpmevent22;
logic [63:0] mhpmcounter23;
logic [63:0] mhpmevent23;
logic [63:0] mhpmcounter24;
logic [63:0] mhpmevent24;
logic [63:0] mhpmcounter25;
logic [63:0] mhpmevent25;
logic [63:0] mhpmcounter26;
logic [63:0] mhpmevent26;
logic [63:0] mhpmcounter27;
logic [63:0] mhpmevent27;
logic [63:0] mhpmcounter28;
logic [63:0] mhpmevent28;
logic [63:0] mhpmcounter29;
logic [63:0] mhpmevent29;
logic [63:0] mhpmcounter30;
logic [63:0] mhpmevent30;
logic [63:0] mhpmcounter31;
logic [63:0] mhpmevent31;

logic en__misa;
logic en__mvendorid;
logic en__marchid;
logic en__mimpid;
logic en__mhartid;
logic en__mstatus;
logic en__mtvec;
logic en__medeleg;
logic en__mideleg;
logic en__mip;
logic en__mie;
logic en__mcycle;
logic en__minstret;
logic en__mscratch;
logic en__mepc;
logic en__mcause;
logic en__mtval;
logic en__mhpmcounter3;
logic en__mhpmevent3;
logic en__mhpmcounter4;
logic en__mhpmevent4;
logic en__mhpmcounter5;
logic en__mhpmevent5;
logic en__mhpmcounter6;
logic en__mhpmevent6;
logic en__mhpmcounter7;
logic en__mhpmevent7;
logic en__mhpmcounter8;
logic en__mhpmevent8;
logic en__mhpmcounter9;
logic en__mhpmevent9;
logic en__mhpmcounter10;
logic en__mhpmevent10;
logic en__mhpmcounter11;
logic en__mhpmevent11;
logic en__mhpmcounter12;
logic en__mhpmevent12;
logic en__mhpmcounter13;
logic en__mhpmevent13;
logic en__mhpmcounter14;
logic en__mhpmevent14;
logic en__mhpmcounter15;
logic en__mhpmevent15;
logic en__mhpmcounter16;
logic en__mhpmevent16;
logic en__mhpmcounter17;
logic en__mhpmevent17;
logic en__mhpmcounter18;
logic en__mhpmevent18;
logic en__mhpmcounter19;
logic en__mhpmevent19;
logic en__mhpmcounter20;
logic en__mhpmevent20;
logic en__mhpmcounter21;
logic en__mhpmevent21;
logic en__mhpmcounter22;
logic en__mhpmevent22;
logic en__mhpmcounter23;
logic en__mhpmevent23;
logic en__mhpmcounter24;
logic en__mhpmevent24;
logic en__mhpmcounter25;
logic en__mhpmevent25;
logic en__mhpmcounter26;
logic en__mhpmevent26;
logic en__mhpmcounter27;
logic en__mhpmevent27;
logic en__mhpmcounter28;
logic en__mhpmevent28;
logic en__mhpmcounter29;
logic en__mhpmevent29;
logic en__mhpmcounter30;
logic en__mhpmevent30;
logic en__mhpmcounter31;
logic en__mhpmevent31;

assign mstatus__mie = mstatus[3];
assign mie__msie = mie[3];
assign mie__mtie = mie[7];
assign mie__meie = mie[11];
assign mip__msip = mip[3];
assign mip__mtip = mip[7];
assign mip__meip = mip[11];

always_comb
begin
    en__misa = 1'b0;
    en__mvendorid = 1'b0;
    en__marchid = 1'b0;
    en__mimpid = 1'b0;
    en__mhartid = 1'b0;
    en__mstatus = 1'b0;
    en__mtvec = 1'b0;
    en__medeleg = 1'b0;
    en__mideleg = 1'b0;
    en__mip = 1'b0;
    en__mie = 1'b0;
    en__mcycle = 1'b0;
    en__minstret = 1'b0;
    en__mscratch = 1'b0;
    en__mepc = 1'b0;
    en__mcause = 1'b0;
    en__mtval = 1'b0;
    en__mhpmcounter3 = 1'b0;
    en__mhpmevent3 = 1'b0;
    en__mhpmcounter4 = 1'b0;
    en__mhpmevent4 = 1'b0;
    en__mhpmcounter5 = 1'b0;
    en__mhpmevent5 = 1'b0;
    en__mhpmcounter6 = 1'b0;
    en__mhpmevent6 = 1'b0;
    en__mhpmcounter7 = 1'b0;
    en__mhpmevent7 = 1'b0;
    en__mhpmcounter8 = 1'b0;
    en__mhpmevent8 = 1'b0;
    en__mhpmcounter9 = 1'b0;
    en__mhpmevent9 = 1'b0;
    en__mhpmcounter10 = 1'b0;
    en__mhpmevent10 = 1'b0;
    en__mhpmcounter11 = 1'b0;
    en__mhpmevent11 = 1'b0;
    en__mhpmcounter12 = 1'b0;
    en__mhpmevent12 = 1'b0;
    en__mhpmcounter13 = 1'b0;
    en__mhpmevent13 = 1'b0;
    en__mhpmcounter14 = 1'b0;
    en__mhpmevent14 = 1'b0;
    en__mhpmcounter15 = 1'b0;
    en__mhpmevent15 = 1'b0;
    en__mhpmcounter16 = 1'b0;
    en__mhpmevent16 = 1'b0;
    en__mhpmcounter17 = 1'b0;
    en__mhpmevent17 = 1'b0;
    en__mhpmcounter18 = 1'b0;
    en__mhpmevent18 = 1'b0;
    en__mhpmcounter19 = 1'b0;
    en__mhpmevent19 = 1'b0;
    en__mhpmcounter20 = 1'b0;
    en__mhpmevent20 = 1'b0;
    en__mhpmcounter21 = 1'b0;
    en__mhpmevent21 = 1'b0;
    en__mhpmcounter22 = 1'b0;
    en__mhpmevent22 = 1'b0;
    en__mhpmcounter23 = 1'b0;
    en__mhpmevent23 = 1'b0;
    en__mhpmcounter24 = 1'b0;
    en__mhpmevent24 = 1'b0;
    en__mhpmcounter25 = 1'b0;
    en__mhpmevent25 = 1'b0;
    en__mhpmcounter26 = 1'b0;
    en__mhpmevent26 = 1'b0;
    en__mhpmcounter27 = 1'b0;
    en__mhpmevent27 = 1'b0;
    en__mhpmcounter28 = 1'b0;
    en__mhpmevent28 = 1'b0;
    en__mhpmcounter29 = 1'b0;
    en__mhpmevent29 = 1'b0;
    en__mhpmcounter30 = 1'b0;
    en__mhpmevent30 = 1'b0;
    en__mhpmcounter31 = 1'b0;
    en__mhpmevent31 = 1'b0;

    case (addr)
        12'h301:
        begin
            rd_data = misa;
            en__misa = cs & we;
        end
        12'hf11:
        begin
            rd_data = mvendorid;
            en__mvendorid = cs & we;
        end
        12'hf12:
        begin
            rd_data = marchid;
            en__marchid = cs & we;
        end
        12'hf13:
        begin
            rd_data = mimpid;
            en__mimpid = cs & we;
        end
        12'hf14:
        begin
            rd_data = mhartid;
            en__mhartid = cs & we;
        end
        12'h300:
        begin
            rd_data = mstatus;
            en__mstatus = cs & we;
        end
        12'h305:
        begin
            rd_data = mtvec;
            en__mtvec = cs & we;
        end
        12'h302:
        begin
            rd_data = medeleg;
            en__medeleg = cs & we;
        end
        12'h303:
        begin
            rd_data = mideleg;
            en__mideleg = cs & we;
        end
        12'h344:
        begin
            rd_data = mip;
            en__mip = cs & we;
        end
        12'h304:
        begin
            rd_data = mie;
            en__mie = cs & we;
        end
        12'hb00:
        begin
            rd_data = mcycle;
            en__mcycle = cs & we;
        end
        12'hb02:
        begin
            rd_data = minstret;
            en__minstret = cs & we;
        end
        12'h340:
        begin
            rd_data = mscratch; 
            en__mscratch = cs & we;
        end
        12'h341:
        begin
            rd_data = mepc;
            en__mepc = cs & we;
        end
        12'h342:
        begin
            rd_data = mcause;
            en__mcause = cs & we;
        end
        12'h343:
        begin
            rd_data = mtval;
            en__mtval = cs & we;
        end
        12'hb03:
        begin
            rd_data = mhpmcounter3;
            en__mhpmcounter3 = cs & we;
        end
        12'hb04:
        begin
            rd_data = mhpmcounter4;
            en__mhpmcounter4 = cs & we;
        end
        12'hb05:
        begin
            rd_data = mhpmcounter5;
            en__mhpmcounter5 = cs & we;
        end
        12'hb06:
        begin
            rd_data = mhpmcounter6;
            en__mhpmcounter6 = cs & we;
        end
        12'hb07:
        begin
            rd_data = mhpmcounter7;
            en__mhpmcounter7 = cs & we;
        end
        12'hb08:
        begin
            rd_data = mhpmcounter8;
            en__mhpmcounter8 = cs & we;
        end
        12'hb09:
        begin
            rd_data = mhpmcounter9;
            en__mhpmcounter9 = cs & we;
        end
        12'hb0a:
        begin
            rd_data = mhpmcounter10;
            en__mhpmcounter10 = cs & we;
        end
        12'hb0b:
        begin
            rd_data = mhpmcounter11;
            en__mhpmcounter11 = cs & we;
        end
        12'hb0c:
        begin
            rd_data = mhpmcounter12;
            en__mhpmcounter12 = cs & we;
        end
        12'hb0d:
        begin
            rd_data = mhpmcounter13;
            en__mhpmcounter13 = cs & we;
        end
        12'hb0e:
        begin
            rd_data = mhpmcounter14;
            en__mhpmcounter14 = cs & we;
        end
        12'hb0f:
        begin
            rd_data = mhpmcounter15;
            en__mhpmcounter15 = cs & we;
        end
        12'hb10:
        begin
            rd_data = mhpmcounter16;
            en__mhpmcounter16 = cs & we;
        end
        12'hb11:
        begin
            rd_data = mhpmcounter17;
            en__mhpmcounter17 = cs & we;
        end
        12'hb12:
        begin
            rd_data = mhpmcounter18;
            en__mhpmcounter18 = cs & we;
        end
        12'hb13:
        begin
            rd_data = mhpmcounter19;
            en__mhpmcounter19 = cs & we;
        end
        12'hb14:
        begin
            rd_data = mhpmcounter20;
            en__mhpmcounter20 = cs & we;
        end
        12'hb15:
        begin
            rd_data = mhpmcounter21;
            en__mhpmcounter21 = cs & we;
        end
        12'hb16:
        begin
            rd_data = mhpmcounter22;
            en__mhpmcounter22 = cs & we;
        end
        12'hb17:
        begin
            rd_data = mhpmcounter23;
            en__mhpmcounter23 = cs & we;
        end
        12'hb18:
        begin
            rd_data = mhpmcounter24;
            en__mhpmcounter24 = cs & we;
        end
        12'hb19:
        begin
            rd_data = mhpmcounter25;
            en__mhpmcounter25 = cs & we;
        end
        12'hb1a:
        begin
            rd_data = mhpmcounter26;
            en__mhpmcounter26 = cs & we;
        end
        12'hb1b:
        begin
            rd_data = mhpmcounter27;
            en__mhpmcounter27 = cs & we;
        end
        12'hb1c:
        begin
            rd_data = mhpmcounter28;
            en__mhpmcounter28 = cs & we;
        end
        12'hb1d:
        begin
            rd_data = mhpmcounter29;
            en__mhpmcounter29 = cs & we;
        end
        12'hb1e:
        begin
            rd_data = mhpmcounter30;
            en__mhpmcounter30 = cs & we;
        end
        12'hb1f:
        begin
            rd_data = mhpmcounter31;
            en__mhpmcounter31 = cs & we;
        end
        12'h323:
        begin
            rd_data = mhpmevent3;
            en__mhpmevent3 = cs & we;
        end
        12'h324:
        begin
            rd_data = mhpmevent4;
            en__mhpmevent4 = cs & we;
        end
        12'h325:
        begin
            rd_data = mhpmevent5;
            en__mhpmevent5 = cs & we;
        end
        12'h326:
        begin
            rd_data = mhpmevent6;
            en__mhpmevent6 = cs & we;
        end
        12'h327:
        begin
            rd_data = mhpmevent7;
            en__mhpmevent7 = cs & we;
        end
        12'h328:
        begin
            rd_data = mhpmevent8;
            en__mhpmevent8 = cs & we;
        end
        12'h329:
        begin
            rd_data = mhpmevent9;
            en__mhpmevent9 = cs & we;
        end
        12'h32a:
        begin
            rd_data = mhpmevent10;
            en__mhpmevent10 = cs & we;
        end
        12'h32b:
        begin
            rd_data = mhpmevent11;
            en__mhpmevent11 = cs & we;
        end
        12'h32c:
        begin
            rd_data = mhpmevent12;
            en__mhpmevent12 = cs & we;
        end
        12'h32d:
        begin
            rd_data = mhpmevent13;
            en__mhpmevent13 = cs & we;
        end
        12'h32e:
        begin
            rd_data = mhpmevent14;
            en__mhpmevent14 = cs & we;
        end
        12'h32f:
        begin
            rd_data = mhpmevent15;
            en__mhpmevent15 = cs & we;
        end
        12'h330:
        begin
            rd_data = mhpmevent16;
            en__mhpmevent16 = cs & we;
        end
        12'h331:
        begin
            rd_data = mhpmevent17;
            en__mhpmevent17 = cs & we;
        end
        12'h332:
        begin
            rd_data = mhpmevent18;
            en__mhpmevent18 = cs & we;
        end
        12'h333:
        begin
            rd_data = mhpmevent19;
            en__mhpmevent19 = cs & we;
        end
        12'h334:
        begin
            rd_data = mhpmevent20;
            en__mhpmevent20 = cs & we;
        end
        12'h335:
        begin
            rd_data = mhpmevent21;
            en__mhpmevent21 = cs & we;
        end
        12'h336:
        begin
            rd_data = mhpmevent22;
            en__mhpmevent22 = cs & we;
        end
        12'h337:
        begin
            rd_data = mhpmevent23;
            en__mhpmevent23 = cs & we;
        end
        12'h338:
        begin
            rd_data = mhpmevent24;
            en__mhpmevent24 = cs & we;
        end
        12'h339:
        begin
            rd_data = mhpmevent25;
            en__mhpmevent25 = cs & we;
        end
        12'h33a:
        begin
            rd_data = mhpmevent26;
            en__mhpmevent26 = cs & we;
        end
        12'h33b:
        begin
            rd_data = mhpmevent27;
            en__mhpmevent27 = cs & we;
        end
        12'h33c:
        begin
            rd_data = mhpmevent28;
            en__mhpmevent28 = cs & we;
        end
        12'h33d:
        begin
            rd_data = mhpmevent29;
            en__mhpmevent29 = cs & we;
        end
        12'h33e:
        begin
            rd_data = mhpmevent30;
            en__mhpmevent30 = cs & we;
        end
        12'h33f:
        begin
            rd_data = mhpmevent31;
            en__mhpmevent31 = cs & we;
        end
    endcase
end

//==============================
// jay__misa__0
//==============================
jay__misa jay__misa__0
(
    .clk(clk),
    .rst(rst),
    .en(en__misa),
    .wr_data(wr_data),
    .misa(misa)
);

//==============================
// jay__mvendorid__0
//==============================
jay__mvendorid jay__mvendorid__0 
(
    .clk(clk),
    .rst(rst),
    .en(en__mvendorid),
    .wr_data(wr_data),
    .mvendorid(mvendorid)
);

//==============================
// jay__marchid__0
//==============================
jay__marchid jay__marchid__0 
(
    .clk(clk),
    .rst(rst),
    .en(en__marchid),
    .wr_data(wr_data),
    .marchid(marchid)
);

//==============================
// jay__mimpid__0
//==============================
jay__mimpid jay__mimpid__0 
(
    .clk(clk),
    .rst(rst),
    .en(en__mimpid),
    .wr_data(wr_data),
    .mimpid(mimpid)
);

//==============================
// jay__mhartid__0
//==============================
jay__mhartid jay__mhartid__0 
(
    .clk(clk),
    .rst(rst),
    .en(en__mhartid),
    .wr_data(wr_data),
    .mhartid(mhartid)
);

//==============================
// jay__mstatus__0
//==============================
jay__mstatus jay__mstatus__0 
(
    .clk(clk),
    .rst(rst),
    .en(en__mstatus),
    .wr_data(wr_data),
    .mstatus(mstatus)
);

//==============================
// jay__mtvec__0
//==============================
jay__mtvec jay__mtvec__0 
(
    .clk(clk),
    .rst(rst),
    .en(en__mtvec),
    .wr_data(wr_data),
    .mtvec(mtvec)
);

//==============================
// jay__medeleg__0
//==============================
jay__medeleg jay__medeleg__0 
(
    .clk(clk),
    .rst(rst),
    .en(en__medeleg),
    .wr_data(wr_data),
    .medeleg(medeleg)
);

//==============================
// jay__mideleg__0
//==============================
jay__mideleg jay__mideleg__0 
(
    .clk(clk),
    .rst(rst),
    .en(en__mideleg),
    .wr_data(wr_data),
    .mideleg(mideleg)
);

//==============================
// jay__mip__0
//==============================
jay__mip jay__mip__0
(
    .clk(clk),
    .rst(rst),
    .en(en__mip),
    .wr_data(wr_data),
    .mip(mip),
    .sip(sip)
);

//==============================
// jay__mie__0
//==============================
jay__mie jay__mie__0
(
    .clk(clk),
    .rst(rst),
    .en(en__mie),
    .wr_data(wr_data),
    .mie(mie)
);

//==============================
// jay__mcycle__0
//==============================
jay__mcycle jay__mcycle__0
(
    .clk(clk),
    .rst(rst),
    .en(en__mcycle),
    .wr_data(wr_data),
    .mcycle(mcycle)
);

//==============================
// jay__minstret__0
//==============================
jay__minstret jay__minstret__0
(
    .clk(clk),
    .rst(rst),
    .en(en__minstret),
    .wr_data(wr_data),
    .minstret(minstret),
    .instret(instret)
);

//==============================
// jay__mscratch__0
//==============================
jay__mscratch jay__mscratch__0
(
    .clk(clk),
    .rst(rst),
    .en(en__mscratch),
    .wr_data(wr_data),
    .mscratch(mscratch)
);

//==============================
// jay__mepc__0
//==============================
jay__mepc jay__mepc__0
(
    .clk(clk),
    .rst(rst),
    .en(en__mepc),
    .wr_data(wr_data),
    .mepc(mepc)
);

//==============================
// jay__mcause__0
//==============================
jay__mcause jay__mcause__0
(
    .clk(clk),
    .rst(rst),
    .en(en__mcause),
    .wr_data(wr_data),
    .mcause(mcause)
);

//==============================
// jay__mtval__0
//==============================
jay__mtval jay__mtval__0
(
    .clk(clk),
    .rst(rst),
    .en(en__mtval),
    .wr_data(wr_data),
    .mtval(mtval)
);

//==============================
// jay__mhpmcounter__3
//==============================
jay__mhpmcounter jay__mhpmcounter__3
(
    .clk(clk),
    .rst(rst),
    .en(en__mhpmcounter3),
    .wr_data(wr_data),
    .mhpmcounter(mhpmcounter3)
);

//==============================
// jay__mhpmevent__3
//==============================
jay__mhpmevent jay__mhpmevent__3
(
    .clk(clk),
    .rst(rst),
    .en(en__mhpmevent3),
    .wr_data(wr_data),
    .mhpmevent(mhpmevent3)
);

//==============================
// jay__mhpmcounter__4
//==============================
jay__mhpmcounter jay__mhpmcounter__4
(
    .clk(clk),
    .rst(rst),
    .en(en__mhpmcounter4),
    .wr_data(wr_data),
    .mhpmcounter(mhpmcounter4)
);

//==============================
// jay__mhpmevent__4
//==============================
jay__mhpmevent jay__mhpmevent__4
(
    .clk(clk),
    .rst(rst),
    .en(en__mhpmevent4),
    .wr_data(wr_data),
    .mhpmevent(mhpmevent4)
);

//==============================
// jay__mhpmcounter__5
//==============================
jay__mhpmcounter jay__mhpmcounter__5
(
    .clk(clk),
    .rst(rst),
    .en(en__mhpmcounter5),
    .wr_data(wr_data),
    .mhpmcounter(mhpmcounter5)
);

//==============================
// jay__mhpmevent__5
//==============================
jay__mhpmevent jay__mhpmevent__5
(
    .clk(clk),
    .rst(rst),
    .en(en__mhpmevent5),
    .wr_data(wr_data),
    .mhpmevent(mhpmevent5)
);

//==============================
// jay__mhpmcounter__6
//==============================
jay__mhpmcounter jay__mhpmcounter__6
(
    .clk(clk),
    .rst(rst),
    .en(en__mhpmcounter6),
    .wr_data(wr_data),
    .mhpmcounter(mhpmcounter6)
);

//==============================
// jay__mhpmevent__6
//==============================
jay__mhpmevent jay__mhpmevent__6
(
    .clk(clk),
    .rst(rst),
    .en(en__mhpmevent6),
    .wr_data(wr_data),
    .mhpmevent(mhpmevent6)
);

//==============================
// jay__mhpmcounter__7
//==============================
jay__mhpmcounter jay__mhpmcounter__7
(
    .clk(clk),
    .rst(rst),
    .en(en__mhpmcounter7),
    .wr_data(wr_data),
    .mhpmcounter(mhpmcounter7)
);

//==============================
// jay__mhpmevent__7
//==============================
jay__mhpmevent jay__mhpmevent__7
(
    .clk(clk),
    .rst(rst),
    .en(en__mhpmevent7),
    .wr_data(wr_data),
    .mhpmevent(mhpmevent7)
);

//==============================
// jay__mhpmcounter__8
//==============================
jay__mhpmcounter jay__mhpmcounter__8
(
    .clk(clk),
    .rst(rst),
    .en(en__mhpmcounter8),
    .wr_data(wr_data),
    .mhpmcounter(mhpmcounter8)
);

//==============================
// jay__mhpmevent__8
//==============================
jay__mhpmevent jay__mhpmevent__8
(
    .clk(clk),
    .rst(rst),
    .en(en__mhpmevent8),
    .wr_data(wr_data),
    .mhpmevent(mhpmevent8)
);

//==============================
// jay__mhpmcounter__9
//==============================
jay__mhpmcounter jay__mhpmcounter__9
(
    .clk(clk),
    .rst(rst),
    .en(en__mhpmcounter9),
    .wr_data(wr_data),
    .mhpmcounter(mhpmcounter9)
);

//==============================
// jay__mhpmevent__9
//==============================
jay__mhpmevent jay__mhpmevent__9
(
    .clk(clk),
    .rst(rst),
    .en(en__mhpmevent9),
    .wr_data(wr_data),
    .mhpmevent(mhpmevent9)
);

//==============================
// jay__mhpmcounter__10
//==============================
jay__mhpmcounter jay__mhpmcounter__10
(
    .clk(clk),
    .rst(rst),
    .en(en__mhpmcounter10),
    .wr_data(wr_data),
    .mhpmcounter(mhpmcounter10)
);

//==============================
// jay__mhpmevent__10
//==============================
jay__mhpmevent jay__mhpmevent__10
(
    .clk(clk),
    .rst(rst),
    .en(en__mhpmevent10),
    .wr_data(wr_data),
    .mhpmevent(mhpmevent10)
);

//==============================
// jay__mhpmcounter__11
//==============================
jay__mhpmcounter jay__mhpmcounter__11
(
    .clk(clk),
    .rst(rst),
    .en(en__mhpmcounter11),
    .wr_data(wr_data),
    .mhpmcounter(mhpmcounter11)
);

//==============================
// jay__mhpmevent__11
//==============================
jay__mhpmevent jay__mhpmevent__11
(
    .clk(clk),
    .rst(rst),
    .en(en__mhpmevent11),
    .wr_data(wr_data),
    .mhpmevent(mhpmevent11)
);

//==============================
// jay__mhpmcounter__12
//==============================
jay__mhpmcounter jay__mhpmcounter__12
(
    .clk(clk),
    .rst(rst),
    .en(en__mhpmcounter12),
    .wr_data(wr_data),
    .mhpmcounter(mhpmcounter12)
);

//==============================
// jay__mhpmevent__12
//==============================
jay__mhpmevent jay__mhpmevent__12
(
    .clk(clk),
    .rst(rst),
    .en(en__mhpmevent12),
    .wr_data(wr_data),
    .mhpmevent(mhpmevent12)
);

//==============================
// jay__mhpmcounter__13
//==============================
jay__mhpmcounter jay__mhpmcounter__13
(
    .clk(clk),
    .rst(rst),
    .en(en__mhpmcounter13),
    .wr_data(wr_data),
    .mhpmcounter(mhpmcounter13)
);

//==============================
// jay__mhpmevent__13
//==============================
jay__mhpmevent jay__mhpmevent__13
(
    .clk(clk),
    .rst(rst),
    .en(en__mhpmevent13),
    .wr_data(wr_data),
    .mhpmevent(mhpmevent13)
);

//==============================
// jay__mhpmcounter__14
//==============================
jay__mhpmcounter jay__mhpmcounter__14
(
    .clk(clk),
    .rst(rst),
    .en(en__mhpmcounter14),
    .wr_data(wr_data),
    .mhpmcounter(mhpmcounter14)
);

//==============================
// jay__mhpmevent__14
//==============================
jay__mhpmevent jay__mhpmevent__14
(
    .clk(clk),
    .rst(rst),
    .en(en__mhpmevent14),
    .wr_data(wr_data),
    .mhpmevent(mhpmevent14)
);

//==============================
// jay__mhpmcounter__15
//==============================
jay__mhpmcounter jay__mhpmcounter__15
(
    .clk(clk),
    .rst(rst),
    .en(en__mhpmcounter15),
    .wr_data(wr_data),
    .mhpmcounter(mhpmcounter15)
);

//==============================
// jay__mhpmevent__15
//==============================
jay__mhpmevent jay__mhpmevent__15
(
    .clk(clk),
    .rst(rst),
    .en(en__mhpmevent15),
    .wr_data(wr_data),
    .mhpmevent(mhpmevent15)
);

//==============================
// jay__mhpmcounter__16
//==============================
jay__mhpmcounter jay__mhpmcounter__16
(
    .clk(clk),
    .rst(rst),
    .en(en__mhpmcounter16),
    .wr_data(wr_data),
    .mhpmcounter(mhpmcounter16)
);

//==============================
// jay__mhpmevent__16
//==============================
jay__mhpmevent jay__mhpmevent__16
(
    .clk(clk),
    .rst(rst),
    .en(en__mhpmevent16),
    .wr_data(wr_data),
    .mhpmevent(mhpmevent16)
);

//==============================
// jay__mhpmcounter__17
//==============================
jay__mhpmcounter jay__mhpmcounter__17
(
    .clk(clk),
    .rst(rst),
    .en(en__mhpmcounter17),
    .wr_data(wr_data),
    .mhpmcounter(mhpmcounter17)
);

//==============================
// jay__mhpmevent__17
//==============================
jay__mhpmevent jay__mhpmevent__17
(
    .clk(clk),
    .rst(rst),
    .en(en__mhpmevent17),
    .wr_data(wr_data),
    .mhpmevent(mhpmevent17)
);

//==============================
// jay__mhpmcounter__18
//==============================
jay__mhpmcounter jay__mhpmcounter__18
(
    .clk(clk),
    .rst(rst),
    .en(en__mhpmcounter18),
    .wr_data(wr_data),
    .mhpmcounter(mhpmcounter18)
);

//==============================
// jay__mhpmevent__18
//==============================
jay__mhpmevent jay__mhpmevent__18
(
    .clk(clk),
    .rst(rst),
    .en(en__mhpmevent18),
    .wr_data(wr_data),
    .mhpmevent(mhpmevent18)
);

//==============================
// jay__mhpmcounter__19
//==============================
jay__mhpmcounter jay__mhpmcounter__19
(
    .clk(clk),
    .rst(rst),
    .en(en__mhpmcounter19),
    .wr_data(wr_data),
    .mhpmcounter(mhpmcounter19)
);

//==============================
// jay__mhpmevent__19
//==============================
jay__mhpmevent jay__mhpmevent__19
(
    .clk(clk),
    .rst(rst),
    .en(en__mhpmevent19),
    .wr_data(wr_data),
    .mhpmevent(mhpmevent19)
);

//==============================
// jay__mhpmcounter__20
//==============================
jay__mhpmcounter jay__mhpmcounter__20
(
    .clk(clk),
    .rst(rst),
    .en(en__mhpmcounter20),
    .wr_data(wr_data),
    .mhpmcounter(mhpmcounter20)
);

//==============================
// jay__mhpmevent__20
//==============================
jay__mhpmevent jay__mhpmevent__20
(
    .clk(clk),
    .rst(rst),
    .en(en__mhpmevent20),
    .wr_data(wr_data),
    .mhpmevent(mhpmevent20)
);

//==============================
// jay__mhpmcounter__21
//==============================
jay__mhpmcounter jay__mhpmcounter__21
(
    .clk(clk),
    .rst(rst),
    .en(en__mhpmcounter21),
    .wr_data(wr_data),
    .mhpmcounter(mhpmcounter21)
);

//==============================
// jay__mhpmevent__21
//==============================
jay__mhpmevent jay__mhpmevent__21
(
    .clk(clk),
    .rst(rst),
    .en(en__mhpmevent21),
    .wr_data(wr_data),
    .mhpmevent(mhpmevent21)
);

//==============================
// jay__mhpmcounter__22
//==============================
jay__mhpmcounter jay__mhpmcounter__22
(
    .clk(clk),
    .rst(rst),
    .en(en__mhpmcounter22),
    .wr_data(wr_data),
    .mhpmcounter(mhpmcounter22)
);

//==============================
// jay__mhpmevent__22
//==============================
jay__mhpmevent jay__mhpmevent__22
(
    .clk(clk),
    .rst(rst),
    .en(en__mhpmevent22),
    .wr_data(wr_data),
    .mhpmevent(mhpmevent22)
);

//==============================
// jay__mhpmcounter__23
//==============================
jay__mhpmcounter jay__mhpmcounter__23
(
    .clk(clk),
    .rst(rst),
    .en(en__mhpmcounter23),
    .wr_data(wr_data),
    .mhpmcounter(mhpmcounter23)
);

//==============================
// jay__mhpmevent__23
//==============================
jay__mhpmevent jay__mhpmevent__23
(
    .clk(clk),
    .rst(rst),
    .en(en__mhpmevent23),
    .wr_data(wr_data),
    .mhpmevent(mhpmevent23)
);

//==============================
// jay__mhpmcounter__24
//==============================
jay__mhpmcounter jay__mhpmcounter__24
(
    .clk(clk),
    .rst(rst),
    .en(en__mhpmcounter24),
    .wr_data(wr_data),
    .mhpmcounter(mhpmcounter24)
);

//==============================
// jay__mhpmevent__24
//==============================
jay__mhpmevent jay__mhpmevent__24
(
    .clk(clk),
    .rst(rst),
    .en(en__mhpmevent24),
    .wr_data(wr_data),
    .mhpmevent(mhpmevent24)
);

//==============================
// jay__mhpmcounter__25
//==============================
jay__mhpmcounter jay__mhpmcounter__25
(
    .clk(clk),
    .rst(rst),
    .en(en__mhpmcounter25),
    .wr_data(wr_data),
    .mhpmcounter(mhpmcounter25)
);

//==============================
// jay__mhpmevent__25
//==============================
jay__mhpmevent jay__mhpmevent__25
(
    .clk(clk),
    .rst(rst),
    .en(en__mhpmevent25),
    .wr_data(wr_data),
    .mhpmevent(mhpmevent25)
);

//==============================
// jay__mhpmcounter__26
//==============================
jay__mhpmcounter jay__mhpmcounter__26
(
    .clk(clk),
    .rst(rst),
    .en(en__mhpmcounter26),
    .wr_data(wr_data),
    .mhpmcounter(mhpmcounter26)
);

//==============================
// jay__mhpmevent__26
//==============================
jay__mhpmevent jay__mhpmevent__26
(
    .clk(clk),
    .rst(rst),
    .en(en__mhpmevent26),
    .wr_data(wr_data),
    .mhpmevent(mhpmevent26)
);

//==============================
// jay__mhpmcounter__27
//==============================
jay__mhpmcounter jay__mhpmcounter__27
(
    .clk(clk),
    .rst(rst),
    .en(en__mhpmcounter27),
    .wr_data(wr_data),
    .mhpmcounter(mhpmcounter27)
);

//==============================
// jay__mhpmevent__27
//==============================
jay__mhpmevent jay__mhpmevent__27
(
    .clk(clk),
    .rst(rst),
    .en(en__mhpmevent27),
    .wr_data(wr_data),
    .mhpmevent(mhpmevent27)
);

//==============================
// jay__mhpmcounter__28
//==============================
jay__mhpmcounter jay__mhpmcounter__28
(
    .clk(clk),
    .rst(rst),
    .en(en__mhpmcounter28),
    .wr_data(wr_data),
    .mhpmcounter(mhpmcounter28)
);

//==============================
// jay__mhpmevent__28
//==============================
jay__mhpmevent jay__mhpmevent__28
(
    .clk(clk),
    .rst(rst),
    .en(en__mhpmevent28),
    .wr_data(wr_data),
    .mhpmevent(mhpmevent28)
);

//==============================
// jay__mhpmcounter__29
//==============================
jay__mhpmcounter jay__mhpmcounter__29
(
    .clk(clk),
    .rst(rst),
    .en(en__mhpmcounter29),
    .wr_data(wr_data),
    .mhpmcounter(mhpmcounter29)
);

//==============================
// jay__mhpmevent__29
//==============================
jay__mhpmevent jay__mhpmevent__29
(
    .clk(clk),
    .rst(rst),
    .en(en__mhpmevent29),
    .wr_data(wr_data),
    .mhpmevent(mhpmevent29)
);

//==============================
// jay__mhpmcounter__30
//==============================
jay__mhpmcounter jay__mhpmcounter__30
(
    .clk(clk),
    .rst(rst),
    .en(en__mhpmcounter30),
    .wr_data(wr_data),
    .mhpmcounter(mhpmcounter30)
);

//==============================
// jay__mhpmevent__30
//==============================
jay__mhpmevent jay__mhpmevent__30
(
    .clk(clk),
    .rst(rst),
    .en(en__mhpmevent30),
    .wr_data(wr_data),
    .mhpmevent(mhpmevent30)
);

//==============================
// jay__mhpmcounter__31
//==============================
jay__mhpmcounter jay__mhpmcounter__31
(
    .clk(clk),
    .rst(rst),
    .en(en__mhpmcounter31),
    .wr_data(wr_data),
    .mhpmcounter(mhpmcounter31)
);

//==============================
// jay__mhpmevent__31
//==============================
jay__mhpmevent jay__mhpmevent__31
(
    .clk(clk),
    .rst(rst),
    .en(en__mhpmevent31),
    .wr_data(wr_data),
    .mhpmevent(mhpmevent31)
);


endmodule

