module shift_module(
    input [31:0]shift_in0; //Number to be shifted
    input [4:0]shift_in1; //Amount to be shifted 
    output [31:0]LSL, LSR, ASR
    );

    wire sign_bit;

    assign LSL = shift_in0 << shift_in1; 
    assign LSR = shift_in0 >> shift_in1;
    assign ASR = shift_in0 >>> shift_in1; 
endmodule