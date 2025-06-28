`timescale 1ns / 1ps

module SIPO     // Right Shift
    #(parameter n = 4)
    (
    input clk, 
    input reset_n,
    input SI,               // Shift In
    output [n - 1:0] Q      // Parallel Output
    );
    
    wire [n - 1:0] Q_next;
    genvar k;                                  // Modular structure
    // Registers
    generate
        for(k = 0; k < n; k = k + 1) begin: FF
            D_FF_asyn_reset ff_inst(
                .D(Q_next[k]),
                .clk(clk),
                .Q(Q[k]),
                .reset_n(reset_n)
            );
        end
    endgenerate

    genvar j;
    generate
        for(j = 0; j < n - 1; j = j + 1) begin: NEXT_BLOCK
            assign Q_next[n - 1] = SI;
            assign Q_next[j] =  Q[j + 1];
        end
    endgenerate
        
endmodule
