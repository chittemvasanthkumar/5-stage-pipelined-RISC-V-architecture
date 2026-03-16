module ProgramCounter(
    input clk,
    input reset,
    input stall,
    input [31:0] next_pc,
    output reg [31:0] pc
);

always @(posedge clk or posedge reset)
begin
    if(reset)
        pc <= 0;
    else if(!stall)
        pc <= next_pc;
end

endmodule