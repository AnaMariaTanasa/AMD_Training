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


module top(input clk,output [31:0]adder32_out,output [31:0]pc,output [31:0] instruction);
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