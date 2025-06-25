`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.06.2025 20:27:36
// Design Name: 
// Module Name: cla_nbits_tb
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


module cla_nbits_tb(

    );
    
    parameter n = 8;
    reg [n - 1:0] x, y;
    reg cin;
    wire [n - 1:0] s;
    wire cout;
    
    cla_nbits #(.n(n)) uut (
        .x(x),
        .y(y),
        .cin(cin),
        .s(s),
        .cout(cout)
    ); 
    
    initial 
    begin
        #60 $finish;
    end
    
    initial
    begin
        x = 8'b00000000;                // 0 + 0 + 0
        y = 8'b00000000;
        cin = 1'b0;
        #10
        x = 8'b00000001;                // 1 + 2 + 1
        y = 8'b00000010;
        cin = 1'b1;
        #10
        x = 8'b00000101;                // 5 + 49 + 0
        y = 8'b00110001;
        cin = 1'b0;
        #10
        x = 8'b10010011;                // 147 + 219 + 1
        y = 8'b11011011;
        cin = 1'b1;
        #10
        x = 8'b00001000;                // 8 + 16 + 1
        y = 8'b00010000;
        cin = 1'b1;
        #10
        x = 8'b00100001;                // 33 + 34 + 1
        y = 8'b00100010;
        cin = 1'b1;
        
    end
endmodule
