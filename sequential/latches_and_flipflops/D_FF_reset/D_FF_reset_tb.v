`timescale 1ns / 1ps

module D_FF_reset_tb();

    reg clk, D, reset_n, clear_n;
    wire Q;
    
    D_FF_reset uut (
        .D(D),
        .clk(clk),
        .reset_n(reset_n),
        .clear_n(clear_n),
        .Q(Q)
    );
    
    localparam T = 10;      // Clock period
    always begin
        clk = 1'b0;
        #(T / 2);
        clk = 1'b1;
        #(T / 2);
    end
    
     initial begin
    // Initial values
    D = 1'b0;
    reset_n = 1'b1;
    clear_n = 1'b1;

    // Apply async reset
    #2 reset_n = 1'b0;
    #10 reset_n = 1'b1;    // Normal operation

    // Set D = 1
    #3 D = 1'b1; // Set before falling edge
    #10;

    // Apply synchronous clear
    #3 clear_n = 1'b0;
    #10 clear_n = 1'b1;

    // D = 0, should follow
    #3 D = 1'b0;
    #10;

    // Check both reset and clear together
    #3 reset_n = 1'b0;
    #5 clear_n = 1'b0;  // should be ignored due to reset
    #10 reset_n = 1'b1;
    clear_n = 1'b1;

    // Final test: set D = 1 again
    #3 D = 1'b1;
    #10;

    // End simulation
    #10 $stop;
  end
endmodule
