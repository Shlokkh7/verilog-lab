`timescale 1ns / 1ps

module grey_encoder_4bit(                      // Grey code is also called Reflected Binary Code because of how it is constructed, to know why ask me personally
    input [3:0] i_bin,
    input i_en,
    output reg [3:0] o_grey
    );
    
    always @(*) begin
        if (i_en) begin
            o_grey[3] = i_bin[3];
            o_grey[2] = i_bin[3] ^ i_bin[2];
            o_grey[1] = i_bin[2] ^ i_bin[1];
            o_grey[0] = i_bin[1] ^ i_bin[0];
        end
        else begin
            o_grey = 4'bxxxx;
        end
    end
endmodule
