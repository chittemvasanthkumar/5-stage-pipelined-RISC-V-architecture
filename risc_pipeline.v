module traffic_light(
input clk,rst,
output reg [2:0] light
);

parameter RED=2'b00;
parameter YELLOW=2'b01;
parameter GREEN=2'b10;

reg [1:0] state, nextstate;
 always@(posedge clk)begin
 if (rst)
 state<= RED;
 else
 state<= nextstate;
 end



always @(*) begin
case (state)
2'b00: nextstate=YELLOW;
2'b01: nextstate=GREEN;
2'b10: nextstate=RED;
default: nextstate=RED;
endcase
end

always @(*) begin
case(state)
2'b00: light=2'b100;
2'b01: light=2'b010;
2'b10: light=2'b001;
default: light=2'b100;
endcase
end
endmodule