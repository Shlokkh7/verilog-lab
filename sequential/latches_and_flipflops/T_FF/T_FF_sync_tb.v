`timescale 1ns / 1ps

module T_FF_sync_tb();

    reg clk;
    reg clear_n;
    reg T;
    wire Q;
    
    T_FF_sync uut (
        .clk(clk),
        .clear_n(clear_n),
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
        clear_n = 1'b1;
        T = 1'b0;
        
        // Apply Reset
        #3 clear_n = 1'b0;
        #8 clear_n = 1'b1;
        
        // Apply Toggle
        #10 T = 1'b1;
        repeat(5) @(negedge clk);
        
        // Unchanged state
        #3 T = 1'b0;
        
        // Apply Reset
        #15 clear_n = 1'b0;
        #7 clear_n = 1'b1;
        
        // End Simulation
        #10 $stop;
    end 
endmodule