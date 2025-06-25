`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.06.2025 02:49:29
// Design Name: 
// Module Name: decoder_2x4_df_tb
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


module decoder_2x4_df_tb(

    );
    
    reg a, b, e;
    wire q0, q1, q2, q3;
    
    decoder_2x4_df uut (
        .a(a),
        .b(b),
        .e(e),
        .q0(q0),
        .q1(q1),
        .q2(q2),
        .q3(q3)
    );
    
    initial
    begin                   // Don't need this
        #40 $finish;
    end 
    
    initial
    begin
        a = 1'b0;
        b = 1'b0;
        e = 1'b0;
        #10
        
        a = 1'b0;
        b = 1'b1;
        e = 1'b1;
        #10
        
        a = 1'b1;
        b = 1'b0;
        e = 1'b1;
        #10
       
        a = 1'b1;
        b = 1'b1;
        e = 1'b1;
    end
       
endmodule
