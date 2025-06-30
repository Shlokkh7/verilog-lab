`timescale 1ns / 1ps

/*
    sel = 1 ---> Up Counter
    sel = 0 ---> Down Counter
*/
module async_up_down_counter_nbit
    #(parameter n = 3)
    (
    input clk,
    input preset_n,
    input reset_n,
    input sel,
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
                .preset_n(preset_n),
                .reset_n(reset_n),
                .T(1),
                .Q(Q_reg[k])
            );
        end
    endgenerate
    
    // Next State Logic
    
 /*
    For Up-Counting: falling edge ? ~Q (acts like rising edge on next FF)
    For Down-Counting: rising edge ? Q (as is)
 */
    genvar j;
    generate
        assign ripple_clk[0] = clk;
        for(j = 1; j < n; j = j + 1) begin: MUX_BLOCK
            // assign ripple_clk[j] = sel ? ~Q_reg[j - 1]: Q_reg[j - 1];
            mux_generic_1bit #(.INS(2)) MUX_inst (
                .w({~Q_reg[j - 1], Q_reg[j - 1]}),
                .s(sel),
                .f(ripple_clk[j])
            );
        end
    endgenerate
  
    // Qutput Logic
    assign Q = Q_reg;
endmodule
