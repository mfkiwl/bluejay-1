//==============================================
// serial_peripheral_interface 
//==============================================
module serial_peripheral_interface
(
    input clk,
    input rst,
);


logic sck;
logic mosi;
logic miso;


//==============================
// d_flip_flop__mtimecmp__mtimecmp
//==============================
d_flip_flop #(.WIDTH(CSR__MTIMECMP__MTIMECMP__WIDTH), .RESET_VALUE(CSR__MTIMECMP__MTIMECMP__RESET_VALUE)) d_flip_flop__mtimecmp__mtimecmp
(
    .clk(clk),
    .rst(rst),
    .en(en__mtimecmp),
    .d(wr_data[CSR__MTIMECMP__MTIMECMP__FIELD]),
    .q(mtimecmp__mtimecmp)
);


endmodule
