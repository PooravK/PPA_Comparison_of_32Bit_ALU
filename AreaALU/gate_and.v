module gate_and(
    input [31:0]and_in0, and_in1,
    output [31:0]and_out
    );

    assign and_out = and_in0 & and_in1; 
endmodule