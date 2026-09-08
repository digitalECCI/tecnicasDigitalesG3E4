`timescale 1ns/1ps

module detector_TB;

reg A, B, C;
wire S;

detector_primo uut (
    .A(A),
    .B(B),
    .C(C),
    .S(S)
);

initial begin

    // Crear archivo de ondas
    $dumpfile("detector.vcd");
    $dumpvars(0, detector_TB);

    // Mostrar resultados en la terminal
    $monitor("Tiempo=%0t | A=%b B=%b C=%b | S=%b",
             $time, A, B, C, S);

    // Probar las 8 combinaciones
    A=0; B=0; C=0; #10;
    A=0; B=0; C=1; #10;
    A=0; B=1; C=0; #10;
    A=0; B=1; C=1; #10;
    A=1; B=0; C=0; #10;
    A=1; B=0; C=1; #10;
    A=1; B=1; C=0; #10;
    A=1; B=1; C=1; #10;

    $finish;

end

endmodule
