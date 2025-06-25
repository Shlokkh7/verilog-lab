`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.06.2025 14:56:18
// Design Name: 
// Module Name: mux_4x1_nbits_tb
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


module mux_4x1_nbits_tb(

    );
    parameter n = 4;
    reg [n - 1: 0] w0, w1, w2, w3;
    reg [1:0] s;
    wire [n - 1:0] f;
    
    mux_4x1_nbits #(.n(n)) uut (
        .w0(w0),
        .w1(w1),
        .w2(w2),
        .w3(w3),
        .s(s),
        .f(f)
    );
    
    initial 
    begin
        #40 $finish;
    end
    initial
    begin
        w0 = 4'd3;
        w1 = 4'd7;
        w2 = 4'd11;
        w3 = 4'd15;
        
        s = 2'b00;
     #5 s = 2'b01;
     #5 s = 2'b10;
     #5 s = 2'b11;
     #5
        w0 = 4'd1;
     #5 w1 = 4'd5;
     #5 w2 = 4'd9;
     #5 w3 = 4'd14; 
    end
    
endmodule
