`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.06.2025 18:16:13
// Design Name: 
// Module Name: demux_1x4_tb
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


module demux_1x4_tb(

    );
    
    reg f, en;
    reg [1:0] s;
    wire [3:0] y;
    integer j, k;
    
    demux_1x4 uut (
        .f(f),
        .en(en),
        .s(s),
        .y(y)
    );
    
    initial
    begin
        #(10 * 2 * 2 ** 2) $finish;
    end
    
    initial
    begin
        f = 1'b1;
        for(j = 0; j <= 1; j = j + 1)
        begin
            for(k = 0; k < 2**2; k = k + 1)
            begin
                en = j;
                s = k;
                #1;
                $display("f = %b, en = %b, s = %b, y = %b", f, en, s, y);
                #9;
            end
        end
    end
endmodule
