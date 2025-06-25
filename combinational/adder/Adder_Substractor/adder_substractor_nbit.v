`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.06.2025 23:07:57
// Design Name: 
// Module Name: adder_substractor_nbit
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


module adder_substractor_nbit
    #(parameter n = 4)
    (
    input [n - 1:0] x, y,
    input add_n,
    output [n - 1:0] s,
    output cout
    );
    
    wire [n - 1:0] xored_y;
    generate
        genvar k;
        for(k = 0; k < n; k = k + 1)
        begin
            assign xored_y[k] = y[k] ^ add_n;
        end
    endgenerate
    
    rca_nbits #(.n(n)) A0 (
        .x(x),
        .y(xored_y),
        .cin(add_n),
        .s(s),
        .cout(cout)
    );
    
endmodule
