`timescale 1ns / 1ps

module register_file_16bitsx16_tb();

    reg clk;
    reg reset_n;
    reg [3:0] read_add1, read_add2;           // Read Address
    reg [3:0] write_add;                      // Write Address
    reg write_en;                             // Write enable
    reg [15:0] write_data;                    // Write data
    wire [15:0] read_out1, read_out2;           // Read out 
    
    register_file_16bitsx16 uut (
        .clk(clk),
        .reset_n(reset_n),
        .read_add1(read_add1),
        .read_add2(read_add2),
        .write_add(write_add),                   
        .write_en(write_en),
        .write_data(write_data),
        .read_out1(read_out1),
        .read_out2(read_out2)
    );
    
    // Clock
    localparam T = 10;         // Clock Period
    always begin
        clk = 1'b0;
        #(T / 2);
        clk = 1'b1;
        #(T / 2);
    end
    
    initial begin
        $display("--------------------------------------------------");
        $display("                Testbench Started                 ");
        $display("--------------------------------------------------");
        
        // --- Reset Phase ---
        write_en = 1'b0;
        reset_n  = 1'b0; // Apply reset
        @(posedge clk);
        reset_n = 1'b1;
        @(posedge clk);
        
        // --- Write to registers ---
        $display("Writing to R1, R9 and R12");
        write_en = 1'b1;
        write_add = 4'h1;
        write_data = 16'hAAAA;
        @(posedge clk)
        
        write_add = 4'h9;
        write_data = 16'hAB15;
        @(posedge clk)
        
        write_add = 4'hC;
        write_data = 16'hABCD;
        @(posedge clk)
        write_en = 1'b0;
        
        // --- Read back written values ---
        $display("Read R1 and R9");
        read_add1 = 4'h1;
        read_add2 = 4'h9;
        @(posedge clk);
        
        // --- Read unwritten data ---
        $display("Read R3 and R10");
        read_add1 = 4'h3;
        read_add2 = 4'hA;
        @(posedge clk);
        
        // --- Read during Write simultaneously
        $display("Writing to R4 while reading R4");
        write_en = 1'b1;
        write_add = 4'h4;
        write_data = 16'hAACD;
        read_add1 = 4'h4;
        read_add2 = 4'hF;
        @(posedge clk);
        
        // --- End of Test ---
        @(posedge clk);
        $display("\n--------------------------------------------------");
        $display("                 Test Finished                  ");
        $display("--------------------------------------------------");
        $finish;
    end
    
endmodule
