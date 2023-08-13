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
    output logic [CSR__MSTATUS__MIE__WIDTH-1:0] mstatus__mie,
    output logic [CSR__MIE__MSIE__WIDTH-1:0] mie__msie,
    output logic [CSR__MIE__MTIE__WIDTH-1:0] mie__mtie,
    output logic [CSR__MIE__MEIE__WIDTH-1:0] mie__meie,
    output logic [CSR__MIP__MSIP__WIDTH-1:0] mip__msip,
    output logic [CSR__MIP__MTIP__WIDTH-1:0] mip__mtip,
    output logic [CSR__MIP__MEIP__WIDTH-1:0] mip__meip
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
PYTHON
(
    for i in range(3, 32):
        print(f"logic [63:0] mhpmcounter{i};")
        print(f"logic [63:0] mhpmevent{i};")
)

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
PYTHON
(
    for i in range(3, 32):
        print(f"logic en__mhpmcounter{i};")
        print(f"logic en__mhpmevent{i};")
)

assign mstatus__mie = mstatus[CSR__MSTATUS__MIE__FIELD];
assign mie__msie = mie[CSR__MIE__MSIE__FIELD];
assign mie__mtie = mie[CSR__MIE__MTIE__FIELD];
assign mie__meie = mie[CSR__MIE__MEIE__FIELD];
assign mip__msip = mip[CSR__MIP__MSIP__FIELD];
assign mip__mtip = mip[CSR__MIP__MTIP__FIELD];
assign mip__meip = mip[CSR__MIP__MEIP__FIELD];

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
PYTHON
(
    for i in range(3, 32):
        print(f"    en__mhpmcounter{i} = 1'b0;")
        print(f"    en__mhpmevent{i} = 1'b0;")
)

    case (addr)
        CSR__MISA:
        begin
            rd_data = misa;
            en__misa = cs & we;
        end
        CSR__MVENDORID:
        begin
            rd_data = mvendorid;
            en__mvendorid = cs & we;
        end
        CSR__MARCHID:
        begin
            rd_data = marchid;
            en__marchid = cs & we;
        end
        CSR__MIMPID:
        begin
            rd_data = mimpid;
            en__mimpid = cs & we;
        end
        CSR__MHARTID:
        begin
            rd_data = mhartid;
            en__mhartid = cs & we;
        end
        CSR__MSTATUS:
        begin
            rd_data = mstatus;
            en__mstatus = cs & we;
        end
        CSR__MTVEC:
        begin
            rd_data = mtvec;
            en__mtvec = cs & we;
        end
        CSR__MEDELEG:
        begin
            rd_data = medeleg;
            en__medeleg = cs & we;
        end
        CSR__MIDELEG:
        begin
            rd_data = mideleg;
            en__mideleg = cs & we;
        end
        CSR__MIP:
        begin
            rd_data = mip;
            en__mip = cs & we;
        end
        CSR__MIE:
        begin
            rd_data = mie;
            en__mie = cs & we;
        end
        CSR__MCYCLE:
        begin
            rd_data = mcycle;
            en__mcycle = cs & we;
        end
        CSR__MINSTRET:
        begin
            rd_data = minstret;
            en__minstret = cs & we;
        end
        CSR__MSCRATCH:
        begin
            rd_data = mscratch; 
            en__mscratch = cs & we;
        end
        CSR__MEPC:
        begin
            rd_data = mepc;
            en__mepc = cs & we;
        end
        CSR__MCAUSE:
        begin
            rd_data = mcause;
            en__mcause = cs & we;
        end
        CSR__MTVAL:
        begin
            rd_data = mtval;
            en__mtval = cs & we;
        end
PYTHON
(
    for i in range(3, 32):
        print(f"        CSR__MHPMCOUNTER{i}:")
        print(f"        begin")
        print(f"            rd_data = mhpmcounter{i};")
        print(f"            en__mhpmcounter{i} = cs & we;")
        print(f"        end")
)
PYTHON
(
    for i in range(3, 32):
        print(f"        CSR__MHPMEVENT{i}:")
        print(f"        begin")
        print(f"            rd_data = mhpmevent{i};")
        print(f"            en__mhpmevent{i} = cs & we;")
        print(f"        end")
)
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

PYTHON
(
    for i in range(3, 32):
        print(f"//==============================")
        print(f"// jay__mhpmcounter__{i}")
        print(f"//==============================")
        print(f"jay__mhpmcounter jay__mhpmcounter__{i}")
        print(f"(")
        print(f"    .clk(clk),")
        print(f"    .rst(rst),")
        print(f"    .en(en__mhpmcounter{i}),")
        print(f"    .wr_data(wr_data),")
        print(f"    .mhpmcounter(mhpmcounter{i})")
        print(f");")
        print(f"")
        print(f"//==============================")
        print(f"// jay__mhpmevent__{i}")
        print(f"//==============================")
        print(f"jay__mhpmevent jay__mhpmevent__{i}")
        print(f"(")
        print(f"    .clk(clk),")
        print(f"    .rst(rst),")
        print(f"    .en(en__mhpmevent{i}),")
        print(f"    .wr_data(wr_data),")
        print(f"    .mhpmevent(mhpmevent{i})")
        print(f");")
        print(f"")
)

endmodule

