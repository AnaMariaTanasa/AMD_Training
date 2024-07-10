`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.07.2024 11:42:57
// Design Name: 
// Module Name: ram
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


module ram(
input clk,
input [31:0]din,
input [7:0]addr,
input rw,
output reg [31:0]out
);
reg [31:0] mem[0:99];
always@(posedge clk)
begin
if(!rw)//citire
    out=mem[addr];
else
    mem[addr]=din;
end
endmodule

module tb_ram;
reg clkt;
reg [31:0]dint;
reg [7:0]addrt;
reg rwt;
wire [31:0]outt;
ram ram_inst(.clk(clkt),
             .din(dint),
             .addr(addrt),
             .rw(rwt),
             .out(outt)
             );
initial
begin
# 0 clkt=1'b0;
forever #5 clkt=~clkt;
end

initial
begin
#0 addrt=0;dint=0;rwt=1'b1;
#10 addrt=1;dint=1;
#10 addrt=2;dint=2;
#10 addrt=3;dint=3;
#10 addrt=4;dint=4;
#10 addrt=5;dint=5;
#10 addrt=6;dint=6;
#10 addrt=7;dint=7;
#10 addrt=102;dint=130;
#10 addrt=0;rwt=1'b0;
#10 addrt=1;
#10 addrt=2;
#10 addrt=2;
#10 addrt=3;
#10 addrt=4;
#10 addrt=5;
#10 addrt=6;
#10 addrt=102;
#300 $finish;
end
endmodule;
