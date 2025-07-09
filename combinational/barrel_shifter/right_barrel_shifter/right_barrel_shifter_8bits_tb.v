`timescale 1ns / 1ps

module right_barrel_shifter_8bits_tb();

    reg [7:0] D;
    reg [2:0] s;
    wire [7:0] Q;
    
    right_barrel_shifter_8bits uut (
        .D(D),
        .s(s),
        .Q(Q)
    );
    
    initial begin
        // Initializing
        D = 8'b00001111;
        s = 3'b000;
        
        
       #10 s = 3'b001;             // 1bit shift
       #10 s = 3'b010;             // 2bit shift
       #10 s = 3'b011;             // 3bit shift
       #10 s = 3'b100;             // 4bit shift
       #10 s = 3'b101;             // 5bit shift
       #10 s = 3'b110;             // 6bit shift
       #10 s = 3'b111;             // 7bit shift
       
       // New walue of D = 8'b11001100
        D = 8'b11001100;
        
        s = 3'b000;                 // Hold
        #10 s = 3'b101;              // 5bit shift
        
        // End simulation
        #10 $finish;
    end
endmodule
