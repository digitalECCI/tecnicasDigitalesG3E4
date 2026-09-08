module fundamentos(
    input A,
    input B,
    input Ci,
    output SO,
    output CO
);

wire C1;
wire C2;
wire C3;

xor(C1, A, B);
and(C2, A, B);
and(C3, C1, Ci);
xor(SO, C1, Ci);
or(CO, C2, C3);

endmodule
