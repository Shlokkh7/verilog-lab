`timescale 1ns / 1ps

module fa_dataflow(
    input x_i, y_i, cin_i,
    output s_o, cout_o
    );
    
    wire s0, c0, c1;
    half_adder_df HA0 (
        .x_i(x_i),
        .y_i(y_i),
        .s_o(s0),
        .c_o(c0)
    );
    half_adder_df HA1 (
        .x_i(s0),
        .y_i(cin_i),
        .s_o(s_o),
        .c_o(c1)
    );
    
    assign cout_o = c0 | c1;
endmodule
