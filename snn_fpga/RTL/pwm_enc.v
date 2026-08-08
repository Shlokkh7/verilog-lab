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

module pwm_enc
    #(parameter n = 8)
    (
    input [n - 1:0] ref_i,
    input clk_i,
    input reset_i,
    output reg pwm_o,
    output [n - 1:0] carrier    // Only for debugging
    );
    
    wire [n - 1:0] car_q;       // For the carrier bits (counter)
    wire Q_reg;                 // For the shift register
    reg pwm, pre_pwm;
    reg Q_next;
    integer i;
    
    counter #(.n(n)) carrier_gen (
        .clk(clk_i),
        .reset(reset_i),
        .Q(car_q)
    );
    
    D_FF_asyn_reset ff_inst0(
                .D(Q_next),
                .clk(clk_i),
                .Q(Q_reg),
                .reset_n(~reset_i)
            );
    
    always @(posedge clk_i)
    begin
        if (car_q > ref_i) begin
            Q_next <= 1'b1;
        end
        else begin
            Q_next <= 1'b0;
        end
    end
//    always @(posedge clk_i)
//    begin
    
    
//    end
    
    
    // Carrier signal for debugging9
    assign carrier = car_q;
endmodule
