`timescale 1ns / 1ps

module top(input clk,input [11:0] in_debug,output [11:0] out_debug);
wire [31:0]adder32_out_pc,pc,instruction,rd1,rd2,ext_out, mux_alusrc,alu_out,opcode,rd_dm,wd,shift_out,adder32_out_beq, mux_beq_out;
wire [5:0] rd_n1,rd_n2,func,wa;
wire zero,regdst,regwrite,extop,alusrc,memwrite,mem2reg,branch,PCSrc,PCJ;
wire [3:0] aluop;
reg [31:0]di_adder1=4;
wire [31:0] pcJump;

//module regn_npl#(parameter n=32)(input clk,input [n-1:0] di,output reg [n-1:0] do=0);
regn_npl pc_reg(.clk(clk),.di(mux_beq_out),.do(pc));

//module adder32(input [31:0] di1,input [31:0] di2,output [31:0] do);
adder32 adder32_inst1(.di1(pc),.di2(di_adder1),.do(adder32_out_pc));

//module instruction_memory(input [31:0] address,output reg [31:0]out);
instruction_memory im(pc,instruction);
assign rd_n1=instruction[25:21];
assign rd_n2=instruction[20:16];
assign wa=instruction[15:11];

//module reg_bank(input clk,input regwrite,input regdst,input [4:0] ra1,input [4:0] ra2,input [4:0] wa,input [31:0] wd,output [31:0] rd1,output [31:0] rd2);                                                                                                         //rd1=destination registetr 2 ,rd2= destination register 2
reg_bank reg_bank_inst(.clk(clk),.regwrite(regwrite),.regdst(regdst),.ra1(rd_n1),.ra2(rd_n2),.wa(wa),.wd(wd),.rd1(rd1),.rd2(rd2));

assign func=instruction[5:0];
assign opcode=instruction[31:26];
assign pcJump={pc[31:28],instruction[25:0],2'b00};

//module main_control(input [5:0] func,input [5:0] opcode,input zero_flag,output reg regdst,output reg regwrite,output reg extop,output reg alusrc,output reg [3:0] aluop,output reg memwrite,output reg mem2reg,output reg branch,output reg PCSrc,output reg PCJ);
main_control main_control_inst ( .func(func),.opcode(opcode),.zero_flag(zero),.regdst(regdst),.regwrite(regwrite),.extop(extop),.alusrc(alusrc),.aluop(aluop),.memwrite(memwrite),.mem2reg(mem2reg),.branch(branch),.PCSrc(PCSrc),.PCJ(PCJ));

//module ext_sign(input [15:0] di,input extop,output [31:0] do);
ext_sign ext_sign_inst(.di(instruction[15:0]),.extop(extop),.do(ext_out));

//module rshl2(input [31:0] di,output [31:0] do);
rshl2 rhshl_inst(.di(ext_out),.do(shift_out));


adder32 adder32_inst2(.di1(adder32_out_pc),.di2(shift_out),.do(adder32_out_beq));

//module mux4_1 #(parameter n=32)( input [n-1:0] di1,input [n-1:0] di2,input [n-1:0] di3,input [n-1:0] di4, input [1:0] sel,output reg [n-1:0] do);
mux4_1 mux_beq(.di1(adder32_out_pc),.di2(adder32_out_beq),.di3(pcJump),.di4(32'b0),.sel({PCJ,PCSrc}),.do(mux_beq_out));

//module mux2_1 #(parameter n=32)(input [n-1:0] di1,input [n-1:0] di2,input sel,output [n-1:0] do);
mux2_1 mux_alusrc_inst(.di1(rd2),.di2(ext_out),.sel(alusrc),.do(mux_alusrc));

//module alu(input [31:0] di1,input [31:0] di2,input [3:0] alu_ctr,output reg zero,output reg [31:0] out);
alu alu_inst(.di1(rd1),.di2(mux_alusrc),.alu_ctr(aluop),.zero(zero),.out(alu_out));

//module data_memory(input clk,input [31:0] address,input [31:0] write_data,input mem_write,output  [31:0] read_data,input [15:0] in_debug,output reg[31:0] out_debug);
data_memory dm(.clk(clk),.address(alu_out),.write_data(rd2),.mem_write(memwrite),.read_data(rd_dm),.in_debug(in_debug),.out_debug(out_debug));
mux2_1 mux_dm(rd_dm,alu_out,mem2reg,wd);

endmodule


module tb;
reg clkt;
reg [11:0] in_debugt;
wire [11:0] out_debugt;
top top_inst(clkt,in_debugt,out_debugt);

initial begin
#0 clkt=1'b0;
forever #5 clkt=~clkt;
end
initial
begin
#0 in_debugt=16'haabb;
#1000 $finish;
end
endmodule;
