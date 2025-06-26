`timescale 1ns / 1ps

module simple_register_load
    #(parameter n = 8)
    (
    input clk,
    input load,
    input [n - 1:0] I,
    output [n - 1:0] Q
    );
    
    reg [n - 1:0] Q_reg, Q_next;
    // State Registers
    always @(posedge clk) begin
        Q_reg <= Q_next;
    end
    
    // Next State Logic
    always @(I, load) begin
        if (load)
            Q_next = I;
        else
            Q_next = Q_reg;
    end
    assign Q = Q_reg;
endmodule
