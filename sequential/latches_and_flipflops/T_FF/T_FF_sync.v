`timescale 1ns / 1ps

module T_FF_sync(
    input clk,
    input clear_n,
    input T,
    output Q
    );
    
    // localparam C2Q_DELAY = 2;   // For simulation only
    reg Q_reg, Q_next;
    // State Registers
    always @(posedge clk) begin
      /* #C2Q_DELAY */ Q_reg <= Q_next;
    end
    
    // Next State Logic
    always @(T, Q_reg, clear_n) begin
        if (!clear_n)
            Q_next = 1'b0;
        else
            Q_next = T ? ~Q_reg: Q_reg;
    end
    
    // Output Logic
    assign Q = Q_reg;
endmodule
