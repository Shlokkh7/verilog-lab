`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.06.2025 14:34:18
// Design Name: 
// Module Name: priority_encoder_4x2
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


module priority_encoder_4x2_tb(

    );
    
    reg [3:0] i;
    wire v;
    wire [1:0] y;
    integer k;
    
    priority_encoder_4x2 uut (
        .i(i),
        .v(v),
        .y(y)
    );
    
    initial
    begin
    #(5 * 2 ** 4) $finish;
    end
    
    initial
    begin
        for(k = 0; k < 2 ** 4; k = k + 1)
        begin
            i = k;
            #1;
            $display("i = %b, v = %b, y = %b", i, v, y);
            #4;
        end
    end
endmodule
