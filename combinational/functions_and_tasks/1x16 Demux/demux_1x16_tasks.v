`timescale 1ns / 1ps

module demux_1x16_tasks(
    input i_f,
    input [3:0] i_s,
    output reg [15:0] o_y
    );
    
    reg [15:0] temp_y;
        
    task demux_1x16;
        input f;
        input [3:0] s;
        output [15:0] y;
        integer k;
        begin
            y = 16'b1111111111111111;                          // Default value
            for(k = 0; k < 16; k = k + 1) begin
                if (k == s)
                    y[k] = f;
            end
        end
    endtask
    always @(*) begin
        demux_1x16(i_f, i_s, temp_y);
        o_y = temp_y;
    end
endmodule
