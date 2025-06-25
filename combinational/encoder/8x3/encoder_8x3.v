`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.06.2025 19:30:46
// Design Name: 
// Module Name: encoder_8x3
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


module encoder_8x3(
    input [7:0] i,
    input en,
    output [2:0] y
    );
    
    wire [3:0] a;
    generate
        genvar k;
        for(k = 0; k <= 3 ; k = k + 1)
        begin
            assign a[k] = i[k] | i[k + 4];
        end
    endgenerate 
    
    encoder_4x2 EN0 (
        .i(a),
        .en(en),
        .y(y[1:0])
    );
    
    assign y[2] = |i[7:4] & en;
endmodule
