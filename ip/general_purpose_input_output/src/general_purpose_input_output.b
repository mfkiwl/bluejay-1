//==============================================
// general_purpose_input_output
//==============================================
module general_purpose_input_output
(
    input clk,
    input rst,
    input cs,
    input we,
    input addr,
    input [7:0] wr_data,
    output logic [7:0] rd_data
);


assign tip = mtime >= mtimecmp;


always_comb
begin
    case (addr)
        GPIO_REGISTER__0:
        begin
            rd_data = mtime;
            we__mtime = we;
        end
        GPIO_REGISTER__1:
        begin
            rd_data = mtimecmp;
            we__mtimecmp = we;
        end
    endcase
end


//============================================== 
// Machine Time Register (mtime)
//==============================================
logic [63:0] mtime;
logic [CSR__MTIME__MTIME__WIDTH-1:0] mtime__mtime;
logic [CSR__MTIME__MTIME__WIDTH-1:0] mtime__mtime__n;
logic we__mtime;
logic en__mtime;

assign mtime[CSR__MTIME__MTIME__FIELD] = mtime__mtime;

assign en__mtime = 1'b1; 

always_comb
