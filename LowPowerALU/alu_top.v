module alu_top(
    input clk, clear, alu_en,
    input [31:0]alu_in0, alu_in1,
    input [3:0]control_signal,
    output reg [31:0]alu_out,
    output zero_flag
    );

    wire [31:0]addition_out;
    wire [31:0]subtraction_out;
    wire [31:0]and_operation_out;
    wire [31:0]or_operation_out;
    wire [31:0]xor_operation_out;
    wire [31:0]LLS_out;
    wire [31:0]LRS_out;
    wire [31:0]ARS_out;
    wire SLTU_out;
    wire SLT_out;

    reg latch_en;
    wire clk_gate;

    parameter ADD = 4'b0000;
    parameter SUB = 4'b0001;
    parameter AND = 4'b0010;
    parameter OR = 4'b0011;
    parameter XOR = 4'b0100;
    parameter LOGICAL_LS = 4'b0101;
    parameter LOGICAL_RS = 4'b0110;
    parameter ARITHMETIC_RS = 4'b0111;
    parameter LESS_THAN_UNSIGNED = 4'b1000;
    parameter LESS_THAN_SIGNED = 4'b1001;

    adder32bit ADDITION(
        .adder_in0(alu_in0),
        .adder_in1(alu_in1),
        .carry_in(1'b0),
        .adder_out(addition_out)
        );

    subtractor32bit SUBTRACTION(
        .subtractor_in0(alu_in0),
        .subtractor_in1(alu_in1),
        .borrow_in(1'b0),
        .subtractor_out(subtraction_out)
        );

    gate_and AND_OP(
        .and_in0(alu_in0),
        .and_in1(alu_in1),
        .and_out(and_operation_out)
        );

    gate_or OR_OP(
        .or_in0(alu_in0),
        .or_in1(alu_in1),
        .or_out(or_operation_out)
        );

    gate_xor XOR_OP(
        .xor_in0(alu_in0),
        .xor_in1(alu_in1),
        .xor_out(xor_operation_out)
        );
    
    shift_module SHIFTING(
        .shift_in0(alu_in0),
        .shift_in1(alu_in1[4:0]),
        .LSL(LLS_out),
        .LSR(LRS_out),
        .ASR(ARS_out)
        );

    comparator COMPARISON(
        .comp_in0(alu_in0),
        .comp_in1(alu_in1),
        .SLTU(SLTU_out),
        .SLT(SLT_out)
        );

    assign zero_flag = (alu_out == 32'b0)?1'b1:1'b0;

    always @(*)begin
        if (!clk)begin
            latch_en = alu_en;
        end
    end

    assign clk_gate = latch_en & clk;

    always @(posedge clk_gate or posedge clear)begin
        if (clear)begin
            alu_out = 32'b0;
        end else begin
            case (control_signal)
                ADD: alu_out = addition_out;
                SUB: alu_out = subtraction_out;
                AND: alu_out = and_operation_out;
                OR: alu_out = or_operation_out;
                XOR: alu_out = xor_operation_out;
                LOGICAL_LS: alu_out = LLS_out;
                LOGICAL_RS: alu_out = LRS_out;
                ARITHMETIC_RS: alu_out = ARS_out;
                LESS_THAN_UNSIGNED: alu_out = {31'b0, SLTU_out};
                LESS_THAN_SIGNED: alu_out = {31'b0, SLT_out};
                default: alu_out = 32'b0;
            endcase
        end
    end

endmodule