`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.06.2025 14:02:01
// Design Name: 
// Module Name: mux_generic_1bit
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


module mux_generic_1bit
    #(parameter INS = 5)
    (
    input [INS - 1:0] w,                      
    input [$clog2(INS) - 1:0] s,               
    output reg f                                      
    );

    integer k;
    always @(*) 
    begin
        f = 'bx; 
        for (k = 0; k < INS; k = k + 1)
            if (k == s)
                f = w[k];
    end
endmodule
