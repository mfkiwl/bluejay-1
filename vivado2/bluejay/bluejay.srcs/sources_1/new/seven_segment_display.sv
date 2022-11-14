//==============================================
// seven_segment_display
//==============================================
module seven_segment_display
(
    input logic clk,
    input logic rst,
    input logic [7:0] en,
    input logic [3:0] n__0, 
    input logic [3:0] n__1, 
    input logic [3:0] n__2, 
    input logic [3:0] n__3, 
    input logic [3:0] n__4, 
    input logic [3:0] n__5, 
    input logic [3:0] n__6, 
    input logic [3:0] n__7,
    output logic [7:0] an,
    output logic ca, 
    output logic cb, 
    output logic cc, 
    output logic cd, 
    output logic ce, 
    output logic cf, 
    output logic cg
);
    

logic [3:0] n;
logic [15:0] count;
logic [7:0] state;
logic [7:0] state__n;


always_comb begin
    case (state)
        8'hfe: n = n__0;
        8'hfd: n = n__1;
        8'hfb: n = n__2;
        8'hf7: n = n__3;
        8'hef: n = n__4;
        8'hdf: n = n__5;
        8'hbf: n = n__6;
        8'h7f: n = n__7;
    endcase
end


always_ff @(posedge clk) begin
    if (rst) begin
        an <= 8'hff;
    end
    else begin
        an <= state | ~en;
    end
end


always_comb begin
    state__n = state;

    if (count == 0) begin
        state__n = {state[6:0], state[7]};
    end
end


always_ff @(posedge clk) begin
    if (rst) begin
        state <= 8'hfe;
    end
    else begin
        state <= state__n; 
    end
end

always_ff @(posedge clk) begin
    if (rst) begin
        count <= 0;
    end
    else begin
        count <= count + 1;
    end
end

//==============================
// binary_to_seven_segment__0
//==============================
binary_to_seven_segment binary_to_seven_segment__0
(
    .clk(clk),
    .rst(rst),
    .n(n),
    .ca(ca), 
    .cb(cb), 
    .cc(cc), 
    .cd(cd), 
    .ce(ce), 
    .cf(cf), 
    .cg(cg)
);
    
endmodule

