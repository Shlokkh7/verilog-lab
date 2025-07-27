`timescale 1ns / 1ps

module comparator_4bits_tb();

    reg [3:0] a, b;
    wire [2:0] y;
    
    comparator_4bits uut (
        .a(a),
        .b(b),
        .y(y)
    );
    
    initial begin
        // Initial value
        a = 4'b0000;
        b = 4'b0000;
        
        #10 a = 4'b0001;
            b = 4'b0010;
        #10 a = 4'b1000;
            b = 4'b1001;
        #10 a = 4'b1101;
            b = 4'b1100;
        #10 a = 4'b1111;
            b = 4'b1111;
        
        
        #20 $stop;    
    end
endmodule
