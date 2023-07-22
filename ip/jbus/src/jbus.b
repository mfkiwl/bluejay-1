//==============================================
// jbus 
//==============================================
module jbus 
(
    input clk,
    input rst,
PYTHON
(
    for i in range(JBUS__NUMBER_OF_REGIONS):
        print(f"    output logic cs__{i},")
        print(f"    output logic we__{i},")
        print(f"    output logic [39:0] addr__{i},")
        print(f"    output logic [1:0] size__{i},")
        print(f"    output logic [63:0] wr_data__{i},")
        print(f"    input ready__{i},")
        print(f"    input resp__{i},")
        print(f"    input [63:0] rd_data__{i},")
)
    input cs,
    input we,
    input [63:0] addr,
    input [1:0] size,
    input [63:0] wr_data,
    output logic ready,
    output logic resp,
    output logic [63:0] rd_data
);


//==============================
// jbus__decoder 
//==============================
jbus__decoder decoder 
(
    .clk(clk),
    .rst(rst),
PYTHON
(
    for i in range(JBUS__NUMBER_OF_REGIONS):
        print(f"    .jcs__{i}(jcs__{i}),")
        print(f"    .jready__{i}(jready__{i}),")
        print(f"    .jresp__{i}(jresp__{i}),")
        print(f"    .jrd_data__{i}(jrd_data__{i}),")
)
    .jcs(jcs),
    .jready(jready),
    .jresp(jresp),
    .jrd_data(jrd_data)
);


//==============================
// master
//==============================
jbus__master master 
(
    .clk(clk),
    .rst(rst),
    .jcs(jcs),
    .jwe(jwe),
    .jaddr(jaddr),
    .jsize(jsize),
    .jwr_data(jwr_data),
    .jready(jready),
    .jresp(jresp),
    .jrd_data(jrd_data)
    .cs(cs),
    .we(we),
    .addr(addr),
    .size(size),
    .wr_data(wr_data),
    .ready(ready),
    .resp(resp),
    .rd_data(rd_data)
);


PYTHON
(
    for i in range(JBUS__NUMBER_OF_REGIONS):
        if JBUS__INCLUDE_SLAVES:
            print(f"//==============================")
            print(f"// jbus__slave")
            print(f"//==============================")
            print(f"jbus__slave slave__{i}")
            print(f"(")
            print(f"    .clk(clk),")
            print(f"    .rst(rst),")
            print(f"    .jcs(jcs__{i}),")
            print(f"    .jwe(jwe),")
            print(f"    .jaddr(jaddr),")
            print(f"    .jsize(jsize),")
            print(f"    .jwr_data(jwr_data),")
            print(f"    .jready(jready__{i}),")
            print(f"    .jresp(jresp__{i}),")
            print(f"    .jrd_data(jrd_data__{i})")
            print(f"    .cs(cs__{i}),")
            print(f"    .we(we__{i}),")
            print(f"    .addr(addr__{i}),")
            print(f"    .size(size__{i}),")
            print(f"    .wr_data(wr_data__{i}),")
            print(f"    .ready(ready__{i}),")
            print(f"    .resp(resp__{i}),")
            print(f"    .rd_data(rd_data__{i})")
            print(f");")
            print(f"")
        else:
            print(f"assign cs__{i} = jcs__{i};")
            print(f"assign we__{i} = jwe;")
            print(f"assign addr__{i} = jaddr;")
            print(f"assign size__{i} = jsize;")
            print(f"assign wr_data__{i} = jwr_data;")
            print(f"assign jready__{i} = ready__{i};")
            print(f"assign jresp__{i} = resp__{i};")
            print(f"assign jrd_data__{i} = rd_data__{i};")
            print(f"")
)

endmodule

