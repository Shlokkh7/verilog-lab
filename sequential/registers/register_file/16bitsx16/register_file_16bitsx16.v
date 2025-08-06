`timescale 1ns / 1ps

module register_file_16bitsx16(
    input clk,
    input reset_n,
    input [3:0] read_add1, read_add2,           // Read Address
    input [3:0] write_add,                      // Write Address
    input write_en,                             // Write enable
    input [15:0] write_data,                    // Write data
    output reg [15:0] read_out1, read_out2      // Read out data
    );
    
    // Registers
    reg [15:0] Q_next [0:15];                   // Unpacked Array 
    reg [15:0] Q_reg [0:15];
    
    integer i;
    always @(posedge clk, negedge reset_n) begin
        if (~reset_n) begin
            for (i = 0; i < 16; i = i + 1) begin
              Q_reg[i] <= 16'h0;
            end
         end
        else begin
            for (i = 0; i < 16; i = i + 1) begin
                Q_reg[i] <= Q_next[i];
            end
        end
    end
    
    // Read block
    always @(posedge clk) begin
        if (write_en && (read_add1 == write_add)) begin
            read_out1 <= write_data;
        end
        else begin
            read_out1 <= Q_reg[read_add1];
        end
        if (write_en && (read_add2 == write_add)) begin
            read_out2 <= write_data;
        end
        else begin
            read_out2 <= Q_reg[read_add2];
        end
        
    end
    
    // Write Block
    always @(*) begin
        for (i = 0; i < 16; i = i + 1) begin
            Q_next[i] = Q_reg[i];
        end
        if (write_en)
            Q_next[write_add] = write_data;
    end
endmodule
