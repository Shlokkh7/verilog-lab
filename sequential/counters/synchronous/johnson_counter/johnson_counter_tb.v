`timescale 1ns / 1ps

module johnson_counter_tb();

    parameter n = 7;
    reg clk;
    reg clear_n;
    wire [n - 1:0] Q;
    
    johnson_counter #(.n(n)) uut (
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
        
        #(1.5 * (10 * 2 * n)) $stop;            // 10ns per state, 2n states and the counter ends after 1.5 cycles later
    end
endmodule
