`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.06.2025 05:15:04
// Design Name: 
// Module Name: decoder_3x8_beh_tb
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


module decoder_3x8_beh_tb(

    );
    
    reg [2:0] a; 
    reg en;
    wire [7:0] q;

    decoder_3x8_beh uut(
        .a(a),
        .en(en),
        .q(q)
    );
    
    initial
    begin
    #80 $finish;
    end
    
    initial
    begin
        a = 3'b000;           // q0
        en = 1'b0;
        #10
        a = 3'b001;           // q1
        en = 1'b0;
        #10
        a = 3'b010;           // q2  
        en = 1'b0;
        #10
        a = 3'b011;           // q3
        en = 1'b0;
        #10
        a = 3'b000;           // q4
        en = 1'b1;
        #10
        a = 3'b001;           // q5
        en = 1'b1;
        #10
        a = 3'b010;           // q6
        en = 1'b1;
        #10
        a = 3'b011;           // q7
        en = 1'b1;
        
    end
endmodule
