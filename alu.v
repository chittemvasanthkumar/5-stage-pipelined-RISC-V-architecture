module ALU(
    input [31:0] A,
    input [31:0] B,
    input [3:0] ALU_Sel,
    output reg [31:0] ALU_Out
);

always @(*)
begin
    case(ALU_Sel)
        4'b0000: ALU_Out = A + B;
        4'b0001: ALU_Out = A - B;
        4'b0010: ALU_Out = A & B;
        4'b0011: ALU_Out = A | B;
        default: ALU_Out = 0;
    endcase
end

endmodule