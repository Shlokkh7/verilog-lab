`timescale 1ns / 1ps

module half_adder_df(
    input x_i, y_i,
    output s_o, c_o
    );
    
    assign s_o = x_i ^ y_i;
    assign c_o = x_i & y_i;
    
endmodule
