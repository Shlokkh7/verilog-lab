`timescale 1ns / 1ps

//=======================================================
//1:      for t=1 to end
//2:          if c(t) > r(t)
//3:              pwm(t) = 1
//4:          else
//5:              pwm(t) = 0
//6:      end
//7:      for t=1 to end
//8:          if ((pwm(t) == 1) && (pwm(t-1) == 0
//9:              spikes(t) = 1;
//10:         else
//11:             spikes(t)=0;
//12:     end
//=======================================================

module pwm_enc(
    input [7:0] ref_i,
    input clk_i,
    input reset_i,
    output pwm_o
    );
    
    reg [7:0] car_q;
    
    BCD_counter_1digit (
        .clk(clk_i),
        .clear_n(~reset_i),
        .Q(car_q)
    );
    
    
endmodule
