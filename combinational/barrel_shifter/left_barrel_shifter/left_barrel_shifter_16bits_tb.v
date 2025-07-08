`timescale 1ns / 1ps

module left_barrel_shifter_16bits_tb();

    reg [15:0] D;
    reg [3:0] s;
    wire [15:0] Q;
    
    left_barrel_shifter_16bits uut (
        .D(D),
        .s(s),
        .Q(Q)
    );
    
    integer i;
    initial begin
        // Initializing
        D = 16'b0000111100011100;
        s = 4'b0000;
        #10
        $display("D = %b", D);
        
        for(i = 0; i < 16; i = i + 1) begin
            s = i;
            #4;
            $display("Q = %b, s = %d, time = %0dns", Q, s, $time);
            #1;
        end
       // New walue of 16'b1100110011001100
        D = 16'b1100110011001100;
        
        s = 4'b0000;                 // Hold
        #10 s = 4'b0101;            // 5bit shift
        #4 $display("D = %b\nQ = %b, s = %d", D, Q, s);
        // End simulation
        #10 $finish;
    end
endmodule
