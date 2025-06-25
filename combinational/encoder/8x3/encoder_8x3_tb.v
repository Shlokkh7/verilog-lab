`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.06.2025 03:38:15
// Design Name: 
// Module Name: encoder_8x3_tb
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


module encoder_8x3_tb(

    );
    
    reg [7:0]i;
    reg en;
    wire [2:0] y;
    integer j, k;
    
    encoder_8x3 uut (
        .i(i),
        .en(en),
        .y(y)
    );
     
     
     initial
     begin
        #80 $finish;
     end
     
     initial 
     begin
         for(j = 1; j <= 255; j = j * 2)
         begin
            for(k = 0; k <= 1; k = k + 1)
            begin
                en = k;
                i = j;
                #5;   
            end
         end
     end
endmodule
