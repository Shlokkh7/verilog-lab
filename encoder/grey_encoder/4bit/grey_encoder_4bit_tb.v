`timescale 1ns / 1ps

module grey_encoder_4bit_tb();

    reg [3:0] i_bin;
    reg i_en;
    wire [3:0] o_grey;
    integer j, k;
    
    grey_encoder_4bit uut(
        .i_bin(i_bin),
        .i_en(i_en),
        .o_grey(o_grey)
    );
    
    initial begin
        $display("Binary Grey");
        #160 $finish;
    end
    
    initial begin
        for(j = 0; j < 2 ;j = j + 1) begin
            for(k = 0; k < 16; k = k + 1) begin
                i_en = j;
                i_bin = k;
                #1 $display("%b | %b", i_bin, o_grey);
                #4;
            end
        end
    end
endmodule
