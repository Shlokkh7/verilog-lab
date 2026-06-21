`timescale 1ns / 1ps

module rca_nbits
    #(parameter n = 8)              // Default value
    (
    input [n - 1: 0] x_i, y_i,
    input cin_i,
    output [n - 1: 0] s_o,
    output cout_o
    );
    
    wire [n : 0] c;
    assign c[0] = cin_i;
    assign cout_o = c[n];                     // Non blocking statement
        
    generate
        genvar k;
        
        for (k = 0; k < n; k = k + 1)
        begin: stage
            fa_dataflow FA (
                .x_i(x_i[k]),
                .y_i(y_i[k]),
                .cin_i(c[k]),
                .s_o(s_o[k]),
                .cout_o(c[k + 1])
            ); 
        end
    endgenerate 
    
endmodule
