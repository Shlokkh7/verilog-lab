`timescale 1ns / 1ps

module counter_nbits_tb();

    parameter n = 4;
    reg clk;
    reg reset;
    wire [n - 1:0] Q;
    
    counter #(.n(n)) uut (
        .clk(clk),
        .reset(reset),
        .Q(Q)
    );
    
    localparam T = 5;
    always begin
        clk = 1'b0;
        #(T / 2);
        clk = 1'b1;
        #(T / 2);
    end
    initial begin
        // Start up reset
        reset = 1'b0;
        #3 reset = 1'b1;
        #10 reset = 1'b0;
        #200000 $finish;
    end
endmodule
