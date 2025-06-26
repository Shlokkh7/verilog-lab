`timescale 1ns / 1ps

module shift_registers // Right Shift
    #(parameter n = 4)
    (
    input clk,
    input SI,           // Serial in
    //output [n - 1:0] Q,  // If we care about parallel output
    output SO           // Serial out
    );
    
    reg [n - 1:0] Q_reg, Q_next;
    // State Registers
    always @(posedge clk) begin
        Q_reg <= Q_next;
    end
    
    // Next State Logic
    always @(SI, Q_reg) begin
        // Right Shift
        Q_next = {SI, Q_reg[n - 1:1]};
        
        // Left Shift
        //Q_next = {Q_reg[n - 2:0], SI};
    end
    
    assign SO = Q_reg[0];
    //assign Q = Q_reg;
endmodule
