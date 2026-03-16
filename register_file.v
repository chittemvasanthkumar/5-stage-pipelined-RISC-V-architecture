module RegisterFile(
    input clk,
    input [4:0] rs1,
    input [4:0] rs2,
    input [4:0] rd,
    input [31:0] write_data,
    input reg_write,
    output [31:0] read_data1,
    output [31:0] read_data2
);

reg [31:0] registers [0:31];

assign read_data1 = registers[rs1];
assign read_data2 = registers[rs2];

initial begin
    registers[1] = 32'd1;   // x1 = 1
    registers[2] = 32'd3;   // x2 = 3
end

always @(posedge clk)
begin
    if(reg_write && rd != 0)
        registers[rd] <= write_data;
end

endmodule