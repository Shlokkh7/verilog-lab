`timescale 1ns / 1ps

module encoder_8x3_tasks_tb();

    reg [7:0] i_a;
    reg i_en;
    wire [2:0] o_y;
    integer j, k;
    encoder_8x3_tasks uut (
        .i_a(i_a),
        .i_en(i_en),
        .o_y(o_y)
    );
    
    initial begin
    #80 $finish;
    end
    
    initial begin
        for(j = 0; j < 2; j = j + 1) begin
            for(k = 1; k < 256; k = k * 2) begin
                i_en = j;
                i_a = k;
                #1 $display("en = %b, a = %b, y = %b", i_en, i_a, o_y);
                #4;
            end
        end      
    end
endmodule
