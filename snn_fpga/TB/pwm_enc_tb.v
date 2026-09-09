`timescale 1ns / 1ps

module pwm_enc_tb();

    // ==========================================
    // 1. Parameter & Signal Declarations
    // ==========================================
    parameter N = 4;
    localparam CLK_PERIOD = 5; 
    localparam PWM_PERIOD = CLK_PERIOD * (2**N); // 2560 ns

    reg [N - 1:0] ref_i;
    reg clk_i;
    reg reset_i;
    
    wire pwm_o;
//    wire [N - 1:0] carrier;             // For Debugging
//    wire test;                          // For Debugging
    wire spike;

    // ==========================================
    // 2. DUT Instantiation
    // ==========================================
    pwm_enc #(.n(N)) uut (
        .ref_i(ref_i),
        .clk_i(clk_i),
        .reset_i(reset_i),
        .pwm_o(pwm_o),
//        .carrier(carrier),              
//        .test(test),
        .spike(spike)
    );

    // ==========================================
    // 3. Clock Generation
    // ==========================================
    initial clk_i = 0;
    always #(CLK_PERIOD / 2) clk_i = ~clk_i; 

    // ==========================================
    // 4. Sine Wave Generation Variables
    // ==========================================
    real pi = 3.1415926535;
    real phase = 0.0;
    real sine_val;

    // ==========================================
    // 5. Continuous Signal Update (The Magic)
    // ==========================================
    // Update the input value a few times per PWM period to create a smooth wave
    always #(PWM_PERIOD / 16) begin
        if (!reset_i) begin
            // Increment phase (64 steps per full sine wave)
            phase = phase + (2.0 * pi / 64.0); 
            if (phase >= 2.0 * pi) begin
                phase = phase - (2.0 * pi);
            end
            
            // $sin() returns -1.0 to +1.0
            // Shift to 0.0 to 2.0, divide by 2 for 0.0 to 1.0, scale to 0 to 255
            sine_val = (($sin(phase) + 1.0) / 2.0) * 255.0;
            
            // Convert real to integer and assign to our 8-bit input
            ref_i = $rtoi(sine_val);
        end
    end

    // ==========================================
    // 6. Simulation Control
    // ==========================================
    initial begin
        // Setup waveform dumping 
//        $dumpfile("pwm_enc_sine.vcd");
//        $dumpvars(0, pwm_enc_tb_sine);

        // Initialize
        reset_i = 1'b1;
        ref_i = 8'd0;
        
        #(CLK_PERIOD * 10);
        
        // Release reset on negedge
        @(negedge clk_i);
        reset_i = 1'b0;

        // Run the simulation long enough to see about 3 full sine waves
        // 1 full sine wave takes 64 updates * (PWM_PERIOD / 16) = 4 * PWM_PERIOD
        #(PWM_PERIOD * 12); 
        
        $finish; 
    end

endmodule