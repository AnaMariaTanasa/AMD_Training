`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.07.2024 12:26:58
// Design Name: 
// Module Name: top
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


module top(input clk,output pc_lsb);
wire [31:0] pc,adder32_out,instruction,alu_out,ra1_out,ra2_out,ext_sign_out,mux_alusrc_out;
wire [4:0] ra1,ra2,wa;
wire [5:0] opcode,func;
wire [15:0] ext_sign_in;
wire [31:0] di_adder=4;
wire[3:0] aluop;
wire regdst,extop,regwrite,alusrc,memwrite,mem2reg,zero,branch,PCJ,PCSrc;


//module regn_npl (input clk,input [31:0] di,output reg [31:0] do=0);
regn_npl pc_reg(clk,adder32_out,pc);

//module adder32(input [31:0] di1,input [31:0] di2,output [31:0] do);
adder32 adder32_pc(pc,di_adder,adder32_out);

//module instruction_memory(input [31:0] address,output reg [31:0]out);
instruction_memory im(.address(pc),.out(instruction));

assign ext_sign_in=instruction[15:0];
assign ra1=instruction [25:21];
assign ra2=instruction [20:16];
assign wa=instruction [15:11];
assign opcode=instruction[5:0];
assign func=instruction[31:26];

//module main_control(input [5:0] func,input [5:0] opcode,input zero_flag,output reg regdst,output reg regwrite,output reg extop,output reg alusrc,output reg [3:0] aluop,output reg memwrite,output reg mem2reg,output reg branch,output reg PCSrc,output reg PCJ);
main_control control(.func(func),.opcode(opcode),.zero_flag(zero),.regdst(regdst),.regwrite(regwrite),.extop(extop),.alusrc(alusrc),.aluop(aluop),.memwrite(memwrite),.mem2reg(mem2reg),.branch(branch),.PCSrc(PCSrc),.PCJ(PCJ));

//module reg_bank(input clk,input regwrite,input regdst,input [4:0] ra1,input [4:0] ra2,input [4:0] wa,input [31:0] wd,output [31:0] rd1,output [31:0] rd2);                                                                                                         //rd1=destination registetr 2 ,rd2= destination register 2
reg_bank reg_bank_inst(.clk(clk),.regwrite(regwrite),.regdst(regdst),.ra1(ra1),.ra2(ra2),.wa(wa),.wd(alu_out),.rd1(ra1_out),.rd2(ra2_out));

//module ext_sign(input [15:0] di,input extop,output [31:0] do);
ext_sign ext_sign_inst(.di(ext_sign_in),.do(ext_sign_out));

//module mux2_1 #(parameter n=32)(input [n-1:0] di1,input [n-1:0] di2,input sel,output [n-1:0] do);
mux2_1 mux_alusrc(.di1(ra2_out),.di2(ext_sign_out),.sel(alusrc),.do(mux_alusrc_out));

//module alu(input [31:0] di1,input [31:0] di2,input [3:0] alu_ctr,output  zero,output reg [31:0] out);
alu alu_inst(.di1(ra1_out),.di2(mux_alusrc_out),.alu_ctr(aluop),.zero(zero),.out(alu_out));

assign pc_lsb=pc[0];
endmodule
