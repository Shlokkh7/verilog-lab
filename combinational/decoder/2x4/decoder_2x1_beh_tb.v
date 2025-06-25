`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.06.2025 03:29:30
// Design Name: 
// Module Name: decoder_2x4_beh_tb
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


module decoder_2x4_beh_tb(

    );
    
    reg [1:0] a;
    reg en;
    wire [3:0] q;
    
    decoder_2x4_beh uut (
        .a(a),
        .en(en),
        .q(q)
    );
    
    initial
    begin                   // Don't need this
        #40 $finish;
    end 
    
    initial
    begin
        a = 2'b00;           // q0
        en = 1'b1;
        #10
        
        a = 2'b01;           // q2
        en = 1'b1;
        #10
        
        a = 2'b10;           // q3
        en = 1'b0;
        #10
        
        a = 2'b11;           // q1
        en = 1'b1;
    end
       
endmodule
