`timescale 1ns / 1ps

module rca_4bit(
    input [3:0] x_i, y_i,
    input cin_i,
    output [3:0] s_o,
    output cout_o
    );
    
    wire [3:1] c;                   // Internal carry
    fa_dataflow FA0 (
        .x_i(x_i[0]),
        .y_i(y_i[0]),
        .cin_i(cin_i),
        .s_o(s_o[0]),
        .cout_o(c[1])
    );
    fa_dataflow FA1 (
        .x_i(x_i[1]),
        .y_i(y_i[1]),
        .cin_i(c[1]),
        .s_o(s_o[1]),
        .cout_o(c[2])
     );
     fa_dataflow FA2 (
        .x_i(x_i[2]),
        .y_i(y_i[2]),
        .cin_i(c[2]),
        .s_o(s_o[2]),
        .cout_o(c[3])
     );
     fa_dataflow FA3 (
        .x_i(x_i[3]),
        .y_i(y_i[3]),
        .cin_i(c[3]),
        .s_o(s_o[3]),
        .cout_o(cout_o)
     );
      
endmodule
