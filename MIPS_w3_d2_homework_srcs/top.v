//`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.07.2024 13:00:10
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


/*module top(input clk,output [31:0]adder32_out,output [31:0]pc,output [31:0] instruction);
//module regn_npl#(parameter n=32)(input clk,input [n-1:0] di,output reg [n-1:0] do=0);
//wire [31:0] adder32_out,pc;
regn_npl pc_reg(clk,adder32_out,pc);
//module adder32(input [31:0] di,output [31:0] do);
adder32 adder32_inst(pc,adder32_out);
//module instruction_memory(input clk,input [31:0] address,output reg [31:0]out);
instruction_memory im(clk,pc,instruction);
endmodule


module tb;
reg clkt;
wire [31:0]adder32_outt,pct,instructiont;
top top_inst(clkt,adder32_outt,pct,instructiont);
initial begin
#0 clkt=1'b0;
forever #5 clkt=~clkt;
end
initial
begin
#200 $finish;
end
endmodule;
*/
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.07.2024 13:00:10
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


/*module top(input clk,output [31:0]adder32_out_pc,output [31:0]pc,output [31:0] instruction,output [5:0] rd_n1,output [5:0] rd_n2,output [31:0] rd1,output [31:0]rd2,output zero,output regdst,output regwrite,output extop,output [3:0] aluop,output alusrc,output memwrite,output mem2reg,output [31:0] ext_out,output [31:0] mux_alusrc,output [31:0] alu_out,output [5:0] func,output [5:0] opcode,output [31:0] rd_dm,output [31:0] wd,output [31:0] shift_out,output [31:0]adder32_out_beq,output branch,output PCSrc,output [31:0] mux_beq_out);
//module regn_npl#(parameter n=32)(input clk,input [n-1:0] di,output reg [n-1:0] do=0);
//wire [31:0] adder32_out,pc;

reg [31:0]di_adder1=4;
//module regn_npl#(parameter n=32)(input clk,input [n-1:0] di,output reg [n-1:0] do=0);

regn_npl pc_reg(.clk(clk),.di(mux_beq_out),.do(pc));
//module adder32(input [31:0] di1,input [31:0] di2,output [31:0] do);
adder32 adder32_inst1(.di1(pc),.di2(di_adder1),.do(adder32_out_pc));
//module instruction_memory(input [31:0] address,output reg [31:0]out);
instruction_memory im(pc,instruction);
assign rd_n1=instruction[25:21];
assign rd_n2=instruction[20:16];
//module reg_bank(input clk,input regwrite,input regdst,input [4:0] ra1,input [4:0] ra2,input [4:0] wa, di,input [31:0] wd,output [31:0] rd1,output [31:0] rd2);//regwrite for enabling writing in registers
reg_bank reg_bank_inst(.clk(clk),.regwrite(regwrite),.regdst(regdst),.ra1(instruction[25:21]),.ra2(instruction[20:16]),.wa(instruction[15:11]),.wd(wd),.rd1(rd1),.rd2(rd2));
//module main_control(input [5:0] func,input [5:0] opcode,input zero_flag,output reg regdst,output reg regwrite,output reg extop,output reg alusrc,output reg [3:0] aluop,output reg memwrite,output reg mem2reg);
assign func=instruction[5:0];
assign opcode=instruction[31:26];
//module main_control(input [5:0] func,input [5:0] opcode,input zero_flag,output reg regdst,output reg regwrite,output reg extop,output reg alusrc,output reg [3:0] aluop,output reg memwrite,output reg mem2reg,output reg branch,output reg PCSrc);
main_control main_control_inst ( .func(func),.opcode(opcode),.zero_flag(zero),.regdst(regdst),.regwrite(regwrite),.extop(extop),.alusrc(alusrc),.aluop(aluop),.memwrite(memwrite),.mem2reg(mem2reg),.branch(branch),.PCSrc(PCSrc));
//module ext_sign(input [15:0] di,input extop,output [31:0] do);
ext_sign ext_sign_inst(.di(instruction[15:0]),.extop(extop),.do(ext_out));
//module rshl2(input [32:0] di,output [32:0] do);
rshl2 rhshl_inst(.di(ext_out),.do(shift_out));
adder32 adder32_inst2(.di1(adder32_out_pc),.di2(shift_out),.do(adder32_out_beq));
//module mux2_1 #(parameter n=32)(input [n-1:0] di1,input [n-1:0] di2,input sel,output [n-1:0] do);

mux2_1 mux_beq(.di1(adder32_out_pc),.di2(adder32_out_beq),.sel(PCSrc),.do(mux_beq_out));
mux2_1 mux_alusrc_inst(.di1(rd2),.di2(ext_out),.sel(alusrc),.do(mux_alusrc));
//module alu(input [31:0] di1,input [31:0] di2,input [3:0] alu_ctr,output reg zero,output reg [31:0] out);
alu alu_inst(.di1(rd1),.di2(mux_alusrc),.alu_ctr(aluop),.zero(zero),.out(alu_out));
///module data_memory(input clk,input [31:0] address,input [31:0] write_data,input mem_write,output reg [31:0] read_data);
data_memory dm(clk,alu_out,rd2,mem_write,rd_dm);
mux2_1 mux_dm(rd_dm,alu_out,mem2reg,wd);

endmodule


module tb;
reg clkt;
wire [31:0]adder32_out_pct,pct,instructiont,rd1t,rd2t,ext_outt,mux_alusrct,alu_outt,rd_dmt,wdt,shift_outt,adder32_out_beqt,mux_beq_outt;
wire zerot,regdstt,regwritet,extopt,alusrct,memwritet,mem2regt,PCSrct,brancht;
wire [3:0] aluopt;
wire [5:0] funct,opcodet,rd_n1t,rd_n2t;
//module top(input clk,output [31:0]adder32_out_pc,output [31:0]pc,output [31:0] instruction,output [5:0] rd_n1,output [5:0] rd_n2,output [31:0] rd1,output [31:0]rd2,output zero,output regdst,output regwrite,
//output extop,output [3:0] aluop,output alusrc,output memwrite,output mem2reg,output [31:0] ext_out,output [31:0] mux_alusrc,output [31:0] alu_out,output [5:0] func,output [5:0] opcode,output [31:0] rd_dm,output [31:0] wd,
//output [31:0] shift_out,output [31:0]adder32_out_beq,output PCSrc,output [31:0] mux_beq_out);
top top_inst(clkt,adder32_out_pct,pct,instructiont,rd_n1t,rd_n2t,rd1t,rd2t,zerot,regdstt,regwritet,extopt,aluopt,alusrct,memwritet,mem2regt, ext_outt,mux_alusrct, alu_outt,funct,opcodet,rd_dmt,wdt,shift_outt,adder32_out_beqt,brancht,PCSrct,mux_beq_outt);

initial begin
#0 clkt=1'b0;
forever #5 clkt=~clkt;
end
initial
begin
#1000 $finish;
end
endmodule;
*/

module top(input clk,output [31:0]adder32_out_pc,output [31:0]pc,output [31:0] instruction,output [5:0] rd_n1,output [5:0] rd_n2,output [31:0] rd1,output [31:0]rd2,output zero,output regdst,output regwrite,output extop,output [3:0] aluop,output alusrc,output memwrite,output mem2reg,output [31:0] ext_out,output [31:0] mux_alusrc,output [31:0] alu_out,output [5:0] func,output [5:0] opcode,output [31:0] rd_dm,output [31:0] wd,output [31:0] shift_out,output [31:0]adder32_out_beq,output branch,output PCSrc,output [31:0] mux_beq_out,output PCJ);
//module regn_npl#(parameter n=32)(input clk,input [n-1:0] di,output reg [n-1:0] do=0);
//wire [31:0] adder32_out,pc;
wire [5:0] funct,opcode;
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
//module reg_bank(input clk,input regwrite,input regdst,input [4:0] ra1,input [4:0] ra2,input [4:0] wa, di,input [31:0] wd,output [31:0] rd1,output [31:0] rd2);//regwrite for enabling writing in registers
reg_bank reg_bank_inst(.clk(clk),.regwrite(regwrite),.regdst(regdst),.ra1(instruction[25:21]),.ra2(instruction[20:16]),.wa(instruction[15:11]),.wd(wd),.rd1(rd1),.rd2(rd2));
//module main_control(input [5:0] func,input [5:0] opcode,input zero_flag,output reg regdst,output reg regwrite,output reg extop,output reg alusrc,output reg [3:0] aluop,output reg memwrite,output reg mem2reg);
assign func=instruction[5:0];
assign opcode=instruction[31:26];
assign pcJump={pc[31:28],instruction[25:0],2'b00};
//module main_control(input [5:0] func,input [5:0] opcode,input zero_flag,output reg regdst,output reg regwrite,output reg extop,output reg alusrc,output reg [3:0] aluop,output reg memwrite,output reg mem2reg,output reg branch,output reg PCSrc,output reg PCJ);
main_control main_control_inst ( .func(func),.opcode(opcode),.zero_flag(zero),.regdst(regdst),.regwrite(regwrite),.extop(extop),.alusrc(alusrc),.aluop(aluop),.memwrite(memwrite),.mem2reg(mem2reg),.branch(branch),.PCSrc(PCSrc),.PCJ(PCJ));
//module ext_sign(input [15:0] di,input extop,output [31:0] do);
ext_sign ext_sign_inst(.di(instruction[15:0]),.extop(extop),.do(ext_out));
//module rshl2(input [32:0] di,output [32:0] do);
rshl2 rhshl_inst(.di(ext_out),.do(shift_out));
adder32 adder32_inst2(.di1(adder32_out_pc),.di2(shift_out),.do(adder32_out_beq));
//module mux2_1 #(parameter n=32)(input [n-1:0] di1,input [n-1:0] di2,input sel,output [n-1:0] do);

mux4_1 mux_beq(.di1(adder32_out_pc),.di2(adder32_out_beq),.di3(pcJump),.di4(32'b0),.sel({PCJ,PCSrc}),.do(mux_beq_out));
mux2_1 mux_alusrc_inst(.di1(rd2),.di2(ext_out),.sel(alusrc),.do(mux_alusrc));
//module alu(input [31:0] di1,input [31:0] di2,input [3:0] alu_ctr,output reg zero,output reg [31:0] out);
alu alu_inst(.di1(rd1),.di2(mux_alusrc),.alu_ctr(aluop),.zero(zero),.out(alu_out));
///module data_memory(input clk,input [31:0] address,input [31:0] write_data,input mem_write,output reg [31:0] read_data);
data_memory dm(clk,alu_out,rd2,mem_write,rd_dm);
mux2_1 mux_dm(rd_dm,alu_out,mem2reg,wd);

endmodule


module tb;
reg clkt;
wire [31:0]adder32_out_pct,pct,instructiont,rd1t,rd2t,ext_outt,mux_alusrct,alu_outt,rd_dmt,wdt,shift_outt,adder32_out_beqt,mux_beq_outt;
wire zerot,regdstt,regwritet,extopt,alusrct,memwritet,mem2regt,PCSrct,brancht,PCJt;
wire [3:0] aluopt;
wire [5:0] funct,opcodet,rd_n1t,rd_n2t;
//module top(input clk,output [31:0]adder32_out_pc,output [31:0]pc,output [31:0] instruction,output [5:0] rd_n1,output [5:0] rd_n2,output [31:0] rd1,output [31:0]rd2,output zero,output regdst,output regwrite,
//output extop,output [3:0] aluop,output alusrc,output memwrite,output mem2reg,output [31:0] ext_out,output [31:0] mux_alusrc,output [31:0] alu_out,output [5:0] func,output [5:0] opcode,output [31:0] rd_dm,output [31:0] wd,
//output [31:0] shift_out,output [31:0]adder32_out_beq,output PCSrc,output [31:0] mux_beq_out);
top top_inst(clkt,adder32_out_pct,pct,instructiont,rd_n1t,rd_n2t,rd1t,rd2t,zerot,regdstt,regwritet,extopt,aluopt,alusrct,memwritet,mem2regt, ext_outt,mux_alusrct, alu_outt,funct,opcodet,rd_dmt,wdt,shift_outt,adder32_out_beqt,brancht,PCSrct,mux_beq_outt,PCJt);

initial begin
#0 clkt=1'b0;
forever #5 clkt=~clkt;
end
initial
begin
#5 $finish;
end
endmodule;