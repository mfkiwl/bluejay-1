//==============================================
// jbus__decoder
//==============================================
module jbus__decoder
(
    input clk,
    input rst,
PYTHON
(
    for i in range(JBUS__NUMBER_OF_REGIONS):
        print(f"    output logic jcs__{i},")
        print(f"    input jready__{i},")
        print(f"    input jresp__{i},")
        print(f"    input [63:0] jrd_data__{i},")
)
    input jcs,
    output logic jready,
    output logic jresp,
    output logic [63:0] jrd_data
);


always_comb
begin
PYTHON
(
    for i in range(JBUS__NUMBER_OF_REGIONS):
        print(f"    jcs__{i} = 1'b0;")
)
    jready = 1'b0;
    jresp = 1'b1;
    jrd_data = ERRORCODE__ACCESS_FAULT;

    casez (addr)
PYTHON
(
    for i in range(JBUS__NUMBER_OF_REGIONS):
        print(f"        JBUS__REGION__{i}:")
        print(f"        begin")
        print(f"            jcs__{i} = jcs;")
        print(f"            jready = jready__{i};")
        print(f"            jresp = jresp__{i};")
        print(f"            jrd_data = jrd_data__{i};")
        print(f"        end")
        print(f"")
)
        default:
        begin
            jready = 1'b1;
            jresp = 1'b1;
            jrd_data = ERRORCODE__ACCESS_FAULT;
        end
    endcase
end

endmodule

