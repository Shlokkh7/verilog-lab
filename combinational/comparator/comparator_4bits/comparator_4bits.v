`timescale 1ns / 1ps
    /*
        a > b: y = 100
        a = b: y = 010
        a < b: y = 001
    */    
module comparator_4bits(
    input [3:0] a, b,
    output [2:0] y
    );
    /*
      For the euality of a and b
      x[3] => a[3] = b[3]
      x[2] => a[2] = b[2]
      x[1] => a[1] = b[1]
      x[0] => a[0] = b[0]
    */
    wire [3:0] x;        
    genvar k;
    generate
        for(k = 0; k < 4; k = k + 1) begin: EQUALITY_BLOCK
            assign x[k] = ~(a[k] ^ b[k]);
        end
    endgenerate
    // a > b 
    assign y[2] = (a[3] & ~b[3]) | (x[3] & a[2] & ~b[2]) | (x[3] & x[2] & a[1] & ~b[1]) | (x[3] & x[2] & x[1] & a[0] & ~b[0]);
    
    // a = b
    assign y[1] = x[3] & x[2] & x[1] & x[0];
    
    // a < b
    assign y[0] = (~a[3] & b[3]) | (x[3] & ~a[2] & b[2]) | (x[3] & x[2] & ~a[1] & b[1]) | (x[3] & x[2] & x[1] & ~a[0] & b[0]);
    
endmodule
