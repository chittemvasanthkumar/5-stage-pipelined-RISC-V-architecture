module HazardDetectionUnit(
    input [4:0] ID_rs1,
    input [4:0] ID_rs2,
    input [4:0] EX_rd,
    input EX_memread,
    output reg stall
);

always @(*)
begin
    if(EX_memread &&
      ((EX_rd == ID_rs1) || (EX_rd == ID_rs2)))
        stall = 1;
    else
        stall = 0;
end

endmodule