`timescale 1ns/1ps

// ============================================================
// PWM-BASED SPIKE ENCODER
//
// Paper algorithm:
//
// if carrier(t) > input(t)
//     pwm(t) = 1
// else
//     pwm(t) = 0
//
// spike(t) = pwm(t) AND NOT pwm(t-1)
//
// Since the comparison is strictly ">", an input value N
// produces a spike when the carrier reaches N+1.
// ============================================================

module roshan_enc #(
    parameter integer WIDTH = 8
)(
    input  wire                 clk,
    input  wire                 rst_n,
    input  wire [WIDTH-1:0]     signal_in,

    output wire [WIDTH-1:0]     carrier,
    output reg  [WIDTH-1:0]     sampled_input,
    output wire                 pwm,
    output wire                 spike,
    output wire                 frame_start
);

    localparam [WIDTH-1:0] MAX_CODE = {WIDTH{1'b1}};

    reg [WIDTH-1:0] carrier_reg;
    reg             previous_pwm;
    reg             sample_active;

    assign carrier = carrier_reg;

    // High during the last carrier count.
    assign frame_start = (carrier_reg == MAX_CODE);

    // Exact comparison from the supplied algorithm.
    assign pwm =
        sample_active &&
        (carrier_reg > sampled_input);

    // Rising-edge detection from the supplied algorithm.
    assign spike =
        pwm &&
        !previous_pwm;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            carrier_reg   <= {WIDTH{1'b0}};
            sampled_input <= {WIDTH{1'b0}};
            previous_pwm  <= 1'b0;
            sample_active <= 1'b0;
        end
        else begin
            // Store pwm(t-1).
            previous_pwm <= pwm;

            if (frame_start) begin
                carrier_reg   <= {WIDTH{1'b0}};
                sampled_input <= signal_in;
                sample_active <= 1'b1;
            end
            else begin
                carrier_reg <= carrier_reg + 1'b1;
            end
        end
    end

endmodule