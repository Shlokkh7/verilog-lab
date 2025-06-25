`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.06.2025 19:23:14
// Design Name: 
// Module Name: demux_1xN
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


module demux_1xN                // n select line
    #(parameter n = 3)
    (
    input f, en,
    input [n - 1:0] s,
    output reg [2 ** n - 1:0] y
    );
    
    always @(f, en, s)
    begin
        y = 'b0;               // Default value
        if (en)
        begin
            y[s] = f;
        end
        else
            y = 'b0;
    end
endmodule
