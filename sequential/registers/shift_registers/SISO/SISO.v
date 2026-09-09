`timescale 1ns / 1ps

module SISO    // Right Shift
    #(parameter n = 4)
    (
    input clk, reset_n,
    input SI,       // Shift In
    output SO       // Shift Out
    );
    
    wire [n - 1:0] Q_next, Q_reg;
    genvar k;                                  // Modular structure
    // Registers
     D_FF_asyn_reset ff_inst0(
                .D(Q_next[0]),
                .clk(clk),
                .Q(Q_reg[0]),
                .reset_n(reset_n)
            );
    generate
        for(k = 1; k < n; k = k + 1) begin: FF
            D_FF_asyn_reset ff_inst(
                .D(Q_next[k]),
                .clk(clk),
                .Q(Q_reg[k]),
                .reset_n(reset_n)
            );
        end
    endgenerate
    
    assign Q_next[n - 1] = SI;

    genvar j;
    generate
        for(j = 0; j < n - 1; j = j + 1) begin: NEXT_BLOCK
            assign Q_next[j] =  Q_reg[j + 1];
        end
    endgenerate
 
    assign SO = Q_reg[0];           // LSB
endmodule
