`timescale 1ns / 1ps

module PIPO
    #(parameter n = 4)
    (
    input clk, reset_n,
    input [n - 1:0] I,
    output [n - 1:0] Q
    );
    
    genvar k;                                  // Modular structure
    // Registers
    generate
        for(k = 0; k < n; k = k + 1) begin: FF
            D_FF_asyn_reset ff_inst(
                .D(I[k]),
                .clk(clk),
                .Q(Q[k]),
                .reset_n(reset_n)
            );
        end
    endgenerate
endmodule
