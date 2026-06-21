`timescale 1ns / 1ps

module half_adder_struct(
    input x, y,
    output s, c
    );
    
    xor X0 (s, x, y);
    and A0 (c, x, y);
endmodule
