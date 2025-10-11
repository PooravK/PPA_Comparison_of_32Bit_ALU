module subtractor32bit(
    input [31:0] subtractor_in0, subtractor_in1,
    input borrow_in,
    output [31:0] subtractor_out,
    output borrow_out
    );

    wire c5;
    wire c6;
    wire c7;

    subtractor8bit block6(
        .subtractor_in0(subtractor_in0[7:0]),
        .subtractor_in1(subtractor_in1[7:0]),
        .borrow_in(borrow_in),
        .subtractor_out(subtractor_out[7:0]),
        .borrow_out(c5)
        );
    subtractor8bit block7(
        .subtractor_in0(subtractor_in0[15:8]),
        .subtractor_in1(subtractor_in1[15:8]),
        .borrow_in(c5),
        .subtractor_out(subtractor_out[15:8]),
        .borrow_out(c6)
        );
    subtractor8bit block8(
        .subtractor_in0(subtractor_in0[23:16]),
        .subtractor_in1(subtractor_in1[23:16]),
        .borrow_in(c6),
        .subtractor_out(subtractor_out[23:16]),
        .borrow_out(c7)
        );
    subtractor8bit block9(
        .subtractor_in0(subtractor_in0[31:24]),
        .subtractor_in1(subtractor_in1[31:24]),
        .borrow_in(c7),
        .subtractor_out(subtractor_out[31:24]),
        .borrow_out(borrow_out)
        );
endmodule

module subtractor8bit(
    input [7:0] subtractor_in0, subtractor_in1,
    input borrow_in,
    output [7:0] subtractor_out,
    output borrow_out
    );

    wire c4;

    subtractor4bit block4(
        .subtractor_in0(subtractor_in0[3:0]),
        .subtractor_in1(subtractor_in1[3:0]),
        .borrow_in(borrow_in),
        .subtractor_out(subtractor_out[3:0]),
        .borrow_out(c4)
        );
    subtractor4bit block5(
        .subtractor_in0(subtractor_in0[7:4]),
        .subtractor_in1(subtractor_in1[7:4]),
        .borrow_in(c4),
        .subtractor_out(subtractor_out[7:4]),
        .borrow_out(borrow_out)
        );
endmodule

module subtractor4bit(
    input [3:0] subtractor_in0, subtractor_in1,
    input borrow_in,
    output [3:0] subtractor_out,
    output borrow_out
    );

    wire c1;
    wire c2;
    wire c3;

    subtractor1bit block0 (
        .subtractor_in0(subtractor_in0[0]),
        .subtractor_in1(subtractor_in1[0]),
        .borrow_in(borrow_in),
        .subtractor_out(subtractor_out[0]),
        .borrow_out(c1)
        );
    subtractor1bit block1 (
        .subtractor_in0(subtractor_in0[1]),
        .subtractor_in1(subtractor_in1[1]),
        .borrow_in(c1),
        .subtractor_out(subtractor_out[1]),
        .borrow_out(c2)
        );
    subtractor1bit block2 (
        .subtractor_in0(subtractor_in0[2]),
        .subtractor_in1(subtractor_in1[2]),
        .borrow_in(c2),
        .subtractor_out(subtractor_out[2]),
        .borrow_out(c3)
        );
    subtractor1bit block3 (
        .subtractor_in0(subtractor_in0[3]),
        .subtractor_in1(subtractor_in1[3]),
        .borrow_in(c3),
        .subtractor_out(subtractor_out[3]),
        .borrow_out(borrow_out)
        );
endmodule

module subtractor1bit(
    input subtractor_in0, subtractor_in1, borrow_in,
    output subtractor_out, borrow_out
    );

    assign subtractor_out = subtractor_in0 ^ subtractor_in1 ^ borrow_in;
    assign borrow_out = (~subtractor_in0 & subtractor_in1) | (~subtractor_in0 & borrow_in) | (subtractor_in1 & borrow_in);
endmodule