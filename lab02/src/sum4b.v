`include "modulo1.v"
`timescale 1ns/1ps

 
module sum4b (
    input  [3:0] A,
    input  [3:0] B,
    input CI,
    output [3:0] SO,
    output CO

    );

    wire C0;
    wire C1;
    wire C2;
    
    modulo1 bit0 (
        .A(A[0]),
        .B(B[0]),
        .Ci(CI),
        .SO(SO[0]),
        .CO(C0)
    );
    
    modulo1 bit1 (
        .A(A[1]),
        .B(B[1]),
        .Ci(C0),
        .SO(SO[1]),
        .CO(C1)
    );

    modulo1 bit2 (
        .A(A[2]),
        .B(B[2]),
        .Ci(C1),
        .SO(SO[2]),
        .CO(C2)
    );
    
    modulo1 bit3 (
        .A(A[3]),
        .B(B[3]),
        .Ci(C2),
        .SO(SO[3]),
        .CO(CO)
    );

endmodule