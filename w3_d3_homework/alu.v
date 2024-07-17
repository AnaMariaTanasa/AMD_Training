`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.07.2024 12:27:26
// Design Name: 
// Module Name: alu
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


module alu(input [31:0] di1,input [31:0] di2,input [3:0] alu_ctr,output  zero,output reg [31:0] out);
always@(di1 or di2 or alu_ctr)
begin
case(alu_ctr)
4'b0000:out=di1 & di2; //and
4'b0001:out=di1 | di2; //or
4'b0010:out=di1+di2;//add
4'b0110:out=di1-di2;//sub
4'b0111:out=(di1<di2)?1:0;//slt
4'b1100:out=~(di1 | di2); //nor
default:out=0;
endcase

end
assign zero=(out==0)?1:0;

endmodule