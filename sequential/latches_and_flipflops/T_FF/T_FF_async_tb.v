`timescale 1ns / 1ps

module T_FF_async_tb();

    reg clk;
    reg reset;
    reg T;
    wire Q;
    
    T_FF_async uut (
        .clk(clk),
        .reset(reset),
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
        reset = 1'b0;
        T = 1'b0;
        
        // Apply Reset
        #3 reset = 1'b1;
        #8 reset = 1'b0;
        
        // Apply Toggle
        #10 T = 1'b1;
        repeat(5) @(negedge clk);
        
        // Unchanged state
        #3 T = 1'b0;
        
        // Apply Reset
        #15 reset = 1'b1;
        #9 reset = 1'b0;
        
        // End Simulation
        #10 $stop;
    end 
endmodule