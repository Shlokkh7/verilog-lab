`timescale 1ns / 1ps

module D_FF_neg(
    input D,
    input clk,
    output reg Q
    );
    
    always @(negedge clk) begin
        Q <= D;                    // Non blocking statement
    end
endmodule
