`timescale 1ns / 1ps
module partial_product_generator (
    input  signed [7:0] A,
    input  signed [7:0] B,
    output signed [15:0] PP0, PP1, PP2, PP3, PP4, PP5, PP6, PP7
);

    wire signed [15:0] A_ext = A;

    assign PP0 = B[0] ? (A_ext <<< 0) : 16'sd0;
    assign PP1 = B[1] ? (A_ext <<< 1) : 16'sd0;
    assign PP2 = B[2] ? (A_ext <<< 2) : 16'sd0;
    assign PP3 = B[3] ? (A_ext <<< 3) : 16'sd0;
    assign PP4 = B[4] ? (A_ext <<< 4) : 16'sd0;
    assign PP5 = B[5] ? (A_ext <<< 5) : 16'sd0;
    assign PP6 = B[6] ? (A_ext <<< 6) : 16'sd0;
    assign PP7 = B[7] ? (-(A_ext <<< 7)) : 16'sd0;

endmodule

