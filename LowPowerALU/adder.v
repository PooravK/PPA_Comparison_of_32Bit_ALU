module adder32bit(
    input [31:0] adder_in0, adder_in1,
    input carry_in,
    output [31:0] adder_out,
    output carry_out
    );

    wire c5;
    wire c6;
    wire c7;

    adder8bit block6(
        .adder_in0(adder_in0[7:0]),
        .adder_in1(adder_in1[7:0]),
        .carry_in(carry_in),
        .adder_out(adder_out[7:0]),
        .carry_out(c5)
        );
    adder8bit block7(
        .adder_in0(adder_in0[15:8]),
        .adder_in1(adder_in1[15:8]),
        .carry_in(c5),
        .adder_out(adder_out[15:8]),
        .carry_out(c6)
        );
    adder8bit block8(
        .adder_in0(adder_in0[23:16]),
        .adder_in1(adder_in1[23:16]),
        .carry_in(c6),
        .adder_out(adder_out[23:16]),
        .carry_out(c7)
        );
    adder8bit block9(
        .adder_in0(adder_in0[31:24]),
        .adder_in1(adder_in1[31:24]),
        .carry_in(c7),
        .adder_out(adder_out[31:24]),
        .carry_out(carry_out)
        );
endmodule

module adder8bit(
    input [7:0] adder_in0, adder_in1,
    input carry_in,
    output [7:0] adder_out,
    output carry_out
    );

    wire c4;

    adder4bit block4(
        .adder_in0(adder_in0[3:0]),
        .adder_in1(adder_in1[3:0]),
        .carry_in(carry_in),
        .adder_out(adder_out[3:0]),
        .carry_out(c4)
        );
    adder4bit block5(
        .adder_in0(adder_in0[7:4]),
        .adder_in1(adder_in1[7:4]),
        .carry_in(c4),
        .adder_out(adder_out[7:4]),
        .carry_out(carry_out)
        );
endmodule

module adder4bit(
    input [3:0] adder_in0, adder_in1,
    input carry_in,
    output [3:0] adder_out,
    output carry_out
    );

    wire c1;
    wire c2;
    wire c3;

    adder1bit block0 (
        .adder_in0(adder_in0[0]),
        .adder_in1(adder_in1[0]),
        .carry_in(carry_in),
        .adder_out(adder_out[0]),
        .carry_out(c1)
        );
    adder1bit block1 (
        .adder_in0(adder_in0[1]),
        .adder_in1(adder_in1[1]),
        .carry_in(c1),
        .adder_out(adder_out[1]),
        .carry_out(c2)
        );
    adder1bit block2 (
        .adder_in0(adder_in0[2]),
        .adder_in1(adder_in1[2]),
        .carry_in(c2),
        .adder_out(adder_out[2]),
        .carry_out(c3)
        );
    adder1bit block3 (
        .adder_in0(adder_in0[3]),
        .adder_in1(adder_in1[3]),
        .carry_in(c3),
        .adder_out(adder_out[3]),
        .carry_out(carry_out)
        );
endmodule

module adder1bit(
    input adder_in0, adder_in1, carry_in,
    output adder_out, carry_out
    );

    assign adder_out = adder_in0 ^ adder_in1 ^ carry_in;
    assign carry_out = (adder_in0 & adder_in1) | (adder_in0 & carry_in) | (adder_in1 & carry_in);
endmodule