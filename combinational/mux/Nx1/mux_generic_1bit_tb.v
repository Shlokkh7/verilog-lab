`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.06.2025 19:24:59
// Design Name: 
// Module Name: mux_generic_1bit_tb
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


module mux_generic_1bit_tb(

    );
    parameter INS = 4;
    reg [INS - 1: 0] w;
    reg [$clog2(INS) - 1:0] s;
    wire f;
    
    mux_generic_1bit #(.INS(INS)) uut (
        .w(w),
        .s(s),
        .f(f)
    );
    
    initial 
    begin
        #40 $finish;
    end
    initial
    begin
        w = 4'd10;
        
        s = 2'b00;
     #5 s = 2'b01;
     #5 s = 2'b10;
     #5 s = 2'b11;
     #5
        w = 4'd2;
     #5 w = 4'd4;
     #5 w = 4'd6;
     #5 w = 4'd10; 
    end
endmodule
