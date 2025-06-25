`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.06.2025 18:31:08
// Design Name: 
// Module Name: demux_1x2_
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


module demux_1x2(
    input f, s, en,
    output reg [1:0] y
    );
    
    always @(f, s, en)
    begin
        y = 2'b00;
        
        if (en)
        begin
            /*if (s == 0)
                y[0] = f;
            else if (s == 1)
                y[1] = f;*/
                
        y[s] = f;
        end
        else
            y = 2'b00;
    end
endmodule
