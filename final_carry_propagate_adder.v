// final_carry_propagate_adder.v
`timescale 1ns / 1ps
module final_carry_propagate_adder(
    input  signed [15:0] A,// sum from our csa 
    input  signed [15:0] B,// carry from our csa 
    output signed [15:0] SUM// final output 
);
    assign SUM = $signed(A) + $signed(B);
endmodule
