`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.06.2025 15:13:51
// Design Name: 
// Module Name: demux_1xN_tb
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


module demux_1xN_tb(

    );
    
    parameter n = 3;
    reg f, en;
    reg [n - 1:0] s;
    wire [2 ** n - 1:0] y;
    integer j, k;
    
    demux_1xN #(.n(n)) uut(
        .f(f),
        .en(en),
        .s(s),
        .y(y)
    );
    
    initial
    begin
        #(6 * 2 * (2 ** n)) $finish;
    end
    initial
    begin
        f = 1'b1;
        for(j = 0; j <= 1; j = j + 1)
        begin
            for(k = 0; k < 2**n; k = k + 1)
            begin
                s = k;
                en = j;
                #1;
                $display("f = %b, en = %b, s = %b, y = %b", f, en, s, y);
                #5;
            end
        end
    end
endmodule
