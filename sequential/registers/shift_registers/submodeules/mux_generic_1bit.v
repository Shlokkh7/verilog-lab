`timescale 1ns / 1ps

module mux_generic_1bit
    #(parameter INS = 5)
    (
    input [INS - 1:0] w,                      
    input [$clog2(INS) - 1:0] s,               
    output reg f                                      
    );

    integer k;
    always @(*) 
    begin
        f = 'bx; 
        for (k = 0; k < INS; k = k + 1)
            if (k == s)
                f = w[k];
    end
endmodule
