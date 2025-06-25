`timescale 1ns / 1ps

module compare_storage_elements(
    input clk,
    input D,
    output Ql, Qp, Qn
    );
    
    D_latch L0 (
        .D(D),
        .clk(clk),
        .Q(Ql),
        .Q_b()
    );
    
    D_FF_pos FF0 (
        .D(D),
        .clk(clk),
        .Q(Qp)    
    );
    
    D_FF_neg FF1 (
        .D(D),
        .clk(clk),
        .Q(Qn)
    );
    
endmodule
