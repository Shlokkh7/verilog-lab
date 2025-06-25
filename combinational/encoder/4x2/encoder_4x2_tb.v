`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.06.2025 18:45:03
// Design Name: 
// Module Name: encoder_4x2_tb
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


module encoder_4x2_tb(

    );
    
    reg [3:0] i;
    reg en;
    wire [1:0] y;
    
    encoder_4x2 uut (
        .i(i),
        .en(en),
        .y(y)
    );
    
    initial 
    begin
        #60 $finish;
    end
    
    initial 
    begin
        en = 1'b0;
        i[0] = 1'b0;
        i[1] = 1'b0;
        i[2] = 1'b0;
        i[3] = 1'b0;
        #10
        
        en = 1'b1;
        i[0] = 1'b0;
        i[1] = 1'b1;
        i[2] = 1'b0;
        i[3] = 1'b0;
        #10
        
        en = 1'b1;
        i[0] = 1'b0;
        i[1] = 1'b0;
        i[2] = 1'b1;
        i[3] = 1'b0;
        #10
        
        en = 1'b1;
        i[0] = 1'b0;
        i[1] = 1'b0;
        i[2] = 1'b0;
        i[3] = 1'b1;
        #10
        
        en = 1'b0;
        i[0] = 1'b0;
        i[1] = 1'b1;
        i[2] = 1'b0;
        i[3] = 1'b0;
        #10
        en = 1'b1;
        i[0] = 1'b1;
        i[1] = 1'b0;
        i[2] = 1'b1;
        i[3] = 1'b1;
        
    end
endmodule
