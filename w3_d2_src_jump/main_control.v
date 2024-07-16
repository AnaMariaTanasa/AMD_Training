`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.07.2024 12:48:06
// Design Name: 
// Module Name: main_control
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


module main_control(input [5:0] func,input [5:0] opcode,input zero_flag,output reg regdst,output reg regwrite,output reg extop,output reg alusrc,output reg [3:0] aluop,output reg memwrite,output reg mem2reg,output reg branch,output reg PCSrc,output reg PCJ);
always@(func or opcode or zero_flag)
begin
casex({opcode,func,zero_flag})
13'b000000_100000_x:{regdst,regwrite,extop,alusrc,aluop,memwrite,mem2reg,branch}=12'b1_1_0_0_0010_0_1_0_0;//add
13'b000000_100010_x:{regdst,regwrite,extop,alusrc,aluop,memwrite,mem2reg,branch}=12'b1_1_0_0_0110_0_1_0_0;//sub
13'b000000_100100_x:{regdst,regwrite,extop,alusrc,aluop,memwrite,mem2reg,branch}=12'b1_1_0_0_0000_0_1_0_0;//and
13'b000000_100101_x:{regdst,regwrite,extop,alusrc,aluop,memwrite,mem2reg,branch}=12'b1_1_0_0_0001_0_1_0_0;//or
13'b000000_101010_x:{regdst,regwrite,extop,alusrc,aluop,memwrite,mem2reg,branch}=12'b1_1_0_0_0111_0_1_0_0;//slt
13'b001000_xxxxxx_x:{regdst,regwrite,extop,alusrc,aluop,memwrite,mem2reg,branch}=12'b0_1_1_1_0010_0_1_0_0;//addi I-type
13'b000100_xxxxxx_1:{regdst,regwrite,extop,alusrc,aluop,memwrite,mem2reg,branch}=12'b0_0_1_0_0110_0_1_1_0;//beq
13'b000010_xxxxxx_x:{regdst,regwrite,extop,alusrc,aluop,memwrite,mem2reg,branch}=12'b0_0_1_0_0110_0_1_1_0;
default:{regdst,regwrite,extop,alusrc,aluop,memwrite,mem2reg,branch}=12'b0_0_0_0_0000_1_0_0_1;//jump
endcase
PCSrc = zero_flag & branch;
end
endmodule