`timescale 1ns / 1ps

module register_load
    #(parameter n = 8)
    (
    input clk,
    input reset,
    input en,                   // Enable the whole register, as in enabling the 
    input [n - 1:0] I,
    output [n - 1:0] Q
    );
    
    reg [n - 1:0] Q_reg, Q_next;
    // State Registers
    always @(posedge clk) begin
        if (reset) begin
        Q_reg <= 'b0;
        end
        else if (en) begin
            Q_reg <= Q_next;
        end
        else begin
            Q_reg <= Q_reg;
        end
    end
    
    // Next State Logic
    always @(I) begin
          Q_next = I;
      end
    assign Q = Q_reg;
endmodule

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

// Main Encoder
module pwm_enc
    #(parameter n = 4)
    (
    input [n - 1:0] ref_i,
    input clk_i,
    input reset_i,
    output pwm_o,
//    output [n - 1:0] carrier,       // Only for debugging
//    output test,                    // Only for debugging
    output spike
    );
    
    wire [n - 1:0] car_q;            // For the carrier bits (counter)
    reg pre_pwm;                     // For the shift register
    reg pwm;
    reg [n - 1:0] sam_in;
    wire frame_en;
    
    // Input sample and hold
    register_load #(.n(n)) register (
        .clk(clk_i),
        .reset(reset_i),
        .en(frame_en),
        .I(ref_i),
        .Q(sam_in)
    );
    
    counter #(.n(n)) carrier_gen (
        .clk(clk_i),
        .reset(reset_i),
        .Q(car_q)
    );
    
    // Pwm generation
    always @(posedge clk_i)
    begin
        if(reset_i) begin
            pwm <= 1'b0;
            pre_pwm <= 1'b0;
            sam_in <= 'b0;
        end
        else if (car_q > sam_in) begin
           pwm <= 1'b1;
           pre_pwm <= pwm;
        end
        else begin
            pwm <= 1'b0;
            pre_pwm <= pwm;
        end
//        frame_en = 
    end

    // Spike when rising edge 
    assign spike = pwm & ~pre_pwm;
    
    // Output
    assign pwm_o = pwm;
    // Signals for debugging
//    assign test = pre_pwm & pwm;
//    assign carrier = car_q;
endmodule
