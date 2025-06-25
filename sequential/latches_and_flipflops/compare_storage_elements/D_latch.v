`timescale 1ns / 1ps

module D_latch(
    input D,
    input clk,
    output reg Q,
    output Q_b
    );
    
    assign Q_b = ~Q;
    always @(D, clk) begin
        if (clk)
            Q <= D;                    // Non blocking statement
    end
endmodule
