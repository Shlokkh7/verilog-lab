`timescale 1ns / 1ps

module mux_2x1 (
    input w0, w1,
    input s,
    output f
    );
  
    assign f = s?w1:w0;           // dataflow modelling

endmodule
