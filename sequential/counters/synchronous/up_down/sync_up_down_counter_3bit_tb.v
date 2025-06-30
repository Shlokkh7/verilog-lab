`timescale 1ns / 1ps

module sync_up_down_counter_3bit_tb();

    reg clk;
    reg sel;
    reg clear_n;
    wire [2:0] Q;
    
    sync_up_down_counter_3bit uut (
        .clk(clk),
        .sel(sel),
        .clear_n(clear_n),
        .Q(Q)
    );
    
    localparam T = 10;          // Clock Period
    always begin
        clk = 1'b1;
        #(T / 2);
        clk = 1'b0;
        #(T / 2);
    end
    
    initial begin
        // Initialization
        sel = 1'b1;         // Stating with down counter
        clear_n = 1'b1;
        
        //Start up
        #3  clear_n = 1'b0;
        #15 clear_n = 1'b1;
        
        #80;
        
        // Apply down counter
        sel = 1'b0;
        
        // End Simulation
        #100 $stop;
    end
endmodule
