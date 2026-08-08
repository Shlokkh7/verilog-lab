`timescale 1ns / 1ps

module T_FF_async(
    input clk,
    // input preset_n,
    input reset,            // Asynchronous (Active high)
    input T,
    output Q
    );
    
    reg Q_reg;
    wire Q_next;
    // State Registers
    always @(posedge clk, posedge reset/*, negedge preset_n*/) begin
        if (reset)
            Q_reg <= 1'b0;
//        else if (!preset_n)
//            Q_reg <= 1'b1;
        else
            Q_reg <= Q_next;
    end
    
    // Next State
    assign Q_next = T ? ~Q_reg: Q_reg;
//    mux_generic_1bit #(.INS(2)) MUX0 (
//        .w({~Q_reg, Q_reg}),
//        .s(T),
//        .f(Q_next)
//    );
    // Output Logic
    assign Q = Q_reg;
endmodule
