`timescale 1ns / 1ps

module sync_up_down_counter_3bit(
    input clk,
    input sel,
    input clear_n,
    output [2:0] Q
    );
    
    wire [2:0] Q_reg, Q_next;
    // State Registers
    genvar k;
    generate
        for(k = 0; k < 3; k = k + 1) begin: FF_BLOCK
            T_FF_sync ff_inst(
                .clk(clk),
                .clear_n(clear_n),
                .T(Q_next[k]),
                .Q(Q_reg[k])
            );
        end
    endgenerate
    
    // Next State Logic
    assign Q_next[0] = 1'b1;
    assign Q_next[1] = sel ^ Q_reg[0];
    assign Q_next[2] = sel ^ (Q_reg[0] & Q_reg[1]);
    
    // Output Logic
    assign Q = Q_reg; 
endmodule
