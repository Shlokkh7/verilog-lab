`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.06.2025 05:11:59
// Design Name: 
// Module Name: decoder_3x8_beh
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


module decoder_3x8_beh(
    input [2:0] a,
    input en,
    output [7:0] q
    );
    
//    wire ena;
//    assign ena = a[2] & 
    decoder_2x4_beh D1(
        .a(a),
        .en(~a[2] & en),
        .q(q[3:0])
    );
    
    decoder_2x4_beh D2(
        .a(a),
        .en(a[2] & en),
        .q(q[7:4])
    );
endmodule
