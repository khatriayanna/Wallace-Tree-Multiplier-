`timescale 1ns / 1ps
module wallace_multiplier_top (
    input  signed [7:0] A, B,
    output signed [15:0] PRODUCT
);

    // These are Wires for partial products ( 1st step in our multiplier)
    wire signed [15:0] PP0, PP1, PP2, PP3, PP4, PP5, PP6, PP7;
    // Wires for final sum and carry from Wallace tree
    wire signed [15:0] SUM, CARRY;

    //  partial products are generated here usuing our partial product gen module 
    partial_product_generator ppg (
        .A(A), .B(B),
        .PP0(PP0), .PP1(PP1), .PP2(PP2), .PP3(PP3),
        .PP4(PP4), .PP5(PP5), .PP6(PP6), .PP7(PP7)
    );

    // partial products goes inside  Wallace Tree for reduction usuing carry save adder 
    wallace_tree_new wt (
        .PP0(PP0), .PP1(PP1), .PP2(PP2), .PP3(PP3),
        .PP4(PP4), .PP5(PP5), .PP6(PP6), .PP7(PP7),
        .SUM(SUM), .CARRY(CARRY)
    );

    // carry propogate adder is used for final product of sum and carry recieved from  wallace tree
    final_carry_propagate_adder fpa (
        .A(SUM),
        .B(CARRY),
        .SUM(PRODUCT)
    );

endmodule

