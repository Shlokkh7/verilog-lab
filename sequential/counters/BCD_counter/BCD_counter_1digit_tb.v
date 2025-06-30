`timescale 1ns / 1ps

module BCD_counter_1digit_tb();

    reg clk;
    reg clear_n;
    wire [3:0] Q;
    
    BCD_counter_1digit uut (
        .clk(clk),
        .clear_n(clear_n),
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
        // Start up reset
        clear_n = 1'b1;
        #3 clear_n = 1'b0;
        #15 clear_n = 1'b1;
        #200 $finish;
    end
endmodule
