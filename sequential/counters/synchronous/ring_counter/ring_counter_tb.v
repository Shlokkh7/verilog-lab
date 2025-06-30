`timescale 1ns / 1ps

module ring_counter_tb();

    parameter n = 5;
    reg clk;
    reg clear_n;
    wire [n - 1:0] Q;
    
    ring_counter #(.n(n)) uut (
        .clk(clk),
        .clear_n(clear_n),
        .Q(Q)
    );
    
    localparam T = 10;              // Clock Period
    always begin
        clk = 1'b0;
        #(T / 2);
        clk = 1'b1;
        #(T / 2);
    end
    
    initial begin
        clear_n = 1'b1;
        #3 clear_n = 1'b0;
        #15 clear_n = 1'b1;
        
        #200 $stop;
    end
endmodule
