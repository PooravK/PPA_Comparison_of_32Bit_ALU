`timescale 1ns/1ps

module tb_alu_top();
    reg [31:0]alu_in0;
    reg [31:0]alu_in1;
    reg [3:0]control_signal;
    reg clk;
    reg clear;
    reg alu_en;
    wire [31:0]alu_out;
    wire zero_flag;

    alu_top uut(
        .alu_in0(alu_in0),
        .alu_in1(alu_in1),
        .control_signal(control_signal),
        .alu_out(alu_out),
        .zero_flag(zero_flag),
        .clk(clk),
        .clear(clear),
        .alu_en(alu_en)
        );

        initial clk = 1'b0;

        always #5 clk = ~clk;

        initial begin
            $dumpfile("alu_topwaveform.vcd");
            $dumpvars(0, tb_alu_top);

            alu_en = 1'b0; #10;

            alu_en = 1'b1;

            clear = 1'b1; #10;

            clear = 1'b0; #10;

            control_signal = 4'b0000; // ADD
            alu_in0 = 32'hFFFFFFFF;
            alu_in1 = 32'h00000001;
            #10;

            alu_in0 = 32'hAAAAAAAA;
            alu_in1 = 32'h55555555;
            #10;

            alu_en = 1'b0;
            #20;
            alu_en = 1'b1;
            #10;

            control_signal = 4'b0001; // SUB
            alu_in0 = 32'd5;
            alu_in1 = 32'd3;
            #10;

            alu_in0 = 32'd12;
            alu_in1 = 32'd15;
            #10;

            alu_in0 = 32'd10;
            alu_in1 = 32'd10;
            #10;

            alu_en = 1'b0;
            #20;
            alu_en = 1'b1;
            #10;

            control_signal = 4'b0010; // AND
            alu_in0 = 32'h11111111;
            alu_in1 = 32'b11111111;
            #10;

            alu_in0 = 32'b10101010;
            alu_in1 = 32'b01010101;
            #10;

            alu_en = 1'b0;
            #20;
            alu_en = 1'b1;
            #10;

            control_signal = 4'b0011; // OR
            alu_in0 = 32'h11111111;
            alu_in1 = 32'b11111111;
            #10;

            alu_in0 = 32'b10101010;
            alu_in1 = 32'b01010101;
            #10;

            alu_en = 1'b0;
            #20;
            alu_en = 1'b1;
            #10;

            control_signal = 4'b0100; // XOR
            alu_in0 = 32'h11111111;
            alu_in1 = 32'b11111111;
            #10;

            alu_in0 = 32'b10101010;
            alu_in1 = 32'b01010101;
            #10;

            alu_en = 1'b0;
            #20;
            alu_en = 1'b1;
            #10;

            control_signal = 4'b0101; // Logical left shift
            alu_in0 = 32'b10101010;
            alu_in1 = 5'b00001;
            #10;

            alu_in0 = 32'b10101010;
            alu_in1 = 5'b00010;
            #10;

            alu_in0 = 32'b10101010;
            alu_in1 = 5'b00100;
            #10;

            alu_in0 = 32'b10101010;
            alu_in1 = 5'b01000;
            #10;

            alu_in0 = 32'b10101010;
            alu_in1 = 5'b10000;
            #10;

            alu_en = 1'b0;
            #20;
            alu_en = 1'b1;
            #10;

            control_signal = 4'b0110; // Logical right shift
            alu_in0 = 32'b10101010;
            alu_in1 = 5'b00001;
            #10;

            alu_in0 = 32'b10101010;
            alu_in1 = 5'b00010;
            #10;

            alu_in0 = 32'b10101010;
            alu_in1 = 5'b00100;
            #10;

            alu_in0 = 32'b10101010;
            alu_in1 = 5'b01000;
            #10;

            alu_in0 = 32'b10101010;
            alu_in1 = 5'b10000;
            #10;

            alu_en = 1'b0;
            #20;
            alu_en = 1'b1;
            #10;

            control_signal = 4'b0111; // Arithmetic right shift
            alu_in0 = 32'b10101010;
            alu_in1 = 5'b00001;
            #10;

            alu_in0 = 32'b10101010;
            alu_in1 = 5'b00010;
            #10;

            alu_in0 = 32'b10101010;
            alu_in1 = 5'b00100;
            #10;

            alu_in0 = 32'b10101010;
            alu_in1 = 5'b01000;
            #10;

            alu_in0 = 32'b10101010;
            alu_in1 = 5'b10000;
            #10;

            alu_en = 1'b0;
            #20;
            alu_en = 1'b1;
            #10;

            control_signal = 4'b1000; // Less than unsigned
            alu_in0 = 32'd20;
            alu_in1 = 32'd40;
            #10;

            alu_in0 = 32'd60;
            alu_in1 = 32'd40;
            #10;

            alu_in0 = 32'd40;
            alu_in1 = 32'd40;
            #10;

            alu_en = 1'b0;
            #20;
            alu_en = 1'b1;
            #10;

            control_signal = 4'b1001; // Less than signed
            alu_in0 = -32'd20;
            alu_in1 = 32'd40;
            #10;

            alu_in0 = 32'd60;
            alu_in1 = -32'd40;
            #10;

            alu_in0 = -32'd40;
            alu_in1 = -32'd40;
            #10;

            clear = 1'b1; #10;
            alu_en = 1'b0;

            $finish;
        end
endmodule