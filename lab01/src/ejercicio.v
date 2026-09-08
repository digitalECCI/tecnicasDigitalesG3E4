module verificador (
    input A,  //input A,B,C,
    input B,
    input C,
    output S
);

wire C1;
wire C2;
wire C3;
wire C4;

and(C1,A,B);
and(C2,A,C);
and(C3,B,C);
or(C4,C1,C2);
or(S,C4,C3);

endmodule