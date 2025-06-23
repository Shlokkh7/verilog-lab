`timescale 1ns / 1ps

module grey_encoder_nbit
    #(parameter n = 4)
    (
    input [n - 1:0] i_bin,
    input i_en,
    output reg [n - 1:0] o_grey
    );
    
    integer k;
    always @(*) begin
        if (i_en) begin
            o_grey[n - 1] = i_bin[n - 1];
            
            for(k = 0; k < (n - 1); k = k + 1) begin
                o_grey[k] = i_bin[k] ^ i_bin[k + 1];
            end
        end
        else begin
            o_grey = 'bx;
        end
    end
endmodule
