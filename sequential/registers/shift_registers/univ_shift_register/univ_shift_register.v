`timescale 1ns / 1ps
/*
    s = 00  Unchanged
    s = 01  Right Shift
    s = 10  Left Shift
    s = 11  Parallel Load
*/
module univ_shift_register               
    #(parameter n = 4)
    (
    input clk,
    input reset_n,
    input MSB_in,
    input LSB_in,           
    input [n - 1:0] I,
    input [1:0] s,  
    output [n - 1:0] Q   
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
    
    // For (n - 1) and 0 FFs
    mux_generic_1bit #(.INS(4)) mux_inst_nth (
                .w({I[n - 1], Q[n - 2], MSB_in, Q[n - 1]}),
                .s(s),
                .f(Q_next[n  - 1])
            );
    mux_generic_1bit #(.INS(4)) mux_inst_0th (
                .w({I[0], LSB_in, Q[1], Q[0]}),
                .s(s),
                .f(Q_next[0])
            );
    // For (n - 2) to 1 FFs
    genvar j;
    generate
        for(j = 1; j < n - 1; j = j + 1) begin: MUX_BLOCK
            mux_generic_1bit #(.INS(4)) mux_inst (
                .w({I[j], Q[j - 1], Q[j + 1], Q[j]}),
                .s(s),
                .f(Q_next[j])
            );
        end
    endgenerate
endmodule
