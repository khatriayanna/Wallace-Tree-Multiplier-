`timescale 1ns / 1ps
module wallace_tree_new (
    input  signed [15:0] PP0, PP1, PP2, PP3, PP4, PP5, PP6, PP7,
    output signed [15:0] SUM, CARRY
);
// Stage 1
    wire signed [15:0] s1_1, c1_1;
    wire signed [15:0] s1_2, c1_2;
    wire signed [15:0] s1_3, c1_3;

    carry_save_adder csa1(PP0, PP1, PP2, s1_1, c1_1);
    carry_save_adder csa2(PP3, PP4, PP5, s1_2, c1_2);
    carry_save_adder csa3(PP6, PP7, 16'sd0, s1_3, c1_3);

    // Stage 2
    wire signed [15:0] s2_1, c2_1;
    wire signed [15:0] s2_2, c2_2;

    carry_save_adder csa4(s1_1, c1_1, s1_2, s2_1, c2_1);
    carry_save_adder csa5(c1_2, s1_3, c1_3, s2_2, c2_2);

    // Final stage
    wire signed [15:0] s_final, c_final;
    carry_save_adder csa6(s2_1, c2_1, s2_2, s_final, c_final);
    carry_save_adder csa7(s_final, c_final, c2_2, SUM, CARRY);
endmodule
