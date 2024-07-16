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


//module reg_bank(input clk,input regwrite,input regdst,input [31:0] di,input [31:0] wd,output [31:0] rd1,output [31:0] rd2);//regwrite for enabling writing in registers
module reg_bank(input clk,input regwrite,input regdst,input [4:0] ra1,input [4:0] ra2,input [4:0] wa,input [31:0] wd,output [31:0] rd1,output [31:0] rd2);                                                                                                         //rd1=destination registetr 2 ,rd2= destination register 2
//reg [31:0] regs_test [0:2]={32'b0,32'b0,32'b0};
reg [31:0] regs [0:31];

initial
begin
$readmemb("reg_bank_content.mem",regs);
end
assign rd1=regs[ra1];
assign rd2=regs[ra2];

always@(posedge clk)
begin
    if(regwrite)
    begin
        if(regdst)
            begin
            if(wa>=5'b00001)
                regs[wa]=wd;
            end
        else
           begin
           if(ra2>=5'b00001)
                regs[ra2]=wd;
           end
        
    end
end                                                                                                       
endmodule