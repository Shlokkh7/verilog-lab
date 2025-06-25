`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.06.2025 00:46:43
// Design Name: 
// Module Name: array_multiplier_4bit_tb
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


module array_multiplier_4bit_tb();
    
    reg [3:0] a, b;
    wire [7:0] z;
    integer j, k;
    array_multiplier_4bit uut(
        .a(a),
        .b(b),
        .z(z)
    );
    
    initial begin
    #1280 $finish;
    end
    
    initial begin
        for(j = 0; j < 16; j = j + 1)
        begin
            for(k = 0; k < 16; k = k + 1)
            begin
                a = j;
                b = k;
                #1;
                $display("a = %b(%d), b = %b(%d), z = %b(%d)", a, a, b, b, z, z);
                #4;
            end
        end
    end
endmodule
