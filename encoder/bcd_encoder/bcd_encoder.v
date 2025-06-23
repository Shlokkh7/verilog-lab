`timescale 1ns / 1ps

module bcd_encoder(                        // Also called 10-to-4 BCD encoder
    input [9:0] i_i,
    input i_en,
    output reg [3:0] o_y
    );
    
    always @(*) begin
        if (i_en) begin
            case (i_i)
            10'b0000000001: o_y = 4'b0000;
            10'b0000000010: o_y = 4'b0001;
            10'b0000000100: o_y = 4'b0010;
            10'b0000001000: o_y = 4'b0011;
            10'b0000010000: o_y = 4'b0100;
            10'b0000100000: o_y = 4'b0101;
            10'b0001000000: o_y = 4'b0110;
            10'b0010000000: o_y = 4'b0111;
            10'b0100000000: o_y = 4'b1000;
            10'b1000000000: o_y = 4'b1001;
            default:       o_y = 4'bxxxx;
            endcase
        end
        else begin
            o_y = 4'bxxxx;
        end
    end
endmodule
