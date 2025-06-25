`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.06.2025 14:16:53
// Design Name: 
// Module Name: demux_1x4
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


module demux_1x4(
    input f,
    input en,
    input [1:0] s,
    output reg [3:0] y
    );
    
    always @(f, en, s)
    begin
        y = 4'b0000;
        if(en)
        begin
            /*case (s)
            0:  y[0] = f;
            1:  y[1] = f;
            2:  y[2] = f;
            3:  y[3] = f;
            default: y = 4'b0000;
            endcase*/
            
            y[s] = f;
        end
        else
            y = 4'b0000;
    end
endmodule
