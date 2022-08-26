////==============================================
//// timer
////==============================================
//module timer
//(
//    input clk,
//    input rst,
//    input [WIDTH-1:0] N,   
//    output logic ov
//);
//
//// To achieve a period of x clock cycles, set N = x - 1.
//
//
//parameter WIDTH = 8;
//    
//logic [WIDHT-1:0] n;
//    
//
//assign ov = (n == N);
//
//    
//always_ff @(posedge clk) begin
//    if (rst) begin
//        n <= 0;
//    end
//    else begin
//        n <= (n == N) ? 0 : n + 1;
//    end
//end
//
//
//endmodule
