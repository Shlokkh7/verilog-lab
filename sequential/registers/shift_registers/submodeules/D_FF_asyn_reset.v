`timescale 1ns / 1ps

module D_FF_asyn_reset(
    input D,
    input clk,
    input reset_n,  // Asynchronous (Active low)
    output Q
    );
    
    reg Q_reg, Q_next;
    // State register
    always @(negedge clk, negedge reset_n) begin
        if (!reset_n)
            Q_reg <= 1'b0;
        else
            Q_reg <= Q_next;
    end
    
    // Next state
    always @(D) begin
        Q_next = D;
    end
    
    assign Q = Q_reg;
endmodule
