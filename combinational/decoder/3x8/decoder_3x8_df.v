`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.06.2025 05:04:58
// Design Name: 
// Module Name: decoder_3x8_df
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


module decoder_3x8_df(
    input a, b, c,
    output q0, q1, q2, q3, q4, q5, q6, q7
    );
    
    decoder_2x4_df D1(
        .a(a),
        .b(b),
        .e(~c),
        .q0(q0),
        .q1(q1),
        .q2(q2),
        .q3(q3)
    );
    
    decoder_2x4_df D2(
        .a(a),
        .b(b),
        .e(c),
        .q0(q4),
        .q1(q5),
        .q2(q6),
        .q3(q7)
    );
endmodule
