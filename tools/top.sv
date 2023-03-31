module top
(
    input a,
    output logic z,
);
    
always_comb
begin
    case ((a))
    6'h0:
    begin
        a = b;
    end
    6'h1:
    begin
        a == c;
    end
    endcase
end

PYTHON
(
    for i in range(len(10)):
        print("    hi")
)

endmodule
