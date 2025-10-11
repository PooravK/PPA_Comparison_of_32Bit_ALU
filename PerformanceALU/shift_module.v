module shift_module(
    input [31:0]shift_in0, //Number to be shifted
    input [4:0]shift_in1, //Amount to be shifted 
    output [31:0]LSL, LSR, ASR
    );

    assign LSL = shift_in0 << shift_in1; 
    assign LSR = shift_in0 >> shift_in1;
    assign ASR = shift_in0 >>> shift_in1; 

    // Can also do: assign ASR = {{shift_in1{sign_bit}}, shift_in0[31:shift_in1]};
endmodule