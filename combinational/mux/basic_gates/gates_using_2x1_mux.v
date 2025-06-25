`timescale 1ns / 1ps
module gates_using_2x1_mux
    #(parameter n = 2)
    (
    input x, y,                     
    output AND,                       // AND Gate
    output NAND,                      // NAND Gate
    output OR,                        // OR Gate    
    output NOR,                       // NOR Gate
    output NOT                       // NOT Gate    
    );
    

    wire ma, mo, mn;
    
    // AND Gate    
    mux_generic_1bit #(.INS(n)) M0 (
        .w({y, x}),
        .s(x),
        .f(ma)
    );
    
    mux_generic_1bit #(.INS(n)) M1 (
        .w({1'b1, 1'b0}),
        .s(ma),
        .f(AND)
    ); 
    
    // NAND Gate
    mux_generic_1bit #(.INS(n)) M2 (
        .w({1'b0, 1'b1}),
        .s(ma),
        .f(NAND)
    );
    
    // OR Gate
    mux_generic_1bit #(.INS(n)) M3 (
        .w({x, y}),
        .s(x),
        .f(mo)
    );
    
    mux_generic_1bit #(.INS(n)) M4 (
        .w({1'b1, 1'b0}),
        .s(mo),
        .f(OR)
    );
    
    // NOR Gate
    mux_generic_1bit #(.INS(n)) M5 (
        .w({1'b0, 1'b1}),
        .s(mo),
        .f(NOR)
    );
    
    // NOT Gate
    mux_generic_1bit #(.INS(n)) M6 (
        .w({1'b0, 1'b1}),
        .s(x),
        .f(NOT)
    );
endmodule
