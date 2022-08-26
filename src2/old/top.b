//==============================================
// top
//==============================================
module top
(
    input clk_100mhz,
    // input [15:0] sw,         //switches
    input btnc,       //center button
    // input btnu,      //up button
    // input btnl,       //left button
    // input btnr,       //right button
    // input btnd,       //down button
    // output logic [15:0] led,        //little LEDs above switches
    output logic led16_b    //blue channel left RGB LED
    // output logic led16_g,    //green channel left RGB LED
    // output logic led16_r,    //red channel left RGB LED
    // output logic led17_b,    //blue channel right RGB LED
    // output logic led17_g,    //green channel right RGB LED
    // output logic led17_r,    //red channel right RGB LED
    // output logic [7:0] an,
    // output logic ca, cb, cc, cd, ce, cf, cg
);


logic clk;
logic rst;
logic x;
// logic btnd_clean;
// logic [7:0] port_0;
// logic [7:0] port_1;
// logic [7:0] port_2;
// logic [7:0] port_3;

assign clk = clk_100mhz;
assign rst = btnc;
assign led16_b = port__0__rd_data[0];
// assign rst = btnd_clean;
// assign led[7:0] = port_0;
// assign led[15:8] = port_1;

//==============================
// jay__0
//==============================
jay jay__0
(
    .clk(clk),
    .rst(rst),
    .port__0__rd_data(port__0__rd_data)
);

logic [63:0] port__0__rd_data;


endmodule
