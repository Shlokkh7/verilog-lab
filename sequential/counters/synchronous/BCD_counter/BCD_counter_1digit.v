`timescale 1ns / 1ps

module BCD_counter_1digit(
    // input T,
    input clk,
    input clear_n,      // Synchronous (Active low)
    output [3:0] Q
    );
    
    wire [3:0] Q_reg, Q_next;
    // State Registers
    T_FF_sync FF0 (.clk(clk), .clear_n(clear_n), .T(Q_next[0]), .Q(Q_reg[0]));
    T_FF_sync FF1 (.clk(clk), .clear_n(clear_n), .T(Q_next[1]), .Q(Q_reg[1]));
    T_FF_sync FF2 (.clk(clk), .clear_n(clear_n), .T(Q_next[2]), .Q(Q_reg[2]));
    T_FF_sync FF3 (.clk(clk), .clear_n(clear_n), .T(Q_next[3]), .Q(Q_reg[3]));
    
    // Next State Logic
    assign Q_next[0] = 1'b1;
    assign Q_next[1] = ~Q_reg[3] & Q_reg[0];
    assign Q_next[2] = ~Q_reg[3] & Q_reg[1] & Q_reg[0];
    assign Q_next[3] = (~Q_reg[3] & Q_reg[2] & Q_reg[1] & Q_reg[0]) | (Q_reg[3] & ~Q_reg[2] & ~Q_reg[1] & Q_reg[0]);
    
    // Output Logic
    assign Q = Q_reg;
endmodule
