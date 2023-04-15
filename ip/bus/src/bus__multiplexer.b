//==============================================
// bus__multiplexer
//==============================================
module bus__multiplexer
(
    input clk,
    input rst,
PYTHON
(
    for i in range(8):
        print(f"    output logic cs__{i},")
        print(f"    input ready__{i},")
        print(f"    input [63:0] rd_data__{i},")
        
)
    input cs,
    output logic ready,
    output logic [63:0] rd_data,
    input [2:0] sel
);


always_comb
begin
    cs__0 = 1'b0; 
    cs__1 = 1'b0; 
    cs__2 = 1'b0; 
    cs__3 = 1'b0; 
    cs__4 = 1'b0; 
    cs__5 = 1'b0; 
    cs__6 = 1'b0; 
    cs__7 = 1'b0; 

    case (sel)
        3'h0:
        begin
            cs__0 = cs;
            ready = ready__0;
            rd_data = rd_data__0;
        end
        3'h1:
        begin
            cs__1 = cs;
            ready = ready__1;
            rd_data = rd_data__1;
        end
        3'h2:
        begin
            cs__2 = cs;
            ready = ready__2;
            rd_data = rd_data__2;
        end
        3'h3:
        begin
            cs__3 = cs;
            ready = ready__3;
            rd_data = rd_data__3;
        end
        3'h4:
        begin
            cs__4 = cs;
            ready = ready__4;
            rd_data = rd_data__4;
        end
        3'h5:
        begin
            cs__5 = cs;
            ready = ready__5;
            rd_data = rd_data__5;
        end
        3'h6:
        begin
            cs__6 = cs;
            ready = ready__6;
            rd_data = rd_data__6;
        end
        3'h7:
        begin
            cs__7 = cs;
            ready = ready__7;
            rd_data = rd_data__7;
        end
    endcase
end

endmodule
