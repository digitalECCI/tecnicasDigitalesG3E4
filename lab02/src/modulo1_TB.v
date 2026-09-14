`include "modulo1.v"
`timescale 1s/1s

module modulo1_TB(

);

reg A;
reg B;
reg Ci;
wire SO; 
wire CO;

modulo1 uut(
    .A(A),
    .B(B),
    .Ci(Ci),
    .SO(SO),
    .CO(CO)
);

initial begin

      $dumpfile("modulo1_TB.vcd");
    $dumpvars(0,modulo1_TB);

    //caso1
    A= 1'b0;
    B= 1'b0;
    Ci= 1'b0;
    #5;
    //caso2
    A= 1'b0;
    B= 1'b0;
    Ci= 1'b1;

    #5;
    //caso3
    A= 1'b0;
    B= 1'b1;
    Ci= 1'b0;
    #5;
    //caso4
    A= 1'b0;
    B= 1'b1;
    Ci= 1'b1;
    #5;
     //caso5
    A= 1'b1;
    B= 1'b0;;
    Ci= 1'b0;
    #5;
    //caso6
    A= 1'b1;
    B= 1'b0;
    Ci= 1'b1;

    #5;
    //caso7
    A= 1'b1;
    B= 1'b1;
    Ci= 1'b0;
    #5;
    //caso8
    A= 1'b1;
    B= 1'b1;
    Ci= 1'b1;
    #5;


end





endmodule