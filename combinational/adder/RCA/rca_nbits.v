`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.06.2025 12:41:30
// Design Name: 
// Module Name: rca_nbits
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


module rca_nbits
    #(parameter n = 4)              // Default value
    (
    input [n - 1: 0] x, y,
    input cin,
    output [n - 1: 0] s,
    output cout
    );
    
    wire [n : 0] c;
    assign c[0] = cin;
    assign cout = c[n];                     // Non blocking statement
        
    generate
        genvar k;
        
        for (k = 0; k < n; k = k + 1)
        begin: stage
            fa_dataflow FA (
                .x(x[k]),
                .y(y[k]),
                .cin(c[k]),
                .s(s[k]),
                .cout(c[k + 1])
            ); 
        end
    endgenerate 
    
endmodule
