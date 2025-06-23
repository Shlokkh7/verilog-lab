`timescale 1ns / 1ps

module bcd_encoder_tb();

    reg [9:0] i_i;
    reg i_en;
    wire [3:0] o_y;
    integer j, k;
    
    bcd_encoder uut (
        .i_i(i_i),
        .i_en(i_en),
        .o_y(o_y)
    );
    
    initial begin
        #100 $finish;
    end
    
    initial begin
        for(j = 0; j < 2; j = j + 1) begin
            for(k = 1; k < 11'b10000000000 ; k = k * 2) begin
                i_en = j;
                i_i = k;
                #1 $display("en = %b, i = %b, y = %b time = %2d", i_en, i_i, o_y, $time);
                #4;
            end
        end
    end
endmodule
