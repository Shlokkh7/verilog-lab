`timescale 1ns / 1ps

module encoder_8x3_fun(
    input [7:0] i_a,
    input i_en,
    output [2:0] o_y
    );
    
    function [2:0] encoder_8x3;
        input [7:0] a;
        input en;
        begin
            if (en) begin
                case (a)
                8'b00000001:  encoder_8x3 = 0;
                8'b00000010:  encoder_8x3 = 1;
                8'b00000100:  encoder_8x3 = 2;
                8'b00001000:  encoder_8x3 = 3;
                8'b00010000:  encoder_8x3 = 4;
                8'b00100000:  encoder_8x3 = 5;
                8'b01000000:  encoder_8x3 = 6;
                8'b10000000:  encoder_8x3 = 7;
                default:      encoder_8x3 = 3'bxxx;
                endcase
            end
            else
                encoder_8x3 = 3'bxxx;
        end
    endfunction
    
    assign o_y = encoder_8x3(i_a, i_en);
endmodule
