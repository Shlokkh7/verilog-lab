`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.06.2025 19:26:50
// Design Name: 
// Module Name: cla_nbits
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


module cla_nbits
    #(parameter n = 4)
    (
    input [n - 1:0] x, y,
    input cin,
    output [n - 1:0] s,
    output cout
    );
    
    wire [n:0] c;
    wire [n - 1:0] g, p;
    
    assign c[0] = cin;
    assign cout = c[n];
    
    generate
    
        genvar k;
        
        for(k = 0; k < n; k = k + 1)
        begin: stage
            assign g[k] = x[k] & y[k];
            assign p[k] = x[k] ^ y[k];
            assign c[k + 1] =  g[k] | (p[k] & c[k]);
            assign s[k] = p[k] ^ c[k];
        end
    endgenerate
endmodule
