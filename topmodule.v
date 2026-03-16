module riscV_pipeline(
    input clk,
    input reset
);

wire stall;

wire [31:0] pc;
wire [31:0] instruction;

wire [31:0] read_data1, read_data2;
wire [31:0] alu_result;
wire [31:0] mem_data;
wire [31:0] write_back_data;

wire [4:0] rs1, rs2, rd;

assign rs1 = instruction[19:15];
assign rs2 = instruction[24:20];
assign rd  = instruction[11:7];

ProgramCounter PC(
    .clk(clk),
    .reset(reset),
    .stall(stall),
    .next_pc(pc + 4),
    .pc(pc)
);

InstructionMemory IM(
    .addr(pc),
    .instruction(instruction)
);

RegisterFile RF(
    .clk(clk),
    .rs1(rs1),
    .rs2(rs2),
    .rd(rd),
    .write_data(write_back_data),
    .reg_write(1'b1),
    .read_data1(read_data1),
    .read_data2(read_data2)
);

ALU alu(
    .A(read_data1),
    .B(read_data2),
    .ALU_Sel(4'b0000),
    .ALU_Out(alu_result)
);

DataMemory DM(
    .clk(clk),
    .mem_read(1'b1),
    .mem_write(1'b0),
    .address(alu_result),
    .write_data(read_data2),
    .read_data(mem_data)
);

assign write_back_data = mem_data;

HazardDetectionUnit HDU(
    .ID_rs1(rs1),
    .ID_rs2(rs2),
    .EX_rd(rd),
    .EX_memread(1'b0),
    .stall(stall)
);

endmodule