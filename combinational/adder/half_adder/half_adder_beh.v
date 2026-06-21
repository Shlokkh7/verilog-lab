`timescale 1ns / 1ps

module half_adder_beh(
    input x, y,
    output reg s, c
    );
    
    always @(x, y)
    begin
    // Sum
        s = x ^ y;
    // Carry
        if (x & y)
        begin
            c = 1'b1;
        end 
        else
        begin
            c = 1'b0;
        end
    end
endmodule
