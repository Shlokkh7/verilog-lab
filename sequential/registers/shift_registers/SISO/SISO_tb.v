`timescale 1ns / 1ps

module SISO_tb();

    parameter n = 5;
    reg clk;
    reg reset_n;
    reg SI;
    wire SO;
    
    SISO #(.n(n)) uut (
        .clk(clk),
        .reset_n(reset_n),
        .SI(SI),
        .SO(SO)
    );
    
    localparam T = 10;
    always begin
        clk = 1'b1;
        #(T / 2);
        clk = 1'b0;
        #(T / 2);
    end
    
    initial begin
        reset_n = 1'b1;
        SI = 1'b0;
        
        // Apply Reset
        #3 reset_n = 1'b0;
        #5 reset_n = 1'b1;
        
        // Applying 1st right shift
        #10 SI = 1'b1;
        
        repeat(4) @(negedge clk);
        
        #10 SI = 1'b0;
        
        repeat(2) @(negedge clk);
        
        // Apply Reset
        #10 reset_n = 1'b0;
        #5 reset_n = 1'b1;
        
        // Apply Shift
        #10 SI = 1'b1;
        
        // End Simulation
        #20 $stop;
   
    end
endmodule
