module modulo1
(
    input A,
    input B,
    input Ci,
    output SO,
    output CO
);

assign SO = Ci ^ ( A ^ B);
assign CO = (B & Ci) | (A & (B | Ci));


endmodule