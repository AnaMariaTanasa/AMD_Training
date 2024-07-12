`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.07.2024 11:52:05
// Design Name: 
// Module Name: reg_bank
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


module reg_bank(input clk,input regwrite,input regdst,input [31:0] di,input [31:0] wd,output [31:0] rd1,output [31:0] rd2);//regwrite for enabling writing in registers
                                                                                                           //rd1=destination registetr 2 ,rd2= destination register 2
//reg [31:0] regs_test [0:2]={32'b0,32'b0,32'b0};
reg [31:0] regs [0:31];
wire [31:0]rd1_out;
wire [31:0]rd2_out;
initial
begin
$readmemb("reg_bank_content.mem",regs);
end
assign rd1_out=regs[di[25:21]];
assign rd1_out=regs[di[20:16]];

always@(posedge clk)
begin
    if(regwrite)
    begin
        if(regdst)
           regs[di[15:11]]=wd;
        else
           regs[di[20:16]]=wd;
        
    end
end                                                                                                       
endmodule
