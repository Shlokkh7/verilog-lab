`timescale 1ns / 1ps

module PISO_tb();

    parameter n = 4;
    reg clk;
    reg reset_n;
    reg load;
    reg [n - 1:0] I;
    wire SO;
    
    PISO #(.n(n)) uut (
        .clk(clk), 
        .reset_n(reset_n),
        .load(load),
        .I(I),
        .SO(SO)
    );
    
    localparam T = 10;      // Clock Period
    always begin
        clk = 1'b0;
        #(T / 2);
        clk = 1'b1;
        #(T / 2);
    end
    
    initial begin
        // Initial Value
        reset_n = 1'b1;
        load = 1'b1;
        I = 4'b0000;
        
           // Apply reset
        #3 reset_n = 1'b0;
        #4 reset_n = 1'b1; // Release reset
    
        // Apply a test value
        #6 I = 4'b1010;
        
        // Apply another value  Load is still 1
        #10 I = 4'b1111;
    
        // Apply shift
        #10 load = 1'b0;
        repeat(3) @(negedge clk);
        
        // Apply Reset
           reset_n = 1'b0;
        #4 reset_n = 1'b1;
        
        #10 $stop;
    end
endmodule
