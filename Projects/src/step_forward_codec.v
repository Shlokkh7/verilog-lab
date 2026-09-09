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

module pwm_spike_encoder #(
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


// ============================================================
// SPIKE-PHASE DECODER
//
// The spike occurs at:
//
//     carrier = sampled_input + 1
//
// Therefore:
//
//     reconstructed = spike_phase - 1
//
// This is the hardware reconstruction equivalent. General
// curve fitting would normally be performed in software after
// collecting reconstructed samples.
// ============================================================

module pwm_spike_decoder #(
    parameter integer WIDTH = 8
)(
    input  wire                 clk,
    input  wire                 rst_n,
    input  wire                 frame_start,
    input  wire                 spike_in,

    output reg  [WIDTH-1:0]     reconstructed,
    output reg                  recon_valid,
    output reg  [WIDTH-1:0]     phase_counter
);

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            reconstructed <= {WIDTH{1'b0}};
            recon_valid    <= 1'b0;
            phase_counter  <= {WIDTH{1'b0}};
        end
        else begin
            recon_valid <= 1'b0;

            if (frame_start)
                phase_counter <= {WIDTH{1'b0}};
            else
                phase_counter <= phase_counter + 1'b1;

            if (spike_in) begin
                reconstructed <= phase_counter - 1'b1;
                recon_valid    <= 1'b1;
            end
        end
    end

endmodule


// ============================================================
// COMPLETE ENCODER-DECODER WRAPPER
// ============================================================

module pwm_spike_codec #(
    parameter integer WIDTH = 8
)(
    input  wire                 clk,
    input  wire                 rst_n,
    input  wire [WIDTH-1:0]     signal_in,

    output wire [WIDTH-1:0]     sampled_input,
    output wire [WIDTH-1:0]     carrier,
    output wire                 pwm,
    output wire                 spike,
    output wire                 frame_start,

    output wire [WIDTH-1:0]     reconstructed,
    output wire                 recon_valid,
    output wire [WIDTH-1:0]     decoder_phase
);

    pwm_spike_encoder #(
        .WIDTH(WIDTH)
    ) encoder (
        .clk           (clk),
        .rst_n         (rst_n),
        .signal_in     (signal_in),
        .carrier       (carrier),
        .sampled_input (sampled_input),
        .pwm           (pwm),
        .spike         (spike),
        .frame_start   (frame_start)
    );

    pwm_spike_decoder #(
        .WIDTH(WIDTH)
    ) decoder (
        .clk           (clk),
        .rst_n         (rst_n),
        .frame_start   (frame_start),
        .spike_in      (spike),
        .reconstructed (reconstructed),
        .recon_valid   (recon_valid),
        .phase_counter (decoder_phase)
    );

endmodule