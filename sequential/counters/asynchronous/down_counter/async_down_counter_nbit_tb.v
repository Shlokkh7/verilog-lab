`timescale 1ns / 1ps

module async_down_counter_nbit_tb();
    
    parameter n = 4;
    reg clk;
    reg preset_n;
    wire [n - 1:0] Q;
    
    async_down_counter_nbit #(.n(n)) uut (
        .clk(clk),
        .preset_n(preset_n),
        .Q(Q)
    );
    
    localparam T = 10;          // Clock Period
    always begin
        clk = 1'b0;
        #(T / 2);
        clk = 1'b1;
        #(T / 2);
    end
    
    initial begin
        // Initial Start up
        preset_n = 1'b0;
        #13 preset_n = 1'b1;
        
        #200 $stop;
    end
endmodule
