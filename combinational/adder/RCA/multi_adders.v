`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.06.2025 18:44:50
// Design Name: 
// Module Name: multi_adders
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module multi_adders(
    input [15:0] a, b,                  // For 16 bit RCA
    input cin_ab,
    output [15:0] s_ab,
    output cout_ab,
    
    input [33:0] x, y,                  // For a 34 bit RCA
    input cin_xy,
    output [33:0] s_xy,
    output cout_xy
    );
    
    rca_nbits #(.n(16)) adder_16(
        .x(a),
        .y(b),
        .cin(cin_ab),
        .s(a_ab),
        .cout(cout_ab)
    );
    rca_nbits #(.n(34)) adder_34(
        .x(x),
        .y(y),
        .cin(cin_xy),
        .s(a_xy),
        .cout(cout_xy)
    );
endmodule
