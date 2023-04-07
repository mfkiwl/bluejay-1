module top
(
    input a,
    output logic z,
);
    
always_comb
begin
    case ((a))
    SIZE__WORD:
    begin
        a = b;
    end
    OP__LB:
    begin
        a == c;
PYTHON
(
        print('        a == c + d;')
        print('        y == c + d;')
)
    end
    endcase
end

PYTHON
(
    for i in range(5):
        print('    hi')
)

endmodule
