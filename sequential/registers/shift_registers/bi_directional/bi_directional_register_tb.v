`timescale 1ns / 1ps

module bi_directional_register_tb;

    parameter n = 4;
    reg clk;
    reg reset_n;
    reg SI;
    reg R_L_n;
    wire SO;
    
    bi_directional_register #(.n(n)) uut (
        .clk(clk),
        .reset_n(reset_n),
        .SI(SI),
        .R_L_n(R_L_n),
        .SO(SO)
    );

    localparam T = 10;
    always begin
        clk = 1'b0;
        #(T/2);
        clk = 1'b1;
        #(T/2);
    end

    initial begin
        // Initial values
        reset_n = 1;
        SI = 0;
        R_L_n = 1; // Shift Right

        // Apply reset
        #3 reset_n = 0;
        #4 reset_n = 1;

        // Right shift (R_L_n = 1)
        R_L_n = 1;
        SI = 1; #10;  // Q should become 1000
        SI = 0; #10;  // Q should become 0100
        SI = 1; #10;  // Q should become 0010
        SI = 1; #10;  // Q should become 0001
        
        // Left shift (R_L_n = 0)
        R_L_n = 0; 
        SI = 0; #10;  // Q should become 0010
        SI = 1; #10;  // Q should become 0101
        SI = 0; #10;  // Q should become 1010
        SI = 1; #10;  // Q should become 1101

        // Finish
        #10 $stop;
    end
endmodule
