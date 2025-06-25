`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.06.2025 05:43:48
// Design Name: 
// Module Name: decoder_3x8_df_tb
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


module decoder_3x8_df_tb(

    );
    
    reg a, b, c;
    wire q0, q1, q2, q3, q4, q5, q6, q7;

    decoder_3x8_df uut(
        .a(a),
        .b(b),
        .c(c),
        .q0(q0),
        .q1(q1),
        .q2(q2),
        .q3(q3),
        .q4(q4),
        .q5(q5),
        .q6(q6),
        .q7(q7)
    );
    
    initial
    begin
    #80 $finish;
    end
    
    initial
    begin
        a = 1'b0;           // q0
        b = 1'b0;
        c = 1'b0;
        #10
        a = 1'b1;           // q6
        b = 1'b0;
        c = 1'b1;
        #10
        a = 1'b1;           // q2
        b = 1'b0;
        c = 1'b0;
        #10
        a = 1'b0;           // q5
        b = 1'b1;          
        c = 1'b1;
        #10
        a = 1'b1;           // q3
        b = 1'b1;
        c = 1'b0;
        #10
        a = 1'b0;           // q4
        b = 1'b0;
        c = 1'b1;
        #10
        a = 1'b0;           // q1
        b = 1'b1;
        c = 1'b0;
        #10
        a = 1'b1;           // q7
        b = 1'b1;
        c = 1'b1;
        
    end
endmodule

