  `timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.06.2025 21:11:32
// Design Name: 
// Module Name: fa_dataflow
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


module fa_dataflow(
    input x, y, cin,
    output s, cout
    );
    
    wire s0, c0, c1;
    half_adder_df HA0 (
        .x(x),
        .y(y),
        .s(s0),
        .c(c0)
    );
    half_adder_df HA1 (
        .x(s0),
        .y(cin),
        .s(s),
        .c(c1)
    );
    
    assign cout = c0 | c1;
endmodule
