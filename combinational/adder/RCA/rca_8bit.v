`timescale 1ns / 1ps

module rca_8bit(
    input [7:0] x, y,
    input cin,
    output [7:0] s,
    output cout
    );
    
    rca_nbits #(.n(8)) adder_8(
        .x(x),
        .y(y),
        .cin(cin),
        .s(s),
        .cout(cout)
    );
endmodule
