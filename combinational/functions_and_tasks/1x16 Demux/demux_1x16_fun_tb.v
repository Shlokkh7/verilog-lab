`timescale 1ns / 1ps

module demux_1x16_fun_tb();

    reg i_f;
    reg [3:0] i_s;
    wire [15:0] o_y;
    integer k;
    
    demux_1x16_fun uut (
        .i_f(i_f),
        .i_s(i_s),
        .o_y(o_y)
    );
    
    initial begin
    #80 $finish;
    end
    
    initial begin
        i_f = 1'b1;
        for(k = 0; k < 16; k = k + 1) begin
             i_s = k;
             #5;
        end
    end
endmodule
