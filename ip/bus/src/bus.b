//==============================================
// bus 
//==============================================
module bus 
(
    input clk,
    input rst,
PYTHON
(
    for i in range(8):
        print(f"    input cs__{i},")
        print(f"    input ready__{i},")
        print(f"    input [63:0] rd_data__{i},")
)
    output logic ready,
    output logic resp,
    output logic [63:0] rd_data
);


always_comb
begin
    case (1'b1)
PYTHON
(
    for in in range(8):
        print(f"        3'h{i:x}:")
        print(f"        begin")
        print(f"            ready = ready__{i};")
        print(f"            rd_data = rd_data__{i};")
        print(f"        end")
)
    endcase
end

endmodule

