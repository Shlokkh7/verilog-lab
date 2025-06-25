`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.06.2025 23:24:43
// Design Name: 
// Module Name: array_multiplier_4bit
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


module array_multiplier_4bit(
    input [3:0] a, b,
    output [7:0] z 
    );
    
    // wire [15:0] p;
    wire [11:0] s, c;
    // Half Adder block
    half_adder_beh ha0(.x(a[1] & b[0]), .y(a[0] & b[1]), .s(s[0]), .c(c[0]));
    half_adder_beh ha1(.x(a[2] & b[0]), .y(a[1] & b[1]), .s(s[1]), .c(c[1]));
    half_adder_beh ha2(.x(a[3] & b[0]), .y(a[2] & b[1]), .s(s[2]), .c(c[2]));
    half_adder_beh ha3(.x(s[7]), .y(c[6]), .s(s[9]), .c(c[9]));
    
    // Full Adder block
    fa_structural fa0(.x(s[1]), .y(a[0] & b[2]), .cin(c[0]), .s(s[3]), .cout(c[3]));
    fa_structural fa1(.x(s[2]), .y(a[1] & b[2]), .cin(c[1]), .s(s[4]), .cout(c[4]));
    fa_structural fa2(.x(a[3] & b[1]), .y(a[2] & b[2]), .cin(c[2]), .s(s[5]), .cout(c[5]));
    fa_structural fa3(.x(s[4]), .y(a[0] & b[3]), .cin(c[3]), .s(s[6]), .cout(c[6]));
    fa_structural fa4(.x(s[5]), .y(a[1] & b[3]), .cin(c[4]), .s(s[7]), .cout(c[7]));
    fa_structural fa5(.x(a[3] & b[2]), .y(a[2] & b[3]), .cin(c[5]), .s(s[8]), .cout(c[8]));
    fa_structural fa6(.x(s[8]), .y(c[9]), .cin(c[7]), .s(s[10]), .cout(c[10]));
    fa_structural fa7(.x(a[3] & b[3]), .y(c[10]), .cin(c[8]), .s(s[11]), .cout(c[11]));
    
    // Assigning output (z)
    assign z[0] = a[0] & b[0];
    assign z[1] = s[0];
    assign z[2] = s[3];
    assign z[3] = s[6];
    assign z[4] = s[9];
    assign z[5] = s[10];
    assign z[6] = s[11];
    assign z[7] = c[11];
endmodule
