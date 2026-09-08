module peru (
    input A,
    input B,
    output Sand,
    output Sor,
    output Snot,
    output Sxor,
    output Sxnor
);

and(Sand, A, B);
or(Sor, A, B);
not(Snot, A);
xor(Sxor, A, B);
xnor(Sxnor, A, B);

endmodule
