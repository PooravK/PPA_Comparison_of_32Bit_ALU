module gate_xor(
    input [31:0]xor_in0, xor_in1,
    output [31:0]xor_out
    );

    assign xor_out = xor_in0 ^ xor_in1 
endmodule