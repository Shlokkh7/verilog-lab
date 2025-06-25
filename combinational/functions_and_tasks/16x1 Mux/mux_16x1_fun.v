`timescale 1ns / 1ps

module mux_16x1_fun(           // This Mux is for 16 one bit inputs
    input [15:0] i_a,
    input [3:0] i_s,
    output o_f
    );
    
    function mux_16x1;
        input [15:0] in;
        input [3:0] s;
        integer k;
        begin
            for(k = 0; k < 16; k = k + 1) begin
                if (k == s) begin
                    mux_16x1 = in[k];
                end
            end
        end
    endfunction
    
    assign o_f = mux_16x1(i_a, i_s);
endmodule
