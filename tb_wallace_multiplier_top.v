`timescale 1ns / 1ps
module tb_wallace_multiplier_top;
    reg signed [7:0] A;
    reg signed [7:0] B;
    wire signed [15:0] PRODUCT;

    wallace_multiplier_top uut(.A(A), .B(B), .PRODUCT(PRODUCT));

    initial begin
        $monitor("time=%0t  A=%0d  B=%0d  PRODUCT=%0d", $time, A, B, PRODUCT);

        A = 10;  B = -1;    #10;       // -275
        A = 5;   B = 3;    #10;       // 15
        A = -8;  B = 6;    #10;       // -48
        A = -10; B = 10;   #10;       //  100
        A = 7; B = 120;    #10;       //  254
        A = -128;B = 1;    #10;       // -128

        $stop;
    end
endmodule

