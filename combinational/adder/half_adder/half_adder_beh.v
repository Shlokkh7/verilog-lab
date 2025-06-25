`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.06.2025 20:46:22
// Design Name: 
// Module Name: half_adder_beh
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


module half_adder_beh(
    input x, y,
    output reg s, c
    );
    
    always @(x, y)
    begin
    // Sum
        s = x ^ y;
     // Carry
        if (x & y)
        begin
            c = 1'b1;
        end 
        else
        begin
            c = 1'b0;
        end
    end
endmodule
