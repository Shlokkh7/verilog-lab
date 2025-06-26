`timescale 1ns / 1ps

module simple_registers
  #(parameter n = 8)            // Parameterized for custom use
    (
    input clk,
    input [n - 1:0] I,
    output [n - 1:0] Q
    );
    
   /* genvar k;
    generate
        for(k = 0; k < n; k = k + 1) begin: FF
            D_FF_asyn_reset (
                .D(I[k]),
                .clk(clk),
                .Q(Q[k]),
                .reset_n()
            );
        end
    endgenerate*/
    
    reg [n - 1:0] Q_reg, Q_next;
    
    always @(posedge clk) begin
        Q_reg <= Q_next;
    end
    
    always @(I) begin
        Q_next = I;
    end
    
    assign Q = Q_reg;
endmodule
