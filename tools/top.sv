module top
(
    input a,
    output logic z,
);
    
always_comb
begin
    case ((a))
    2'h1:
    begin
        a = b;
    end
    6'h1:
    begin
        a == c;
        a == c + d;
    end
    endcase
end

    hi
    hi
    hi


endmodule
