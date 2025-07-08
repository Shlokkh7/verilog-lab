`timescale 1ns / 1ps

/*
In the code you can use the assigment operation with ? : ternary operator
or use the mux_2x1 module
*/
module left_barrel_shifter_16bits(
    input [15:0] D,
    input [3:0] s,
    output [15:0] Q
    );
    
    wire [15:0] fa, fb, fc, fd;             // Internal wires
    // s0 coulum of muxes
   /* mux_2x1 MUX_COL_1_0 (
        .w0(D[0]),
        .w1(D[15]),
        .s(s[0]),
        .f(fa[0])
    );*/
    assign fa[0] = s[0]? D[15]: D[0];
    genvar k;
    generate
        for(k = 1; k < 16; k = k + 1) begin: MUX_COL_1
            /*mux_2x1 mux_inst (
                .w0(D[k]),
                .w1(D[k - 1]),
                .s(s[0]),
                .f(fa[k])
             );*/
             assign fa[k] = s[0]? D[k - 1]: D[k];
        end
    endgenerate
    
    // s1 column of muxes
    /*mux_2x1 MUX_COL_2_0 (
        .w0(fa[0]),
        .w1(fa[14]),
        .s(s[1]),
        .f(fb[0])
    );*/
    assign fb[0] = s[1]? fa[14]: fa[0];
    /*mux_2x1 MUX_COL_2_1 (
        .w0(fa[1]),
        .w1(fa[15]),
        .s(s[1]),
        .f(fb[1])
    );*/
    assign fb[1] = s[1]? fa[15]: fa[1];
    genvar j;
    generate
        for(j = 2; j < 16; j = j + 1) begin: MUX_COL_2
            /*mux_2x1 mux_inst (
                .w0(fa[j]),
                .w1(fa[j - 2]),
                .s(s[1]),
                .f(fb[j])
             );*/
            assign fb[j] = s[1]? fa[j - 2]: fa[j];
        end
    endgenerate
    
    // s2 column of muxes
    genvar l;
    generate
        for(l = 0; l < 4; l = l + 1) begin: MUX_COL_3_low
            /*mux_2x1 mux_inst (
                .w0(fb[l]),
                .w1(fb[12 - l]),
                .s(s[2]),
                .f(fc[l])
             );*/
             assign fc[l] = s[2]? fb[12 + l]: fb[l];
        end
        for(l = 15; l > 3; l = l - 1) begin: MUX_COL_3_up
            /*mux_2x1 mux_inst (
                .w0(fb[l]),
                .w1(fb[l - 4]),
                .s(s[2]),
                .f(fc[l])
             );*/
            assign fc[l] = s[2]? fb[l - 4]: fb[l];
        end
    endgenerate
    
    // s3 column of muxes
    genvar m;
    generate
        for(m = 0; m < 8; m = m + 1) begin: MUX_COL_4_low
            /*mux_2x1 mux_inst (
                .w0(fc[m]),
                .w1(fc[m + 8]),
                .s(s[3]),
                .f(fd[m])
             );*/
            assign fd[m] = s[3]? fc[m + 8]: fc[m];
        end
        for(m = 15; m > 7; m = m - 1) begin: MUX_COL_4_up
            /*mux_2x1 mux_inst (
                .w0(fc[m]),
                .w1(fc[m - 8]),
                .s(s[3]),
                .f(fd[m])
             );*/
             assign fd[m] = s[3]? fc[m - 8]: fc[m];
        end
    endgenerate
    
    // Final Output
    assign Q = fd;
endmodule
