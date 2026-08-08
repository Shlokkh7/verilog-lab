`timescale 1ns / 1ps

module pwm_enc_tb(

    );
    
    parameter n = 4;
    reg [n - 1:0] ref_i;
    reg clk_i;
    reg reset_i;
    wire pwm_o;
    wire [n - 1:0] carrier;
    integer i;
    
    pwm_enc #(.n(n)) uut(
        .ref_i(ref_i),
        .clk_i(clk_i),
        .reset_i(reset_i),
        .pwm_o(pwm_o),
        .carrier(carrier)
    );
    
    localparam T = 5;
    always
    begin
        clk_i = 1'b0;
        #(T / 2);
        clk_i = 1'b1;
        #(T / 2);
    end
    
    initial
    begin
    // Apply reset
    reset_i = 1'b0;
    #5 reset_i = 1'b1;
    #7 reset_i = 1'b0;
        // Feed input
        for (i = 0; i <= 90; i = i + 2) begin
            assign ref_i = i;
            #5;
        end
        for (i = 92; i >= 0; i = i - 1) begin
            assign ref_i = i;
            #5;
        end
    end
endmodule
