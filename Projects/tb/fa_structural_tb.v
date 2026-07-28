`timescale 1ns / 1ps

module fa_structural_tb(

    );

    reg x;
    reg y;
    reg cin;
    wire s;
    wire cout;
    
    fa_structural uut(
        .x(x),
        .y(y),
        .cin(cin),
        .s(s),
        .cout(cout)
    );
    
    initial
    begin
        #50 $finish;
    end
    
    initial
    begin
        x = 1'b1;
        y = 1'b0;
        cin = 1'b0;
        #10
        
        x = 1'b0;
        y = 1'b1;
        cin = 1'b1;
        #10
        
        x = 1'b0;  
        y = 1'b1;  
        cin = 1'b0;
        #10        
           
        x = 1'b1;  
        y = 1'b1;  
        cin = 1'b1;
        #10
        
        x = 1'b1;  
        y = 1'b0;  
        cin = 1'b1;
         
      end
endmodule


