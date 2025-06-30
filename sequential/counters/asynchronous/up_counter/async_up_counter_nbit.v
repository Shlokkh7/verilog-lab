`timescale 1ns / 1ps

module async_up_counter_nbit
    #(parameter n = 7)
    (
    input clk,
    input reset_n,      // Required for startup
    output [n - 1:0] Q
    );
    
    wire [n - 1:0] ripple_clk;
    wire [n - 1:0] Q_reg;
    // State Register
    genvar k;
    generate
        for(k = 0; k < n; k = k + 1) begin: FF_BLOCK
            T_FF_async ff_inst (
                .clk(ripple_clk[k]),
                .preset_n(1),
                .reset_n(reset_n),
                .T(1),
                .Q(Q_reg[k])
            );
        end
    endgenerate
    
    // Next State Logic
    genvar j;
    generate
        assign ripple_clk[0] = clk;
        for(j = 1; j < n; j = j + 1) begin: Clk_BLOCK
            assign ripple_clk[j] = ~Q_reg[j - 1];
        end
    endgenerate
    
    // At the final state when all FFs are 1 then due to the rising edge of each ~Q all the next FFs toggle converting them all in 0
    
    // Qutput Logic
    assign Q = Q_reg;
endmodule
