
`timescale 1ns / 1ps

module D_FF(
    input D,
    input clk,
    input clear_n,  // Synchronous (Active low)
    output Q
    );
    
    reg Q_reg, Q_next;
    // State register
    always @(posedge clk) begin    
        Q_reg <= Q_next;
    end
    
    // Next state
    always @(D, clear_n) begin
        if (!clear_n)
            Q_next = 1'b0;
        else
            Q_next = D;
        
    end
    
    // Output Logic
    assign Q = Q_reg;
endmodule
