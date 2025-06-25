`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.06.2025 13:46:20
// Design Name: 
// Module Name: mux_2x1_nbits
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


module mux_2x1_nbits
    #(parameter n = 3)
    (
    input [n - 1:0] w0, w1,
    input s,
    output reg [n - 1:0] f
    );
    
//  assign f = s?w1:w0;           // dataflow modelling
    
    always @(s, w0, w1)
    begin
        f = s?w1:w0;              // procedural assignment
    end
endmodule
