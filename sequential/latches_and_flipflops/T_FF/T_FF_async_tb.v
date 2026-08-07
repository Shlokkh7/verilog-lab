`timescale 1ns / 1ps

module T_FF_async_tb();

    reg clk;
    reg reset_n;
    reg T;
    wire Q;
    
    T_FF_async uut (
        .clk(clk),
        .reset_n(reset_n),
        .T(T),
        .Q(Q)
    );
    
    localparam t = 10;      // Clock Period
    always begin
        clk = 1'b0;
        #(t / 2);
        clk = 1'b1;
        #(t /2);
    end
    
    initial begin
        // Initial value
        reset_n = 1'b1;
        T = 1'b0;
        
        // Apply Reset
        #3 reset_n = 1'b0;
        #8 reset_n = 1'b1;
        
        // Apply Toggle
        #10 T = 1'b1;
        repeat(5) @(negedge clk);
        
        // Unchanged state
        #3 T = 1'b0;
        
        // Apply Reset
        #15 reset_n = 1'b0;
        #9 reset_n = 1'b1;
        
        // End Simulation
        #10 $stop;
    end 
endmodule