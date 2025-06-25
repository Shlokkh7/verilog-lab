`timescale 1ns / 1ps

module decoder_2x4_tasks(
    input [1:0] i_a,
    input i_en,
    output reg [3:0] o_y
    );
    
    reg [3:0] temp_y;
    
    task decoder_2x4;
        input [1:0] in;
        input en;
        output [3:0] y;
        begin
            if(en)
            begin
                case(in)
                2'b00:  y = 4'b0001;
                2'b01:  y = 4'b0010;
                2'b10:  y = 4'b0100;
                2'b11:  y = 4'b1000;
                default:y = 4'b0000;
                endcase
            end
            else
            begin
                y = 4'b0000;
            end
        end
    endtask
    
    always @(*) begin
        decoder_2x4(i_a, i_en, temp_y);
        o_y = temp_y;
    end
endmodule
