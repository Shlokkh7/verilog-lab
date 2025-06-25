`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.06.2025 20:30:45
// Design Name: 
// Module Name: fa_structural
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


module fa_structural(
    input x, y, cin,
    output s, cout
    );
    
    wire s1, a0, a1;
    xor X0 (s1, x, y);
    xor X1 (s , s1, cin);
    and A0 (a0, s1, cin);
    and A1 (a1, x, y);
    or O0 (cout, a0, a1);
endmodule
