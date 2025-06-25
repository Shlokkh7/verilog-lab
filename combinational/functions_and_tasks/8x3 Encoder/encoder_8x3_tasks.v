`timescale 1ns / 1ps

module encoder_8x3_tasks(
    input [7:0] i_a,
    input i_en,
    output reg [2:0] o_y
    );
    
    reg [2:0] temp_y;
    
    task encoder_8x3;
        input [7:0] a;
        input en;
        output [2:0] y;
        begin
            if (en) begin
                case (a)
                8'b00000001:  y = 0;
                8'b00000010:  y = 1;
                8'b00000100:  y = 2;
                8'b00001000:  y = 3;
                8'b00010000:  y = 4;
                8'b00100000:  y = 5;
                8'b01000000:  y = 6;
                8'b10000000:  y = 7;
                default:      y = 3'bxxx;
                endcase
            end
            else
                y = 3'bxxx;
        end
    endtask
    always @(*) begin
        encoder_8x3(i_a, i_en, temp_y);
        o_y = temp_y;
    end
endmodule
