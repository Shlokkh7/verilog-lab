`timescale 1ns / 1ps

module mux_16x1_tasks(
    input [15:0] i_a,
    input [3:0] i_s,
    output reg o_f
    );
    
    reg temp_f;
    
    task mux_16x1;
        input [15:0] in;
        input [3:0] s;
        output f;
        integer k;
        begin
            for(k = 0; k < 16; k = k + 1) begin
                if (k == s) begin
                   f = in[k];
                end
            end
        end
    endtask
    
    always @(*) begin
    mux_16x1(i_a, i_s, temp_f);
    o_f = temp_f;
    end
    
endmodule
