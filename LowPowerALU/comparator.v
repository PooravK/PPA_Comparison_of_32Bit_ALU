module comparator(
    input [31:0]comp_in0, comp_in1,
    output reg SLT,
    output SLTU
    );

    assign SLTU = ((comp_in0 - comp_in1) < 32'b0)?1'b1:1'b0;

    always @(*)begin

        if (comp_in0[31] == 1'b0 && comp_in1[31] == 1'b0)begin
            SLT = ((comp_in0 - comp_in1) < 32'b0)?1'b1:1'b0;

        end else if (comp_in0[31] == 1'b1 && comp_in1[31] == 1'b0)begin
            SLT = 1'b1;

        end else if (comp_in0[31] == 1'b0 && comp_in1[31] == 1'b1)begin
            SLT = 1'b0;

        end else begin
            SLT = ((comp_in0 - comp_in1) < 32'b0)?1'b1:1'b0;

        end
    end
endmodule