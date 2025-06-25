`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.06.2025 02:07:33
// Design Name: 
// Module Name: adder_substractor_nbit_tb
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


module adder_substractor_nbit_tb(

    );
    parameter n = 8;                    // Testing for 8 bits
    reg [n - 1:0] x, y;
    reg add_n;
    wire [n - 1:0] s;
    wire cout;
    integer i, j = 1, k, l;
    
    adder_substractor_nbit #(.n(n)) uut (
        .x(x),
        .y(y),
        .add_n(add_n),
        .s(s),
        .cout(cout)
    );
    
    initial
    begin
        for(k = 0; k < n; k = k + 1)
        begin
            assign j = j * 2;
        end
    end
    
    
    initial
    begin
        // For adder add_n = 0
        for(l = 0; l < j; l = l + 1)
        begin
            y = l;
            add_n =1'b0;
            for(i = 0; i < j; i = i + 1)
            begin
                x = i;
                #5;
                $display("%0.2f", $realtime);
            end
        end
        
        // For substractor add_n = 1
        for(l = 0; l < j; l = l + 1)
        begin
            y = l;
            add_n =1'b1;
            for(i = 0; i < j; i = i + 1)
            begin
                x = i;
                #5;
               $display("%0.2f", $realtime);
            end
        end     
    
    #655360 $finish;
    end
endmodule
