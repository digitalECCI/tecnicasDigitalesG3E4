`include "sum4b.v"
`timescale 1ns/1ps

module sum4b_TB;

    reg  [3:0] A;
    reg  [3:0] B;
    reg        CI;

    wire [3:0] SO;
    wire       CO;

    integer i, j;

    // Instancia del módulo a probar
    sum4b uut (
        .A(A),
        .B(B),
        .CI(CI),
        .SO(SO),
        .CO(CO)
    );

    initial begin

    $dumpfile("sum4b_TB.vcd");
    $dumpvars(0,sum4b_TB);
     
     CI=0;
        for (i=0;i<16;i=i+1) begin
         for (j=0;j<16;j=j+1) begin
            A<=i;
            B<=j;
            #10;
        end
       end
    end

endmodule