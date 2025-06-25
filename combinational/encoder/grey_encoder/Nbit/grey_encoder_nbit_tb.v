`timescale 1ns / 1ps

module grey_encoder_nbit_tb();

    parameter n = 3;
    reg [n - 1:0] i_bin;
    reg i_en;
    wire [n - 1:0] o_grey;
    integer j, k;
    
    grey_encoder_nbit #(.n(n)) uut(
        .i_bin(i_bin),
        .i_en(i_en),
        .o_grey(o_grey)
    );
    
    initial begin
        $display("Binary Grey");
        #(2**n * 5 * 2) $finish;
    end
    
    initial begin
        for(j = 0; j < 2 ;j = j + 1) begin
            for(k = 0; k < 2**n; k = k + 1) begin
                i_en = j;
                i_bin = k;
                #1 $strobe("%b | %b", i_bin, o_grey);            // Logs the value after the time delay settles
                #4;
            end
        end
    end
endmodule
