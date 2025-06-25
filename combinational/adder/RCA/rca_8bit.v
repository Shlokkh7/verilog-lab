`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.06.2025 18:59:25
// Design Name: 
// Module Name: rca_8bit
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
