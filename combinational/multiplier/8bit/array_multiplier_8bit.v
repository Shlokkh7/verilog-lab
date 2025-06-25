`timescale 1ns / 1ps

module array_multiplier_8bit(
    input [7:0] a, b,
    output [15:0] z
    );
    
    wire [55:0] s, c;
    
    // Half adder block
    half_adder_beh HA0 (.x(a[1] & b[0]), .y(a[0] & b[1]), .s(s[0]), .c(c[0]));
    half_adder_beh HA1 (.x(a[2] & b[0]), .y(a[1] & b[1]), .s(s[1]), .c(c[1]));
    half_adder_beh HA2 (.x(a[3] & b[0]), .y(a[2] & b[1]), .s(s[2]), .c(c[2]));
    half_adder_beh HA3 (.x(a[4] & b[0]), .y(a[3] & b[1]), .s(s[3]), .c(c[3]));
    half_adder_beh HA4 (.x(a[5] & b[0]), .y(a[4] & b[1]), .s(s[4]), .c(c[4]));
    half_adder_beh HA5 (.x(a[6] & b[0]), .y(a[5] & b[1]), .s(s[5]), .c(c[5]));
    half_adder_beh HA6 (.x(a[7] & b[0]), .y(a[6] & b[1]), .s(s[6]), .c(c[6]));
    half_adder_beh HA7 (.x(s[43]), .y(c[42]), .s(s[49]), .c(c[49]));
    
    // Full Adder block
    fa_structural FA0 (.x(s[1]), .y(a[0] & b[2]), .cin(c[0]), .s(s[7]), .cout(c[7]));
    fa_structural FA1 (.x(s[2]), .y(a[1] & b[2]), .cin(c[1]), .s(s[8]), .cout(c[8]));
    fa_structural FA2 (.x(s[3]), .y(a[2] & b[2]), .cin(c[2]), .s(s[9]), .cout(c[9]));
    fa_structural FA3 (.x(s[4]), .y(a[3] & b[2]), .cin(c[3]), .s(s[10]), .cout(c[10]));
    fa_structural FA4 (.x(s[5]), .y(a[4] & b[2]), .cin(c[4]), .s(s[11]), .cout(c[11]));
    fa_structural FA5 (.x(s[6]), .y(a[5] & b[2]), .cin(c[5]), .s(s[12]), .cout(c[12]));
    fa_structural FA6 (.x(a[7] & b[1]), .y(a[6] & b[2]), .cin(c[6]), .s(s[13]), .cout(c[13]));
    fa_structural FA7 (.x(s[8]), .y(a[0] & b[3]), .cin(c[7]), .s(s[14]), .cout(c[14]));
    fa_structural FA8 (.x(s[9]), .y(a[1] & b[3]), .cin(c[8]), .s(s[15]), .cout(c[15]));
    fa_structural FA9 (.x(s[10]), .y(a[2] & b[3]), .cin(c[9]), .s(s[16]), .cout(c[16]));
    fa_structural FA10 (.x(s[11]), .y(a[3] & b[3]), .cin(c[10]), .s(s[17]), .cout(c[17]));
    fa_structural FA11 (.x(s[12]), .y(a[4] & b[3]), .cin(c[11]), .s(s[18]), .cout(c[18]));
    fa_structural FA12 (.x(s[13]), .y(a[5] & b[3]), .cin(c[12]), .s(s[19]), .cout(c[19]));
    fa_structural FA13 (.x(a[7] & b[2]), .y(a[6] & b[3]), .cin(c[13]), .s(s[20]), .cout(c[20]));
    fa_structural FA14 (.x(s[15]), .y(a[0] & b[4]), .cin(c[14]), .s(s[21]), .cout(c[21]));
    fa_structural FA15 (.x(s[16]), .y(a[1] & b[4]), .cin(c[15]), .s(s[22]), .cout(c[22]));
    fa_structural FA16 (.x(s[17]), .y(a[2] & b[4]), .cin(c[16]), .s(s[23]), .cout(c[23]));
    fa_structural FA17 (.x(s[18]), .y(a[3] & b[4]), .cin(c[17]), .s(s[24]), .cout(c[24]));
    fa_structural FA18 (.x(s[19]), .y(a[4] & b[4]), .cin(c[18]), .s(s[25]), .cout(c[25]));
    fa_structural FA19 (.x(s[20]), .y(a[5] & b[4]), .cin(c[19]), .s(s[26]), .cout(c[26]));
    fa_structural FA20 (.x(a[7] & b[3]), .y(a[6] & b[4]), .cin(c[20]), .s(s[27]), .cout(c[27]));
    fa_structural FA21 (.x(s[22]), .y(a[0] & b[5]), .cin(c[21]), .s(s[28]), .cout(c[28]));
    fa_structural FA22 (.x(s[23]), .y(a[1] & b[5]), .cin(c[22]), .s(s[29]), .cout(c[29]));
    fa_structural FA23 (.x(s[24]), .y(a[2] & b[5]), .cin(c[23]), .s(s[30]), .cout(c[30]));
    fa_structural FA24 (.x(s[25]), .y(a[3] & b[5]), .cin(c[24]), .s(s[31]), .cout(c[31]));
    fa_structural FA25 (.x(s[26]), .y(a[4] & b[5]), .cin(c[25]), .s(s[32]), .cout(c[32]));
    fa_structural FA26 (.x(s[27]), .y(a[5] & b[5]), .cin(c[26]), .s(s[33]), .cout(c[33]));
    fa_structural FA27 (.x(a[7] & b[4]), .y(a[6] & b[5]), .cin(c[27]), .s(s[34]), .cout(c[34]));
    fa_structural FA28 (.x(s[29]), .y(a[0] & b[6]), .cin(c[28]), .s(s[35]), .cout(c[35]));
    fa_structural FA29 (.x(s[30]), .y(a[1] & b[6]), .cin(c[29]), .s(s[36]), .cout(c[36]));
    fa_structural FA30 (.x(s[31]), .y(a[2] & b[6]), .cin(c[30]), .s(s[37]), .cout(c[37]));
    fa_structural FA31 (.x(s[32]), .y(a[3] & b[6]), .cin(c[31]), .s(s[38]), .cout(c[38]));
    fa_structural FA32 (.x(s[33]), .y(a[4] & b[6]), .cin(c[32]), .s(s[39]), .cout(c[39]));
    fa_structural FA33 (.x(s[34]), .y(a[5] & b[6]), .cin(c[33]), .s(s[40]), .cout(c[40]));
    fa_structural FA34 (.x(a[7] & b[5]), .y(a[6] & b[6]), .cin(c[34]), .s(s[41]), .cout(c[41]));
    fa_structural FA35 (.x(s[36]), .y(a[0] & b[7]), .cin(c[35]), .s(s[42]), .cout(c[42]));
    fa_structural FA36 (.x(s[37]), .y(a[1] & b[7]), .cin(c[36]), .s(s[43]), .cout(c[43]));
    fa_structural FA37 (.x(s[38]), .y(a[2] & b[7]), .cin(c[37]), .s(s[44]), .cout(c[44]));
    fa_structural FA38 (.x(s[39]), .y(a[3] & b[7]), .cin(c[38]), .s(s[45]), .cout(c[45]));
    fa_structural FA39 (.x(s[40]), .y(a[4] & b[7]), .cin(c[39]), .s(s[46]), .cout(c[46]));
    fa_structural FA40 (.x(s[41]), .y(a[5] & b[7]), .cin(c[40]), .s(s[47]), .cout(c[47]));
    fa_structural FA41 (.x(a[7] & b[6]), .y(a[6] & b[7]), .cin(c[41]), .s(s[48]), .cout(c[48]));
    fa_structural FA42 (.x(s[44]), .y(c[49]), .cin(c[43]), .s(s[50]), .cout(c[50]));
    fa_structural FA43 (.x(s[45]), .y(c[50]), .cin(c[44]), .s(s[51]), .cout(c[51]));
    fa_structural FA44 (.x(s[46]), .y(c[51]), .cin(c[45]), .s(s[52]), .cout(c[52]));
    fa_structural FA45 (.x(s[47]), .y(c[52]), .cin(c[46]), .s(s[53]), .cout(c[53]));
    fa_structural FA46 (.x(s[48]), .y(c[53]), .cin(c[47]), .s(s[54]), .cout(c[54]));
    fa_structural FA47 (.x(a[7] & b[7]), .y(c[54]), .cin(c[48]), .s(s[55]), .cout(c[55]));
    
    assign z[0] = a[0] & b[0];
    assign z[1] = s[0];
    assign z[2] = s[7];
    assign z[3] = s[14];
    assign z[4] = s[21];
    assign z[5] = s[28];
    assign z[6] = s[35];
    assign z[7] = s[42];
    assign z[8] = s[49];
    assign z[9] = s[50];
    assign z[10] = s[51];
    assign z[11] = s[52];
    assign z[12] = s[53];
    assign z[13] = s[54];
    assign z[14] = s[55];
    assign z[15] = c[55];
endmodule
