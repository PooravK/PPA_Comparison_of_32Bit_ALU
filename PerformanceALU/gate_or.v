module gate_or(
    input [31:0]or_in0, or_in1,
    output [31:0]or_out
    );

    assign or_out = or_in0 | or_in1;
endmodule