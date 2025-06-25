`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.06.2025 20:49:38
// Design Name: 
// Module Name: half_adder_struct
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


module half_adder_struct(
    input x, y,
    output s, c
    );
    
    xor X0 (s, x, y);
    and A0 (c, x, y);
endmodule
