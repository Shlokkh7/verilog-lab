`timescale 1ns / 1ps

module right_barrel_shifter_8bits(
    input [7:0] D,
    input [2:0] s,
    output [7:0] Q
    );
    
    wire [7:0] fa, fb, fc;          // Internal  
    // s0 column of muxes
    mux_2x1 MUX_COL_1_7 (
                .w0(D[7]),
                .w1(D[0]),
                .s(s[0]),
                .f(fa[7])
            );
    genvar k;
    generate
        for(k = 0; k < 7; k = k + 1) begin: MUX_COL_1
            mux_2x1 mux_inst (
                .w0(D[k]),
                .w1(D[k + 1]),
                .s(s[0]),
                .f(fa[k])
            );
        end
    endgenerate

    // s1 column of muxes
    mux_2x1 MUX_COL_2_7 (
                .w0(fa[7]),
                .w1(fa[1]),
                .s(s[1]),
                .f(fb[7])
            );
    mux_2x1 MUX_COL_2_6 (
                .w0(fa[6]),
                .w1(fa[0]),
                .s(s[1]),
                .f(fb[6])
            );
    genvar j;
    generate
        for(j = 0; j < 6; j = j + 1) begin: MUX_COL_2
            mux_2x1 mux_inst (
                .w0(fa[j]),
                .w1(fa[j + 2]),
                .s(s[1]),
                .f(fb[j])
            );
        end
    endgenerate
    
    // s2 column of muxes
    genvar l;
    generate
        for(l = 0; l < 4; l = l + 1) begin: MUX_COL_3_low
            mux_2x1 mux_inst (
                .w0(fb[l]),
                .w1(fb[l + 4]),
                .s(s[2]),
                .f(fc[l])
            );
        end
        for(l = 7; l > 3; l = l - 1) begin: MUX_COL_3_up
            mux_2x1 mux_inst (
                .w0(fb[l]),
                .w1(fb[l - 4]),
                .s(s[2]),
                .f(fc[l])
            );
        end
    endgenerate
    
    // Final output
    assign Q = fc;
endmodule
