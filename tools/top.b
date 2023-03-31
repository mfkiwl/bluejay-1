module top
(
    input a,
    output logic z,
);
    
always_comb
begin
    case ((a))
    OP__NOP:
    begin
        a = b;
    end
    OP__LB:
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
