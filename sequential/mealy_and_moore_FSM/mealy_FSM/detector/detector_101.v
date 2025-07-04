`timescale 1ns / 1ps

// Detector outputs z = 1 when pattern "101" detected

module detector_101(
    input clk,
    input clear_n,
    input x,                    // Serial input
    output z,
    output [1:0] Q              // Only for debugging
    );
    
    // State Registers
    wire [1:0] Q_reg, Q_next;
    D_FF FF0 (.D(Q_next[0]), .clk(clk), .clear_n(clear_n), .Q(Q_reg[0]));
    D_FF FF1 (.D(Q_next[1]), .clk(clk), .clear_n(clear_n), .Q(Q_reg[1]));
    
    // Next State Logic
    assign Q_next[0] = x & ~ Q_reg[1];
    assign Q_next[1] = ~ x & ~ Q_reg[1] & Q_reg[0];
    
    // Output Logic
    assign z = x & Q_reg[1] & ~Q_reg[0];
    assign Q = Q_reg;
endmodule
