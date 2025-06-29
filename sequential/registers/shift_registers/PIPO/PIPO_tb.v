`timescale 1ns / 1ps

module PIPO_tb();

    parameter n = 5;
    reg clk;
    reg reset_n;
    reg [n - 1:0] I;
    wire [n - 1:0] Q;
    
    PIPO #(.n(n)) uut (
        .clk(clk), 
        .reset_n(reset_n),
        .I(I),
        .Q(Q)
    );
    
    localparam T = 10;
    always begin
        clk = 1'b0;
        #(T / 2);
        clk = 1'b1;
        #(T / 2);
    end
    
    initial begin
        reset_n = 1'b1;
        I = 5'b10101;
        
           // Apply reset
        #5 reset_n = 1'b0;
        #5 reset_n = 1'b1; // Release reset
    
        // Apply a test value
        #7 I = 5'b11010;
    
        // Apply another value
        #10 I = 5'b10111;
    
        #10 $stop;
    end
endmodule
