`timescale 1ns / 1ps

module fa_behavioral(
    input x, y, cin,
    output s,
    output reg cout
    );
    
    wire s0, c0, c1;
    half_adder_beh HA0 (
        .x(x),
        .y(y),
        .s(s0),
        .c(c0)
    );
    half_adder_beh HA1 (
        .x(s0),
        .y(cin),
        .s(s),
        .c(c1)
    );
    
    always @(x, y, c0, c1)
    begin
        cout = c0 | c1;
    end
endmodule
