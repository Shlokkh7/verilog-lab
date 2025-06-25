`timescale 1ns / 1ps

module decoder_2x4_fun(
    input [1:0] i_a,
    input i_en,
    output [3:0] o_y
    );
    
    function [3:0] decoder_2x4;
        input [1:0] in;
        input en;
        
        begin
            if(en)
            begin
                case(in)
                2'b00:  decoder_2x4 = 4'b0001;
                2'b01:  decoder_2x4 = 4'b0010;
                2'b10:  decoder_2x4 = 4'b0100;
                2'b11:  decoder_2x4 = 4'b1000;
                default: decoder_2x4 = 4'b0000;
                endcase
            end
            else
            begin
                decoder_2x4 = 4'b0000;
            end
        end
    endfunction
    
    assign o_y = decoder_2x4(i_a, i_en);
    
endmodule
