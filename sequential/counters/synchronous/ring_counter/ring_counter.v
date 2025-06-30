`timescale 1ns / 1ps

module ring_counter
    #(parameter n = 4)
    (
    input clk,
    input clear_n,          // Synchronous (Active Low)
    output [n - 1:0] Q
    );
    
    wire init;
    wire [n - 1:0] Q_reg, Q_next;
    // State Register
    D_FF ff_inst_nth (                  // nth state register
                .D(Q_next[n - 1]),
                .clk(clk),
                .load(~clear_n),
                .load_val(1'b1),
                .clear_n(1'b1),
                .Q(Q_reg[n - 1])
            );
    genvar k;
    generate
        for(k = 0; k < n - 1; k = k + 1) begin: FF_BLOCK
            D_FF ff_inst (
                .D(Q_next[k]),
                .clk(clk),
                .load(1'b0),
                .load_val(1'b1),
                .clear_n(clear_n),
                .Q(Q_reg[k])
            );
        end
    endgenerate
    
    // Next State Logic
        
    assign Q_next = {Q_reg[0], Q_reg[n - 1:1]};
    
    // Output Logic
    assign Q = Q_reg;
endmodule
