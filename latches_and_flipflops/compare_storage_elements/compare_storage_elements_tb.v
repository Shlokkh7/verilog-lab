`timescale 1ns / 1ps

module compare_storage_elements_tb();

    reg clk;
    reg D;
    wire Ql, Qp, Qn;
    
    compare_storage_elements uut (
        .clk(clk),
        .D(D),
        .Ql(Ql),
        .Qp(Qp),
        .Qn(Qn)
    );
    
    localparam T = 20;          // Clock period
    always begin
        clk = 1'b0;
        #(T / 2);
        clk = 1'b1;
        #(T / 2);
    end
    
    initial begin
        D = 1'b1;
        
        #(2 * T)
        D = 1'b0;
        
        @(posedge clk);            // Wait for the next positive edge, no matter how far it is
        D = 1'b1;
        
        #2 D = 1'b0;
        #3 D = 1'b1;
        #4 D = 1'b0;
        
        repeat(2) @(negedge clk);   // Do a couple of negative edge then do the following
        D = 1'b1;
        
        #20 $stop; 
        
        
    end
endmodule
