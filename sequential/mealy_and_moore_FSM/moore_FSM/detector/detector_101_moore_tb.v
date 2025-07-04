`timescale 1ns / 1ps

module detector_101_moore_tb();

    reg clk;
    reg clear_n;
    reg x;
    wire z;
    wire [1:0] Q;           // Only for debugging
    
    detector_101_moore uut (
        .clk(clk),
        .clear_n(clear_n),
        .x(x),
        .z(z),
        .Q(Q)
    );
    
    localparam T = 8;          // Clock Period
    always begin
        clk = 1'b0;
        #(T / 2);
        clk = 1'b1;
        #(T / 2);
    end
    
    reg [31:0] test_input = 32'b11001101010011001001101011001010;       // Example binary pattern
    integer i;
    
    initial begin
        clear_n = 1'b1;
        x = 1'b0;
    
        // Reset FSM
        @(negedge clk); clear_n = 1'b0;
        @(negedge clk); clear_n = 1'b1;
    
        // Feed test pattern
        for (i = 31; i >= 0; i = i - 1) begin
            @(negedge clk);
            x = test_input[i];
        end
    
        #20 $finish;
    end
    always @(posedge clk) begin
        if (z)
            $display("Pattern 101 detected at time %0dns", $time);
    end

    initial begin
        $display("Time\tclk\treset\tx\tQ\tz");
        $monitor("%0dns\t\t%b\t\t%b\t\t%b\t\t%b\t\t%b", $time, clk, clear_n, x, Q, z);
    end

endmodule
