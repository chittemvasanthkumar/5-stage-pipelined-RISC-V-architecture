module control_unit(
    input [5:0] opcode,
    output reg RegWrite, MemRead, MemWrite, MemToReg,
    output reg [3:0] ALUop
);

    always @(*) begin
        RegWrite = 0; MemRead = 0; MemWrite = 0; MemToReg = 0;
        ALUop = 4'd0;

        case(opcode)
            6'b000000: begin // R-type ADD
                RegWrite = 1;
                ALUop = 4'd1;
            end

            6'b001000: begin // ADDI
                RegWrite = 1;
                ALUop = 4'd1;
            end

            6'b100011: begin // LW
                RegWrite = 1; MemRead = 1; MemToReg = 1;
                ALUop = 4'd1;
            end

            6'b101011: begin // SW
                MemWrite = 1;
                ALUop = 4'd1;
            end

            6'b000100: begin // BEQ
                ALUop = 4'd2;
            end
        endcase
    end

endmodule
