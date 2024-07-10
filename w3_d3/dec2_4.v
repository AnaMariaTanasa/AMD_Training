`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.07.2024 11:32:22
// Design Name: 
// Module Name: dec2_4
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

//functionality; dmux/one-hot
module dec2_4(di,do);
input [1:0] di;
output reg [3:0] do;
always@(di)
begin
case(di)
2'b00: do=4'b0001;
2'b01:do=4'b0010;
2'b10:do=4'b0100;
2'b11:do=4'b1000;
endcase
do=~do;
end
endmodule


/*module tb_dec_2_4;
reg [1:0] dit;
wire [3:0] dot;
dec2_4 dec2_4_inst(dit,dot);
initial
begin
#0 dit=2'b00;
#10 dit=2'b01;
#10 dit=2'b10;
#10 dit=2'b11;
#50 $finish;
end
endmodule
*/