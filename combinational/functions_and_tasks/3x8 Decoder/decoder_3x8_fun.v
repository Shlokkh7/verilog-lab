`timescale 1ns / 1ps

module decoder_3x8_fun(
    input [2:0] i_a,
    input i_en,
    output [7:0] o_y
    );
    
    function [7:0] decoder_3x8;
        input [2:0] in;
        input en;
        begin
            if (en) begin
                case (in)
                3'b000: decoder_3x8 = 8'b00000001;
                3'b001: decoder_3x8 = 8'b00000010;
                3'b010: decoder_3x8 = 8'b00000100;
                3'b011: decoder_3x8 = 8'b00001000;
                3'b100: decoder_3x8 = 8'b00010000;
                3'b101: decoder_3x8 = 8'b00100000;
                3'b110: decoder_3x8 = 8'b01000000;
                3'b111: decoder_3x8 = 8'b10000000;
                default:decoder_3x8 = 8'b00000000;
                endcase
            end
            else begin
                decoder_3x8 = 8'b00000000;
            end
        end    
    endfunction
    
    assign o_y = decoder_3x8(i_a, i_en);
endmodule
