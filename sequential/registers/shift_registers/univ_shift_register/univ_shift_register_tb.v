`timescale 1ns / 1ps

module univ_shift_register_tb();
    
    parameter n = 4;
    reg clk;
    reg reset_n;
    reg MSB_in;
    reg LSB_in;           
    reg [n - 1:0] I;
    reg [1:0] s;
    wire [n - 1:0] Q;
    
    univ_shift_register #(.n(n)) uut (
        .clk(clk),
        .reset_n(reset_n),
        .MSB_in(MSB_in),
        .LSB_in(LSB_in),
        .I(I),
        .s(s),
        .Q(Q)
    );
    
    localparam T = 10;          // Clock Period
    always begin
        clk = 1'b0;
        #(T / 2);
        clk = 1'b1;
        #(T / 2);
    end
    
    initial begin
        $display("Time\tReset\tS\tI\tQ");
        $monitor("%0dns\t%b\t%b\t%b\t%b", $time, reset_n, s, I, Q);
        
        // Initial
        reset_n = 1'b1;
        MSB_in = 1'b0;
        LSB_in = 1'b0;
        I = 4'b0000;
        s = 2'b00;
        
        // Applying Reset after 7ns
        #7 reset_n = 1'b0;               
        #3 reset_n = 1'b1;
       
        // Parallel Load at t = 17ns
        #5 I = 4'b1011; s = 2'b11;     
        
        // Hold
        #5 s = 2'b00;
        
        // Shift right with MSB_in = 1 t = 37ns
        #10 MSB_in = 1'b1; s = 2'b01;
             
        // Shift left with LSB_in = 0 t = 47ns
        #17 LSB_in = 1'b0; s = 2'b10;
        
        // Hold
        #7 s = 2'b00;

        // Rseet again t = 62ns
        #5 reset_n = 1'b0;              
        #3 reset_n = 1'b1;      
        
        // New Load
        #5 I = 4'b1110; s = 2'b11;
        
        // Shift Left
        #10 LSB_in = 1'b1; s = 2'b10;   
        
        // Done simulation
        #10 $stop;                      
    end
endmodule
