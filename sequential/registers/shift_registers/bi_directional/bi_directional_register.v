`timescale 1ns / 1ps

module bi_directional_register 
    #(parameter n = 4)
    (
    input clk,
    input reset_n,
    input SI,               // Shift In
    input R_L_n,            // Select Line
    output SO               // Shift Out
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
    
    // For (n - 1) and 0 FFs
    mux_generic_1bit #(.INS(2)) mux_inst_nth (
                .w({SI, Q_reg[n - 2]}),
                .s(R_L_n),
                .f(Q_next[n  - 1])
            );
    mux_generic_1bit #(.INS(2)) mux_inst_0th (
                .w({Q_reg[1], SI}),
                .s(R_L_n),
                .f(Q_next[0])
            );
            
    // For (n - 2) to 1 FFs
    genvar j;
    generate
        for(j = 1; j < n - 1; j = j + 1) begin: MUX_BLOCK
            mux_generic_1bit #(.INS(2)) mux_inst (
                .w({Q_reg[j + 1], Q_reg[j - 1]}),
                .s(R_L_n),
                .f(Q_next[j])
            );
        end
    endgenerate
    
    mux_generic_1bit #(.INS(2)) mux_inst_SO (
                .w({Q_reg[0], Q_reg[n - 1]}),
                .s(R_L_n),
                .f(SO)
            );
endmodule
