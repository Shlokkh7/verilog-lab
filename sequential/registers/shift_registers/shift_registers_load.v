`timescale 1ns / 1ps

module shift_registers_load // Right Shift or load
    #(parameter n = 4)
    (
    input clk,
    input load,
    input SI,           // Serial in
    input [n - 1:0] I,  // Parallel in
    input reset_n,
    output [n - 1:0] Q, // Parallel output
    output SO           // Serial out
    );
    
    reg [n - 1:0] Q_reg, Q_next;
    // State Registers
    always @(posedge clk, negedge reset_n) begin
        if (!reset_n)
            Q_reg <= 0;
        else
            Q_reg <= Q_next;
    end
    
    // Next State Logic
    always @(I, SI, Q_reg, load) begin
        
        if (load)
            Q_next = I;                         // If load = 1 Parallel load
        else
            Q_next = {SI, Q_reg[n - 1:1]};      // Else right shift
    end
    
    assign SO = Q_reg[0];
    assign Q = Q_reg;
endmodule
