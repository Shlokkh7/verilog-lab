`timescale 1ns / 1ps

module async_up_down_counter_nbit_tb();

    parameter n = 3;
    reg clk;
    reg preset_n;
    reg reset_n;
    reg sel;
    wire [n - 1:0] Q;
    
    async_up_down_counter_nbit #(.n(n)) uut(
        .clk(clk),
        .preset_n(preset_n),
        .reset_n(reset_n),
        .sel(sel),
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
        sel = 1'b1;         // Stating with up counter
        preset_n = 1'b1;
        reset_n = 1'b1;
        
        //Start up
        #3  reset_n = 1'b0;
        #15 reset_n = 1'b1;
        
        #80;
        
        // Apply down counter
        sel = 1'b0;
        preset_n = 1'b0;
        #9 preset_n = 1'b1;
        
        // End Simulation
        #100 $stop;
    end
endmodule
