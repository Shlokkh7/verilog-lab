`timescale 1ns / 1ps

module demux_1x16_fun(
    input i_f,
    input [3:0] i_s,
    output [15:0] o_y
    );
    
    function [15:0] demux_1x16;
        input f;
        input [3:0] s;
        integer k;
        begin
            demux_1x16 = 16'd0;                    // Default value
            for(k = 0; k < 16; k = k + 1) begin
                if (k == s)
                    demux_1x16[k] = f;
            end
        end
    endfunction
    
    assign o_y = demux_1x16(i_f, i_s);
endmodule
