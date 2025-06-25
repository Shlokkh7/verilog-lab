`timescale 1ns / 1ps

module decoder_3x8_tasks(
    input [2:0] i_a,
    input i_en,
    output reg [7:0] o_y
    );
    
    reg [7:0] temp_y;              // Necessary, since vivado doesn't like if we drive argument of a task directly to the output port
    
    task decoder_3x8;
        input [2:0] in;
        input en;
        output [7:0] y;
        begin
            if (en) begin
                case (in)
                3'b000: y = 8'b00000001;
                3'b001: y = 8'b00000010;
                3'b010: y = 8'b00000100;
                3'b011: y = 8'b00001000;
                3'b100: y = 8'b00010000;
                3'b101: y = 8'b00100000;
                3'b110: y = 8'b01000000;
                3'b111: y = 8'b10000000;
                default:y = 8'b00000000;
                endcase
            end
            else begin
                y = 8'b00000000;
            end
        end    
    endtask
    always @(*) begin
        decoder_3x8(i_a, i_en, temp_y);
        o_y = temp_y;
    end
   
endmodule
