`timescale 1ns / 1ps

module univ_shift_register 
    #(parameter n = 4)
    (
    input clk, reset_n,
    input MSB_in, LSB_in,           
    input [n - 1:0] I,
    input [1:0] s,  
    output [n - 1:0] Q           
    );
    
    reg [n - 1:0] Q_reg, Q_next;
    // State Registers
    always @(negedge clk, negedge reset_n) begin
        if (!reset_n)
            Q_reg <= 0;
        else
            Q_reg <= Q_next;
    end
    
    // Next State Logic
    always @(s, MSB_in, LSB_in, Q_reg, I) begin
        case (s)
        2'b00:  Q_next = Q_reg;
        2'b01:  Q_next = {MSB_in, Q_reg[n - 1:1]};
        2'b10:  Q_next = {Q_reg[n - 2:0], LSB_in};
        2'b11:  Q_next = I;
        default: Q_next = Q_reg;
        endcase
    end
    
    // Output Logic
    assign Q = Q_reg;
endmodule
