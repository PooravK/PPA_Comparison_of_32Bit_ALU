`timescale 1ns/1ps

module tb_subtractor();
    reg [31:0]subtractor_in0;
    reg [31:0]subtractor_in1;
    reg borrow_in;
    wire borrow_out;
    wire [31:0]subtractor_out;

    subtractor32bit uut (
        .subtractor_in0(subtractor_in0),
        .subtractor_in1(subtractor_in1),
        .borrow_in(borrow_in),
        .borrow_out(borrow_out),
        .subtractor_out(subtractor_out)
        );

        initial begin
            $dumpfile("subtractor_waveform.vcd");
            $dumpvars(0, tb_subtractor);

            subtractor_in0 =32'd10;
            subtractor_in1 =32'd5;
            borrow_in = 1'b0;
            #10;

            subtractor_in0 =32'd15;
            subtractor_in1 =32'd15;
            borrow_in = 1'b0;
            #10;

            subtractor_in0 =32'd7;
            subtractor_in1 =32'd9;
            borrow_in = 1'b0;
            #10;

            subtractor_in0 =32'd20;
            subtractor_in1 =32'd5;
            borrow_in = 1'b1;
            #10;

            subtractor_in0 =32'h7FFFFFFF;
            subtractor_in1 =32'h7FFFFFFF;
            borrow_in = 1'b0;
            #10;

            subtractor_in0 =32'h80000000;
            subtractor_in1 =32'h80000000;
            borrow_in = 1'b1;
            #10;

            $finish;
        end
endmodule