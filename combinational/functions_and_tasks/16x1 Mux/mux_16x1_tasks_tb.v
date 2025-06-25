`timescale 1ns / 1ps

module mux_16x1_tasks_tb();

    reg [15:0] i_a;
    reg [3:0] i_s;
    wire o_f;
    
    mux_16x1_tasks uut (
        .i_a(i_a),
        .i_s(i_s),
        .o_f(o_f)
    );
    
    initial begin
        #64 $finish;
    end
    
    initial begin
        i_a = 16'd33000;       // 1000 0000 1110 1000
        
        i_s = 4'b0000;
     #3 i_s = 4'b0001;
     #3 i_s = 4'b0010;
     #3 i_s = 4'b0011;
     #3 i_s = 4'b0101;
     #3 i_s = 4'b0110;
     #3 i_s = 4'b0111;
     #3 i_s = 4'b1000;
     #3 i_s = 4'b1001;
     #3 i_s = 4'b1010;
     #3 i_s = 4'b1011;
     #3 i_s = 4'b1111;
     #3 i_s = 4'b1110;
     
        i_a = 16'd1500;         // 0000 0101 1101 1100
     #7 i_a = 16'd28;           // 0000 0000 0001 1100
     #7 i_a = 16'd16750;        // 0100 0001 0110 1110 
     #7 i_a = 16'd23456;        // 0101 1011 1010 0000 
    end
endmodule
