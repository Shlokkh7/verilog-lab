`timescale 1ns / 1ps

module decoder_3x8_fun_tb();

    reg [2:0] i_a;
    reg i_en;
    wire [7:0] o_y;
    integer j, k;
    
    decoder_3x8_fun uut (
        .i_a(i_a),
        .i_en(i_en),
        .o_y(o_y)
    );
    
    initial begin
        #80 $finish;
    end
    
    initial begin
        for(j = 0; j <= 1; j = j + 1) begin
            for(k = 0; k < 8; k = k + 1) begin
                i_en = j;
                i_a = k;
                #1;
                $display("en = %b, a = %b, y = %b", i_en, i_a, o_y);
                #4;
            end
        end
    end
endmodule
