`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.06.2025 14:34:18
// Design Name: 
// Module Name: priority_encoder_generic_tb
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


module priority_encoder_generic_tb(

    );
    
    parameter n = 4;
    reg [n - 1:0] i;
    wire v;
    wire [$clog2(n) - 1:0] y;
    integer k;
    
    priority_encoder_generic #(.n(n)) uut (
        .i(i),
        .v(v),
        .y(y)
    );
    
    initial
    begin
    #(5 * 2 ** n) $finish;
    end
    
    initial
    begin
        for(k = 0; k < 2 ** n; k = k + 1)
        begin
            i = k;
            #1;
            $display("i = %b, v = %b, y = %b", i, v, y);
            #4;
        end
    end
endmodule
