`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.06.2025 13:39:59
// Design Name: 
// Module Name: decoder_2x4_fun_tb
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


module decoder_2x4_fun_tb();

    reg [1:0] i_a;
    reg i_en;
    wire [3:0] o_y;
    integer j, k;
    
    decoder_2x4_fun uut (
        .i_a(i_a),
        .i_en(i_en),
        .o_y(o_y)
    );
    
    initial begin
        #40 $finish;
    end  
    initial begin
        for(j = 0; j <= 1; j = j + 1) begin
            for(k = 0; k < 4; k = k + 1) begin
                i_en = j;
                i_a = k;
                #1;
                $display("en = %b, a = %b, y = %b", i_en, i_a, o_y);
                #4;
            end
        end
    end
endmodule
