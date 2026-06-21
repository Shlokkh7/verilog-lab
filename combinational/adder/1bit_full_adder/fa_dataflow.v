  `timescale 1ns / 1ps


module fa_dataflow(
    input x, y, cin,
    output s, cout
    );
    
    wire s0, c0, c1;
    half_adder_df HA0 (
        .x(x),
        .y(y),
        .s(s0),
        .c(c0)
    );
    half_adder_df HA1 (
        .x(s0),
        .y(cin),
        .s(s),
        .c(c1)
    );
    
    assign cout = c0 | c1;
endmodule
