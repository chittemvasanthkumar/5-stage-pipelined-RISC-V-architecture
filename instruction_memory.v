module InstructionMemory(
    input [31:0] addr,
    output [31:0] instruction
);

reg [31:0] memory [0:255];

initial begin
    memory[0] = 32'h00000033;
    memory[1] = 32'h00000033;
    memory[2] = 32'h00000033;
end

assign instruction = memory[addr[9:2]];

endmodule