`timescale 1ns / 1ps

module array_multiplier_8bit_tb();

    reg [7:0] a, b;
    wire [15:0] z;
    reg [15:0] exp;
    integer j, k;
    
    array_multiplier_8bit uut (
        .a(a),
        .b(b),
        .z(z)
    );
    
    always @(*) begin
        exp = a * b;
    end
    
    initial begin
        #327680 $finish;
    end
    
    initial begin
        for(j = 0; j < 256; j = j + 1)
        begin
            for(k = 0; k < 256; k = k + 1)
            begin
                a = j;
                b = k;
                #1;
                if(z !== exp) begin
                    //$error("Mismatch a = %b, b = %b => z = %b (Expected z = %exp)");
                    $display("a = %b(%d), b = %b(%d), z = %b(%d), expected = %b(%d)", a, a, b, b, z, z, exp, exp);
                end
                #4;
            end
        end
    end
endmodule
