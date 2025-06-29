`timescale 1ns / 1ps

// load = 1 -> Parallel Load
// load = 0 -> Right Shift

module PISO     // Right Shift and Parallel Load
    #(parameter n = 4)
    (
    input clk,
    input reset_n,
    input load,
    input [n - 1:0] I,  // Parallel In
    output SO           // Shift Out
    );
    
    wire [n - 1:0] Q_next, Q_reg;
    genvar k;                                  // Modular structure
    // Registers
    generate
        for(k = 0; k < n; k = k + 1) begin: FF
            D_FF_asyn_reset ff_inst(
                .D(Q_next[k]),
                .clk(clk),
                .Q(Q_reg[k]),
                .reset_n(reset_n)
            );
        end
    endgenerate
    
    // Load of Shift_n
    mux_generic_1bit #(.INS(2)) mux_inst_nth (
                .w({I[n - 1], 0}),
                .s(load),
                .f(Q_next[n - 1])
           );
    // assign Q_next[n - 1] = load ? I[n - 1]:0;
      
    genvar j;
    generate
        for(j = 0; j < n - 1; j = j + 1) begin: MUX_BLOCK
           mux_generic_1bit #(.INS(2)) mux_inst (
                .w({I[j], Q_reg[j + 1]}),
                .s(load),
                .f(Q_next[j])
           );
        end
    endgenerate
    
    assign SO = Q_reg[0];
endmodule
