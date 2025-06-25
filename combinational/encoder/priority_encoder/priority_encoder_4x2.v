`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.06.2025 20:38:53
// Design Name: 
// Module Name: priority_encoder
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


module priority_encoder_4x2(
    input [3:0] i,
    output v,
    //input en,
    output reg [1:0] y
    );
    
    assign v = |i;
    always @(i)
    begin
        y = 2'bxx;
        
        if (i[3])
            y = 2'b11;
        else if(i[2])
            y = 2'b10;
        else if (i[1])
            y = 2'b01;
        else if (i[0])
            y = 2'b00;
        else
            y = 2'bxx;
    end
endmodule
