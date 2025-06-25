`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.06.2025 03:20:31
// Design Name: 
// Module Name: decoder_2x4_beh
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


module decoder_2x4_beh(
    input [1:0] a,
    input en,
    output reg [3:0] q
    );
   
    always @(a, en)
    begin
        /*q0 = ~a & ~b & en;
        q1 = ~a & b & en;
        q2 = a & ~b & en;
        q3 = a & b & en;*/
        
        q = 4'b0000;                   // Default value
        /*if (en)
        begin
            if (a == 2'b00)
                q[0] = 1;
            else if (a == 2'b01)
                q[1] = 1;
            else if (a == 2'b10)
                q[2] = 1;
            else if (a == 2'b11)
                q[3] = 1;
            else
                q = 4'b0000;
        end*/
        
        // Case Block
        if (en)
        begin
            case (a)
            0:  q[0] = 1; 
            1:  q[1] = 1;
            2:  q[2] = 1;
            3:  q[3] = 1;
            default: q = 4'b0000;
            endcase
        end
    end
endmodule
