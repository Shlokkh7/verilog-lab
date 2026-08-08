`timescale 1ns / 1ps

// Synchronous n bit parameterized counter
module counter
    #(parameter n = 16)
    (
    input clk,
    input reset,
    output [n - 1:0] Q
    );
    
    // wire [n - 1:0] T;
    wire [n - 1:0] Q_reg;
    wire res_auto;
    // assign T[0] = 1'b0;
    // Generate block
    
    T_FF_sync tff_inst0 (
                .clk(clk),
                .clear_n(~res_auto),
                .T(1'b1),
                .Q(Q_reg[0])
            );
            
    genvar i;
    generate
        for(i = 1; i < n; i = i + 1) begin: T_FF_inst
            T_FF_sync tff_inst (
                .clk(clk),
                .clear_n(~res_auto),
                .T(&Q_reg[i - 1:0]),
                .Q(Q_reg[i])
            );
        end
    endgenerate
    
    assign res_auto = (reset | (&Q_reg));
    assign Q = Q_reg;

endmodule
