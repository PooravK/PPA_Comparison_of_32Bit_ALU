`timescale 1ns/1ps

module tb_adder();
    reg [31:0]adder_in0;
    reg [31:0]adder_in1;
    reg carry_in;
    wire carry_out;
    wire [31:0]adder_out;

    adder32bit uut (
        .adder_in0(adder_in0),
        .adder_in1(adder_in1),
        .carry_in(carry_in),
        .carry_out(carry_out),
        .adder_out(adder_out)
        );

        initial begin
            $dumpfile("adder_waveform.vcd");
            $dumpvars(0, tb_adder);

            adder_in0 =32'hFFFFFFFF;
            adder_in1 =32'h00000000;
            carry_in = 1'b0;
            #10;

            adder_in0 =32'hFFFFFFFF;
            adder_in1 =32'h00000001;
            carry_in = 1'b0;
            #10;

            adder_in0 =32'h00000000;
            adder_in1 =32'hFFFFFFFF;
            carry_in = 1'b1;
            #10;

            adder_in0 =32'h00000000;
            adder_in1 =32'h00000000;
            carry_in = 1'b0;
            #10;

            adder_in0 =32'h7FFFFFFF;
            adder_in1 =32'h7FFFFFFF;
            carry_in = 1'b1;
            #10;

            adder_in0 =32'h80000000;
            adder_in1 =32'h80000000;
            carry_in = 1'b1;
            #10;

            $finish;
        end
endmodule