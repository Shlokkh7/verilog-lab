`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.06.2025 14:55:12
// Design Name: 
// Module Name: priority_encoder_generic
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


module priority_encoder_generic
    #(parameter n = 4)
    (
    input [n - 1:0] i,
    output v,
    output reg [$clog2(n) - 1:0] y
    );
    
    assign v = |i;
    integer k;
    
    always @(i)
    begin
        y ='bx;
        for(k = 0; k < n; k = k + 1)
        begin
            if (i[k])
                y = k;
        end
    end
endmodule
