`timescale 10ns / 1ps


module adder_substractor_nbit
    #(parameter n = 4)
    (
    input [n - 1:0] x, y,
    input add_n,
    output [n - 1:0] s,
    output cout
    );
    
    wire [n - 1:0] xored_y;
    generate
        genvar k;
        for(k = 0; k < n; k = k + 1)
        begin: bit
            assign xored_y[k] = y[k] ^ add_n;
        end
    endgenerate
    
    rca_nbits #(.n(n)) A0 (
        .x_i(x),
        .y_i(xored_y),
        .cin_i(add_n),
        .s_o(s),
        .cout_o(cout)
    );
    
endmodule
