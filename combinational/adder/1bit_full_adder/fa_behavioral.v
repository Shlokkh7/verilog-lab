`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.06.2025 21:36:05
// Design Name: 
// Module Name: fa_behavioral
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


module fa_behavioral(
    input x, y, cin,
    output s,
    output reg cout
    );
    
    wire s0, c0, c1;
    half_adder_beh HA0 (
        .x(x),
        .y(y),
        .s(s0),
        .c(c0)
    );
    half_adder_beh HA1 (
        .x(s0),
        .y(cin),
        .s(s),
        .c(c1)
    );
    
    always @(x, y)
    begin
        cout = c0 | c1;
    end
endmodule
